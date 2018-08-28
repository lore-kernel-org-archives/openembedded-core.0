Return-Path: <prvs=877847af4e=adrian.ratiu@ni.com>
Received: from mx0b-00010702.pphosted.com (mx0b-00010702.pphosted.com
	[148.163.158.57])
	by mail.openembedded.org (Postfix) with ESMTP id B0C2776086
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Aug 2018 09:16:10 +0000 (UTC)
Received: from pps.filterd (m0098779.ppops.net [127.0.0.1])
	by mx0b-00010702.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
	w7S9G3PD002036; Tue, 28 Aug 2018 04:16:10 -0500
Authentication-Results: ppops.net;
	dkim=pass header.d=nio365.onmicrosoft.com header.s=selector1-ni-com
Received: from nam05-by2-obe.outbound.protection.outlook.com
	(mail-by2nam05lp0243.outbound.protection.outlook.com
	[216.32.181.243])
	by mx0b-00010702.pphosted.com with ESMTP id 2m34xar96s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
	Tue, 28 Aug 2018 04:16:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=nio365.onmicrosoft.com; s=selector1-ni-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=a1Tw8bhDBSXv+raLMFdAh468GMxl5GUWSxE0iM2hfiY=;
	b=ivmfqjaO8svRblhioTeU7ZW3qA2l9NJRTPcOB3ZFirMYczeUks33O7CkB9paJHMCFjLkelHd1zSHcw/JWewQ0Iy1578Jlxf/1GsAvXAUN33afeWdopNKxH0qkYpH9aRzoDVrK8aImIqulxGNSV/YIx9mJxG4Ez/I5EmRre+SuX0=
Received: from ionel-work (80.97.64.55) by
	MWHPR04MB0401.namprd04.prod.outlook.com (2603:10b6:300:70::18) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1080.14; Tue, 28 Aug 2018 09:16:06 +0000
From: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	Alexandru Vasiu <alexandru.vasiu@ni.com>,
	openembedded-core@lists.openembedded.org
In-Reply-To: <5e5a13cb317d319f7ab9cb2a149881cd0adaa5d9.camel@linuxfoundation.org>
References: <20180827143105.30059-1-alexandru.vasiu@ni.com>
	<20180827143105.30059-3-alexandru.vasiu@ni.com>
	<5e5a13cb317d319f7ab9cb2a149881cd0adaa5d9.camel@linuxfoundation.org>
Date: Tue, 28 Aug 2018 12:17:39 +0300
Message-ID: <874lfeu9xo.fsf@ni.com>
MIME-Version: 1.0
X-Originating-IP: [80.97.64.55]
X-ClientProxiedBy: AM0PR01CA0029.eurprd01.prod.exchangelabs.com
	(2603:10a6:208:69::42) To MWHPR04MB0401.namprd04.prod.outlook.com
	(2603:10b6:300:70::18)
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 73c58f91-dc45-4ea6-eca0-08d60cc6e340
X-Microsoft-Antispam: BCL:0; PCL:0;
	RULEID:(7020095)(4652040)(8989137)(4534165)(4627221)(201703031133081)(201702281549075)(8990107)(5600074)(711020)(2017052603328)(7153060)(7193020);
	SRVR:MWHPR04MB0401; 
