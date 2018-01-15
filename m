Return-Path: <alex.stewart@ni.com>
Received: from mx0b-00010702.pphosted.com (mx0a-00010702.pphosted.com
	[148.163.156.75])
	by mail.openembedded.org (Postfix) with ESMTP id 5204D7827D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Jan 2018 15:59:55 +0000 (UTC)
Received: from pps.filterd (m0098780.ppops.net [127.0.0.1])
	by mx0a-00010702.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
	w0FFuFOo025166; Mon, 15 Jan 2018 09:59:57 -0600
Received: from nam02-sn1-obe.outbound.protection.outlook.com
	(mail-sn1nam02lp0023.outbound.protection.outlook.com [216.32.180.23])
	by mx0a-00010702.pphosted.com with ESMTP id 2fg058p2bh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
	Mon, 15 Jan 2018 09:59:57 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=nio365.onmicrosoft.com; s=selector1-ni-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=TIhZkxuY3pjTSsjqkNh2M6jnuJf86xMusvjqSauBKDo=;
	b=NTkWW8N6v0ZMLez/vROsrPdH21t3dOUvb9igpHPD4jSXRbNM2abA4N7NjEGdMxECmBXNMyeMVQrX6+PM35Z5QUeom8tYmpSNXoLjXMeZfWTWBmf6Y0SAxGErwpzYKssoSTtizFInPL03N6qmILZwb5odWPw2DsSXlbLjT3km+ZY=
Received: from [10.2.72.95] (130.164.62.180) by
	DM2PR0401MB0973.namprd04.prod.outlook.com (2a01:111:e400:3c0f::11) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.20.407.7;
	Mon, 15 Jan 2018 15:59:55 +0000
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
References: <20180112130644.21313-1-alex.stewart@ni.com>
	<CAP9ODKoKBNbFia_YCQB-H1J10iUoCu2ROrjCZEW7t07LWRT4cA@mail.gmail.com>
From: Alex Stewart <alex.stewart@ni.com>
Organization: National Instruments Corp.
Message-ID: <ce42cef0-e51a-50de-0454-02ba61667d2c@ni.com>
Date: Mon, 15 Jan 2018 09:59:52 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.5.0
MIME-Version: 1.0
In-Reply-To: <CAP9ODKoKBNbFia_YCQB-H1J10iUoCu2ROrjCZEW7t07LWRT4cA@mail.gmail.com>
X-Originating-IP: [130.164.62.180]
X-ClientProxiedBy: CY4PR04CA0077.namprd04.prod.outlook.com
	(2603:10b6:910:4f::42) To DM2PR0401MB0973.namprd04.prod.outlook.com
	(2a01:111:e400:3c0f::11)
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bb4ea130-fc8e-4842-0d02-08d55c310587
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(7020095)(4652020)(4534125)(4602075)(4627221)(201703031133081)(201702281549075)(5600026)(4604075)(2017052603307)(7153060)(7193020);
	SRVR:DM2PR0401MB0973; 
X-Microsoft-Exchange-Diagnostics: 1; DM2PR0401MB0973;
	3:bhXRfnfqeFe7y70FaEDZklvSUZ//1TPYFR7hCPfvI6q2WNQWSmMm1G45jF/p8ZIew5GfkOWJlgNcU9UIDVBH3tHihqeawnv9uiL6+wzqSpfX0xYaJBCERA9efQhZAjn4442AA/4jVbGgQRflbeFrhBz+xwOYYsqDpMrVofOT5erp4ub7UbUvwKQhofipGdziTJPICXedvE/sGpl5A8PLgEisYHbCdFJao5w7Syf6Bj0QL0RoQ44bGHYUtuI3OHi+;
	25:geO4oPSP8F4dVnUNK31/cJTEdlKgQaeqeQpZ5BDHTp71dJSwn0DKiAmXEn78O5PkHqklRzLTAF/oP9JiUYZfrrfLsuvZ7KQeKghQ1EexxKXjMzS4vn3zjvO98fUnS3TUcQPU0rEO6E/TwpAxE+1yqGezGhyN6p7m2Vz5uj5e0kiJLoGj2kdtmisXqHXTx1lyRjJXiNinAA999dUIFOobc/tpntgp92tZPvXsCL/dlhT1KjGZkVJlwW2ww8n3O8ycbRBojxM2iy2kmbPhfCphrH7yS0C389uBWyxsWu7wsAWpEjK1K5ZaJJcDAMqkpwiLSKbKrJOUccqgfMZMmcl5VQ==;
	31:mAQz61hrkn04x4qHflma8TwQ2PZHvpR4uE/2VMpWsXEbyhglvtTHIBTIYMOBr/jo48fnZ1wYWlm6GLr2g8IjJ/9P9RiW3AkNNaLSXKgI3+PbNiKbjvZvmh95BITu/TwnQZcspAhPWMeafY08BWR5ryev1wQBSywrliG7lULodi0jOPoIVrUZi0XrimfgcIk9D8DkJkMBEqzVpbqoCwlunJCEZ5C9d+uAM8aI6IeLFYw=
