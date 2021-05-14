Received: from NAM12-BN8-obe.outbound.protection.outlook.com (NAM12-BN8-obe.outbound.protection.outlook.com [40.107.237.61])
 by mx.groups.io with SMTP id smtpd.web11.8895.1620999838987357753
 for <openembedded-core@lists.openembedded.org>;
 Fri, 14 May 2021 06:43:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=hXsy0Nvr;
 spf=pass (domain: windriver.com, ip: 40.107.237.61, mailfrom: randy.macleod@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PGcGXTK/Q/VQrdRWYgB8f3ufc32dQ+Dp+uH+nI41YCs/4rId0BvrTcWRztMa2KJcepMcosvmtI4OHaZxy8LzOmsU2EJvCGlD3x+vo05jF6uNhFsnqTbTsKRi1c/PhzAY+3D2WUIx1dm61DEMxmPrUsfFGP9YVv+AYZ0Ueq7IP/6ozlIvy2VvyILStZz3PbElQGK0TPY6b9zwNdsl/b5mqdODe+Onk1cWk5+G/TXkxFSGOoIZ6MMMujCOGhM5YYzelvLe0z/Qr6dIaR5bsXWe83BLExixHunyJxv8SS/Z/kIBuwqUwPbX1f4ymqu2QVdbzcJN4AY+82rJa4LO4l3cqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5YQ69LjYiA17TBbtIxKYzkEGp7JjJmXAFdHzLnFWBws=;
 b=E2dMXwyAtuCcqHsReZXmK/oxA//8dSrlDnXtYwfUsreZL2WWQO3bnW3tfewCWl5ryEiMY6NyNAvIRXNYhETFB8OYSYK+mraKNrzRUQC5dSQpAexZE1kSKqwP+ZP8ld47cq3sSeLNNZ9Qzz0TL+dkOYYF5pvXsHmDxfMItz60yn3PF3iyH8lS6NexjxgcbvyzO4gb516Hmva4h07xp96hnW51vKKNbqSlPOxfAGVH6yEtpH/511yygC8wnbyVDkczH2QMEiWcs3/XWaLrzQdHXXF5MlvPH2yemRpBB8IMgT/aMTsatLR7m2LUXbcB0CP+tuwjPQE5j+s8n7DO0J0vVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5YQ69LjYiA17TBbtIxKYzkEGp7JjJmXAFdHzLnFWBws=;
 b=hXsy0Nvr0TdP+uZhraZ/p7lu2U34x+B8+AnCt/72GO+0sJ033TS0JwOpNaPxuGwHej4ROech+uzd1PTlZF0OT4MI+hAxRDQehRLLOOzhoprBioZupf2O+ig2fX4+h+xTy13E3iORINQqyRdi3RSzH18m/1WCA/lCPAkgrIlU0ko=
Authentication-Results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=windriver.com;
Received: from DM6PR11MB3994.namprd11.prod.outlook.com (2603:10b6:5:193::19)
 by DM6PR11MB3418.namprd11.prod.outlook.com (2603:10b6:5:6e::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.26; Fri, 14 May
 2021 13:43:57 +0000
Received: from DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::8d3b:70ab:5fc7:9eb5]) by DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::8d3b:70ab:5fc7:9eb5%7]) with mapi id 15.20.4129.028; Fri, 14 May 2021
 13:43:56 +0000
Subject: Re: [OE-core] [hardknott][PATCH 1/3] libxml2: fix CVE-2021-3517
To: Tony Tascioglu <tony.tascioglu@windriver.com>,
 "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>,
 "Mittal, Anuj" <anuj.mittal@intel.com>
References: <167EF1314E1FDFB2.26402@lists.openembedded.org>
 <CY4PR11MB1272E5788B8DCF54B6F36DBE84509@CY4PR11MB1272.namprd11.prod.outlook.com>
From: "Randy MacLeod" <randy.macleod@windriver.com>
Message-ID: <2cfbc114-29f8-a364-cf93-c0511e3e6685@windriver.com>
Date: Fri, 14 May 2021 09:43:52 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <CY4PR11MB1272E5788B8DCF54B6F36DBE84509@CY4PR11MB1272.namprd11.prod.outlook.com>
X-Originating-IP: [198.48.226.187]
X-ClientProxiedBy: BYAPR21CA0025.namprd21.prod.outlook.com
 (2603:10b6:a03:114::35) To DM6PR11MB3994.namprd11.prod.outlook.com
 (2603:10b6:5:193::19)