X-Microsoft-Exchange-Diagnostics: 1; MWHPR04MB0401;
	3:dRKojI0xTAYl8Ptf5QFs4AZRFBoVOpVjXFOTa0ZZDbf9xmgz0X8uKqS55tdGc1E+TaqU96HX3+/5jrYfoaYqQP37Y8RdXXhgcoSFzW2RnRam8scuTVuJXpg4Fx6dcFwsTIjcYJc2kb6pbtDx5cP9dTtrTIMOzYs8bnaTyfC7svt9bcJv5E88PWTGNIl5sR6NIp4vwQmhyYMncAN1lo6KN5sVIh2E6Vkky47WKZgRnhQPJdjZR1gpwzJLF1YGGfRq;
	25:ZPndfQFxcvYq10Gy6pY9deuFxTO2Uo/K7KdsSLu5JR1KwsESJwXIaQe8kyMP13IUXdPiJ8PahpF8icWOAjG/evDSG/AlHjoiE3XKZ+g5o2FS6z8cMQ4OoKwuXkbuJjOIrgZbE21fptSDqddslfvCQiQDx7ThDgh9cpNxZmC4ifdv/tB6W59QZFjEtkHhaXu/dbeev7+g9GQp24d+LxDJA4Cg0RluSXWYHMXrJlAjogCFzbMUEGN31m6Lbx4btMOhVHDr1c/qku4gIU6z8O5XwebU6wpA4fLd0KMDm3Ooj3tVj77IyMqgxIVhQBczeiy/qEbK9+3IMxrgsB+uMYP37g==;
	31:3Gd59qc2aoozX4N8UQSjDWhD8Bb6FMB9xhhslji49lNCegYuIzR0ApWRbWOzpxnv0Qnmh/uiFxOj015GgVaCti8LMZAbcpD+DhjT9KF5+nkgJkNf/ozAWeR5cbVXmbqVMMhqsbXHWG7L2Ly/rVqfx3JfnwxjvrIQ/009ec1Fea/VOGAHU4TLMQO4oBcKSLhept4dMkjc1Rcht8+ls1Gjqrl4DImoAZ+v4myKS8qO45A=
X-MS-TrafficTypeDiagnostic: MWHPR04MB0401:
X-Microsoft-Exchange-Diagnostics: 1; MWHPR04MB0401;
	20:rw0cuK3wKc4spBnQgxL7I3MJN9gAXbhoNPTP/FmgRoM6pACNdnOX53Oy+1fCnrk4YlXJa/Pj3Fgt85kIWhG5J7dSAX/JcQWymMK1+ihqXLJxhjWk/Gc5J2rFYbFz9OEqVosWcLwZOFJHBWIRXP5upPjvEr+zplxklFsRMc7FchSr8tVOznicZMiaBtCx2bHQL6oko5Adr6TYja79kwoGJMrs42h8E8Kz8znyXqjPwIYx32cpCmXQdPFOsh4MbTNQwb4otjlDfxr17N3ocv/TRRBr75ai0HlGM/D1FnGyu745u3sbZO+AmGyP4qtDyDFA1dnqLQHIydl5yqoQ0znu8Mf0lhakCKZaszhia5gxvq9TlK3jc0h/KW6VOVxlDojW/qfKN/Huy4s1PBFsj+auicUGQC+Bmd/81QEY7zwntA9YzgaY98uHuH/MJj0UJ0Qd8RQSyEnvf4DTzMZ2xnmv//dfZL1TDJax4N4Mlgo4AT1dNL5cdmi48+5ke3FlvuvMqPEbF/ErWeep1GSw8XNlJizb1evPmLWxgqU4y78agIwfd+kfaG6CQoTei5DdrtYG02a+1PB5HSQuZv7kOaQvoc0RxQXrBudvdw+ewZpwCbU=
X-Microsoft-Antispam-PRVS: <MWHPR04MB04018B86E83B2FA98201CF5AF60A0@MWHPR04MB0401.namprd04.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(10436049006162)(264703809997249)(145744241990776); 
X-MS-Exchange-SenderADCheck: 1
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(8211001083)(6040522)(2401047)(8121501046)(5005006)(3002001)(3231311)(944501410)(52105095)(93006095)(93001095)(10201501046)(149027)(150027)(6041310)(20161123562045)(20161123558120)(20161123560045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123564045)(201708071742011)(7699016);
	SRVR:MWHPR04MB0401; BCL:0; PCL:0; RULEID:; SRVR:MWHPR04MB0401; 
X-Microsoft-Exchange-Diagnostics: 1; MWHPR04MB0401;
	4:2D3TV6bEZ9fA3f1fnauUx/UEvmU+Zh+fxhKDk6UYN7n+EVwqx8tYy+V17B/88D5CK7k63vkXp+MbXT+kcL46i4tODNOYIe9ajs2ZUHQicI+y8KEseghMQS5tds7aSHGKAeOpR4MRSd7KvFCjumTGfWmy72HDXdKfjG9Sa1Z0nQKKzD56XAPvE7/I47ae7sawCpYYrsgCVPbANDHg1169jnoQ2Jjz8vPlYoVdpVOoqlPGg/+XVMvveImpACmQDjl+A9RB2VXwf+cOak2200BGy3z4pM8PG+In76c4Mw+Nk+OXXEAkXDSiER8JY6Z/h4Keif8auHh9rY08I6Cjm+1FO3JkuX3xUkZarJGYl50wVLzRPC/sTJx0PUMIN/HDT7OW
