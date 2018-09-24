Return-Path: <prvs=88059e1ad1=adrian.ratiu@ni.com>
Received: from mx0b-00010702.pphosted.com (mx0b-00010702.pphosted.com
	[148.163.158.57])
	by mail.openembedded.org (Postfix) with ESMTP id 7FF9F792FE
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Sep 2018 14:58:45 +0000 (UTC)
Received: from pps.filterd (m0098779.ppops.net [127.0.0.1])
	by mx0b-00010702.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
	w8OEq6h6002007; Mon, 24 Sep 2018 09:58:45 -0500
Authentication-Results: ppops.net;
	dkim=pass header.d=nio365.onmicrosoft.com header.s=selector1-ni-com
Received: from nam04-sn1-obe.outbound.protection.outlook.com
	(mail-sn1nam04lp0083.outbound.protection.outlook.com [216.32.180.83])
	by mx0b-00010702.pphosted.com with ESMTP id 2mnm1n4ybq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
	Mon, 24 Sep 2018 09:58:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=nio365.onmicrosoft.com; s=selector1-ni-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=/VzPmcod3uKnbz5fLaqGJPhclKtMt2a9elL3kxkknnQ=;
	b=WsC1N3j9Q9C2NEwXopk4mxF8OVUzGeyWswGsEhuzK+2WGkwkF9Q/oXsUBTP+GB0OyqVbwT85kwaQsphpIeFpXF+Nqe8MH73fSw4x7tm4wHcM11XcuIJZEgJP7m4/U0SzVQWW13Pt5oGGsjv80DOl/j6qCGzrWhINwRkZhSeLki4=
Received: from ionel-work (80.97.64.55) by
	BN6PR04MB0387.namprd04.prod.outlook.com (2603:10b6:404:91::16) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1143.18; Mon, 24 Sep 2018 14:58:42 +0000
From: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	openembedded-core@lists.openembedded.org
In-Reply-To: <be7a233326b1d6709c57398e1a01ed5a371ddb3b.camel@linuxfoundation.org>
References: <20180924132500.30363-1-adrian.ratiu@ni.com>
	<be7a233326b1d6709c57398e1a01ed5a371ddb3b.camel@linuxfoundation.org>
Date: Mon, 24 Sep 2018 18:00:28 +0300
Message-ID: <871s9jj5yr.fsf@ni.com>
MIME-Version: 1.0
X-Originating-IP: [80.97.64.55]
X-ClientProxiedBy: DB6P18901CA0019.EURP189.PROD.OUTLOOK.COM
	(2603:10a6:4:16::29) To BN6PR04MB0387.namprd04.prod.outlook.com
	(2603:10b6:404:91::16)
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ab18348e-f95b-4e9b-47c5-08d6222e3877
X-Microsoft-Antispam: BCL:0; PCL:0;
	RULEID:(7020095)(4652040)(8989299)(4534165)(4627221)(201703031133081)(201702281549075)(8990200)(5600074)(711020)(2017052603328)(7153060)(7193020);
	SRVR:BN6PR04MB0387; 
