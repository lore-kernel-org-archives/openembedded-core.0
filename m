Received: from NAM10-BN7-obe.outbound.protection.outlook.com (NAM10-BN7-obe.outbound.protection.outlook.com [40.107.92.50])
 by mx.groups.io with SMTP id smtpd.web11.5381.1590584709154694564
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 May 2020 06:05:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=HxjgJWuj;
 spf=pass (domain: windriver.com, ip: 40.107.92.50, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RuWA+c1cHS++36FmFmiq4EODJIgRT6Jlsfp1Z3bIu6HMnDnLfCdOiCit7bFANRCm5iuzibwAkkZqbEulYVxMHQ8APTp7F7x//BQP4b7Zr4t4PPHX3tevPWHWVCtGya9zTKWoG8wr73gWgpzCnArnIpFEaILuyPqBV+CYwQdPe0mIWt7d+2/KwfM3Sq+p6ng4+e8wScB2ZF7j1Qfa+qCEUYRbNZZ9KRizd9Sa4Dt1AwFvMBZh2Z7yEvJC+gbCspEF5xVH4mgWnzKMEWPOkEni0WJslO1jcukNa6SVYi1Te0aZqQgi9+i0bqSUAu9XES5YUrB6pDtiEUHpN+qkRFagYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IY8Lct7PLvbrpqZef8VO6zZ4VLd1X0p+MU9dbfJpPwk=;
 b=oe+PogicQ7i1YZnMoleWI/bs9jqyuMwHZBRSdmRVt2w/tJvWpudou621DkYmV2H6OBPKXWjUBke6QVcVjtshGnV9qbftJGeqCgDjQZaiBw/rUgOo/SGunCr4mejGaKkmqHkY0EE6LqtUFsfQkB3EeVLjdcqw5e/ppmGfkzVo9cg68Uv4h+kLMYLF9oBrn1LlAHgCiG6WBMuw1GUtG94EU9BwfGHf51pkbOHtHGMGfqnxQ0BoFBZ5f22yCCbZ0bxQTFoep6qeDZwrsHhYWNUXDGSmQK9IJh4RPPJ1CXinUQJdn/Jb4Apd26331FzrDCaTHonvV50v/oKrXMf4yUcSFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IY8Lct7PLvbrpqZef8VO6zZ4VLd1X0p+MU9dbfJpPwk=;
 b=HxjgJWujSjCy8gBXZQI4kmpMuz9UMEhSD5/5IjC2qcv/uwZqI2Ixm7MLT5A31ZQ00627kGjkgBDjNsqpBd/1cfxVId52wJyuw7qgwCQV7pt6xR5YshJeaI1tNP2uD5YzS8ry2HukBU4DpKbk6FNkznF0P7iYSN/uXBq3/V90Ufw=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BN6PR11MB0003.namprd11.prod.outlook.com (2603:10b6:405:61::26)
 by BN6PR11MB4113.namprd11.prod.outlook.com (2603:10b6:405:77::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3021.23; Wed, 27 May
 2020 13:05:06 +0000
Received: from BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7]) by BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7%4]) with mapi id 15.20.3045.018; Wed, 27 May 2020
 13:05:06 +0000
Subject: Re: [oe-core][PATCH] libexif: upgrade to 0.6.22, change source to GitHub
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
References: <20200526211257.37713-1-trevor.gamblin@windriver.com>
 <CANNYZj9v6gxW+jz4b6ejo838tTRNkSUB3DYULy4yEADz+gZdKw@mail.gmail.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <e0cca8c4-a153-736b-17e8-f9a224e392d5@windriver.com>
Date: Wed, 27 May 2020 09:05:03 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
In-Reply-To: <CANNYZj9v6gxW+jz4b6ejo838tTRNkSUB3DYULy4yEADz+gZdKw@mail.gmail.com>
X-ClientProxiedBy: YTOPR0101CA0068.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:14::45) To BN6PR11MB0003.namprd11.prod.outlook.com
 (2603:10b6:405:61::26)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.16] (174.115.236.231) by YTOPR0101CA0068.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:14::45) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3045.19 via Frontend Transport; Wed, 27 May 2020 13:05:05 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3579c3b3-4b69-47db-f6c4-08d8023e9343
X-MS-TrafficTypeDiagnostic: BN6PR11MB4113:
X-Microsoft-Antispam-PRVS: 
	<BN6PR11MB4113AD12135EDCE772BA7F499FB10@BN6PR11MB4113.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-Forefront-PRVS: 04163EF38A
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	B/I5yyXqGwn4MrshAKE5PJN+H3ncpzv9U9UY+AOuojeQLW8TK3mxqIO6KEZ8NBaz47xx+NUdeWALUnB3VWqqLuk/kFgw1Xhu2IC+PNxwoAnNiEc1hd7kIlzxIwFqrt8NT7NDqyOHBLFZyWyE3QU7WA3HdJq+wq/Y1KeYN1fayLo8dNbYSx+EfeUf+vzfMD6l2q+eIneHL/2mIzfJelh9jzdJrtXZdG1m1px4K3iE7+H3c9fcCCwx2p4SOQc1Xme5eBB4X2kecUHe4K7tfwkseau37c+FP06sim+estmX5z3OJwwzXH79ZfsyAN0JOoYRnIgdXEA6whzlqoaFGhqc1WSGs3limIhb3o6QulgVNvEEBEDO0PcBywvfk51WlBd6CCFRKi7i1yG6ZEuQvwBrUsSUTtEIpEm7KXaqD2N2MTW06OOdG1JMdtvlkpmV4q6mTuZ3wCEkToXo2uaTOYq9binBdv22D0BnTRiTmBqPT8w=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN6PR11MB0003.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(396003)(136003)(39850400004)(366004)(346002)(376002)(36756003)(53546011)(26005)(86362001)(31696002)(966005)(6916009)(16576012)(6486002)(478600001)(33964004)(8936002)(2616005)(2906002)(956004)(186003)(16526019)(8676002)(31686004)(19273905006)(166002)(66476007)(316002)(52116002)(66946007)(5660300002)(44832011)(66556008)(4326008)(83380400001)(30864003)(43740500002)(559001)(579004)(563064011);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	nl+KHLYnQzpEXOZtU0EAU+nX95r9w2oJZ4e+dBubdf0MqId0BG+9fNgiBP3AwKrMT12/hS6THfc91vkWw5vXdMpt/bzBgdVuvQT2pexNaASW79P5KIds8qhSr9guMXCRCWF3BVqfHiTWZXTmlMQV5LcvasvwTexU3b3XVLUwtDNqvOKuHAZ/I2yI40mmRnvC74VIuGwGDro/9uoittYUDA2LEbm8ijwEzHUHz/azd1pF6AxhRCjNnhUUFUU4xOXOGXDAV4JGrNgwwGHTD41TII21ZVvjlP3RPBEkkoVrBgP7UfPiGcuV5GjsFFKaPYHY14MKQ72CWbuEPgeR48vFV0e5XczxLzJQ4lNLrWYgmva9/hjt4K2idfy7Br+i4lT1E1Vns9O9VqzI+D3iWGwNLfDxJnXBGr30ujKBkZbJJnKlNGqAyzjb38FIuyLw3vaIlm6EM/NESaxyJsKIUnPFnnIFptmAahnQ8G1UK5yKfn4=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3579c3b3-4b69-47db-f6c4-08d8023e9343
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2020 13:05:06.0771
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: e9eQ/WlKsScMZV9IC/1E5DMOKS2GzYbJn6c56xJzE54Edu6/1WABrakK634pA+R3JTGrSd0vY5ZygLClj3Mscj+Oq17dfvkIXXmNA/MuZlM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB4113
Content-Type: multipart/alternative;
 boundary="------------5C6E814B41D6E7FC0D9592BA"