X-Forefront-PRVS: 077884B8B5
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10019020)(136003)(39850400004)(396003)(366004)(376002)(346002)(199004)(189003)(446003)(76176011)(2616005)(476003)(11346002)(486006)(386003)(5660300001)(229853002)(305945005)(956004)(16526019)(186003)(105586002)(6666003)(26005)(106356001)(6246003)(81166006)(8936002)(2906002)(97736004)(3846002)(6116002)(8676002)(86362001)(478600001)(47776003)(68736007)(6306002)(66066001)(50466002)(110136005)(16586007)(6496006)(48376002)(316002)(7736002)(14444005)(6486002)(25786009)(966005)(36756003)(51416003)(52116002)(575784001)(53936002)(81156014)(107986001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR04MB0401; H:ionel-work; FPR:;
	SPF:None; LANG:en; PTR:InfoNoRecords; A:1; MX:1; 
Received-SPF: None (protection.outlook.com: ni.com does not designate
	permitted sender hosts)
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; MWHPR04MB0401;
	23:ZxHlMSsqW7g68GWTofHGhO+oK3/Bywji7fJyBpxP1?=
	=?us-ascii?Q?vUeWArKBXxB0oWJclBy6dX1saQJIf3ZkZ9hPPVUerilqiqbSq8TWU4JSH9TU?=
	=?us-ascii?Q?Sc8ehgv1vKM710vARm0dfthzKebo+gh432t77i/2TXxi3zWjY1cmF8wovcEA?=
	=?us-ascii?Q?7hJD1dk9gMukLYRyjzEFl/HmqXFnpOuVThVQks8VU2e5Yhu2GrLPiM5Ok5YP?=
	=?us-ascii?Q?ptkTmHNcqFlv671Q+nJL7GJ2DlEDoF+Bu+73C5rMebqOjLIfxN8wiGAksHSA?=
	=?us-ascii?Q?ryEyqDvZ+YvhgaShyupc7oMmX+Cym1nX3vFag7Hc8x4ppoeFVCiBVS9t2BBl?=
	=?us-ascii?Q?/3diLkZD3qZxtMhRAovBL6CbK6EvRZbCoxAw70mwy0/bSQ+6hQ87hT6Chudc?=
	=?us-ascii?Q?DrnL/mBotoKFfwSMtcgogpqJcXZaSySIJRS5SUdHN+eLJSUoObrQwUx/+qvz?=
	=?us-ascii?Q?G8dSuqXaSQAorIlCOxhV950nSC2n4m9COJu2r5+YDIJvXV/mYr9XRi/qR6md?=
	=?us-ascii?Q?ysrtfuejkWO4HQRmtBH5n3WrjoDeWHE1Sqb9t89zH6SGV/VG6wIptMmuhHsQ?=
	=?us-ascii?Q?1pJy5BYeqojh3naPysB/S7Aq5i3xjBp0eJ9yVwQbJZBee5JNtAhdeDra1gL/?=
	=?us-ascii?Q?ct77ZJv4xWOWzRG+J8VOG2I51ALzs4v8Os0g3pSYpOAx3Mlk4MD9IifOZzpX?=
	=?us-ascii?Q?hN84swlVRqmf3atsG+IYHGYWQwMYkJLfO/mwYF4cbnFjhpN2VS+yK1LGcCmk?=
	=?us-ascii?Q?RKXRdfc0d6KekiYHTcKHoGinwZwoG1qn7mn0XnkTmrAEIOPufDi3q3bckPl2?=
	=?us-ascii?Q?NaRld/3pAly9+RJd6PUEF6P6McgLl0fw6E3ubG/xOlLPgNnnjSLOrJr5Rihr?=
	=?us-ascii?Q?Qcjj5uO/bshjFbxTU8zmKmcmLxNuz8Ryk3n8NqYc6TGaCPbbQJ6Mn2G2agRr?=
	=?us-ascii?Q?ptnJOFau+DIV4fAqa5N9YLVvWIw/dYXSQ5va06X6BcPCloKqHtKZsvIEQYu/?=
	=?us-ascii?Q?gnBeKZl5hs2WYJl/9z4MnDArw3mk1og2ZDSIa6626Q+czYtYCRE4TikBiJyj?=
	=?us-ascii?Q?pL/ROtQfY2KW6yPaYrrWyCBZtN9pHvOqIDWQanCyv+y46IMSn2cr/Az0k5Ru?=
	=?us-ascii?Q?CiD6PDQDo1dvDVPn6MR/epG7+w3+ASB6ZUpGuSkdUSNpkJebCUyI4CNaqrAf?=
	=?us-ascii?Q?CDu+S3eDMUNsodg0gmVi+f2p3h+lG/EBGgFl0RNIyPqnDaErXHt8w/HQ5Mv0?=
	=?us-ascii?Q?oTdm6T6mA9O33d/izA=3D?=
X-Microsoft-Antispam-Message-Info: 6YgmnQVSJaKqt1jJYRe0kLPNymipPMN/KFipv/J93cFy/iRM4pOaI1LuwRwCcnxvwlrEcrnng4oxhUtGZAUZhE0LNQINVaZvh2cS+RK5f+4INp5oC+pC6xKMhmqFlH8Zgwm+D2C6wBWiDcYDoLQL5+TQ9TXk6hkQUrNqNeKcJbgYGDU8UZbfGnaDDmF4OHYi7+DSGmVIL8wbXARhx7Xbwh3GTfgsMEGmQWXAhUHHIaG9MO6MdTrm/C9tYWl4LRZbRmEoNQoxehR8bJX1kIF/MHiCsjGekkMdlkllsTE1L3zNNRkNLTtuG6rpmXzyhEkfb9HEViEeZW6JROtvM0kr9p+uf5i86v8PJI8AfblWY0s=
X-Microsoft-Exchange-Diagnostics: 1; MWHPR04MB0401;
	6:H8u8ttu5LAMX7ww2jpcuVZnE2/hn+XURkMC047pdwlF72ES7JYpxnjaN8tdMtklZmD7L7p3C6FYC0O3Nkh8O41LRFEGvX/mEkeOeLqr1vQDH2Gs/1LAidmEVG+khXoh8ZvoZyyEFmNIvxmQmr16AJVgcxXLJSRt25YPCV1DEoP8QSsMENvieGTiVQ1gwh1gfGRN42xrs8cyudhV2dLnt0FqlNPAttOU+H5+5AumO1z7UDBuWajmbxxp2LBdIzhUCdoQ7L64Ph3KgdqUreJx7qYl7jcHUthkS9G9jKNA3nXeVlEW/PDHsnJd43xEb6iqQaY+fFjz9nXG7rUo1IoGjroULQ9I9Sq9N8JymhCwCBJ+SHudw1GEUPTDBcyLQnHqjxRtp2F07916e0S/tlwfMhaZfUPM821FYGE0TzvO31Bl3Em1RfEd0TAI47AtoGeJUrv8zH3J6nFQhqOuG34lAwA==;
	5:4l3JT6Vvb+emQmb9kTBVOziQIYgXGY5akeblmoNOEiVgpyvgwV6TGHoIlFC9mNLOhIttvoiKIFQGFD0b0To9cflu9RokVRpyN3JgTxr4Ae3UgBhrGPCaBmf9u8p3gxo0EcjZs0d8I1GcxDejUNwpR7gUGyOetmYw5VDkNVa9m9w=;
	7:rXNQRdJwN+i4jXTgxC1zX/MIf9u7tVwA5PtNJqF68V8D8GVOGeDWq/kMZxF8RC4ocOCniai3dGW30dX4Vitf0+spXgrCvag8QLK/793u10MbAPf+R7wRRUBDBZ9LFiLWm3p88mCrqWjoFJ7XECWbBEuLLIrRkl8XOK5bf3xnidPLftb5UlZPOQyyn5OK3W3MNMA8TcZAXglIMLhY9orjzzub9Il6i7jHKG3tbJIAOXJAHEZP0KviGCrMgMjugXUw
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: ni.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2018 09:16:06.4775 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 73c58f91-dc45-4ea6-eca0-08d60cc6e340
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 87ba1f9a-44cd-43a6-b008-6fdb45a5204e
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR04MB0401
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
	definitions=2018-08-28_03:, , signatures=0
X-Proofpoint-Spam-Details: rule=inbound_policy_notspam policy=inbound_policy
	score=30
	priorityscore=1501 malwarescore=0 suspectscore=1 phishscore=0
	bulkscore=0
	spamscore=0 clxscore=1011 lowpriorityscore=0 mlxscore=0 impostorscore=0
	mlxlogscore=999 adultscore=0 classifier=spam adjust=30 reason=mlx
	scancount=1 engine=8.0.1-1807170000 definitions=main-1808280096
Subject: Re: [PATCH 3/3] image_types_wic: Add variable WIC_EXTENSION
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 28 Aug 2018 09:16:10 -0000
Content-Type: text/plain

On Tue, 28 Aug 2018, Richard Purdie <richard.purdie@linuxfoundation.org> wrote:
> On Mon, 2018-08-27 at 17:31 +0300, Alexandru Vasiu wrote:
>> Used to specify what extention will have the image file which
>> is created using wic. The default value is wic. For creating an
>> ISO image, WIC_EXTENSION will be iso.
>> 
>> Signed-off-by: Alexandru Vasiu <alexandru.vasiu@ni.com>
>> ---
>>  meta/classes/image.bbclass           | 2 ++
>>  meta/classes/image_types_wic.bbclass | 3 ++-
>>  2 files changed, 4 insertions(+), 1 deletion(-)
>> 
>> diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
>> index 024d2d4c96..c6833a6770 100644
>> --- a/meta/classes/image.bbclass
>> +++ b/meta/classes/image.bbclass
>> @@ -607,6 +607,8 @@ python create_symlinks() {
>>      if not link_name:
>>          return
>>      for type in subimages:
>> +        if type == 'wic':
>> +            type = d.getVar('WIC_EXTENSION')
>>          dst = os.path.join(deploy_dir, link_name + "." + type)
>>          src = img_name + imgsuffix + type
>>          if os.path.exists(os.path.join(deploy_dir, src)):
>
> This is hardcoding an image type specific issue into common code. I
> really want to avoid doing that.
>
> In the past I started the process of trying to untangle the spaghetti
> we had in image.bbclass and abstract it into common building blocks.
> The hope was to eventually have proper APIs around this.
>
> I never really got back to do further rounds of cleanup/improvement to
> get to that goal but the more image type specific pieces we add back
> in, the harder it will make those goals and the less maintainable the
> coed will become.
>
> So is there some other way we can handle this. It looks like we don't
> even use this iso mode in OE-Core which is bad from a testing
> perspective too? I don't see WIC_EXTENSION being set to iso anywhere?

Our problem is this: all WIC images built & symlinked under
${DEPLOY_DIR_IMAGE} have the extension .wic, including the iso's.

We want our build pipeline to output an iso directly after issuing
"bitbake <image>" by adding IMAGE_FSTYPES += "wic" and having an
<image>.<machine>.wks which speficfies the isoimage-isohybrid plugin.

I agree this solution is hacky. An alternative would be to just rename
the image .wic extension to .iso in our piepline outside bitbake and be
done with it.

How about adding an IMAGE_FSTYPES += "iso" and creating the associated
logic/bbclasses? Is that amount of code justified to have .iso
extensions to wic-built images or are we better of just renaming .wic
to .iso?

>
> Cheers,
>
> Richard
> -- 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> https://urldefense.proofpoint.com/v2/url?u=http-3A__lists.openembedded.org_mailman_listinfo_openembedded-2Dcore&d=DwICAg&c=I_0YwoKy7z5LMTVdyO6YCiE2uzI1jjZZuIPelcSjixA&r=fzwh7IUt7VYYiD6094geII0kSDP3DkEnN0B8zB62AxE&m=TX1s2gOuF5JVPXLJ60USSIym1ujQ2VDP00KcC-1c-_c&s=pYCCOX_mHEmd8jE8DN3zmrnoYuL35Wz_sA2MuuYDNrw&e=