X-MS-TrafficTypeDiagnostic: DM2PR0401MB0973:
X-Microsoft-Exchange-Diagnostics: 1; DM2PR0401MB0973;
	20:9PtkwrNU6Ia8UrZsqBrYN2RqGV+BePttKzzGLxpw0bFtBY056D8yiRAv0nmZNz82LRPdYsEb5skdEhwSal8H2bU0pVbT4QFWJMNKMChMiLuIwRibrwKe3OCSvzq4yeZd/pkH2s2EX80yE9fXimiZqtVllx9BGT7Jvf+cxQH9MIh0zOtIZq+CHxSf5hGBsmPZMehUMLHF99riFJeJa6VpK+//QYArWIBSck6wljylthKEcXBghWtBCKQ2KkPmp/CxaVS3DjguNNY3xrHz5DZ+x5FRGa5ImscOtn5S9Vbj4Ng6Jfq/XOSdmDSxoAcCTW0/p2N5+Iaatb1Ui7FgbD1ZJZV53zfsDhUfNCj4BWtjwoLQb1nMSwNYQ0YP4cBBxeqIJzq2I4exSuLe6cf6211gU/P/ffWymPEml5q1SSebJipWM9rdYNc8ouHB95ZPLy080QgPUIWOq8n1kPMic1YDL/wuqWYzWhyXYDlyNwJfqxMEhFcbkPubQc3P0EaZPHsHtnOaRTN/SFyKQcqL0jR+6tmlC+c0iVtbunDGZRxnXIiQgeRwh8oevWy9BOHWoHJxbFlUrHLV8bU/ASrMZD4arRUYqbQviw0XuSERpz5lgz4=;
	4:WWrbfy0GvSAxElEbXICoQpV2ScJ9Gn0Y+3xrXdoxiPbhRjUIy9Z3SHu/WGN+is4Fk4U8Z5lHxU5vj1mxtxCzdZdkdaxS8Gxc+2ufauwNID2FXlxMDpbuqEzywOeaAmZpwwZSeoidVYgCvYgKQl6xQvh4vOwfbgyyiRyItyJ3Rl3L1/PEdUKkscZY0bx9I9ho0j4Q+KSoE52aDR3UqMvqSTEY3/YjXOYingmkuquW0CEOwvdFeoVubGHJHf6GrMLUqCGZf5amJ2Pm0EOWWEKugdVSDI4YgRQ0Fj7X+LeL0xwXclaX+765wrafrobVoyBV
