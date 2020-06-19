Received: from NAM11-BN8-obe.outbound.protection.outlook.com (NAM11-BN8-obe.outbound.protection.outlook.com [40.107.236.75])
 by mx.groups.io with SMTP id smtpd.web12.2274.1592533131362798318
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Jun 2020 19:18:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=O9a7imYc;
 spf=pass (domain: windriver.com, ip: 40.107.236.75, mailfrom: haitao.liu@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mvZ8mtgUzyhz+zblQtx1zJ1Dcf2XLHwLyCe9Gw5nV1YZAJ8x/reyFVpinb7ab0rH6yaxgSkoqhVMfkI82e7OS3lsidlfbAUdcDyrKSY3ClpmtnfJ4j4cQExmceKyBLoqAkaDvBXr/IUsfHLEmTWRSMimwmph2AvuyLM5uMRzU22DjlnSUfjXIoftA+beDyX1GOuMZOhoX+kwYjm6XjE2ijxZZo8cC4xHrrsXzOqXjG6dc/3wGj8Zcrc3MD9oFZ1km9Ts3gtk8Ag/1Gd4vxK/P4sIShTt5IoNnjV2moSKUtcaUL8K4OlamwG7aVmOWjp7mj9J0BfE3e64X0nYyO731A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vT0OCyu6ZDLr7PFGF96BvZcmUbLxuft015Vmf0cB1rY=;
 b=SKNr4nV8lL4z19i4uBkcDdbne5O0SIeVvJwX1MX2QT0zRiV7lBgpcLUs1c41WptVHZkj9lMqAXhaG822QV67GdnNuThlEhrv84C1XC+Vhrl8NSrQdFd+nZpR7Vucj7Wv36yQ9QwzWczVlUzy4s6fKBkzoNeEpZmvEuO//j5TnyU27tVtEH7rHnIqw5TBD357frYqYXmnnxpHK/Q0Vh7hKEL7WC6KNmVrT6K2wFN0mdTWrkeKMO55qXwdeeUYC1vNPssWbu+SmSrNSBv7iJjIDMibOGW6BkA4QuzRYJPf7Z3b9Qy2Qo8YSGQvkNi1/o++0r5QMORuWzKnAcwrAA/+cA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vT0OCyu6ZDLr7PFGF96BvZcmUbLxuft015Vmf0cB1rY=;
 b=O9a7imYcRUp5aUwDutFnzsC/pA9TUk802jloKwjX8f9ukw/em/0G75KfAoLx2NtaRhfFZRPRlZFGms4Obzkwg0tvnKvpo8EmbBmoOV4BSh4926LOcDlVHx+RV7t9ZK5WHJPAxJHxdla3+y/ersipo+OE4OKOmDB+qTvv/mq9qXM=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from DM6PR11MB3945.namprd11.prod.outlook.com (2603:10b6:5:192::19)
 by DM6PR11MB3834.namprd11.prod.outlook.com (2603:10b6:5:137::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.22; Fri, 19 Jun
 2020 02:18:49 +0000
Received: from DM6PR11MB3945.namprd11.prod.outlook.com
 ([fe80::48c9:b85c:1360:1f71]) by DM6PR11MB3945.namprd11.prod.outlook.com
 ([fe80::48c9:b85c:1360:1f71%2]) with mapi id 15.20.3109.021; Fri, 19 Jun 2020
 02:18:49 +0000
Subject: Re: [OE-core][master][PATCH] libjpeg-turbo: Fix CVE-2020-13790
To: akuster808 <akuster808@gmail.com>,
 openembedded-core@lists.openembedded.org
References: <1592469081-109960-1-git-send-email-haitao.liu@windriver.com>
 <ec710973-8b2e-9c19-4d02-1c44d09797b7@gmail.com>
From: "jason.lau" <Haitao.Liu@windriver.com>
Message-ID: <839fcc1f-549a-3295-8b3b-a72ff1bd67fe@windriver.com>
Date: Fri, 19 Jun 2020 10:18:42 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
In-Reply-To: <ec710973-8b2e-9c19-4d02-1c44d09797b7@gmail.com>
X-ClientProxiedBy: HK2PR06CA0017.apcprd06.prod.outlook.com
 (2603:1096:202:2e::29) To DM6PR11MB3945.namprd11.prod.outlook.com
 (2603:10b6:5:192::19)
Return-Path: Haitao.Liu@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [128.224.162.227] (60.247.85.82) by HK2PR06CA0017.apcprd06.prod.outlook.com (2603:1096:202:2e::29) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.21 via Frontend Transport; Fri, 19 Jun 2020 02:18:48 +0000
X-Originating-IP: [60.247.85.82]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4747675a-255f-4835-0e93-08d813f71a26
X-MS-TrafficTypeDiagnostic: DM6PR11MB3834:
X-Microsoft-Antispam-PRVS: 
	<DM6PR11MB3834998FBEB9AE8CB2FD2AFC9F980@DM6PR11MB3834.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-Forefront-PRVS: 0439571D1D
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	+bfxpMBvgxDFq0DC1ir9pZE7o/3ULTGverjyEX+CE3EIpNEQLzRnqQJbj1urUt/eis91+Vk0e30HIEYjwTw6bDUvN2P69Jmv4sgWlW7ZXKP5La6Q/SWACybylQkJdTquTANx/pFmlA7fPvAgzCMsHvHYEP8Q4aiA+3XiX+VGbMykLbYF0Qigyb/0FTCNxiGei4Kqr8Vz8vuQGLPk7lBDaNYnCyKdufjmFAUfRFS15djiayL3Pt4rM3eRcpPhMu8tevY8TUraJ6V2/AqXNM58PqWv351nFCIo3L01qZBuVWxGanXnctyloHLDRDYmPz4M+qplvoMWTtq2HvDzTX5G0ApCZMbV/dWkUDpCkcLvNkRiJTs44iCvcB8QnhQDavKYTGHQN1gQAU6l3iuMXKvTP76wJw7tMIoJvnXa+qf4F3xvvBinABwQH6Fm7KTiUb8utpbATnJcXPE7FXM9XcCFHiL38YH1k6+/NNnwT61qC0Mza0t0iAExZhRWOY73UYvu+8Cp/+hUVELR3EY0S/ta3w==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB3945.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(39850400004)(366004)(396003)(136003)(376002)(346002)(6666004)(2616005)(6706004)(956004)(8676002)(52116002)(16576012)(86362001)(316002)(31686004)(8936002)(66556008)(166002)(83380400001)(16526019)(66476007)(186003)(36756003)(66946007)(6486002)(2906002)(966005)(30864003)(478600001)(5660300002)(53546011)(31696002)(26005)(33964004)(78286006)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	mITV/JEXPb/4u23SA4SIoZvMWElpFCtp7gh6LXj6QivP+aTwbvKUQixzgQ7xMfELHcqIZzjHSgH+fPsTwqZRNLfoLh7DhvBR9nY3gTtm3j7W7x/JK23xDN3DLOI5nyqubvagZzorGDN1ooLkuHxuflLzfGDTLXCsky945WyUlDubQV6TbfsYJMrQvR9A3kxRKStj4DytxyApJG3G7WgTsTP0LfSapN5h6+/LZIyUkwflPUFzgYy65ml2y1A3k5r7KD77Nvlw4EZOmGk7wnI16j9kBJQuaqAIBdoVUoo17IATYDJ7cF5sKIirW41XH6j3PXZwPw6Ip8hm2pzoEBzpmbF6pJ4h+d5f2pKeLxz/nobs9dROfrQjKEH9mkge3mcg/xkjuQnDcwoaV3E5LWWq8P97WxkadahcYKbvzqcmOcsussmuHn5JdSTUZY4iBFd4it9Y48hZThR+FBSA25dZ9JKRdnQyHstFhsX09y9ARoc=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4747675a-255f-4835-0e93-08d813f71a26
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2020 02:18:49.1855
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nud3jw7+ZnU9Okd6t6y5UNfk8QOd5Wj51ZX9TysxceyMl53bE3vb/n7XeUuggYn7U8vOgDHuqH8NBRKsRrlI/8/h2oNQZbRcyinEFJxzhoc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB3834
Content-Type: multipart/alternative;
 boundary="------------D4738AFC49CC24A02932DDD9"
Content-Language: en-US

--------------D4738AFC49CC24A02932DDD9
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 6/18/20 11:17 PM, akuster808 wrote:
>
>
> On 6/18/20 1:31 AM, jason.lau wrote:
>> libjpeg-turbo 2.0.4 has a heap-based buffer over-read
>> in get_rgb_row() in rdppm.c via a malformed PPM input file.
>>
>> CVE: CVE-2020-13790
>
> What about dunfell?
>
> -armin

Thanks for reminding, the patch is suitable for dunfell, for the 
libjpeg-turbo is 2.0.4 too.


>> Upstream-Status: Backport
>> [https://github.com/libjpeg-turbo/libjpeg-turbo/commit/3de15e0c344d11d4b90f4a47136467053eb2d09a]
>>
>> Signed-off-by: Liu Haitao<haitao.liu@windriver.com>
>> ---
>>   ...buf-overrun-caused-by-bad-binary-PPM.patch | 81 +++++++++++++++++++
>>   .../jpeg/libjpeg-turbo_2.0.4.bb               |  1 +
>>   2 files changed, 82 insertions(+)
>>   create mode 100644 meta/recipes-graphics/jpeg/files/0001-rdppm.c-Fix-buf-overrun-caused-by-bad-binary-PPM.patch
>>
>> diff --git a/meta/recipes-graphics/jpeg/files/0001-rdppm.c-Fix-buf-overrun-caused-by-bad-binary-PPM.patch b/meta/recipes-graphics/jpeg/files/0001-rdppm.c-Fix-buf-overrun-caused-by-bad-binary-PPM.patch
>> new file mode 100644
>> index 0000000000..518df2d28e
>> --- /dev/null
>> +++ b/meta/recipes-graphics/jpeg/files/0001-rdppm.c-Fix-buf-overrun-caused-by-bad-binary-PPM.patch
>> @@ -0,0 +1,81 @@
>> +From ae2fc496c622bdf0c409b93006bbb69d2cabd41f Mon Sep 17 00:00:00 2001
>> +From: DRC<information@libjpeg-turbo.org>
>> +Date: Tue, 2 Jun 2020 14:15:37 -0500
>> +Subject: [PATCH] rdppm.c: Fix buf overrun caused by bad binary PPM
>> +
>> +This extends the fix in 1e81b0c3ea26f4ea8f56de05367469333de64a9f to
>> +include binary PPM files with maximum values < 255, thus preventing a
>> +malformed binary PPM input file with those specifications from
>> +triggering an overrun of the rescale array and potentially crashing
>> +cjpeg, TJBench, or any program that uses the tjLoadImage() function.
>> +
>> +Fixes #433
>> +
>> +CVE: CVE-2020-13790
>> +
>> +Signed-off-by: Liu Haitao<haitao.liu@windriver.com>
>> +---
>> + ChangeLog.md | 20 ++++++++++++++++----
>> + rdppm.c      |  4 ++--
>> + 2 files changed, 18 insertions(+), 6 deletions(-)
>> +
>> +diff --git a/ChangeLog.md b/ChangeLog.md
>> +index 4d1219e..250bcaa 100644
>> +--- a/ChangeLog.md
>> ++++ b/ChangeLog.md
>> +@@ -1,3 +1,15 @@
>> ++2.0.5
>> ++=====
>> ++
>> ++### Significant changes relative to 2.0.4:
>> ++
>> ++1. Fixed an issue in the PPM reader that caused a buffer overrun in cjpeg,
>> ++TJBench, or the `tjLoadImage()` function if one of the values in a binary
>> ++PPM/PGM input file exceeded the maximum value defined in the file's header and
>> ++that maximum value was less than 255.  libjpeg-turbo 1.5.0 already included a
>> ++similar fix for binary PPM/PGM files with maximum values greater than 255.
>> ++
>> ++
>> + 2.0.4
>> + =====
>> +
>> +@@ -562,10 +574,10 @@ application was linked against.
>> +
>> + 3. Fixed a couple of issues in the PPM reader that would cause buffer overruns
>> + in cjpeg if one of the values in a binary PPM/PGM input file exceeded the
>> +-maximum value defined in the file's header.  libjpeg-turbo 1.4.2 already
>> +-included a similar fix for ASCII PPM/PGM files.  Note that these issues were
>> +-not security bugs, since they were confined to the cjpeg program and did not
>> +-affect any of the libjpeg-turbo libraries.
>> ++maximum value defined in the file's header and that maximum value was greater
>> ++than 255.  libjpeg-turbo 1.4.2 already included a similar fix for ASCII PPM/PGM
>> ++files.  Note that these issues were not security bugs, since they were confined
>> ++to the cjpeg program and did not affect any of the libjpeg-turbo libraries.
>> +
>> + 4. Fixed an issue whereby attempting to decompress a JPEG file with a corrupt
>> + header using the `tjDecompressToYUV2()` function would cause the function to
>> +diff --git a/rdppm.c b/rdppm.c
>> +index 87bc330..a8507b9 100644
>> +--- a/rdppm.c
>> ++++ b/rdppm.c
>> +@@ -5,7 +5,7 @@
>> +  * Copyright (C) 1991-1997, Thomas G. Lane.
>> +  * Modified 2009 by Bill Allombert, Guido Vollbeding.
>> +  * libjpeg-turbo Modifications:
>> +- * Copyright (C) 2015-2017, D. R. Commander.
>> ++ * Copyright (C) 2015-2017, 2020, D. R. Commander.
>> +  * For conditions of distribution and use, see the accompanying README.ijg
>> +  * file.
>> +  *
>> +@@ -720,7 +720,7 @@ start_input_ppm(j_compress_ptr cinfo, cjpeg_source_ptr sinfo)
>> +     /* On 16-bit-int machines we have to be careful of maxval = 65535 */
>> +     source->rescale = (JSAMPLE *)
>> +       (*cinfo->mem->alloc_small) ((j_common_ptr)cinfo, JPOOL_IMAGE,
>> +-                                  (size_t)(((long)maxval + 1L) *
>> ++                                  (size_t)(((long)MAX(maxval, 255) + 1L) *
>> +                                            sizeof(JSAMPLE)));
>> +     half_maxval = maxval / 2;
>> +     for (val = 0; val <= (long)maxval; val++) {
>> +--
>> +2.17.0
>> +
>> diff --git a/meta/recipes-graphics/jpeg/libjpeg-turbo_2.0.4.bb b/meta/recipes-graphics/jpeg/libjpeg-turbo_2.0.4.bb
>> index 1f49fd3d3b..e210635c4f 100644
>> --- a/meta/recipes-graphics/jpeg/libjpeg-turbo_2.0.4.bb
>> +++ b/meta/recipes-graphics/jpeg/libjpeg-turbo_2.0.4.bb
>> @@ -12,6 +12,7 @@ DEPENDS_append_x86_class-target    = " nasm-native"
>>   
>>   SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BPN}-${PV}.tar.gz \
>>              file://0001-libjpeg-turbo-fix-package_qa-error.patch  \
>> +file://0001-rdppm.c-Fix-buf-overrun-caused-by-bad-binary-PPM.patch  \
>>              "
>>   
>>   SRC_URI[md5sum] = "d01d9e0c28c27bc0de9f4e2e8ff49855"
>>
>> 
>

--------------D4738AFC49CC24A02932DDD9
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 6/18/20 11:17 PM, akuster808 wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:ec710973-8b2e-9c19-4d02-1c44d09797b7@gmail.com">
      
      <br>
      <br>
      <div class="moz-cite-prefix">On 6/18/20 1:31 AM, jason.lau wrote:<br>
      </div>
      <blockquote type="cite" cite="mid:1592469081-109960-1-git-send-email-haitao.liu@windriver.com">
        <pre class="moz-quote-pre" wrap="">libjpeg-turbo 2.0.4 has a heap-based buffer over-read
in get_rgb_row() in rdppm.c via a malformed PPM input file.

CVE: CVE-2020-13790</pre>
      </blockquote>
      <br>
      What about dunfell?<br>
      <br>
      -armin<br>
    </blockquote>
    <br>
    <p>Thanks for reminding, the patch is suitable for dunfell, for the
      libjpeg-turbo is 2.0.4 too. <br>
    </p>
    <p><br>
    </p>
    <blockquote type="cite" cite="mid:ec710973-8b2e-9c19-4d02-1c44d09797b7@gmail.com">
      <blockquote type="cite" cite="mid:1592469081-109960-1-git-send-email-haitao.liu@windriver.com">
        <pre class="moz-quote-pre" wrap="">Upstream-Status: Backport
[<a class="moz-txt-link-freetext" href="https://github.com/libjpeg-turbo/libjpeg-turbo/commit/3de15e0c344d11d4b90f4a47136467053eb2d09a" moz-do-not-send="true">https://github.com/libjpeg-turbo/libjpeg-turbo/commit/3de15e0c344d11d4b90f4a47136467053eb2d09a</a>]

Signed-off-by: Liu Haitao <a class="moz-txt-link-rfc2396E" href="mailto:haitao.liu@windriver.com" moz-do-not-send="true">&lt;haitao.liu@windriver.com&gt;</a>
---
 ...buf-overrun-caused-by-bad-binary-PPM.patch | 81 &#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;
 .../jpeg/libjpeg-turbo_2.0.4.bb               |  1 &#43;
 2 files changed, 82 insertions(&#43;)
 create mode 100644 meta/recipes-graphics/jpeg/files/0001-rdppm.c-Fix-buf-overrun-caused-by-bad-binary-PPM.patch

diff --git a/meta/recipes-graphics/jpeg/files/0001-rdppm.c-Fix-buf-overrun-caused-by-bad-binary-PPM.patch b/meta/recipes-graphics/jpeg/files/0001-rdppm.c-Fix-buf-overrun-caused-by-bad-binary-PPM.patch
new file mode 100644
index 0000000000..518df2d28e
--- /dev/null
&#43;&#43;&#43; b/meta/recipes-graphics/jpeg/files/0001-rdppm.c-Fix-buf-overrun-caused-by-bad-binary-PPM.patch
@@ -0,0 &#43;1,81 @@
&#43;From ae2fc496c622bdf0c409b93006bbb69d2cabd41f Mon Sep 17 00:00:00 2001
&#43;From: DRC <a class="moz-txt-link-rfc2396E" href="mailto:information@libjpeg-turbo.org" moz-do-not-send="true">&lt;information@libjpeg-turbo.org&gt;</a>
&#43;Date: Tue, 2 Jun 2020 14:15:37 -0500
&#43;Subject: [PATCH] rdppm.c: Fix buf overrun caused by bad binary PPM
&#43;
&#43;This extends the fix in 1e81b0c3ea26f4ea8f56de05367469333de64a9f to
&#43;include binary PPM files with maximum values &lt; 255, thus preventing a
&#43;malformed binary PPM input file with those specifications from
&#43;triggering an overrun of the rescale array and potentially crashing
&#43;cjpeg, TJBench, or any program that uses the tjLoadImage() function.
&#43;
&#43;Fixes #433
&#43;
&#43;CVE: CVE-2020-13790
&#43;
&#43;Signed-off-by: Liu Haitao <a class="moz-txt-link-rfc2396E" href="mailto:haitao.liu@windriver.com" moz-do-not-send="true">&lt;haitao.liu@windriver.com&gt;</a>
&#43;---
&#43; ChangeLog.md | 20 &#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;----
&#43; rdppm.c      |  4 &#43;&#43;--
&#43; 2 files changed, 18 insertions(&#43;), 6 deletions(-)
&#43;
&#43;diff --git a/ChangeLog.md b/ChangeLog.md
&#43;index 4d1219e..250bcaa 100644
&#43;--- a/ChangeLog.md
&#43;&#43;&#43;&#43; b/ChangeLog.md
&#43;@@ -1,3 &#43;1,15 @@
&#43;&#43;2.0.5
&#43;&#43;=====
&#43;&#43;
&#43;&#43;### Significant changes relative to 2.0.4:
&#43;&#43;
&#43;&#43;1. Fixed an issue in the PPM reader that caused a buffer overrun in cjpeg,
&#43;&#43;TJBench, or the `tjLoadImage()` function if one of the values in a binary
&#43;&#43;PPM/PGM input file exceeded the maximum value defined in the file's header and
&#43;&#43;that maximum value was less than 255.  libjpeg-turbo 1.5.0 already included a
&#43;&#43;similar fix for binary PPM/PGM files with maximum values greater than 255.
&#43;&#43;
&#43;&#43;
&#43; 2.0.4
&#43; =====
&#43; 
&#43;@@ -562,10 &#43;574,10 @@ application was linked against.
&#43; 
&#43; 3. Fixed a couple of issues in the PPM reader that would cause buffer overruns
&#43; in cjpeg if one of the values in a binary PPM/PGM input file exceeded the
&#43;-maximum value defined in the file's header.  libjpeg-turbo 1.4.2 already
&#43;-included a similar fix for ASCII PPM/PGM files.  Note that these issues were
&#43;-not security bugs, since they were confined to the cjpeg program and did not
&#43;-affect any of the libjpeg-turbo libraries.
&#43;&#43;maximum value defined in the file's header and that maximum value was greater
&#43;&#43;than 255.  libjpeg-turbo 1.4.2 already included a similar fix for ASCII PPM/PGM
&#43;&#43;files.  Note that these issues were not security bugs, since they were confined
&#43;&#43;to the cjpeg program and did not affect any of the libjpeg-turbo libraries.
&#43; 
&#43; 4. Fixed an issue whereby attempting to decompress a JPEG file with a corrupt
&#43; header using the `tjDecompressToYUV2()` function would cause the function to
&#43;diff --git a/rdppm.c b/rdppm.c
&#43;index 87bc330..a8507b9 100644
&#43;--- a/rdppm.c
&#43;&#43;&#43;&#43; b/rdppm.c
&#43;@@ -5,7 &#43;5,7 @@
&#43;  * Copyright (C) 1991-1997, Thomas G. Lane.
&#43;  * Modified 2009 by Bill Allombert, Guido Vollbeding.
&#43;  * libjpeg-turbo Modifications:
&#43;- * Copyright (C) 2015-2017, D. R. Commander.
&#43;&#43; * Copyright (C) 2015-2017, 2020, D. R. Commander.
&#43;  * For conditions of distribution and use, see the accompanying README.ijg
&#43;  * file.
&#43;  *
&#43;@@ -720,7 &#43;720,7 @@ start_input_ppm(j_compress_ptr cinfo, cjpeg_source_ptr sinfo)
&#43;     /* On 16-bit-int machines we have to be careful of maxval = 65535 */
&#43;     source-&gt;rescale = (JSAMPLE *)
&#43;       (*cinfo-&gt;mem-&gt;alloc_small) ((j_common_ptr)cinfo, JPOOL_IMAGE,
&#43;-                                  (size_t)(((long)maxval &#43; 1L) *
&#43;&#43;                                  (size_t)(((long)MAX(maxval, 255) &#43; 1L) *
&#43;                                            sizeof(JSAMPLE)));
&#43;     half_maxval = maxval / 2;
&#43;     for (val = 0; val &lt;= (long)maxval; val&#43;&#43;) {
&#43;-- 
&#43;2.17.0
&#43;
diff --git a/meta/recipes-graphics/jpeg/libjpeg-turbo_2.0.4.bb b/meta/recipes-graphics/jpeg/libjpeg-turbo_2.0.4.bb
index 1f49fd3d3b..e210635c4f 100644
--- a/meta/recipes-graphics/jpeg/libjpeg-turbo_2.0.4.bb
&#43;&#43;&#43; b/meta/recipes-graphics/jpeg/libjpeg-turbo_2.0.4.bb
@@ -12,6 &#43;12,7 @@ DEPENDS_append_x86_class-target    = &quot; nasm-native&quot;
 
 SRC_URI = &quot;${SOURCEFORGE_MIRROR}/${BPN}/${BPN}-${PV}.tar.gz \
            <a class="moz-txt-link-freetext" href="file://0001-libjpeg-turbo-fix-package_qa-error.patch" moz-do-not-send="true">file://0001-libjpeg-turbo-fix-package_qa-error.patch</a> \
&#43;           <a class="moz-txt-link-freetext" href="file://0001-rdppm.c-Fix-buf-overrun-caused-by-bad-binary-PPM.patch" moz-do-not-send="true">file://0001-rdppm.c-Fix-buf-overrun-caused-by-bad-binary-PPM.patch</a> \
            &quot;
 
 SRC_URI[md5sum] = &quot;d01d9e0c28c27bc0de9f4e2e8ff49855&quot;
</pre>
        <br>
        <fieldset class="mimeAttachmentHeader"></fieldset>
        <pre class="moz-quote-pre" wrap="">
</pre>
      </blockquote>
      <br>
    </blockquote>
  </body>
</html>

--------------D4738AFC49CC24A02932DDD9--