X-Microsoft-Exchange-Diagnostics: 1; BN6PR04MB0387;
	3:2RQQUuwaEk88wSpY2S+M8UyryvFcVf6e6ERMq2tF38WyDknLL9kKZvy2hZhLohXm4txjmIlicIUx6Z2trLMNjN4C14RYmtjuJQ5wZ7MCPh4xin7VrOBGtQP9YkC6byMhEgxNFHicQES5uTXR1SPjdpXKWoIBbulAd1IyF0XYXL7rlIx50bSO2T2fT3W2dgOHwgPklAOSQ+nTS6gYq+KpCOiBKcp1ZaxhRRy4cqwbI6jzXKx+efkSAW06Lzce925H;
	25:7L6g+Dx/Jyxqon8S2zG4n6bxh5RxKDLZYf8Dj8iXDnARCt97axB9yI4MYSFiI+y+sibqYHXIG/+0P04JU2lp1MzEfOwKwZCMDP6xgzRH0WAH7tFuCq4ufercZAXfsef3T69ZR0HZTI2P3/CxYzUuMbuwwsutffYmXnwaCuZlqKZd4uH2x3t5UQ+BIi54kIMBxKB8n03GUr9hZiFbwy6OOg4Rm9FRvg3Mid70zjOrxkvGbsnTwvVkd6RcDr2vP+XfxEvBfuFjbpippxorZxpfIVAQt2IETLwF6pAaZ6/StQiN4yWB9pea4Idp1Yx/mDTF+aXyXTiEmQVHWlFu+IAkCw==;
	31:Yi6hbxVk4SXaTZTIPPJDFBKpbIu1zKq84H4ix5OP+mEg9gJiEHxAw5tL4UxAqeShoJ09tmM20En8g+T+4NALaPqVXfAHS9pxpW6aS0Jph26Jy1O7LO1ZzwjjWme+xkKFlPw7NXJwVDSV9xYTZJ9DTbggrWZJGq8gVN7nOSGxZY2t/JaReIi4GMoBvnGEaiesVPKn/RkevQTbQkDGsT8vN8yYostUQ/+2/Vtk7zrPBTk=
X-MS-TrafficTypeDiagnostic: BN6PR04MB0387:
X-Microsoft-Exchange-Diagnostics: 1; BN6PR04MB0387;
	20:WKP06vw9AbsYjO69DivE/lwUt0IRAF6aW9H8/MxwMXis0DIv02Igs+IGnF7DN7SwSUzTIS8zsIqviBttlHVHyONACIg8Fvq1UzRILNVkqPJ3foLROzCy8HE5hKdx/7atuwhK44TWpU3VB4mCmsQdQlCK4fBxtqo9VQv37OYpsQPwZKqGpe5qvF6H2YbKh45fCnxo0uvXIm2tE+UAmZgOGW5xFrWFUQFS7vSzXcAYK3X+SilDTXsdxtluFuoiLGlh8NWvSxQJXaG7p///FouypyKlxm0wWdwC4nP7/srMTjJZRQswmlvVVz6gM3boaLEST2ErAlIx5Bm1qHENdjajLEfzpSOh2WJ3MgVCjzfcALgD+gc2NT8r6R/8nffEM5fDAa8pQhfEkf7q1yk4AyQoozEJ5iaW+OGt5H4H7e0lTf813740C1tzwARqWZyPeRpfbPg2/kPzr1sjujs/U6hkPEUltfMVnw8Loe+9tJjxT9HWkEVtPJybEOh/oMQLzkeXPovQZyUXGWYthmgR0USAa027mVcnIdFOlwbzUFlLbiipY2+YxN11Z2CbC8tzLdWr7hl7dZBx9oiWz0xOMswSlUcrO8+biYUOJnD9LB5nAp8=
X-Microsoft-Antispam-PRVS: <BN6PR04MB0387371575F5D51736E112EFF6170@BN6PR04MB0387.namprd04.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(158342451672863)(145744241990776);
X-MS-Exchange-SenderADCheck: 1
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(8211001083)(6040522)(2401047)(8121501046)(5005006)(10201501046)(93006095)(93001095)(3002001)(3231355)(944501410)(52105095)(149066)(150027)(6041310)(20161123558120)(20161123562045)(20161123564045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123560045)(201708071742011)(7699051);
	SRVR:BN6PR04MB0387; BCL:0; PCL:0; RULEID:; SRVR:BN6PR04MB0387; 
X-Microsoft-Exchange-Diagnostics: 1; BN6PR04MB0387;
	4:MA+pv4ZPJgxwDzwpQphxvcYwLty3uqid0Iksz8cePbhtIsh8T383ZiXIU9iSAj0S2uHlbbpv3Z2SY1eZhJSil9YzBc1FobdZ/D0Uyo6+LkzfoluseILVfrrP6L9BrAuc0o4GHbVMZH7wqxevH40VZxQ5o9yMYO/MPonOczLn4NDLG0xsh0b2YWXFw/Wgb/sr/wnhL9wUTkttpgPgGo6CF9l+8k5oK+5IPwNGJHnRccWUVusK9BfRR8m8dMIR2EpnFJKNBtovy7MsR12wQDmoIhHpxT1mrQGQFJz4xvqmH2lJAldRMltX0BIUMcU4x1DMYxkvKY0i7oo397hBzenanT71mX1AS5U0vPaVcETgCuk=