X-Microsoft-Antispam-PRVS: <DM2PR0401MB097389EAD7641ABC0D787A9FFEEB0@DM2PR0401MB0973.namprd04.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(145744241990776);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040470)(2401047)(5005006)(8121501046)(3002001)(93006095)(93001095)(10201501046)(3231023)(944501161)(6041268)(20161123558120)(20161123560045)(20161123564045)(20161123562045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(6072148)(201708071742011);
	SRVR:DM2PR0401MB0973; BCL:0; PCL:0;
	RULEID:(100000803101)(100110400095); SRVR:DM2PR0401MB0973; 
X-Forefront-PRVS: 0553CBB77A
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10019020)(6049001)(346002)(39860400002)(366004)(39380400002)(376002)(396003)(24454002)(199004)(189003)(83506002)(478600001)(7736002)(86362001)(66066001)(65956001)(47776003)(386003)(65806001)(16526018)(64126003)(53936002)(106356001)(3846002)(305945005)(6116002)(58126008)(31696002)(50466002)(16576012)(229853002)(6246003)(8676002)(53546011)(105586002)(81166006)(4326008)(68736007)(76176011)(2486003)(52116002)(23676004)(36916002)(52146003)(8936002)(2906002)(97736004)(6486002)(5660300001)(36756003)(65826007)(230700001)(67846002)(31686004)(77096006)(2950100002)(6666003)(316002)(81156014)(25786009)(6916009);
	DIR:OUT; SFP:1102; SCL:1; SRVR:DM2PR0401MB0973; H:[10.2.72.95];
	FPR:; SPF:None; PTR:InfoNoRecords; A:1; MX:1; LANG:en; 
Received-SPF: None (protection.outlook.com: ni.com does not designate
	permitted sender hosts)