Return-Path: randy.macleod@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [172.25.44.2] (198.48.226.187) by BYAPR21CA0025.namprd21.prod.outlook.com (2603:10b6:a03:114::35) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4150.12 via Frontend Transport; Fri, 14 May 2021 13:43:56 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ba64e7b2-4f1c-41ff-65f8-08d916de5238
X-MS-TrafficTypeDiagnostic: DM6PR11MB3418:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<DM6PR11MB341833ED140D37C15372974EF8509@DM6PR11MB3418.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:792;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	+yBCdwXOzfAmuYkfB8igFjFugUHjWB+N3pK/r6b/cAm8ocw++i3AcRjxqPRHJ/ANuj33RWnOMvRzgk/ymdw37N/iTFwC0QtCmCbbivMhXeTJOI1mALWXT/rgJpc1BQ6TTFEbkA5IztIPAXdCABe77plCJK0z3fONlb8NLM0P99KZsozW+96fhQjwFJje2YoeHgnwMRj8txqwffiQyrLIzAcMtO/HfOvPr7S+PjDVQtJvgyfJy+cBkM3KcE0t4vs0T2hO/ZyB6QfW7XEmsm0F/ntigKjO+MwNpxJiO3MQRo5vStXZmYzM+jN4GzLzQnTrzh6P8lPy54F0R4pbiyloNgijFNESo0CLzBhLhDlLROMdmi6B574ZGBiZtT77gLU9xW985+YcH0sHg8chomKxg5qCZfHiZhKCX/ygd13sPk8UPR00+fZtksLoSAxgujOK4O4ci0PxjODvh09aalss6MZtjLqVjqJS6mopg65uQn6uL0AYNHJshtO+KmIwxz2Tl+qBwScqYYN/dBzOr7odQpZNXKIFlicVW6gI5u1m6jWpYDBom9rXhiQD9RlteZHlZ4q9Q/vSu86Kvc+Trxy8QoLp9yM4PDtGCfo3tyv5z4Rjmz052jYbSAtPx3Oe/HvkU73/JT6M4ANkKRrn5MoGLPr8QahwLWqGm21V/5pwlmvle76vbRdlyoQcDg6dwOkf/sC2bYIfFYlv26Eb3z7/VKNmcId2Iy/OT9CuSr5R1ke9nuT47vGG9SFbGEtwwKb1Yi2D7UBk1fh9xueFOP+gQdEaYUTwhFq30h8of413RcIXxSmYBx2EB4mo69JVX0P0g/VEixk08sOC99HG0mau6AschewRwBmwlkJuHlQ7/TXPDIjeYhKG/e9dHB4zAvVp
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB3994.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(136003)(366004)(396003)(39850400004)(376002)(110136005)(16526019)(6666004)(186003)(16576012)(8936002)(8676002)(316002)(6486002)(31696002)(53546011)(66946007)(66556008)(66476007)(26005)(2906002)(52116002)(31686004)(966005)(5660300002)(2616005)(86362001)(956004)(36756003)(478600001)(38350700002)(83380400001)(38100700002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?Windows-1252?Q?5O1ZnF4sfHHfHKqvg34WQ+KXRWCix225YXRc36//JKeCwaFHfLMQ3R83?=
 =?Windows-1252?Q?3MoT/PCnzQ3q9JAPaGVzAHoMGDwMWbK9w8/8J0gw8GPfBsV4/f3iAECh?=
 =?Windows-1252?Q?N/didI6Bv2dhgmcfjbgjeEntKvlCdUL9YaTah2wDP22uN7iAxTrVXiX5?=
 =?Windows-1252?Q?OCGnRtDlMwWNrwDiFljMIMMmNbaDebxFm7XjnG1FHXuHE9YCur0Dvuc3?=
 =?Windows-1252?Q?5FOKbZ0HoCSNQqsQyW+6gHhrJd3hEUfAFWQj8sAXpglKgYWG4KFt/tgD?=
 =?Windows-1252?Q?u7I+87a9a+CLC7LmEWVdw4xAqqWNvNyIv5xrh1g+S0CoxxhLLH7qDjIM?=
 =?Windows-1252?Q?fEcvvKhtxSUxBi+bADbk4a+fbbxQjM7NFxjY+bwNDtkhAmWhRP0zWXEu?=
 =?Windows-1252?Q?W3NOaFwq+qufNK8Xd+LQ5KOusrw0iXacRCLg+dznbJaLhAssHzZPtxtr?=
 =?Windows-1252?Q?qAM/Uo8+sEe4w4sKHRyoqLujXAoqIpTNHQHry7BUWO5PtCIpbGGHXduN?=
 =?Windows-1252?Q?LNU9uXKdEDGbK5IGmdRrdR8o275kpi8Q8eAZVnwatPqaUJgTheY4U7o3?=
 =?Windows-1252?Q?z0/xQxB+uLYP7AglFvj24nMO3GI51xBvh2MFyAQX+iOUVwAHRmGWhz1u?=
 =?Windows-1252?Q?fiWkRKw0xBUyATRfMTfPGaIXMGrSaXgm25Hg0Ux/Sp+OHDEPbWSel61B?=
 =?Windows-1252?Q?oTn8/tmb63K1q3giSqCjZHe6y3/4+a4GlIJyUALRjWyF2ir/75/RrU9I?=
 =?Windows-1252?Q?iwcZ2MA8Lx3bcZsQmdMzQ+F0h16OyRCTnvbSHYaVct2sVuMvMeP6Jgw0?=
 =?Windows-1252?Q?Vt2RXMaffbrI13p7+2DpBz8LD9qFo81VUzkPQUQ9aelNelLcfWnH60/e?=
 =?Windows-1252?Q?sd38fKJzMl8qWW9kD4J8oHxqbf9dzZ+FWw1h4DpBYyyJlqJCTV8LCJKG?=
 =?Windows-1252?Q?gpILCBcoKMNMLFXrN1/rYzOvgZRbswOYdMzqpIdw7c4/P0Uo28133VLf?=
 =?Windows-1252?Q?zfmBmLhncztCrqJEr9QXrDivziHhrWAzZHOAQfr2xRdSfebt5OSO8xZY?=
 =?Windows-1252?Q?yoCR34iUzfRB7iA11mWaBojRl7zIPUOkjsgLZP5ARx45luf6DR8YPQMX?=
 =?Windows-1252?Q?Rfch/dr+527QdIKhsAiO/jujaDwQKcflrdYllBufGudA/TlOB4D+vN2u?=
 =?Windows-1252?Q?uk7jUTUpqKXt7crnZAahBDYJdA0xPnRYy14658oZuAal4W0sA5F11uQr?=
 =?Windows-1252?Q?0m1ZozRJvEMCpHM304AzI4T2JMbvDR5sVdGPiR4iuHh2Ie6jnKV9IQqV?=
 =?Windows-1252?Q?y5N8NGxPhqMRFVhxnPFfpgZ4irDqsS6liQQM97btpPR6u0roZ9XVdCER?=
 =?Windows-1252?Q?o3xE3ebqwDEAYFjygwRMHNEGz6umFMnKqi9wpZWXBLq0Gktg6g49Adzp?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ba64e7b2-4f1c-41ff-65f8-08d916de5238
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3994.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 May 2021 13:43:56.9093
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6mgtIzhLMvLkj/Re+dS3w4mdwQlGNLefCRKdoYIuc856CDtPmYbCHJHLFigMXPZ1vStOczr/m3g2VmnEcKoJ3HH2GfXVPGoOJ9yChhvUCDc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB3418
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-CA
Content-Transfer-Encoding: 7bit

On 2021-05-14 9:38 a.m., Tony Tascioglu wrote:
> Hello,
> 
> These patches are only going to hardknott, and upstream released a new version yesterday that we can use for the master branch. The CVE fixes are present in the new version, and these patches backport those fixes for libxml version 2.9.10 in hardknott.
> I am working on the uprev to 2.9.12, and will send it to master once tested.
> 
> Thanks,
> Tony

Thanks Tony.
Adding Anuj in case he misses this email somehow.

../Randy

> 
> -----Original Message-----
> From: openembedded-core@lists.openembedded.org <openembedded-core@lists.openembedded.org> On Behalf Of Tony Tascioglu
> Sent: Friday, May 14, 2021 9:15 AM
> To: openembedded-core@lists.openembedded.org
> Cc: MacLeod, Randy <Randy.MacLeod@windriver.com>; Tascioglu, Tony <Tony.Tascioglu@windriver.com>
> Subject: [OE-core] [hardknott][PATCH 1/3] libxml2: fix CVE-2021-3517
> 
> Fixes heap-based buffer overflow in xmlEncodeEntitiesInternal() in entities.c
> 
> CVE: CVE-2021-3517
> Upstream-status: Backport [https://gitlab.gnome.org/GNOME/libxml2/-/commit/bf22713507fe1fc3a2c4b525cf0a88c2dc87a3a2]
> 
> Signed-off-by: Tony Tascioglu <tony.tascioglu@windriver.com>
> ---
>   .../libxml/libxml2/CVE-2021-3517.patch        | 54 +++++++++++++++++++
>   meta/recipes-core/libxml/libxml2_2.9.10.bb    |  1 +
>   2 files changed, 55 insertions(+)
>   create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2021-3517.patch
> 
> diff --git a/meta/recipes-core/libxml/libxml2/CVE-2021-3517.patch b/meta/recipes-core/libxml/libxml2/CVE-2021-3517.patch
> new file mode 100644
> index 0000000000..b6204f655a
> --- /dev/null
> +++ b/meta/recipes-core/libxml/libxml2/CVE-2021-3517.patch
> @@ -0,0 +1,54 @@
> +From df3de1376585f7a273d70023f92a530395957324 Mon Sep 17 00:00:00 2001
> +From: Joel Hockey <joel.hockey@gmail.com>
> +Date: Sun, 16 Aug 2020 17:19:35 -0700
> +Subject: [PATCH 1/3] Validate UTF8 in xmlEncodeEntities
> +
> +Code is currently assuming UTF-8 without validating. Truncated UTF-8
> +input can cause out-of-bounds array access.
> +
> +Adds further checks to partial fix in 50f06b3e.
> +
> +Fixes #178
> +
> +CVE: CVE-2021-3517
> +Upstream-Status: Backport
> +[https://gitlab.gnome.org/GNOME/libxml2/-/commit/bf22713507fe1fc3a2c4b5
> +25cf0a88c2dc87a3a2]
> +
> +Signed-off-by: Tony Tascioglu <tony.tascioglu@windriver.com>
> +---
> + entities.c | 16 +++++++++++++++-
> + 1 file changed, 15 insertions(+), 1 deletion(-)
> +
> +diff --git a/entities.c b/entities.c
> +index d575e9d1..7cdbc4de 100644
> +--- a/entities.c
> ++++ b/entities.c
> +@@ -666,11 +666,25 @@ xmlEncodeEntitiesInternal(xmlDocPtr doc, const xmlChar *input, int attr) {
> + 	    } else {
> + 		/*
> + 		 * We assume we have UTF-8 input.
> ++		 * It must match either:
> ++		 *   110xxxxx 10xxxxxx
> ++		 *   1110xxxx 10xxxxxx 10xxxxxx
> ++		 *   11110xxx 10xxxxxx 10xxxxxx 10xxxxxx
> ++		 * That is:
> ++		 *   cur[0] is 11xxxxxx
> ++		 *   cur[1] is 10xxxxxx
> ++		 *   cur[2] is 10xxxxxx if cur[0] is 111xxxxx
> ++		 *   cur[3] is 10xxxxxx if cur[0] is 1111xxxx
> ++		 *   cur[0] is not 11111xxx
> + 		 */
> + 		char buf[11], *ptr;
> + 		int val = 0, l = 1;
> +
> +-		if (*cur < 0xC0) {
> ++		if (((cur[0] & 0xC0) != 0xC0) ||
> ++		    ((cur[1] & 0xC0) != 0x80) ||
> ++		    (((cur[0] & 0xE0) == 0xE0) && ((cur[2] & 0xC0) != 0x80)) ||
> ++		    (((cur[0] & 0xF0) == 0xF0) && ((cur[3] & 0xC0) != 0x80)) ||
> ++		    (((cur[0] & 0xF8) == 0xF8))) {
> + 		    xmlEntitiesErr(XML_CHECK_NOT_UTF8,
> + 			    "xmlEncodeEntities: input not UTF-8");
> + 		    if (doc != NULL)
> +--
> +2.25.1
> +
> diff --git a/meta/recipes-core/libxml/libxml2_2.9.10.bb b/meta/recipes-core/libxml/libxml2_2.9.10.bb
> index 07ae68610c..ad612379b3 100644
> --- a/meta/recipes-core/libxml/libxml2_2.9.10.bb
> +++ b/meta/recipes-core/libxml/libxml2_2.9.10.bb
> @@ -24,6 +24,7 @@ SRC_URI = "http://www.xmlsoft.org/sources/libxml2-${PV}.tar.gz;name=libtar \
>              file://CVE-2019-20388.patch \
>              file://CVE-2020-24977.patch \
>              file://fix-python39.patch \
> +           file://CVE-2021-3517.patch \
>              "
>   
>   SRC_URI[libtar.md5sum] = "10942a1dc23137a8aa07f0639cbfece5"
> --
> 2.29.2
> 
> 
> 
> 
> 


-- 
# Randy MacLeod
# Wind River Linux