X-Forefront-PRVS: 0805EC9467
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10019020)(39860400002)(376002)(346002)(366004)(136003)(396003)(189003)(199004)(446003)(11346002)(10710500007)(106356001)(14444005)(105586002)(476003)(66066001)(486006)(6246003)(3846002)(6116002)(956004)(47776003)(2616005)(186003)(16526019)(16586007)(478600001)(68736007)(48376002)(316002)(966005)(86362001)(305945005)(53936002)(386003)(229853002)(36756003)(6306002)(2906002)(26005)(8936002)(7110500001)(50466002)(81166006)(6666003)(15650500001)(2420400007)(8676002)(97736004)(6486002)(7736002)(6496006)(52116002)(81156014)(25786009)(51416003)(5660300001)(76176011)(107986001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BN6PR04MB0387; H:ionel-work; FPR:;
	SPF:None; LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
Received-SPF: None (protection.outlook.com: ni.com does not designate
	permitted sender hosts)
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; BN6PR04MB0387;
	23:pWDX4c4F0TpMZLYS3Iv6ozh93ezqsSQYqztLxPR/k?=
	=?us-ascii?Q?WUNRgl5WvcXJzZ1KkFokQRNboAqgtFz16tsCxIL9wNm313atIdR9zEWCc5JC?=
	=?us-ascii?Q?H3NM6AVlcLmuvscHhc7lCYGoBlv1EoyeEPc2HBK3Rj5gQXuP2NOeOYEjDnOq?=
	=?us-ascii?Q?/wLSMSkdUHaE6D0eqK1ZDfZ4jghCih89YSmKxojvHOxJQHVFGNfPydFflvLW?=
	=?us-ascii?Q?mfv8ldOMInNcc26xoUnlVPFjaDKItNGpTBNjuy53S7HypR6T6h/UlNoxX0na?=
	=?us-ascii?Q?OPvZqzfIvLPf5g/htBPcvle8SaIVbpk6212HSZRLbY7ZAT4Q7HmnSXP4fwSX?=
	=?us-ascii?Q?lrw+EY0cFITecq1wGfNq/RYfQx0UC5f1Bt2vA8RAtoQVXIRJnCEIGkAURnld?=
	=?us-ascii?Q?Gzl8faio4Y94DRJ1SGe1m4/njST6PwSM91kT8iyVBTs3PWGhuKl7tbbu7oEN?=
	=?us-ascii?Q?Fuedfuyv126CWK6wkB4SwRUvyc6D1X76huLvucQ0Wt+Oab6FOasgHEN+R85q?=
	=?us-ascii?Q?2PlBoV1AdhjE7OAC4qMU5mEVztX1jNwOPMqyiSX4lmm3lWP0cvAxYo0qgdsW?=
	=?us-ascii?Q?XzwTv7B1/QlCM4VFwLsJdtKFVMUIbTkD/Knm1qJfvQJkiGykxbNb+X2Uv6Ss?=
	=?us-ascii?Q?jgW+HTrQeWIUgVuEdsL2W6Xv62oQqdr+1lpnLDqqwKR3m80x6+IuT12enVVr?=
	=?us-ascii?Q?30G5ymk2UNlFoZplETHbJUUN+BFDFbl1Rp5JhTKx5OP62Mi6AKRYftoC/LK6?=
	=?us-ascii?Q?0G4KpbD3+jHUdJ6cDcMJS7F4dqRD558q0CwE9U4z2eDDfWc7ooeehIxcsoo3?=
	=?us-ascii?Q?xcFDKD2HmS2zE9P5DeUOD/9anq9pm+FFWFirKM3AhUj0wbF+X/Nc6TCXT+1i?=
	=?us-ascii?Q?8twetT1wUbnZeJQL01R3YiWi8Sj6TJPVAkarbUgYAvMCH0gIadR6IcNyF1W0?=
	=?us-ascii?Q?N5iVBArmxe4mH0h2b22iFg9A7rsyn4pm7sCP2j+FeSXxadkDQshDNgVf6e5L?=
	=?us-ascii?Q?aTM26gsPxGq0tli2dEWJivmkk7X7eHZgMoE/OSjrwWlff+Mrom1a8uz+qqny?=
	=?us-ascii?Q?ZMNTe8rzrgWZgJZviesPk8vZvQ0mRtGpAdze7o6VJBhwTV2UMaA+2hYXa3Zi?=
	=?us-ascii?Q?qxQRQ84wapObnkgNDnz3+IkZqFcq4IkCs+ad6PXPlzmBTQZrjDvgbCfAgh2p?=
	=?us-ascii?Q?EI2YfauN3znHmuAlOa/htOmRLJYBssquwyDpDYrDMj/7y9FIGjWdESkbeWc7?=
	=?us-ascii?Q?gGG/p56p8w/z5xUOQ66oSyWc1vPb5NbgJ1tZDQ40VHJvCm5siBDO6r962IzC?=
	=?us-ascii?Q?5/nx3HLuHg/iuigCrIRQ64=3D?=
X-Microsoft-Antispam-Message-Info: agbbBTz2ALJScaxp0HcsFfZ0UGllCOBfjo12V7E2OOYNE8zZGAQkBkklEzucwr0uXLsJ8ECozZjrhUht6whBQZ19ny41v7sW92ucp45ycakAnlrt9Cx3NdPRyXivHN7WTCAPtbSJwoC0K5ZILa5JzyXLdVBCgFQECcFJoY6UxdUfBYpvr0UoQmwavajsU37W7xYOt/pil7GSzwCZkCDsdMWVuL4jn3juwWqefoe8hESa0mriqSyWu9UidNuvvZPwZUYcgulCwYfhVmlVviNUpih1r5klP2t3J4OHQY4B4+ouxwkggtW4eeKgphtr4yMdxa++9Dl4twhJNzm+GWuIyLyy//xDAuFgL6zJjIyWYfI=
X-Microsoft-Exchange-Diagnostics: 1; BN6PR04MB0387;
	6:6Iv1CePC2ECt5YKnJ/1Rzd7FKwLr/1EaraLJC+jxFo4rhCANW0YjtsTzzAcXkITwcTH3/IIk+uhrm/n4t3pFZdmScSaEr+vUtSPeybQkZ+MNu6LO5bkHssWaZEXLyW7b4OV5UWWWBKfq7lgAv9W0CLfB4MNcwvmjPnzhewECNOdcOYO945MczjK9p4OKVwLb80HaCtiW3BLZv+RKgbchycXyzmm+Ad7anLlml3Asqz1GBaofsI5TIfr6qvdLZAOxmw1RLdSFT/bU5hUcRIs8rBq9cIAUUQSqMD6ty0fLKMx66D4FHDzWrrbZ8gCBJCByPAfKFAMj5VakzjNCl2Da7m29az7Ilgw2ZgBS81AZ3KQOtHAiJbd5sqTIxHPeBbNk46Iy3XYkF5yv+ZOTG7oW/RKsX93X3hMgoQkRN4+yEwr7gfbwtq4ikmtbeRvMkycGL05sQmVGTe8HJ7GhEWoEFQ==;
	5:7huomrhTnd1fN4TlmpSccMlM1Rk6WYg9mm2RpNC80tMxq8HF0phdSFd8r6451/54JMzP6AjANp6VQ1tk+/8IuOFLDYZLSOwElHyZMBdCRzzQrTd4x3EB8JkfZVtTURPAXPCs3SSOxZOUAOTf6SoXBRpiOKk8rGCq4BSXXY4o2q0=;
	7:16wFKQcseRjlAxDNVvqJ+pv0330CILpzmwtiDITIPX/gg0ZoItHQIWPeYgCKj4wHdhomFe2aidJ0Sy1r9UvtJDSKyISJ82EDC1GK8X5AFQbxjbWqSh/bdHNP8HO/crwGFYsDuLUYSET80p2tWBBXxnm82EJYfTNNxgZCuGck5FPuTg7/HTeSjC9vzQHaj/gJ+NQAH/rtFERwlFRisji3K+1Lcz1BZoixJ++mtiLidub7DraeLVX34nYDn/v/z654
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: ni.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2018 14:58:42.4149 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ab18348e-f95b-4e9b-47c5-08d6222e3877
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 87ba1f9a-44cd-43a6-b008-6fdb45a5204e
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR04MB0387
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
	definitions=2018-09-24_09:, , signatures=0
X-Proofpoint-Spam-Details: rule=inbound_policy_notspam policy=inbound_policy
	score=30
	priorityscore=1501 malwarescore=0 suspectscore=2 phishscore=0
	bulkscore=0
	spamscore=0 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
	mlxlogscore=999 adultscore=0 classifier=spam adjust=30 reason=mlx
	scancount=1 engine=8.0.1-1807170000 definitions=main-1809240147
Subject: Re: [PATCH] rootfs: always update the opkg index
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
X-List-Received-Date: Mon, 24 Sep 2018 14:58:45 -0000
Content-Type: text/plain

On Mon, 24 Sep 2018, Richard Purdie <richard.purdie@linuxfoundation.org> wrote:
> On Mon, 2018-09-24 at 16:25 +0300, Ioan-Adrian Ratiu wrote:
>> The previous logic assumed that if $BUILD_IMAGES_FROM_FEEDS=1 then a
>> complete set of ipk feeds from which to build the image is already
>> present under $IPK_FEED_URIS at do_rootfs runtime.
>> 
>> $IPK_FEED_URIS usually contains "file://${DEPLOY_DIR_IPK}" which
>> renders the above assumption bad because some recipes in the current
>> build can contain code like do_install[nostamp] = "1" which will
>> cause
>> rebuilds bumping $PR and invalidating the index.
>> 
>> Even when the index is manually re-created before an image build
>> ("bitbake package-index"), the nostamp will cause failures because
>> the
>> dependency gets rebuilt before do_rootfs in the "bitbake <image>"
>> call.
>> 
>> So make the opkg rootfs index logic the same as for rpm/deb, to
>> always
>> update the index in $DEPLOY_DIR_IPK to fix the above nostamp failure.
>> 
>> Feeds outside $DEPLOY_DIR_IPK continue to work as usual.
>
> Is this with master or an older branch?

I've extensively tested this with Sumo, on master I could only verify
the build passes and a minimal image boots.

>
> With master, a copy of the feed is constructed under WORKDIR which is
> then indexed since other image generation or package writes could occur
> and the index isn't static. I'm guessing it doesn't do this for
> external feeds and assumes those feeds are static.

My description of the problem mirrors my understanding of the feed
construction process which might be limited especially if it changed on
master post-Sumo, but the answer is yes, external feeds are assumed
static.

>
> I am wondering what happens if you put a remote (http://) url into this
> though? Does that still work or does it break?

It still works, we're using http paths all the time in our distro
(public feed server is at http://download.ni.com/ni-linux-rt/)

>
> I'm also worried about what happens if the file:// path you point at is
> owned by another user and isn't writable.

Thanks for pointing this out. Looks like it enters an infinite loop: the
do_rootfs task is stuck at 3% and a worker process pegs a core to 100%.

Without this change, do_rootfs gets stuck at 12%, worker pegging a core
if the feed is owned by another user with no write permissions.

This was unexpected :) I'll roll up my sleeves and start digging.

Do you have any pointers about what might be happening?

>
> Cheers,
>
> Richard