X-Microsoft-Exchange-Diagnostics: =?utf-8?B?MTtETTJQUjA0MDFNQjA5NzM7MjM6V1lPcGd5THNIQkRRTkE5c28zWGZWZU85?=
	=?utf-8?B?QURwM2xmOGx4bTNuOXZ5dlVxYlNGdzQ5dlBSazJHZ2RsSXVsaEREbDZXVFNZ?=
	=?utf-8?B?UXhHM0FsNkVYWG5uOGZMRGMxd1RmS3NiSFhiUmVlTk0wSEJBSXE4bHJGa2th?=
	=?utf-8?B?TDNKR2FHZzdDMkhrSEZNcGxxaDQ2ME1LNnB3ZE1kOGV3dEg1TllKUDNXdGVX?=
	=?utf-8?B?R3lNMXNYUis1bmViWnVJNzFkV3dtSXBzdU9tSGVGb0dLQmNTY1ZYblEzcUdx?=
	=?utf-8?B?K08rUFRBenpZcnlHUXQ1ZFk5OXl6MFR6MU1yL1BQUTRNbzhGUk82c1J4Q3U2?=
	=?utf-8?B?OXVPODhJWkVXNzcxbldoZmIzMlZUOGlWWjRDWGRIY3RIRjRRVGNIQmVtVnJD?=
	=?utf-8?B?NkwxbWdNZjNzaTNCUVJEYW5wN2IzT05FaEVDRmxDTGZ1MndGcndHV0IvS1l2?=
	=?utf-8?B?ZG8wRUdaMDZaZGZKQU1tZW9heGtITk9zcFV1aGVWQ2haR3VzLzFzWHdqN0ky?=
	=?utf-8?B?c1FsOGZaUDJZdVJkQjRsZmFSUThhTWU5LzZkWGR2djdVN3hxampEbDRnSmVz?=
	=?utf-8?B?S1RMU3B5WFVDTWdzTUVJU0RjUFNXdHdoUXdNK3p0akd6MUFZeDV4M0tlcUJM?=
	=?utf-8?B?NldzbllYRTF6WkxPeXlqRjNZQWFYZEdNbkxDaTlMT3p2YThpS29LclJ1WVov?=
	=?utf-8?B?dG9Fc1ozWlN1RU9jeEFvQTFaa0RvQ2Y4bGdwUytWWWxEMGY1OEhOSnpPeDBt?=
	=?utf-8?B?bEFkTlhFZldFczJaN1hsWm42bnZuZmdITDdnc1NTNkI0UG5RQ3lBL2xndml2?=
	=?utf-8?B?SmQ0QTUrQjFTRm9zQVVEV2MvQjNVa1lSYTI1VUZBVXMvSEl5ajA2cjZsazA3?=
	=?utf-8?B?MG90WFVLV2kvNnJ0dFdGcEg3NTB4ZWU4Mm9JWklGVWNyV3JUZjRaVWxMNE9K?=
	=?utf-8?B?SUZNQ3dKeWplV3VxdmppR2x2VXBCQ0VSVll2VXBUZ1dOM2hmSElCeUVRYmdX?=
	=?utf-8?B?SUFiUjJTeUxjTFZvSEtLZlAyTW1iS09NMlE1Q2FZSk5XRWJvcEQrTFNucUVt?=
	=?utf-8?B?QmFrTjFvWUtBTy9wYzRzWFc4NWZFMExmVTRUcFpYWTVuSk83bktva2NGNGRp?=
	=?utf-8?B?VFRKbjZGZ2FIN2FWcnllMlpOd1RKVTVXVThFd3lSTlNubllSS0JvYWxJWXlr?=
	=?utf-8?B?b1ZXQlRPcmVlNVZEZG45YnQ3UHZONmU1WXcvTWF3VWF6VGdWbDNlTWRYYUNC?=
	=?utf-8?B?d2cydllURXVJZzJLWXcxS2RhQzZ2NmJEZ1hMMXNQSEwzeHlkZzZlQ21kV1po?=
	=?utf-8?B?QmFueTVEYU1IWHZMNUZ3NzVycFFSR1pjWU1DVnJFV0Vhb3V4MmVQK0JhbVJX?=
	=?utf-8?B?dlpLK2ExeXQ2KytQYStLdUlmOHJsZVNrcDlOdWZtdmFVYWhhSmtwYzBRek9C?=
	=?utf-8?B?cmFYai9MNFJMMlJwZ3VpTkxWSmdtemdKNnB6UWQwY0hhQXRTWDlYN2FTaWNp?=
	=?utf-8?B?WkIrVkFhZm1wTlBGR2dCbkpvRnhTbzZyaGlCeS9sOFRCZmlVb3pzMVVTK2tQ?=
	=?utf-8?B?N2RaM0szTUsvSnYrTThWU01ISkxWUGZ3aVZ4VDU4Q1p4bm5PYzlSd0d6V3pL?=
	=?utf-8?B?bmlDVTE1SEtsYmRXVTBENEZuWjBPZVkrYzV6Z3JNeHNoM3JQVFE5bmFLTWRW?=
	=?utf-8?B?WWlsOWZuV1cvM0RvWGZGY2VSMy8xNjNIT0lMN3dKTmtQaWZRcWFJaDFTcFZP?=
	=?utf-8?B?eWxRVkhNcmlURHVldW1RcUlETTZ4ZlhIelJFZXNrUzNqdmk5MGlRcWF0NVlu?=
	=?utf-8?B?OVlQb3FQTjUyWjh1VWc3Wm5JaDBvMXF1d1BXVzVpSzh0aWlhaWJEQU1iSHpK?=
	=?utf-8?Q?+B3H0szT8wP70Cb39j7pfatF7FNmJ8RwzO?=