Content-Language: en-US

--------------5C6E814B41D6E7FC0D9592BA
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit


On 5/27/20 3:59 AM, Alexander Kanavin wrote:
> Hardcoding the split version components isn't great (and breaks 
> automated updates), I have a patch queued that does this better:

Works for me.

Thanks!

>
> http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/commit/?h=akanavin/package-version-updates&id=314af89080317673cf91e24537b2e0d9b36747c2
>
> Specifically:
> def version_underscore(v):
>  return "_".join(v.split("."))
>
> SRC_URI = 
> "https://github.com/libexif/libexif/releases/download/libexif-${@version_underscore("${PV}")}-release/libexif-${PV}.tar.xz 
> \
>  "
>
> Alex
>
> On Tue, 26 May 2020 at 23:13, Trevor Gamblin 
> <trevor.gamblin@windriver.com <mailto:trevor.gamblin@windriver.com>> 
> wrote:
>
>     Updated libexif to 0.6.22, but needed to change to GitHub as a source,
>     since SourceForge does not yet have 0.6.22 version. The new version
>     includes the fixes for the three patch files that have been removed,
>     as well as other severe CVEs.
>
>     CVE: CVE-2018-20030
>     CVE: CVE-2020-13114
>     CVE: CVE-2020-13113
>     CVE: CVE-2020-13112
>     CVE: CVE-2020-0093
>     CVE: CVE-2019-9278
>     CVE: CVE-2020-12767
>     CVE: CVE-2016-6328
>     CVE: CVE-2017-7544
>
>     Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com
>     <mailto:trevor.gamblin@windriver.com>>
>     ---
>      .../libexif/libexif/CVE-2016-6328.patch       |  64 ----------
>      .../libexif/libexif/CVE-2017-7544.patch       |  40 ------
>      .../libexif/libexif/CVE-2018-20030.patch      | 115
>     ------------------
>      .../recipes-support/libexif/libexif_0.6.21.bb
>     <http://libexif_0.6.21.bb> |  17 ---
>      .../recipes-support/libexif/libexif_0.6.22.bb
>     <http://libexif_0.6.22.bb> |  21 ++++
>      5 files changed, 21 insertions(+), 236 deletions(-)
>      delete mode 100644
>     meta/recipes-support/libexif/libexif/CVE-2016-6328.patch
>      delete mode 100644
>     meta/recipes-support/libexif/libexif/CVE-2017-7544.patch
>      delete mode 100644
>     meta/recipes-support/libexif/libexif/CVE-2018-20030.patch
>      delete mode 100644 meta/recipes-support/libexif/libexif_0.6.21.bb
>     <http://libexif_0.6.21.bb>
>      create mode 100644 meta/recipes-support/libexif/libexif_0.6.22.bb
>     <http://libexif_0.6.22.bb>
>
>     diff --git
>     a/meta/recipes-support/libexif/libexif/CVE-2016-6328.patch
>     b/meta/recipes-support/libexif/libexif/CVE-2016-6328.patch
>     deleted file mode 100644
>     index a6f307439b..0000000000
>     --- a/meta/recipes-support/libexif/libexif/CVE-2016-6328.patch
>     +++ /dev/null
>     @@ -1,64 +0,0 @@
>     -CVE: CVE-2016-6328
>     -Upstream-Status: Backport
>     -Signed-off-by: Ross Burton <ross.burton@intel.com
>     <mailto:ross.burton@intel.com>>
>     -
>     -From 41bd04234b104312f54d25822f68738ba8d7133d Mon Sep 17 00:00:00
>     2001
>     -From: Marcus Meissner <marcus@jet.franken.de
>     <mailto:marcus@jet.franken.de>>
>     -Date: Tue, 25 Jul 2017 23:44:44 +0200
>     -Subject: [PATCH] fixes some (not all) buffer overreads during
>     decoding pentax
>     - makernote entries.
>     -
>     -This should fix:
>     -https://sourceforge.net/p/libexif/bugs/125/ CVE-2016-6328
>     ----
>     - libexif/pentax/mnote-pentax-entry.c | 16 +++++++++++++---
>     - 1 file changed, 13 insertions(+), 3 deletions(-)
>     -
>     -diff --git a/libexif/pentax/mnote-pentax-entry.c
>     b/libexif/pentax/mnote-pentax-entry.c
>     -index d03d159..ea0429a 100644
>     ---- a/libexif/pentax/mnote-pentax-entry.c
>     -+++ b/libexif/pentax/mnote-pentax-entry.c
>     -@@ -425,24 +425,34 @@ mnote_pentax_entry_get_value
>     (MnotePentaxEntry *entry,
>     -               case EXIF_FORMAT_SHORT:
>     -                 {
>     -                       const unsigned char *data = entry->data;
>     --                      size_t k, len = strlen(val);
>     -+                      size_t k, len = strlen(val), sizeleft;
>     -+
>     -+                      sizeleft = entry->size;
>     -                       for(k=0; k<entry->components; k++) {
>     -+                              if (sizeleft < 2)
>     -+                                      break;
>     -                               vs = exif_get_short (data,
>     entry->order);
>     -                               snprintf (val+len, maxlen-len, "%i
>     ", vs);
>     -                               len = strlen(val);
>     -                               data += 2;
>     -+                              sizeleft -= 2;
>     -                       }
>     -                 }
>     -                 break;
>     -               case EXIF_FORMAT_LONG:
>     -                 {
>     -                       const unsigned char *data = entry->data;
>     --                      size_t k, len = strlen(val);
>     -+                      size_t k, len = strlen(val), sizeleft;
>     -+
>     -+                      sizeleft = entry->size;
>     -                       for(k=0; k<entry->components; k++) {
>     -+                              if (sizeleft < 4)
>     -+                                      break;
>     -                               vl = exif_get_long (data,
>     entry->order);
>     -                               snprintf (val+len, maxlen-len,
>     "%li", (long int) vl);
>     -                               len = strlen(val);
>     -                               data += 4;
>     -+                              sizeleft -= 4;
>     -                       }
>     -                 }
>     -                 break;
>     -@@ -455,5 +465,5 @@ mnote_pentax_entry_get_value
>     (MnotePentaxEntry *entry,
>     -               break;
>     -       }
>     -
>     --      return (val);
>     -+      return val;
>     - }
>     diff --git
>     a/meta/recipes-support/libexif/libexif/CVE-2017-7544.patch
>     b/meta/recipes-support/libexif/libexif/CVE-2017-7544.patch
>     deleted file mode 100644
>     index e49481ff84..0000000000
>     --- a/meta/recipes-support/libexif/libexif/CVE-2017-7544.patch
>     +++ /dev/null
>     @@ -1,40 +0,0 @@
>     -From 8a92f964a66d476ca8907234359e92a70fc1325b Mon Sep 17 00:00:00
>     2001
>     -From: Changqing Li <changqing.li@windriver.com
>     <mailto:changqing.li@windriver.com>>
>     -Date: Tue, 28 Aug 2018 15:12:10 +0800
>     -Subject: [PATCH] On saving makernotes, make sure the makernote
>     container tags
>     - has a type with 1 byte components.
>     -
>     -Fixes (at least):
>     - https://sourceforge.net/p/libexif/bugs/130
>     - https://sourceforge.net/p/libexif/bugs/129
>     -
>     -Upstream-Status: Backport[https://github.com/libexif/libexif/commit/
>     -c39acd1692023b26290778a02a9232c873f9d71a#diff-830e348923810f00726700b083ec00cd
>     <https://github.com/libexif/libexif/commit/-c39acd1692023b26290778a02a9232c873f9d71a#diff-830e348923810f00726700b083ec00cd>]
>     -
>     -CVE: CVE-2017-7544
>     -
>     -Signed-off-by: Changqing Li <changqing.li@windriver.com
>     <mailto:changqing.li@windriver.com>>
>     ----
>     - libexif/exif-data.c | 6 ++++++
>     - 1 file changed, 6 insertions(+)
>     -
>     -diff --git a/libexif/exif-data.c b/libexif/exif-data.c
>     -index 67df4db..6bf89eb 100644
>     ---- a/libexif/exif-data.c
>     -+++ b/libexif/exif-data.c
>     -@@ -255,6 +255,12 @@ exif_data_save_data_entry (ExifData *data,
>     ExifEntry *e,
>     -                       exif_mnote_data_set_offset
>     (data->priv->md, *ds - 6);
>     -                       exif_mnote_data_save (data->priv->md,
>     &e->data, &e->size);
>     -                       e->components = e->size;
>     -+                        if (exif_format_get_size (e->format) != 1) {
>     -+                              /* e->format is taken from input code,
>     -+                               * but we need to make sure it is
>     a 1 byte
>     -+                               * entity due to the
>     multiplication below. */
>     -+                              e->format = EXIF_FORMAT_UNDEFINED;
>     -+                      }
>     -               }
>     -       }
>     -
>     ---
>     -2.7.4
>     -
>     diff --git
>     a/meta/recipes-support/libexif/libexif/CVE-2018-20030.patch
>     b/meta/recipes-support/libexif/libexif/CVE-2018-20030.patch
>     deleted file mode 100644
>     index 76233e6dc9..0000000000
>     --- a/meta/recipes-support/libexif/libexif/CVE-2018-20030.patch
>     +++ /dev/null
>     @@ -1,115 +0,0 @@
>     -CVE: CVE-2018-20030
>     -Upstream-Status: Backport
>     -Signed-off-by: Ross Burton <ross.burton@intel.com
>     <mailto:ross.burton@intel.com>>
>     -
>     -From 6aa11df549114ebda520dde4cdaea2f9357b2c89 Mon Sep 17 00:00:00
>     2001
>     -From: Dan Fandrich <dan@coneharvesters.com
>     <mailto:dan@coneharvesters.com>>
>     -Date: Fri, 12 Oct 2018 16:01:45 +0200
>     -Subject: [PATCH] Improve deep recursion detection in
>     - exif_data_load_data_content.
>     -
>     -The existing detection was still vulnerable to pathological cases
>     -causing DoS by wasting CPU. The new algorithm takes the number of
>     tags
>     -into account to make it harder to abuse by cases using shallow
>     recursion
>     -but with a very large number of tags.  This improves on commit
>     5d28011c
>     -which wasn't sufficient to counter this kind of case.
>     -
>     -The limitation in the previous fix was discovered by Laurent
>     Delosieres,
>     -Secunia Research at Flexera (Secunia Advisory SA84652) and is
>     assigned
>     -the identifier CVE-2018-20030.
>     -
>     -diff --git a/libexif/exif-data.c b/libexif/exif-data.c
>     -index 67df4db..8d9897e 100644
>     ---- a/libexif/exif-data.c
>     -+++ b/libexif/exif-data.c
>     -@@ -35,6 +35,7 @@
>     - #include <libexif/olympus/exif-mnote-data-olympus.h>
>     - #include <libexif/pentax/exif-mnote-data-pentax.h>
>     -
>     -+#include <math.h>
>     - #include <stdlib.h>
>     - #include <stdio.h>
>     - #include <string.h>
>     -@@ -344,6 +345,20 @@ if (data->ifd[(i)]->count) {                
>             \
>     -       break;                                          \
>     - }
>     -
>     -+/*! Calculate the recursion cost added by one level of IFD loading.
>     -+ *
>     -+ * The work performed is related to the cost in the exponential
>     relation
>     -+ *   work=1.1**cost
>     -+ */
>     -+static unsigned int
>     -+level_cost(unsigned int n)
>     -+{
>     -+    static const double log_1_1 = 0.09531017980432493;
>     -+
>     -+      /* Adding 0.1 protects against the case where n==1 */
>     -+      return ceil(log(n + 0.1)/log_1_1);
>     -+}
>     -+
>     - /*! Load data for an IFD.
>     -  *
>     -  * \param[in,out] data #ExifData
>     -@@ -351,13 +366,13 @@ if (data->ifd[(i)]->count) {              
>              \
>     -  * \param[in] d pointer to buffer containing raw IFD data
>     -  * \param[in] ds size of raw data in buffer at \c d
>     -  * \param[in] offset offset into buffer at \c d at which IFD starts
>     -- * \param[in] recursion_depth number of times this function has been
>     -- * recursively called without returning
>     -+ * \param[in] recursion_cost factor indicating how expensive
>     this recursive
>     -+ * call could be
>     -  */
>     - static void
>     - exif_data_load_data_content (ExifData *data, ExifIfd ifd,
>     -                            const unsigned char *d,
>     --                           unsigned int ds, unsigned int offset,
>     unsigned int recursion_depth)
>     -+                           unsigned int ds, unsigned int offset,
>     unsigned int recursion_cost)
>     - {
>     -       ExifLong o, thumbnail_offset = 0, thumbnail_length = 0;
>     -       ExifShort n;
>     -@@ -372,9 +387,20 @@ exif_data_load_data_content (ExifData *data,
>     ExifIfd ifd,
>     -       if ((((int)ifd) < 0) || ( ((int)ifd) >= EXIF_IFD_COUNT))
>     -         return;
>     -
>     --      if (recursion_depth > 30) {
>     -+      if (recursion_cost > 170) {
>     -+              /*
>     -+               * recursion_cost is a logarithmic-scale indicator
>     of how expensive this
>     -+               * recursive call might end up being. It is an
>     indicator of the depth of
>     -+               * recursion as well as the potential for
>     worst-case future recursive
>     -+               * calls. Since it's difficult to tell ahead of
>     time how often recursion
>     -+               * will occur, this assumes the worst by assuming
>     every tag could end up
>     -+               * causing recursion.
>     -+               * The value of 170 was chosen to limit typical
>     EXIF structures to a
>     -+               * recursive depth of about 6, but pathological
>     ones (those with very
>     -+               * many tags) to only 2.
>     -+               */
>     -               exif_log (data->priv->log,
>     EXIF_LOG_CODE_CORRUPT_DATA, "ExifData",
>     --                        "Deep recursion detected!");
>     -+                        "Deep/expensive recursion detected!");
>     -               return;
>     -       }
>     -
>     -@@ -416,15 +442,18 @@ exif_data_load_data_content (ExifData
>     *data, ExifIfd ifd,
>     -                       switch (tag) {
>     -                       case EXIF_TAG_EXIF_IFD_POINTER:
>     -                               CHECK_REC (EXIF_IFD_EXIF);
>     --                              exif_data_load_data_content (data,
>     EXIF_IFD_EXIF, d, ds, o, recursion_depth + 1);
>     -+                              exif_data_load_data_content (data,
>     EXIF_IFD_EXIF, d, ds, o,
>     -+                                      recursion_cost +
>     level_cost(n));
>     -                               break;
>     -                       case EXIF_TAG_GPS_INFO_IFD_POINTER:
>     -                               CHECK_REC (EXIF_IFD_GPS);
>     --                              exif_data_load_data_content (data,
>     EXIF_IFD_GPS, d, ds, o, recursion_depth + 1);
>     -+                              exif_data_load_data_content (data,
>     EXIF_IFD_GPS, d, ds, o,
>     -+                                      recursion_cost +
>     level_cost(n));
>     -                               break;
>     -                       case EXIF_TAG_INTEROPERABILITY_IFD_POINTER:
>     -                               CHECK_REC (EXIF_IFD_INTEROPERABILITY);
>     --                              exif_data_load_data_content (data,
>     EXIF_IFD_INTEROPERABILITY, d, ds, o, recursion_depth + 1);
>     -+                              exif_data_load_data_content (data,
>     EXIF_IFD_INTEROPERABILITY, d, ds, o,
>     -+                                      recursion_cost +
>     level_cost(n));
>     -                               break;
>     -                       case EXIF_TAG_JPEG_INTERCHANGE_FORMAT:
>     -                               thumbnail_offset = o;
>     diff --git a/meta/recipes-support/libexif/libexif_0.6.21.bb
>     <http://libexif_0.6.21.bb>
>     b/meta/recipes-support/libexif/libexif_0.6.21.bb
>     <http://libexif_0.6.21.bb>
>     deleted file mode 100644
>     index d847beab18..0000000000
>     --- a/meta/recipes-support/libexif/libexif_0.6.21.bb
>     <http://libexif_0.6.21.bb>
>     +++ /dev/null
>     @@ -1,17 +0,0 @@
>     -SUMMARY = "Library for reading extended image information (EXIF)
>     from JPEG files"
>     -HOMEPAGE = "http://sourceforge.net/projects/libexif"
>     -SECTION = "libs"
>     -LICENSE = "LGPLv2.1"
>     -LIC_FILES_CHKSUM =
>     "file://COPYING;md5=243b725d71bb5df4a1e5920b344b86ad"
>     -
>     -SRC_URI = "${SOURCEFORGE_MIRROR}/libexif/libexif-${PV}.tar.bz2 \
>     -           file://CVE-2017-7544.patch \
>     -           file://CVE-2016-6328.patch \
>     -           file://CVE-2018-20030.patch"
>     -
>     -SRC_URI[md5sum] = "27339b89850f28c8f1c237f233e05b27"
>     -SRC_URI[sha256sum] =
>     "16cdaeb62eb3e6dfab2435f7d7bccd2f37438d21c5218ec4e58efa9157d4d41a"
>     -
>     -inherit autotools gettext
>     -
>     -EXTRA_OECONF += "--disable-docs"
>     diff --git a/meta/recipes-support/libexif/libexif_0.6.22.bb
>     <http://libexif_0.6.22.bb>
>     b/meta/recipes-support/libexif/libexif_0.6.22.bb
>     <http://libexif_0.6.22.bb>
>     new file mode 100644
>     index 0000000000..b24135db0f
>     --- /dev/null
>     +++ b/meta/recipes-support/libexif/libexif_0.6.22.bb
>     <http://libexif_0.6.22.bb>
>     @@ -0,0 +1,21 @@
>     +SUMMARY = "Library for reading extended image information (EXIF)
>     from JPEG files"
>     +HOMEPAGE = "http://sourceforge.net/projects/libexif"
>     +SECTION = "libs"
>     +LICENSE = "LGPLv2.1"
>     +LIC_FILES_CHKSUM =
>     "file://COPYING;md5=243b725d71bb5df4a1e5920b344b86ad"
>     +
>     +MAJOR_VERSION = "0"
>     +MINOR_VERSION = "6"
>     +PATCH_VERSION = "22"
>     +
>     +PV = "${MAJOR_VERSION}.${MINOR_VERSION}.${PATCH_VERSION}"
>     +PATH_PV = "${MAJOR_VERSION}_${MINOR_VERSION}_${PATCH_VERSION}"
>     +
>     +SRC_URI =
>     "https://github.com/libexif/libexif/releases/download/libexif-${PATH_PV}-release/libexif-${PV}.tar.gz
>     <https://github.com/libexif/libexif/releases/download/libexif-$%7BPATH_PV%7D-release/libexif-$%7BPV%7D.tar.gz>"
>     +
>     +SRC_URI[md5sum] = "dd67f593b046ad93d01437081329af02"
>     +SRC_URI[sha256sum] =
>     "75dc5c135c61b5e0b15f3911b4de4b3070dd1a1683b9fc08d9ce3518d54d758d"
>     +
>     +inherit autotools gettext
>     +
>     +EXTRA_OECONF += "--disable-docs"
>     -- 
>     2.26.2
>
>     
>

--------------5C6E814B41D6E7FC0D9592BA
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 5/27/20 3:59 AM, Alexander Kanavin
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:CANNYZj9v6gxW&#43;jz4b6ejo838tTRNkSUB3DYULy4yEADz&#43;gZdKw@mail.gmail.com">
      
      <div dir="ltr">
        <div>Hardcoding the split version components isn't great (and
          breaks automated updates), I have a patch queued that does
          this better:</div>
      </div>
    </blockquote>
    <p>Works for me.</p>
    <p>Thanks!<br>
    </p>
    <blockquote type="cite" cite="mid:CANNYZj9v6gxW&#43;jz4b6ejo838tTRNkSUB3DYULy4yEADz&#43;gZdKw@mail.gmail.com">
      <div dir="ltr">
        <div><br>
        </div>
        <div><a href="http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/commit/?h=akanavin/package-version-updates&amp;id=314af89080317673cf91e24537b2e0d9b36747c2" moz-do-not-send="true">http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/commit/?h=akanavin/package-version-updates&amp;id=314af89080317673cf91e24537b2e0d9b36747c2</a></div>
        <div><br>
        </div>
        <div>Specifically:</div>
        <div>
          <div class="gmail-add">def version_underscore(v):</div>
          <div class="gmail-add">&nbsp;return &quot;_&quot;.join(v.split(&quot;.&quot;))</div>
          <div class="gmail-add"><br>
          </div>
          <div class="gmail-add">SRC_URI = &quot;<a href="https://github.com/libexif/libexif/releases/download/libexif-${@version_underscore(" moz-do-not-send="true">https://github.com/libexif/libexif/releases/download/libexif-${@version_underscore(</a>&quot;${PV}&quot;)}-release/libexif-${PV}.tar.xz
            \</div>
          <div class="gmail-add">&nbsp;&quot;</div>
          <div class="gmail-add"><br>
          </div>
          <div class="gmail-add">Alex<br>
          </div>
        </div>
      </div>
      <br>
      <div class="gmail_quote">
        <div dir="ltr" class="gmail_attr">On Tue, 26 May 2020 at 23:13,
          Trevor Gamblin &lt;<a href="mailto:trevor.gamblin@windriver.com" moz-do-not-send="true">trevor.gamblin@windriver.com</a>&gt;
          wrote:<br>
        </div>
        <blockquote class="gmail_quote" style="margin:0px 0px 0px
          0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Updated
          libexif to 0.6.22, but needed to change to GitHub as a source,<br>
          since SourceForge does not yet have 0.6.22 version. The new
          version<br>
          includes the fixes for the three patch files that have been
          removed,<br>
          as well as other severe CVEs.<br>
          <br>
          CVE: CVE-2018-20030<br>
          CVE: CVE-2020-13114<br>
          CVE: CVE-2020-13113<br>
          CVE: CVE-2020-13112<br>
          CVE: CVE-2020-0093<br>
          CVE: CVE-2019-9278<br>
          CVE: CVE-2020-12767<br>
          CVE: CVE-2016-6328<br>
          CVE: CVE-2017-7544<br>
          <br>
          Signed-off-by: Trevor Gamblin &lt;<a href="mailto:trevor.gamblin@windriver.com" target="_blank" moz-do-not-send="true">trevor.gamblin@windriver.com</a>&gt;<br>
          ---<br>
          &nbsp;.../libexif/libexif/CVE-2016-6328.patch&nbsp; &nbsp; &nbsp; &nbsp;|&nbsp; 64
          ----------<br>
          &nbsp;.../libexif/libexif/CVE-2017-7544.patch&nbsp; &nbsp; &nbsp; &nbsp;|&nbsp; 40 ------<br>
          &nbsp;.../libexif/libexif/CVE-2018-20030.patch&nbsp; &nbsp; &nbsp; | 115
          ------------------<br>
          &nbsp;.../recipes-support/libexif/<a href="http://libexif_0.6.21.bb" rel="noreferrer" target="_blank" moz-do-not-send="true">libexif_0.6.21.bb</a>
          |&nbsp; 17 ---<br>
          &nbsp;.../recipes-support/libexif/<a href="http://libexif_0.6.22.bb" rel="noreferrer" target="_blank" moz-do-not-send="true">libexif_0.6.22.bb</a>
          |&nbsp; 21 &#43;&#43;&#43;&#43;<br>
          &nbsp;5 files changed, 21 insertions(&#43;), 236 deletions(-)<br>
          &nbsp;delete mode 100644
          meta/recipes-support/libexif/libexif/CVE-2016-6328.patch<br>
          &nbsp;delete mode 100644
          meta/recipes-support/libexif/libexif/CVE-2017-7544.patch<br>
          &nbsp;delete mode 100644
          meta/recipes-support/libexif/libexif/CVE-2018-20030.patch<br>
          &nbsp;delete mode 100644 meta/recipes-support/libexif/<a href="http://libexif_0.6.21.bb" rel="noreferrer" target="_blank" moz-do-not-send="true">libexif_0.6.21.bb</a><br>
          &nbsp;create mode 100644 meta/recipes-support/libexif/<a href="http://libexif_0.6.22.bb" rel="noreferrer" target="_blank" moz-do-not-send="true">libexif_0.6.22.bb</a><br>
          <br>
          diff --git
          a/meta/recipes-support/libexif/libexif/CVE-2016-6328.patch
          b/meta/recipes-support/libexif/libexif/CVE-2016-6328.patch<br>
          deleted file mode 100644<br>
          index a6f307439b..0000000000<br>
          --- a/meta/recipes-support/libexif/libexif/CVE-2016-6328.patch<br>
          &#43;&#43;&#43; /dev/null<br>
          @@ -1,64 &#43;0,0 @@<br>
          -CVE: CVE-2016-6328<br>
          -Upstream-Status: Backport<br>
          -Signed-off-by: Ross Burton &lt;<a href="mailto:ross.burton@intel.com" target="_blank" moz-do-not-send="true">ross.burton@intel.com</a>&gt;<br>
          -<br>
          -From 41bd04234b104312f54d25822f68738ba8d7133d Mon Sep 17
          00:00:00 2001<br>
          -From: Marcus Meissner &lt;<a href="mailto:marcus@jet.franken.de" target="_blank" moz-do-not-send="true">marcus@jet.franken.de</a>&gt;<br>
          -Date: Tue, 25 Jul 2017 23:44:44 &#43;0200<br>
          -Subject: [PATCH] fixes some (not all) buffer overreads during
          decoding pentax<br>
          - makernote entries.<br>
          -<br>
          -This should fix:<br>
          -<a href="https://sourceforge.net/p/libexif/bugs/125/" rel="noreferrer" target="_blank" moz-do-not-send="true">https://sourceforge.net/p/libexif/bugs/125/</a>
          CVE-2016-6328<br>
          ----<br>
          - libexif/pentax/mnote-pentax-entry.c | 16 &#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;---<br>
          - 1 file changed, 13 insertions(&#43;), 3 deletions(-)<br>
          -<br>
          -diff --git a/libexif/pentax/mnote-pentax-entry.c
          b/libexif/pentax/mnote-pentax-entry.c<br>
          -index d03d159..ea0429a 100644<br>
          ---- a/libexif/pentax/mnote-pentax-entry.c<br>
          -&#43;&#43;&#43; b/libexif/pentax/mnote-pentax-entry.c<br>
          -@@ -425,24 &#43;425,34 @@ mnote_pentax_entry_get_value
          (MnotePentaxEntry *entry,<br>
          -&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;case EXIF_FORMAT_SHORT:<br>
          -&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;{<br>
          -&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;const unsigned char *data =
          entry-&gt;data;<br>
          --&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; size_t k, len = strlen(val);<br>
          -&#43;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; size_t k, len = strlen(val), sizeleft;<br>
          -&#43;<br>
          -&#43;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; sizeleft = entry-&gt;size;<br>
          -&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;for(k=0; k&lt;entry-&gt;components;
          k&#43;&#43;) {<br>
          -&#43;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; if (sizeleft &lt; 2)<br>
          -&#43;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; break;<br>
          -&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;vs = exif_get_short (data,
          entry-&gt;order);<br>
          -&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;snprintf (val&#43;len, maxlen-len,
          &quot;%i &quot;, vs);<br>
          -&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;len = strlen(val);<br>
          -&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;data &#43;= 2;<br>
          -&#43;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; sizeleft -= 2;<br>
          -&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;}<br>
          -&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;}<br>
          -&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;break;<br>
          -&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;case EXIF_FORMAT_LONG:<br>
          -&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;{<br>
          -&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;const unsigned char *data =
          entry-&gt;data;<br>
          --&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; size_t k, len = strlen(val);<br>
          -&#43;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; size_t k, len = strlen(val), sizeleft;<br>
          -&#43;<br>
          -&#43;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; sizeleft = entry-&gt;size;<br>
          -&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;for(k=0; k&lt;entry-&gt;components;
          k&#43;&#43;) {<br>
          -&#43;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; if (sizeleft &lt; 4)<br>
          -&#43;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; break;<br>
          -&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;vl = exif_get_long (data,
          entry-&gt;order);<br>
          -&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;snprintf (val&#43;len, maxlen-len,
          &quot;%li&quot;, (long int) vl);<br>
          -&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;len = strlen(val);<br>
          -&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;data &#43;= 4;<br>
          -&#43;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; sizeleft -= 4;<br>
          -&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;}<br>
          -&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;}<br>
          -&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;break;<br>
          -@@ -455,5 &#43;465,5 @@ mnote_pentax_entry_get_value
          (MnotePentaxEntry *entry,<br>
          -&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;break;<br>
          -&nbsp; &nbsp; &nbsp; &nbsp;}<br>
          - <br>
          --&nbsp; &nbsp; &nbsp; return (val);<br>
          -&#43;&nbsp; &nbsp; &nbsp; return val;<br>
          - }<br>
          diff --git
          a/meta/recipes-support/libexif/libexif/CVE-2017-7544.patch
          b/meta/recipes-support/libexif/libexif/CVE-2017-7544.patch<br>
          deleted file mode 100644<br>
          index e49481ff84..0000000000<br>
          --- a/meta/recipes-support/libexif/libexif/CVE-2017-7544.patch<br>
          &#43;&#43;&#43; /dev/null<br>
          @@ -1,40 &#43;0,0 @@<br>
          -From 8a92f964a66d476ca8907234359e92a70fc1325b Mon Sep 17
          00:00:00 2001<br>
          -From: Changqing Li &lt;<a href="mailto:changqing.li@windriver.com" target="_blank" moz-do-not-send="true">changqing.li@windriver.com</a>&gt;<br>
          -Date: Tue, 28 Aug 2018 15:12:10 &#43;0800<br>
          -Subject: [PATCH] On saving makernotes, make sure the
          makernote container tags<br>
          - has a type with 1 byte components.<br>
          -<br>
          -Fixes (at least):<br>
          -&nbsp; &nbsp; &nbsp; &nbsp;<a href="https://sourceforge.net/p/libexif/bugs/130" rel="noreferrer" target="_blank" moz-do-not-send="true">https://sourceforge.net/p/libexif/bugs/130</a><br>
          -&nbsp; &nbsp; &nbsp; &nbsp;<a href="https://sourceforge.net/p/libexif/bugs/129" rel="noreferrer" target="_blank" moz-do-not-send="true">https://sourceforge.net/p/libexif/bugs/129</a><br>
          -<br>
          -Upstream-Status: Backport[<a href="https://github.com/libexif/libexif/commit/-c39acd1692023b26290778a02a9232c873f9d71a#diff-830e348923810f00726700b083ec00cd" rel="noreferrer" target="_blank" moz-do-not-send="true">https://github.com/libexif/libexif/commit/<br>
-c39acd1692023b26290778a02a9232c873f9d71a#diff-830e348923810f00726700b083ec00cd</a>]<br>
          -<br>
          -CVE: CVE-2017-7544<br>
          -<br>
          -Signed-off-by: Changqing Li &lt;<a href="mailto:changqing.li@windriver.com" target="_blank" moz-do-not-send="true">changqing.li@windriver.com</a>&gt;<br>
          ----<br>
          - libexif/exif-data.c | 6 &#43;&#43;&#43;&#43;&#43;&#43;<br>
          - 1 file changed, 6 insertions(&#43;)<br>
          -<br>
          -diff --git a/libexif/exif-data.c b/libexif/exif-data.c<br>
          -index 67df4db..6bf89eb 100644<br>
          ---- a/libexif/exif-data.c<br>
          -&#43;&#43;&#43; b/libexif/exif-data.c<br>
          -@@ -255,6 &#43;255,12 @@ exif_data_save_data_entry (ExifData
          *data, ExifEntry *e,<br>
          -&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;exif_mnote_data_set_offset
          (data-&gt;priv-&gt;md, *ds - 6);<br>
          -&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;exif_mnote_data_save
          (data-&gt;priv-&gt;md, &amp;e-&gt;data, &amp;e-&gt;size);<br>
          -&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;e-&gt;components = e-&gt;size;<br>
          -&#43;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; if (exif_format_get_size
          (e-&gt;format) != 1) {<br>
          -&#43;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; /* e-&gt;format is taken from
          input code,<br>
          -&#43;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;* but we need to make sure it
          is a 1 byte<br>
          -&#43;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;* entity due to the
          multiplication below. */<br>
          -&#43;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; e-&gt;format =
          EXIF_FORMAT_UNDEFINED;<br>
          -&#43;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; }<br>
          -&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;}<br>
          -&nbsp; &nbsp; &nbsp; &nbsp;}<br>
          - <br>
          --- <br>
          -2.7.4<br>
          -<br>
          diff --git
          a/meta/recipes-support/libexif/libexif/CVE-2018-20030.patch
          b/meta/recipes-support/libexif/libexif/CVE-2018-20030.patch<br>
          deleted file mode 100644<br>
          index 76233e6dc9..0000000000<br>
          ---
          a/meta/recipes-support/libexif/libexif/CVE-2018-20030.patch<br>
          &#43;&#43;&#43; /dev/null<br>
          @@ -1,115 &#43;0,0 @@<br>
          -CVE: CVE-2018-20030<br>
          -Upstream-Status: Backport<br>
          -Signed-off-by: Ross Burton &lt;<a href="mailto:ross.burton@intel.com" target="_blank" moz-do-not-send="true">ross.burton@intel.com</a>&gt;<br>
          -<br>
          -From 6aa11df549114ebda520dde4cdaea2f9357b2c89 Mon Sep 17
          00:00:00 2001<br>
          -From: Dan Fandrich &lt;<a href="mailto:dan@coneharvesters.com" target="_blank" moz-do-not-send="true">dan@coneharvesters.com</a>&gt;<br>
          -Date: Fri, 12 Oct 2018 16:01:45 &#43;0200<br>
          -Subject: [PATCH] Improve deep recursion detection in<br>
          - exif_data_load_data_content.<br>
          -<br>
          -The existing detection was still vulnerable to pathological
          cases<br>
          -causing DoS by wasting CPU. The new algorithm takes the
          number of tags<br>
          -into account to make it harder to abuse by cases using
          shallow recursion<br>
          -but with a very large number of tags.&nbsp; This improves on
          commit 5d28011c<br>
          -which wasn't sufficient to counter this kind of case.<br>
          -<br>
          -The limitation in the previous fix was discovered by Laurent
          Delosieres,<br>
          -Secunia Research at Flexera (Secunia Advisory SA84652) and is
          assigned<br>
          -the identifier CVE-2018-20030.<br>
          -<br>
          -diff --git a/libexif/exif-data.c b/libexif/exif-data.c<br>
          -index 67df4db..8d9897e 100644<br>
          ---- a/libexif/exif-data.c<br>
          -&#43;&#43;&#43; b/libexif/exif-data.c<br>
          -@@ -35,6 &#43;35,7 @@<br>
          - #include &lt;libexif/olympus/exif-mnote-data-olympus.h&gt;<br>
          - #include &lt;libexif/pentax/exif-mnote-data-pentax.h&gt;<br>
          - <br>
          -&#43;#include &lt;math.h&gt;<br>
          - #include &lt;stdlib.h&gt;<br>
          - #include &lt;stdio.h&gt;<br>
          - #include &lt;string.h&gt;<br>
          -@@ -344,6 &#43;345,20 @@ if (data-&gt;ifd[(i)]-&gt;count) {&nbsp; &nbsp; &nbsp;
          &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; \<br>
          -&nbsp; &nbsp; &nbsp; &nbsp;break;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; \<br>
          - }<br>
          - <br>
          -&#43;/*! Calculate the recursion cost added by one level of IFD
          loading.<br>
          -&#43; *<br>
          -&#43; * The work performed is related to the cost in the
          exponential relation<br>
          -&#43; *&nbsp; &nbsp;work=1.1**cost<br>
          -&#43; */<br>
          -&#43;static unsigned int<br>
          -&#43;level_cost(unsigned int n)<br>
          -&#43;{<br>
          -&#43;&nbsp; &nbsp; static const double log_1_1 = 0.09531017980432493;<br>
          -&#43;<br>
          -&#43;&nbsp; &nbsp; &nbsp; /* Adding 0.1 protects against the case where n==1 */<br>
          -&#43;&nbsp; &nbsp; &nbsp; return ceil(log(n &#43; 0.1)/log_1_1);<br>
          -&#43;}<br>
          -&#43;<br>
          - /*! Load data for an IFD.<br>
          -&nbsp; *<br>
          -&nbsp; * \param[in,out] data #ExifData<br>
          -@@ -351,13 &#43;366,13 @@ if (data-&gt;ifd[(i)]-&gt;count) {&nbsp; &nbsp; &nbsp;
          &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;\<br>
          -&nbsp; * \param[in] d pointer to buffer containing raw IFD data<br>
          -&nbsp; * \param[in] ds size of raw data in buffer at \c d<br>
          -&nbsp; * \param[in] offset offset into buffer at \c d at which IFD
          starts<br>
          -- * \param[in] recursion_depth number of times this function
          has been<br>
          -- * recursively called without returning<br>
          -&#43; * \param[in] recursion_cost factor indicating how expensive
          this recursive<br>
          -&#43; * call could be<br>
          -&nbsp; */<br>
          - static void<br>
          - exif_data_load_data_content (ExifData *data, ExifIfd ifd,<br>
          -&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; const unsigned char *d,<br>
          --&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;unsigned int ds, unsigned int
          offset, unsigned int recursion_depth)<br>
          -&#43;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;unsigned int ds, unsigned int
          offset, unsigned int recursion_cost)<br>
          - {<br>
          -&nbsp; &nbsp; &nbsp; &nbsp;ExifLong o, thumbnail_offset = 0, thumbnail_length =
          0;<br>
          -&nbsp; &nbsp; &nbsp; &nbsp;ExifShort n;<br>
          -@@ -372,9 &#43;387,20 @@ exif_data_load_data_content (ExifData
          *data, ExifIfd ifd,<br>
          -&nbsp; &nbsp; &nbsp; &nbsp;if ((((int)ifd) &lt; 0) || ( ((int)ifd) &gt;=
          EXIF_IFD_COUNT))<br>
          -&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;return;<br>
          - <br>
          --&nbsp; &nbsp; &nbsp; if (recursion_depth &gt; 30) {<br>
          -&#43;&nbsp; &nbsp; &nbsp; if (recursion_cost &gt; 170) {<br>
          -&#43;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; /*<br>
          -&#43;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;* recursion_cost is a logarithmic-scale
          indicator of how expensive this<br>
          -&#43;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;* recursive call might end up being. It is an
          indicator of the depth of<br>
          -&#43;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;* recursion as well as the potential for
          worst-case future recursive<br>
          -&#43;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;* calls. Since it's difficult to tell ahead
          of time how often recursion<br>
          -&#43;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;* will occur, this assumes the worst by
          assuming every tag could end up<br>
          -&#43;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;* causing recursion.<br>
          -&#43;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;* The value of 170 was chosen to limit
          typical EXIF structures to a<br>
          -&#43;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;* recursive depth of about 6, but
          pathological ones (those with very<br>
          -&#43;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;* many tags) to only 2.<br>
          -&#43;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;*/<br>
          -&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;exif_log (data-&gt;priv-&gt;log,
          EXIF_LOG_CODE_CORRUPT_DATA, &quot;ExifData&quot;,<br>
          --&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &quot;Deep recursion detected!&quot;);<br>
          -&#43;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &quot;Deep/expensive recursion
          detected!&quot;);<br>
          -&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;return;<br>
          -&nbsp; &nbsp; &nbsp; &nbsp;}<br>
          - <br>
          -@@ -416,15 &#43;442,18 @@ exif_data_load_data_content (ExifData
          *data, ExifIfd ifd,<br>
          -&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;switch (tag) {<br>
          -&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;case EXIF_TAG_EXIF_IFD_POINTER:<br>
          -&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;CHECK_REC (EXIF_IFD_EXIF);<br>
          --&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; exif_data_load_data_content
          (data, EXIF_IFD_EXIF, d, ds, o, recursion_depth &#43; 1);<br>
          -&#43;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; exif_data_load_data_content
          (data, EXIF_IFD_EXIF, d, ds, o,<br>
          -&#43;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; recursion_cost &#43;
          level_cost(n));<br>
          -&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;break;<br>
          -&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;case EXIF_TAG_GPS_INFO_IFD_POINTER:<br>
          -&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;CHECK_REC (EXIF_IFD_GPS);<br>
          --&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; exif_data_load_data_content
          (data, EXIF_IFD_GPS, d, ds, o, recursion_depth &#43; 1);<br>
          -&#43;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; exif_data_load_data_content
          (data, EXIF_IFD_GPS, d, ds, o,<br>
          -&#43;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; recursion_cost &#43;
          level_cost(n));<br>
          -&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;break;<br>
          -&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;case
          EXIF_TAG_INTEROPERABILITY_IFD_POINTER:<br>
          -&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;CHECK_REC
          (EXIF_IFD_INTEROPERABILITY);<br>
          --&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; exif_data_load_data_content
          (data, EXIF_IFD_INTEROPERABILITY, d, ds, o, recursion_depth &#43;
          1);<br>
          -&#43;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; exif_data_load_data_content
          (data, EXIF_IFD_INTEROPERABILITY, d, ds, o,<br>
          -&#43;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; recursion_cost &#43;
          level_cost(n));<br>
          -&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;break;<br>
          -&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;case EXIF_TAG_JPEG_INTERCHANGE_FORMAT:<br>
          -&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;thumbnail_offset = o;<br>
          diff --git a/meta/recipes-support/libexif/<a href="http://libexif_0.6.21.bb" rel="noreferrer" target="_blank" moz-do-not-send="true">libexif_0.6.21.bb</a>
          b/meta/recipes-support/libexif/<a href="http://libexif_0.6.21.bb" rel="noreferrer" target="_blank" moz-do-not-send="true">libexif_0.6.21.bb</a><br>
          deleted file mode 100644<br>
          index d847beab18..0000000000<br>
          --- a/meta/recipes-support/libexif/<a href="http://libexif_0.6.21.bb" rel="noreferrer" target="_blank" moz-do-not-send="true">libexif_0.6.21.bb</a><br>
          &#43;&#43;&#43; /dev/null<br>
          @@ -1,17 &#43;0,0 @@<br>
          -SUMMARY = &quot;Library for reading extended image information
          (EXIF) from JPEG files&quot;<br>
          -HOMEPAGE = &quot;<a href="http://sourceforge.net/projects/libexif" rel="noreferrer" target="_blank" moz-do-not-send="true">http://sourceforge.net/projects/libexif</a>&quot;<br>
          -SECTION = &quot;libs&quot;<br>
          -LICENSE = &quot;LGPLv2.1&quot;<br>
          -LIC_FILES_CHKSUM =
          <a class="moz-txt-link-rfc2396E" href="file://COPYING;md5=243b725d71bb5df4a1e5920b344b86ad">&quot;file://COPYING;md5=243b725d71bb5df4a1e5920b344b86ad&quot;</a><br>
          -<br>
          -SRC_URI =
          &quot;${SOURCEFORGE_MIRROR}/libexif/libexif-${PV}.tar.bz2 \<br>
          -&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<a class="moz-txt-link-freetext" href="file://CVE-2017-7544.patch">file://CVE-2017-7544.patch</a> \<br>
          -&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<a class="moz-txt-link-freetext" href="file://CVE-2016-6328.patch">file://CVE-2016-6328.patch</a> \<br>
          -&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<a class="moz-txt-link-freetext" href="file://CVE-2018-20030.patch">file://CVE-2018-20030.patch</a>&quot;<br>
          -<br>
          -SRC_URI[md5sum] = &quot;27339b89850f28c8f1c237f233e05b27&quot;<br>
          -SRC_URI[sha256sum] =
          &quot;16cdaeb62eb3e6dfab2435f7d7bccd2f37438d21c5218ec4e58efa9157d4d41a&quot;<br>
          -<br>
          -inherit autotools gettext<br>
          -<br>
          -EXTRA_OECONF &#43;= &quot;--disable-docs&quot;<br>
          diff --git a/meta/recipes-support/libexif/<a href="http://libexif_0.6.22.bb" rel="noreferrer" target="_blank" moz-do-not-send="true">libexif_0.6.22.bb</a>
          b/meta/recipes-support/libexif/<a href="http://libexif_0.6.22.bb" rel="noreferrer" target="_blank" moz-do-not-send="true">libexif_0.6.22.bb</a><br>
          new file mode 100644<br>
          index 0000000000..b24135db0f<br>
          --- /dev/null<br>
          &#43;&#43;&#43; b/meta/recipes-support/libexif/<a href="http://libexif_0.6.22.bb" rel="noreferrer" target="_blank" moz-do-not-send="true">libexif_0.6.22.bb</a><br>
          @@ -0,0 &#43;1,21 @@<br>
          &#43;SUMMARY = &quot;Library for reading extended image information
          (EXIF) from JPEG files&quot;<br>
          &#43;HOMEPAGE = &quot;<a href="http://sourceforge.net/projects/libexif" rel="noreferrer" target="_blank" moz-do-not-send="true">http://sourceforge.net/projects/libexif</a>&quot;<br>
          &#43;SECTION = &quot;libs&quot;<br>
          &#43;LICENSE = &quot;LGPLv2.1&quot;<br>
          &#43;LIC_FILES_CHKSUM =
          <a class="moz-txt-link-rfc2396E" href="file://COPYING;md5=243b725d71bb5df4a1e5920b344b86ad">&quot;file://COPYING;md5=243b725d71bb5df4a1e5920b344b86ad&quot;</a><br>
          &#43;<br>
          &#43;MAJOR_VERSION = &quot;0&quot;<br>
          &#43;MINOR_VERSION = &quot;6&quot;<br>
          &#43;PATCH_VERSION = &quot;22&quot;<br>
          &#43;<br>
          &#43;PV = &quot;${MAJOR_VERSION}.${MINOR_VERSION}.${PATCH_VERSION}&quot;<br>
          &#43;PATH_PV =
          &quot;${MAJOR_VERSION}_${MINOR_VERSION}_${PATCH_VERSION}&quot;<br>
          &#43;<br>
          &#43;SRC_URI = &quot;<a href="https://github.com/libexif/libexif/releases/download/libexif-$%7BPATH_PV%7D-release/libexif-$%7BPV%7D.tar.gz" rel="noreferrer" target="_blank" moz-do-not-send="true">https://github.com/libexif/libexif/releases/download/libexif-${PATH_PV}-release/libexif-${PV}.tar.gz</a>&quot;<br>
          &#43;<br>
          &#43;SRC_URI[md5sum] = &quot;dd67f593b046ad93d01437081329af02&quot;<br>
          &#43;SRC_URI[sha256sum] =
          &quot;75dc5c135c61b5e0b15f3911b4de4b3070dd1a1683b9fc08d9ce3518d54d758d&quot;<br>
          &#43;<br>
          &#43;inherit autotools gettext<br>
          &#43;<br>
          &#43;EXTRA_OECONF &#43;= &quot;--disable-docs&quot;<br>
          -- <br>
          2.26.2<br>
          <br>
          <br>
        </blockquote>
      </div>
    </blockquote>
  </body>
</html>

--------------5C6E814B41D6E7FC0D9592BA--
