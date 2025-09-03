Return-Path: <christian.lindeberg@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F872CA0FF2
	for <webhook@archiver.kernel.org>; Wed,  3 Sep 2025 08:49:59 +0000 (UTC)
Received: from AM0PR83CU005.outbound.protection.outlook.com (AM0PR83CU005.outbound.protection.outlook.com [52.101.69.66])
 by mx.groups.io with SMTP id smtpd.web11.7479.1756889395806773350
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Sep 2025 01:49:56 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=mK5i0wlO;
 spf=pass (domain: axis.com, ip: 52.101.69.66, mailfrom: christian.lindeberg@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cBdcjpphKpTWoWKIxeml6izZPKI6unNl6IyjdXieDk3Gh9ZnvzCkIesHFhoSRtAQfndKjhdo8aEFh1mdokSc1c2IXyDa2Eo3Zx95kFSIAQqj5bQSHCNiRUqAMWTOablMvE6gxqIQfJsiPE6ugLe/C8R40gc1M8h4vM+O+vRyhKyP8TxZdMbfvowzngQCdUfZQI/PBo90pWLZMqPcMmJrO+biuFABjMEiJf4kATw79572Qt5t1GSa8A4i3Zlo9R1vMreylGtGvyk04hMc88ixtUyVxM6uFEWM8Iyyd0KTE4ZzeZd4QEotFY+RwqU+zb0N6r97CnsdiUWQ/nc59SIevg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eld8mark1oJMESInPHpd9svzxj/yIEZWEJYbTicbNfk=;
 b=lkPo7G8eYDI93HZ9knUggzAelEwxr+kv1/HQ4KR8jmo4JaXh7kMFAI8ylLmt8V47iRJraPYAM9hz07SbQbiceU2sgeI6IzbaJNOlTIcZi5+VFe5KKvxIpz2mu4xRGvUcIZ3LWIWhP2QZRr1h5FrYCzz9kjD7O1m7i44cTp+hSHGk1xU2a7WLMcvWC6H3vaKCI8QjHfV/oE6lW8SNZa0UipDlXNpkc9so2TIpxZ9bBtpJUPtx1JVoyC1fgepnOlb1hNwo5OABbd9+9ittE6N/z+6c+IomLbM7kvwWIf7g6wktZ8WREZjNWT8046iUTCCKBHzkFBjcrVs26Ens7VhgYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axis.com; dmarc=pass action=none header.from=axis.com;
 dkim=pass header.d=axis.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eld8mark1oJMESInPHpd9svzxj/yIEZWEJYbTicbNfk=;
 b=mK5i0wlOdDpq1kss9FhVfmB1H2SozYvflZ6d+iNQ3X+d+Oe0TI8Vx/pfv09ebtwKcuqR5Li5nIWLP0SbvASmmfE47+otoyo781fdrshPWKYEajZ1IA78B4kYqAaJa/ID+el+kpzHRdxtOIv/V63mzWTHBfm69jjpnYURjs4Sg2U=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axis.com;
Received: from DU0PR02MB9894.eurprd02.prod.outlook.com (2603:10a6:10:44a::6)
 by AS8PR02MB10204.eurprd02.prod.outlook.com (2603:10a6:20b:628::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.27; Wed, 3 Sep
 2025 08:49:49 +0000
Received: from DU0PR02MB9894.eurprd02.prod.outlook.com
 ([fe80::74bd:5b24:5e73:94e0]) by DU0PR02MB9894.eurprd02.prod.outlook.com
 ([fe80::74bd:5b24:5e73:94e0%3]) with mapi id 15.20.9094.016; Wed, 3 Sep 2025
 08:49:49 +0000
Message-ID: <b73a4e8f-b5ed-4839-bc5f-e90fe45b5598@axis.com>
Date: Wed, 3 Sep 2025 10:49:48 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH v2] gomod: extract license files for omitted
 modules
To: Jeroen Hofstee <oe@myspectrum.nl>,
 openembedded-core@lists.openembedded.org, ross.burton@arm.com
References: <20250719150105.2697443-1-jeroen@myspectrum.nl>
 <a00f1d80-39a2-4b55-a36e-b69797ba761b@myspectrum.nl>
Content-Language: en-US
From: Christian Lindeberg <christian.lindeberg@axis.com>
In-Reply-To: <a00f1d80-39a2-4b55-a36e-b69797ba761b@myspectrum.nl>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: MM0P280CA0092.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:190:9::22) To DU0PR02MB9894.eurprd02.prod.outlook.com
 (2603:10a6:10:44a::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR02MB9894:EE_|AS8PR02MB10204:EE_
X-MS-Office365-Filtering-Correlation-Id: 8296bbb7-c733-44d8-88bf-08ddeac6d72f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|4022899009|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?hhOXPas1uvKWa58IsBUKcO4m8Oexb+fJ+bcLKaDuooWY0mr4lSILysyXciim?=
 =?us-ascii?Q?n7pk4gfmjNNQOYhRMCYDkVrvWMWwEvCaseLafN9Ge5KY5CGPZsMkjeuAdli6?=
 =?us-ascii?Q?yfX2l7rOL+q20QnBQHEWpIHhGC1Kqvg/UOlHM+9CX/mSCU4w5ZPyxhLWJo4X?=
 =?us-ascii?Q?NfRVBjoVlmY/Q6c017B0BqUtP69BgU7G6ylDHRluepcENTCwsJT/orGhFFtm?=
 =?us-ascii?Q?yollxF8Kw4tlRlCa4e+lAaml+cFxr4ogs5MmVAeii6r52/JObjkYW1nUWznx?=
 =?us-ascii?Q?QpliGV+L6a0PF5OtMpK+HBknVRc+y84Grir/dLeMP1w+308c4sQBjzTGaEAo?=
 =?us-ascii?Q?+4VMjGJmZNcyVoLJ7giW8ePGeN/Rl0nE1kz9PgMWI1dZ9Ql/F/lbRjEjfU9q?=
 =?us-ascii?Q?3fQD9Uk4Bz23ugdPdwXhsw8oYJRstM0IvyTi9GH3zQJCbbPt7j6S8GpI2NiF?=
 =?us-ascii?Q?8a04BZCzj7xsAZEcjlEP5X/TRmu13TJi6Yn0rT0ei+dgQNKZjc0fpblActvo?=
 =?us-ascii?Q?yLR8Xx/1m6j22EBC6QAG2UjOGLQ7v8j3HoRMkcqRZT6W6PByrgK+XWtE5oiP?=
 =?us-ascii?Q?zJMMwUBeIKGsHS/VAGegZGICKOr6XZFpmIVlayz3ko8VqNLfI4NWsLEOCxhb?=
 =?us-ascii?Q?wzAUMq/f0Y2lJ4ro1kCESW7JxIWjyiUmSvHP/qfmMHk8d8+t6eOxSDUs82MD?=
 =?us-ascii?Q?CfG4Qwo5f/ScWrgI6dK9bv2128N7gBCkbF7ofXRNrqVlPbI8fnp6a1ndeHwc?=
 =?us-ascii?Q?90+U6zpIvuuZS3j5aZ6Mra07u8fVz/IjbQ/1jx2RDhONxsZevfSMvpyeOpjP?=
 =?us-ascii?Q?XGhNW/DsR38lYOMflBiK2Mp9PsuNWanXls2JUPIpMBEcVStsFhO5P+FfUTrz?=
 =?us-ascii?Q?t+NXQcdqz87gBBb5DbeWWsPeY8cLnn9G507+91Imf80inFxh3zm1ybNPdwhX?=
 =?us-ascii?Q?msbIenCE0oRWXv8E6lILncTYid2skxqPRjlRiRCIbhmZlOX2VQb1hJj+xBqx?=
 =?us-ascii?Q?zcV2N4aHrfZ0IOPu/bam+4KVvmSo03B0qI0NNAukwCZaE4jRd14cepZxHlgD?=
 =?us-ascii?Q?fqkZLerPy6Jtb3+DueDtvvRRBkOQfkdzHK/DeV4SVbnWh8gr0en4Na7IprzT?=
 =?us-ascii?Q?WKYmmOLOTwtR+NMy5VqIfljEp2r2GzBxA1wgVZFoBUZ8lGCiTj23qrEJrlqk?=
 =?us-ascii?Q?eWQ3BYaqYh25m62YyECGBFAc1C+X1GD0hx1yXI9Fk/xwd2I4TMAqMmDpJ6a5?=
 =?us-ascii?Q?S/+X/OTtI4P3UKdn2JUlGU6Xd/Q+dyHAvdmFhJopeGlIowbFDwiGdX3YB5M8?=
 =?us-ascii?Q?ruLA/SOjmsO9BaJzKOvsA/3+OlFBjssQb2iaqpI+qTOd2tNGOgea0XIBQI+K?=
 =?us-ascii?Q?hEUFYic=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR02MB9894.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(4022899009)(1800799024)(366016)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?rPtZO1j5uGZHFtrCn9LE57pxrGmwetczJWLsk14xu8MCHmv3u6Cs0lpEXbNC?=
 =?us-ascii?Q?489fy8nHzKFGG5mL/tt4hpch4V2NOtihcSf6O5g/8eGSECqUg0VdutiRlwxW?=
 =?us-ascii?Q?1hsf8+B3oiYNveCKTxbIVLODnQVq/wWftHqGLwEJS+D3/PcIf0KfHqshpddn?=
 =?us-ascii?Q?A2iGiKFCErDpDyhs7UiCVZeyT2taYkLnyGwg7YlhoKxTrDrnlqTRwl7ZJPr7?=
 =?us-ascii?Q?niDDnTGRrOcZLWvQ9lVtFQvxN5enAyK5lOKXfGWv2LFPS6jxKoC60C6eQlfp?=
 =?us-ascii?Q?cnP1zMkd2Itwagw04X3YoeDnRda95jGIBPnEbHh8k2uQhVVVAdKGbbvDMYqY?=
 =?us-ascii?Q?1IvBMcJQKDCTT6JkPpvakRegcsOQKhTcdwrNx7/t4sBkUzfB9YtoN1WSbQ/b?=
 =?us-ascii?Q?0SFQ/Lngcq6PbNMskSwYPenBQsuJh28rrrnL2eiTXt9+npI0PfVTWxSCI1Pf?=
 =?us-ascii?Q?OIbQepsf2YzBvLX5TqlwDqy66XFDS/xZBrvw9JpsPMBR+Q1KCcRKXCHx/DnP?=
 =?us-ascii?Q?VwJhNujN7hyrxsUAdoRc0rj2ukPm1ByiEB6X6BsQUgx58tjJr5Zmt0XU4M4f?=
 =?us-ascii?Q?Y0AxAW5DtudZBb5nlx59HZyiXifoQKmgEFEeksR1gmmplpmrCfOMxil27k4D?=
 =?us-ascii?Q?7Ayeu+ukjleez6p8DyEKVKdWo0rQC7v8JjkqCNXKx8RabCvzYq7KerNWDZZH?=
 =?us-ascii?Q?4+uN5/282UCZIXYbY31TRmf3IE5ExSj/amRQQeovmOOf2sT4o2YuKkVeSpP7?=
 =?us-ascii?Q?NCLrgo4FYTIjUHs3h6+BcfeR1scf20cfckVR0vImU55kpC9Iy0Qhd0SrzMeN?=
 =?us-ascii?Q?qlv966S+Mw7hMWnCABp/aWD1uy7YpUdtldy+E3g2sclAo5CiyduSbqAgTvsb?=
 =?us-ascii?Q?/YN6UtHAAHiiZFBpN3skw1WOLOLZ9Uz8SHhlzSTqkE0QbUM8RaUGIBXUHn7e?=
 =?us-ascii?Q?CupDq8iPVxiKZG47slK4udUXTgNmUhJaPtWwq4wv8z7pGEQ1/3QSEgYOMTHb?=
 =?us-ascii?Q?wf2ACNBqNWigG2v58F/CXLC950GrHmc7GEagudHAyQNVd1Ik6Xfm8TF9U9F9?=
 =?us-ascii?Q?Cabyw1gF3d93MmhAfd7mxKL0Aj6rOTt1TkZA2Y72pv5UUnzj0MHbxQKsTtuP?=
 =?us-ascii?Q?MsOKpw0fTPR76OFiOxHoo3/zFzNOBXuUPA/2KoSj6yq19FBzTE7NNwdM1Xby?=
 =?us-ascii?Q?60USzkiB1EC65QeW7NGhOnyqI6wW8ejNdrkwMU89IHrsqLVBdMnL4sKZDCgG?=
 =?us-ascii?Q?6j76sdtVKbXsNtLd+BXffIOsv8SCOKELHR4yM+xhuYmRxql2Pgw3eC1AiZc3?=
 =?us-ascii?Q?ViUMukAWJWhLn69OUPA3VRqtb0fc7XKEedisLqYhkXzX3HUAsJrcpnYdbgET?=
 =?us-ascii?Q?n5dYe6yMOx4+7K5CLgarr8WrfZsJ+kNGTaDhDtwdD5Ihwz2RbpbW8Y4LERa2?=
 =?us-ascii?Q?N/FBTvKCrzrKBzbMIE3AhdOdu6OAhUr8bZssz+3ssrKyFm5Tel902+bBDBDY?=
 =?us-ascii?Q?nKqf8lr97ns0Ggs0sm8CpfzfZL4YuMGFdH/bvMc95bomfO0V/+OyM1MjNeuV?=
 =?us-ascii?Q?GOMYD8UTHrYyuf8o0Z8qGaQaxIlw9pK/1f/NUIvD?=
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8296bbb7-c733-44d8-88bf-08ddeac6d72f
X-MS-Exchange-CrossTenant-AuthSource: DU0PR02MB9894.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2025 08:49:49.4074
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 24fbzt7jj7ECxF4sDfHAg5gfUPExc2XhTlUB3OnQNYXF8xcoHrq6FDesxVCFADFhq2CaqqgD4PP146JGy04bGA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR02MB10204
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 03 Sep 2025 08:49:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222851

Hi,

An alternative more in line with conditional dependencies to C=20
libraries, where
the license is pulled in if the dependency is added, would be to=20
conditionally
add the licenses.

But in case this is not feasible I guess there is a need to unpack the extr=
a
licenses as a workaround.

Some comments below.

Thanks,
Christian


On 02/09/2025 17:04, Jeroen Hofstee wrote:
> [You don't often get email from oe@myspectrum.nl. Learn why this is=20
> important at https://aka.ms/LearnAboutSenderIdentification ]
>
> Hi Christian, Ross or some else to whom it may concern ,
>
> Can you also have a look at:
> https://patchwork.yoctoproject.org/project/oe-core/patch/20250719150105.2=
697443-1-jeroen@myspectrum.nl/=20
>
>
> It simply makes sure LICENSE files are always present.
>
> Thanks,
> Jeroen
>
> On 7/19/25 17:01, Jeroen Hofstee wrote:
>> From: Jeroen Hofstee <jhofstee@victronenergy.com>
>>
>> If a gomod is omitted with a PACKAGECONFIG option its license file
>> doesn't get extracted to the gomod cache dir and hence do_populate_lic
>> will complain that the license file isn't found. This adds a task
>> do_extract_lic after do_compile and before do_populate_lic to make
>> sure the license files are extracted in such a case.
>>
>> Signed-off-by: Jeroen Hofstee <jhofstee@victronenergy.com>
>>
>> ---
>> v2:
>>
>> - drop bb.utils.mkdirhier(os.path.dirname(cachefile)), extract
>> =C2=A0=C2=A0 will create it.
>> - fix typo in the commit msg, it is do_populate_lic
>> ---
>> =C2=A0 meta/classes-recipe/go-mod.bbclass | 33 +++++++++++++++++++++++++=
+++++
>> =C2=A0 1 file changed, 33 insertions(+)
>>
>> diff --git a/meta/classes-recipe/go-mod.bbclass=20
>> b/meta/classes-recipe/go-mod.bbclass
>> index a15dda8f0e..4c0496e1e7 100644
>> --- a/meta/classes-recipe/go-mod.bbclass
>> +++ b/meta/classes-recipe/go-mod.bbclass
>> @@ -29,6 +29,39 @@ do_unpack[cleandirs] +=3D "${GOMODCACHE}"
>> =C2=A0 GO_WORKDIR ?=3D "${GO_IMPORT}"
>> =C2=A0 do_compile[dirs] +=3D "${B}/src/${GO_WORKDIR}"
>>
>> +python do_extract_lic() {
>> +=C2=A0=C2=A0=C2=A0 import zipfile
>> +
>> +=C2=A0=C2=A0=C2=A0 lics =3D d.getVar("LIC_FILES_CHKSUM")
>> +=C2=A0=C2=A0=C2=A0 cache =3D d.getVar("GOMODCACHE")
>> +=C2=A0=C2=A0=C2=A0 dldir =3D os.path.join(cache, "cache", "download")
>> +=C2=A0=C2=A0=C2=A0 prefix =3D "file://pkg/mod/"
>> +
>> +=C2=A0=C2=A0=C2=A0 for lic in lics.split():
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if not lic.startswith(prefix=
):
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 cont=
inue
>> +
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 try:
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 src =
=3D lic[len(prefix):].split(";")[0]
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 url,=
 suffix =3D src.split("@v")
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 vers=
ion, _, file =3D suffix.partition(os.path.sep)
The path separator in the URIs will not change with the OS but I guess=20
this may
not be completely consistent across the code base.
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 except:
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 cont=
inue
>> +
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 cachefile =3D os.path.join(c=
ache, src)
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 zip =3D os.path.join(dldir, =
url, "@v", "v" + version) + ".zip"
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if os.path.exists(cachefile)=
 or not os.path.exists(zip):
A non-existing zip file is unexpected and I think a warning is appropriate.
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 cont=
inue
>> +
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 try:
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bb.n=
ote(f"extract {src} from {zip}")
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 zipf=
ile.ZipFile(zip).extract(src, cache)
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 except:
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bb.w=
arn(f"could not extract {src} from {zip}")
>> +}
>> +
>> =C2=A0 # Make go install unpack the module zip files in the module cache=
=20
>> directory
>> =C2=A0 # before the license directory is polulated with license files.
>> +# Do make sure licenses get extracted for omitted modules.
>> +addtask do_extract_lic after do_compile before do_populate_lic
>> =C2=A0 addtask do_compile before do_populate_lic
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#220613):=20
>> https://lists.openembedded.org/g/openembedded-core/message/220613
>> Mute This Topic: https://lists.openembedded.org/mt/114238035/9720520
>> Group Owner: openembedded-core+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub=20
>> [oe@myspectrum.nl]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>