X-Microsoft-Exchange-Diagnostics: 1; DM2PR0401MB0973;
	6:wbQaSuFrtUI+P8tJ0gvd/LsAknLTskZcPmiSzpYhUP4teYon3sentJEbs/b/M14kQ2Vc6qJkJzfsZw1aGOTtF2TDSpE7IqF/T1XfqcLk1RsH0RcDsmigDr6t/JqSmlzpIK0C5A2JRtTl4/hA/Nh+X6QinAnIZqtDO8oSL3bp54V7IwyLvM0y/nH/vDEu1aKT0Q/3EuuJNxDGSrO8lp26Rf7+lm2g5wfRZnFgPTKJG3O0t0NLBiAn58ZvFIf6OzwUNSk5rOb1HapyBk1gpsvBrMJJo36WafP64bspcIEOL2IFEALh/1zib3P2Ym04V9GCtT4wF89gbkNDo8UnZWVCMOpRf0aPu7CbXlPZGv1MBJg=;
	5:nE05sKB2k9EMUm9E1AfaQeHcF2hV9m2Gk6uBwPAy2mPyxb0+Fd/YqYc7bqRCg1I1Rcmsn/YlY3Nv33dHhiXc3ufvVJy+YnvPWSUwvPEMRSSR2BeCiHvs9SWWRFmCD4VMva98eVY9ZbORkltrEptjPPJ7jonPwzRfInATNSm64Oo=;
	24:DRxU65BoFo/nKalzEs5bJJpwheeW2dInrJvRVjxtz7K0oDW+FJSFf0bnQpYg8RYhKYtG1IJ8uK6875eS4m5Ivox9CljPNgWcNUpgPeRp/K4=;
	7:5pQXOCDeefGdIYmFK4sTIX+58x9XfiJpxQIKsOhgRRsZnW8prVwcIVYIM3cZEa1Vzeev4AR3xYx2IPuzKBERld5TZxXLzgtYN5PhuoaOgNJK7RMhueKCwxlCwfRfc6wYG1XWzafO+TCLEN8XjEtSHy92x30JmR9fAKu0z5rZvWaQgxitwSeXaDc2tpnu+Evt0VuClxC42sXlgYz5/INtwC/fmgyMatFVCzOO/UAayV1kaVe6w7fUWWneNksR9cEJ
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: ni.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2018 15:59:55.6651 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bb4ea130-fc8e-4842-0d02-08d55c310587
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 87ba1f9a-44cd-43a6-b008-6fdb45a5204e
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM2PR0401MB0973
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2018-01-15_08:, , signatures=0
X-Proofpoint-Spam-Details: rule=inbound_policy_notspam policy=inbound_policy
	score=30
	priorityscore=1501 malwarescore=0 suspectscore=0 phishscore=0
	bulkscore=0
	spamscore=0 clxscore=1011 lowpriorityscore=0 mlxscore=0 impostorscore=0
	mlxlogscore=999 adultscore=0 classifier=spam adjust=30 reason=mlx
	scancount=1 engine=8.0.1-1711220000 definitions=main-1801150227
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] recipes-core: move hwclock.sh to util-linux
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
X-List-Received-Date: Mon, 15 Jan 2018 15:59:56 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

On 01/13/2018 05:48 AM, Otavio Salvador wrote:

> On Fri, Jan 12, 2018 at 11:06 AM, Alex Stewart <alex.stewart@ni.com> wrote:
>> * Move the hwclock.sh initscript from the busybox recipe to util-linux.
>>    This script is generally useful for distros that get their hwclock
>>    implementation from sources other than busybox and we follow debian's
>>    example by providing it in util-linux.
>>
>> :busybox/*
>> * Remove the busybox-hwclock package, as it no longer has a purpose.
>> * If busybox is configured to include hwclock, the busybox package will
>>    RDEPEND on util-linux-hwclock-init.
>>
>> :util-linux/*
>> * Provide the hwclock.sh script in util-linux-hwclock-init, which can be
>>    pulled by any packages that depend on its functionality.
>> * util-linux-hwclock RDEPENDS on util-linux-hwclock-init for its
>>    initscript.
>>
>> Signed-off-by: Alex Stewart <alex.stewart@ni.com>
>> Acked-by: Haris Okanovic <haris.okanovic@ni.com>
>> Acked-by: Adrian Ratiu <adrian.ratiu@ni.com>
>> Acked-by: Ken Sharp <ken.sharp@ni.com>
>> Natinst-ReviewBoard-ID: 214983, 215755
> As mentioned by Christopher, it will increase the build time for
> everyone and there is real gain in this this change. If you want to
> disable the busybox dependency then move hwclock.sh to a hwclock-init
> package that has no standard dependencies and is allarch and make
> busybox and util-linux to depends on it.
>
Either solution works for my purposes, so I'm fine breaking hwclock.sh 
out as its own recipe. It seems degenerative to break such a small piece 
of common-code into its own recipe, but I suppose there isn't a better 
solution if util-linux isn't commonly built.

-- 
Alex Stewart
Software Engineer - LabVIEW Real-Time
National Instruments

alex.stewart@ni.com


