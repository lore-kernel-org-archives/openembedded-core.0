Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01A50C36014
	for <webhook@archiver.kernel.org>; Thu,  3 Apr 2025 01:00:07 +0000 (UTC)
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
 by mx.groups.io with SMTP id smtpd.web10.2808.1743642002776052877
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Apr 2025 18:00:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=PudDqfDd;
 spf=pass (domain: gmail.com, ip: 209.85.210.177, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-736ad42dfd6so259732b3a.3
        for <openembedded-core@lists.openembedded.org>; Wed, 02 Apr 2025 18:00:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743642002; x=1744246802; darn=lists.openembedded.org;
        h=in-reply-to:from:content-language:references:to:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0JYOdQcWo4lnqoaYCggrQdwv1i6PucGYfTpGGtGB/64=;
        b=PudDqfDdcBOZmdzjEB3gJEZ6a4wXyr20hX9IKfwk7jFhAVI5ocb+SfCSKlMIBlIfmU
         C+8dCs66GSOXv4ZYkHNeFbozlsiCb6Xmg13LJvWwS/SXfuwzyX4/PJmNumB95/lXGiPN
         8nuVN87XJN5cbTmc8//DFw1KT96dk83hppurHd1rUgTKVB0fkDPNOYCQoo1ctWeiFrJ4
         kfjhF9XXOrDO/+beAo14a7sr0rINEOK2iRRatCRrUrCJDL6qzN3fUp5KrUrJpNQcBSI+
         ZQg7zee+AQqruXU6K+Yeip+a3hg8mCzhMgAgCUVMQWRrW5WRaTtW4OpGvNSMuqmsHp6L
         CjYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743642002; x=1744246802;
        h=in-reply-to:from:content-language:references:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=0JYOdQcWo4lnqoaYCggrQdwv1i6PucGYfTpGGtGB/64=;
        b=cPE62rw9r/svMS6UiwUkYIFPGmMVpMvQjTMTVEy8S7F5sFQN1OB0qWyTjk3Rl/Gg40
         EuATAm+rJOD0RPzzL+rRl2/j8iX17bl4EkAJ3LX2q9mbhGWKqUgDTIXBmqB2/nuMhjRK
         MBHQMg9V+7N4LbggoquFHPrGDfSJaaa0iggHR5UL2P4S5/kasSdJ/dDde4hHIfUV2pjl
         Zh25hwxSMCUhNG5fF4wVksqrAFNMtSOt6zCUWA72PoCDiIcIBpuS5J0J+zJo+OypM/7G
         QF+PalQo4pipjYJMVKkhl/dsJCXaVK2zJWSy8qBx4okJ5hf3I2SevziFH2645oQ5mF5T
         uTQg==
X-Forwarded-Encrypted: i=1; AJvYcCWhBA3q5R5PzizJSvcA24FRz6N4L9qzbkh/obVtfZIl/AIXH6huVYUdo2wu9J2Zzw3QlP+Gtib4qp5CENtfHDY48w==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwMR9llchSbOVDYpB9FT6zsBC7GEz82pIKERXcn+ZbJR/x4+vcu
	dHIpZmflo1HJUqeN0e5zD00+gF7GVJjDy8OxY80ikr5/EFnLsUSu0p+ytzjE
X-Gm-Gg: ASbGncs3rx3YB8Z2aGyAFAfC5pX8kFiPr/U6P7ZQrXndVY5h88Ik7/m7dLRfhctdypy
	3uKPw9dfzBrCF9QQmbTtgnyi9kPyyHWKeJaf7yCucysctwvJysGJvYQne174pTztbY6PrZLvtS4
	f8Q9ay8fZ9C2T9I2gKHM9XYKyoQ1skbYoH+VmsmQo9M66IjVqQ8XqfDABmtRUMJou2unhOfTb1h
	vG+zpb5WT5A8Rbwj5nU3VooI6fZOS/+6jRSORZaKgkd6ehckbsJE6x8wJSg2rQxZVBa6/5rDUSh
	AeNGIwbKXjd6V8/yd13B4ocuR0Bn6jt88mjeWem754f3Ip1TmlqcvLa6VH2KNRFpIUrR96Yxbvb
	dBBXpdyQgDY2dxb1UcxCiAs3Pk/6JhkE6Xre9oKasGGU2Xdh0
X-Google-Smtp-Source: AGHT+IHOUqWO/3bgvyv1kS+IApdFNymo2Ne5YyuX1ESZGF5cTs4F8XcJywZ0tNO2YZyN+IAd0+KCbA==
X-Received: by 2002:a05:6a00:391f:b0:736:47a5:e268 with SMTP id d2e1a72fcca58-739c78430c8mr5093606b3a.1.1743642001941;
        Wed, 02 Apr 2025 18:00:01 -0700 (PDT)
Received: from ?IPV6:2601:646:8201:fd20:259d:91dc:bf30:aea7? ([2601:646:8201:fd20:259d:91dc:bf30:aea7])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-739d97effe5sm190103b3a.61.2025.04.02.18.00.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Apr 2025 18:00:01 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------0ak9twVeSOB6HltTjpacaDdH"
Message-ID: <b8326eea-a748-42ad-922c-d0fcf961bc27@gmail.com>
Date: Wed, 2 Apr 2025 18:00:00 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH 05/48] btrfs-tools: upgrade 6.13 -> 6.14
To: richard.purdie@linuxfoundation.org,
 openembedded-core@lists.openembedded.org
References: <20250402071017.2157620-1-richard.purdie@linuxfoundation.org>
 <20250402071017.2157620-5-richard.purdie@linuxfoundation.org>
Content-Language: en-US
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <20250402071017.2157620-5-richard.purdie@linuxfoundation.org>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 03 Apr 2025 01:00:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214294

This is a multi-part message in MIME format.
--------------0ak9twVeSOB6HltTjpacaDdH
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 4/2/25 12:09 AM, Richard Purdie via lists.openembedded.org wrote:
> Add tag to SRC_URI to verify SRCREV.
>
> Drop patch merged upstream.
>
> Signed-off-by: Richard Purdie<richard.purdie@linuxfoundation.org>
> ---
>   ...y-to-specify-where-python-modules-ar.patch |  6 +--
>   ...dd-break-to-case-BTRFS_COMPRESS_NONE.patch | 40 -------------------
>   ...trfs-tools_6.13.bb => btrfs-tools_6.14.bb} |  5 +--
>   3 files changed, 5 insertions(+), 46 deletions(-)
>   delete mode 100644 meta/recipes-devtools/btrfs-tools/btrfs-tools/0001-mkfs-add-break-to-case-BTRFS_COMPRESS_NONE.patch
>   rename meta/recipes-devtools/btrfs-tools/{btrfs-tools_6.13.bb => btrfs-tools_6.14.bb} (95%)
>
> diff --git a/meta/recipes-devtools/btrfs-tools/btrfs-tools/0001-Add-a-possibility-to-specify-where-python-modules-ar.patch b/meta/recipes-devtools/btrfs-tools/btrfs-tools/0001-Add-a-possibility-to-specify-where-python-modules-ar.patch
> index 59ea5a66dac..2cd66d2722a 100644
> --- a/meta/recipes-devtools/btrfs-tools/btrfs-tools/0001-Add-a-possibility-to-specify-where-python-modules-ar.patch
> +++ b/meta/recipes-devtools/btrfs-tools/btrfs-tools/0001-Add-a-possibility-to-specify-where-python-modules-ar.patch
> @@ -1,4 +1,4 @@
> -From 76e635a56c5973671da3a8a2fd4fc32e823bf8c9 Mon Sep 17 00:00:00 2001
> +From 030ec81c0dac1e067faf49924d5631bb22ccc90d Mon Sep 17 00:00:00 2001
>   From: Alexander Kanavin<alex.kanavin@gmail.com>
>   Date: Wed, 23 May 2018 21:20:35 +0300
>   Subject: [PATCH] Add a possibility to specify where python modules are
> @@ -11,10 +11,10 @@ Signed-off-by: Alexander Kanavin<alex.kanavin@gmail.com>
>    1 file changed, 1 insertion(+), 1 deletion(-)
>   
>   diff --git a/Makefile b/Makefile
> -index 2f8d2fa0..c760e5ae 100644
> +index 7e36aa42..edff7d5b 100644
>   --- a/Makefile
>   +++ b/Makefile
> -@@ -985,7 +985,7 @@ endif
> +@@ -996,7 +996,7 @@ endif
>    ifeq ($(PYTHON_BINDINGS),1)
>    install_python: libbtrfsutil_python
>    	$(Q)cd libbtrfsutil/python; \
> diff --git a/meta/recipes-devtools/btrfs-tools/btrfs-tools/0001-mkfs-add-break-to-case-BTRFS_COMPRESS_NONE.patch b/meta/recipes-devtools/btrfs-tools/btrfs-tools/0001-mkfs-add-break-to-case-BTRFS_COMPRESS_NONE.patch
> deleted file mode 100644
> index 750ba830740..00000000000
> --- a/meta/recipes-devtools/btrfs-tools/btrfs-tools/0001-mkfs-add-break-to-case-BTRFS_COMPRESS_NONE.patch
> +++ /dev/null
> @@ -1,40 +0,0 @@
> -From ae0743dea3498429fce144e75c8b5b6eeed6f490 Mon Sep 17 00:00:00 2001
> -From: Wang Mingyu<wangmy@fujitsu.com>
> -Date: Tue, 11 Mar 2025 05:24:54 +0000
> -Subject: [PATCH] mkfs: add break to case BTRFS_COMPRESS_NONE
> -
> -when compression null, always through error "lzo support not compiled in"
> -
> -This bug was imported by following commit:
> -----------------------------------------------------
> -commit c6d24a363daed6501d13d9125c560387e2d755ca
> -Author: Mark Harmstone<maharmstone@fb.com>
> -Date:   Thu Dec 12 20:36:55 2024 +0000
> -
> -     btrfs-progs: mkfs: add lzo to --compress option
> -
> -     Allow --compress to work with lzo.
> -----------------------------------------------------
> -
> -Upstream-Status: Submitted [https://github.com/kdave/btrfs-progs/pull/967]
> -
> -Signed-off-by: Wang Mingyu<wangmy@fujitsu.com>
> ----
> - mkfs/rootdir.c | 1 +
> - 1 file changed, 1 insertion(+)
> -
> -diff --git a/mkfs/rootdir.c b/mkfs/rootdir.c
> -index 1927394..5f4cfb9 100644
> ---- a/mkfs/rootdir.c
> -+++ b/mkfs/rootdir.c
> -@@ -1654,6 +1654,7 @@ int btrfs_mkfs_fill_dir(struct btrfs_trans_handle *trans, const char *source_dir
> -
> - 	switch (compression) {
> - 	case BTRFS_COMPRESS_NONE:
> -+                break;
> - 	case BTRFS_COMPRESS_LZO:
> - #if !COMPRESSION_LZO
> - 		error("lzo support not compiled in");
> ---
> -2.43.0
> -
> diff --git a/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.13.bb b/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.14.bb
> similarity index 95%
> rename from meta/recipes-devtools/btrfs-tools/btrfs-tools_6.13.bb
> rename to meta/recipes-devtools/btrfs-tools/btrfs-tools_6.14.bb
> index d73d86ba8ae..cee1fdfd556 100644
> --- a/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.13.bb
> +++ b/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.14.bb
> @@ -15,11 +15,10 @@ LIC_FILES_CHKSUM = " \
>   SECTION = "base"
>   DEPENDS = "util-linux zlib"
>   
> -SRC_URI = "git://github.com/kdave/btrfs-progs.git;branch=master;protocol=https \
> +SRC_URI = "git://github.com/kdave/btrfs-progs.git;branch=master;protocol=https;tar=v${PV} \

what does tar= option do ? is it intentional here ?

>              file://0001-Add-a-possibility-to-specify-where-python-modules-ar.patch \
> -file://0001-mkfs-add-break-to-case-BTRFS_COMPRESS_NONE.patch \
>              "
> -SRCREV = "26e4d9174c70aac0e53c3b5de55cf159f8d9397f"
> +SRCREV = "5ad147c9ec00e657393c85b195c9bcc0f4c35a54"
>   S = "${WORKDIR}/git"
>   
>   PACKAGECONFIG ??= " \
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#214178):https://lists.openembedded.org/g/openembedded-core/message/214178
> Mute This Topic:https://lists.openembedded.org/mt/112042561/1997914
> Group Owner:openembedded-core+owner@lists.openembedded.org
> Unsubscribe:https://lists.openembedded.org/g/openembedded-core/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
-- 
-Khem

--------------0ak9twVeSOB6HltTjpacaDdH
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 4/2/25 12:09 AM, Richard Purdie via
      lists.openembedded.org wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:20250402071017.2157620-5-richard.purdie@linuxfoundation.org">
      <pre wrap="" class="moz-quote-pre">Add tag to SRC_URI to verify SRCREV.

Drop patch merged upstream.

Signed-off-by: Richard Purdie <a class="moz-txt-link-rfc2396E" href="mailto:richard.purdie@linuxfoundation.org">&lt;richard.purdie@linuxfoundation.org&gt;</a>
---
 ...y-to-specify-where-python-modules-ar.patch |  6 +--
 ...dd-break-to-case-BTRFS_COMPRESS_NONE.patch | 40 -------------------
 ...trfs-tools_6.13.bb =&gt; btrfs-tools_6.14.bb} |  5 +--
 3 files changed, 5 insertions(+), 46 deletions(-)
 delete mode 100644 meta/recipes-devtools/btrfs-tools/btrfs-tools/0001-mkfs-add-break-to-case-BTRFS_COMPRESS_NONE.patch
 rename meta/recipes-devtools/btrfs-tools/{btrfs-tools_6.13.bb =&gt; btrfs-tools_6.14.bb} (95%)

diff --git a/meta/recipes-devtools/btrfs-tools/btrfs-tools/0001-Add-a-possibility-to-specify-where-python-modules-ar.patch b/meta/recipes-devtools/btrfs-tools/btrfs-tools/0001-Add-a-possibility-to-specify-where-python-modules-ar.patch
index 59ea5a66dac..2cd66d2722a 100644
--- a/meta/recipes-devtools/btrfs-tools/btrfs-tools/0001-Add-a-possibility-to-specify-where-python-modules-ar.patch
+++ b/meta/recipes-devtools/btrfs-tools/btrfs-tools/0001-Add-a-possibility-to-specify-where-python-modules-ar.patch
@@ -1,4 +1,4 @@
-From 76e635a56c5973671da3a8a2fd4fc32e823bf8c9 Mon Sep 17 00:00:00 2001
+From 030ec81c0dac1e067faf49924d5631bb22ccc90d Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <a class="moz-txt-link-rfc2396E" href="mailto:alex.kanavin@gmail.com">&lt;alex.kanavin@gmail.com&gt;</a>
 Date: Wed, 23 May 2018 21:20:35 +0300
 Subject: [PATCH] Add a possibility to specify where python modules are
@@ -11,10 +11,10 @@ Signed-off-by: Alexander Kanavin <a class="moz-txt-link-rfc2396E" href="mailto:alex.kanavin@gmail.com">&lt;alex.kanavin@gmail.com&gt;</a>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/Makefile b/Makefile
-index 2f8d2fa0..c760e5ae 100644
+index 7e36aa42..edff7d5b 100644
 --- a/Makefile
 +++ b/Makefile
-@@ -985,7 +985,7 @@ endif
+@@ -996,7 +996,7 @@ endif
  ifeq ($(PYTHON_BINDINGS),1)
  install_python: libbtrfsutil_python
  	$(Q)cd libbtrfsutil/python; \
diff --git a/meta/recipes-devtools/btrfs-tools/btrfs-tools/0001-mkfs-add-break-to-case-BTRFS_COMPRESS_NONE.patch b/meta/recipes-devtools/btrfs-tools/btrfs-tools/0001-mkfs-add-break-to-case-BTRFS_COMPRESS_NONE.patch
deleted file mode 100644
index 750ba830740..00000000000
--- a/meta/recipes-devtools/btrfs-tools/btrfs-tools/0001-mkfs-add-break-to-case-BTRFS_COMPRESS_NONE.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-From ae0743dea3498429fce144e75c8b5b6eeed6f490 Mon Sep 17 00:00:00 2001
-From: Wang Mingyu <a class="moz-txt-link-rfc2396E" href="mailto:wangmy@fujitsu.com">&lt;wangmy@fujitsu.com&gt;</a>
-Date: Tue, 11 Mar 2025 05:24:54 +0000
-Subject: [PATCH] mkfs: add break to case BTRFS_COMPRESS_NONE
-
-when compression null, always through error "lzo support not compiled in"
-
-This bug was imported by following commit:
-----------------------------------------------------
-commit c6d24a363daed6501d13d9125c560387e2d755ca
-Author: Mark Harmstone <a class="moz-txt-link-rfc2396E" href="mailto:maharmstone@fb.com">&lt;maharmstone@fb.com&gt;</a>
-Date:   Thu Dec 12 20:36:55 2024 +0000
-
-     btrfs-progs: mkfs: add lzo to --compress option
-
-     Allow --compress to work with lzo.
-----------------------------------------------------
-
-Upstream-Status: Submitted [<a class="moz-txt-link-freetext" href="https://github.com/kdave/btrfs-progs/pull/967">https://github.com/kdave/btrfs-progs/pull/967</a>]
-
-Signed-off-by: Wang Mingyu <a class="moz-txt-link-rfc2396E" href="mailto:wangmy@fujitsu.com">&lt;wangmy@fujitsu.com&gt;</a>
----
- mkfs/rootdir.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/mkfs/rootdir.c b/mkfs/rootdir.c
-index 1927394..5f4cfb9 100644
---- a/mkfs/rootdir.c
-+++ b/mkfs/rootdir.c
-@@ -1654,6 +1654,7 @@ int btrfs_mkfs_fill_dir(struct btrfs_trans_handle *trans, const char *source_dir
- 
- 	switch (compression) {
- 	case BTRFS_COMPRESS_NONE:
-+                break;
- 	case BTRFS_COMPRESS_LZO:
- #if !COMPRESSION_LZO
- 		error("lzo support not compiled in");
--- 
-2.43.0
-
diff --git a/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.13.bb b/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.14.bb
similarity index 95%
rename from meta/recipes-devtools/btrfs-tools/btrfs-tools_6.13.bb
rename to meta/recipes-devtools/btrfs-tools/btrfs-tools_6.14.bb
index d73d86ba8ae..cee1fdfd556 100644
--- a/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.13.bb
+++ b/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.14.bb
@@ -15,11 +15,10 @@ LIC_FILES_CHKSUM = " \
 SECTION = "base"
 DEPENDS = "util-linux zlib"
 
-SRC_URI = "git://github.com/kdave/btrfs-progs.git;branch=master;protocol=https \
+SRC_URI = "git://github.com/kdave/btrfs-progs.git;branch=master;protocol=https;tar=v${PV} \</pre>
    </blockquote>
    <p>what does tar= option do ? is it intentional here ?<br>
    </p>
    <blockquote type="cite"
cite="mid:20250402071017.2157620-5-richard.purdie@linuxfoundation.org">
      <pre wrap="" class="moz-quote-pre">
            <a class="moz-txt-link-freetext" href="file://0001-Add-a-possibility-to-specify-where-python-modules-ar.patch">file://0001-Add-a-possibility-to-specify-where-python-modules-ar.patch</a> \
-           <a class="moz-txt-link-freetext" href="file://0001-mkfs-add-break-to-case-BTRFS_COMPRESS_NONE.patch">file://0001-mkfs-add-break-to-case-BTRFS_COMPRESS_NONE.patch</a> \
            "
-SRCREV = "26e4d9174c70aac0e53c3b5de55cf159f8d9397f"
+SRCREV = "5ad147c9ec00e657393c85b195c9bcc0f4c35a54"
 S = "${WORKDIR}/git"
 
 PACKAGECONFIG ??= " \
</pre>
      <br>
      <fieldset class="moz-mime-attachment-header"></fieldset>
      <pre wrap="" class="moz-quote-pre">
-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#214178): <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-core/message/214178">https://lists.openembedded.org/g/openembedded-core/message/214178</a>
Mute This Topic: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/mt/112042561/1997914">https://lists.openembedded.org/mt/112042561/1997914</a>
Group Owner: <a class="moz-txt-link-abbreviated" href="mailto:openembedded-core+owner@lists.openembedded.org">openembedded-core+owner@lists.openembedded.org</a>
Unsubscribe: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-core/unsub">https://lists.openembedded.org/g/openembedded-core/unsub</a> [<a class="moz-txt-link-abbreviated" href="mailto:raj.khem@gmail.com">raj.khem@gmail.com</a>]
-=-=-=-=-=-=-=-=-=-=-=-

</pre>
    </blockquote>
    <pre class="moz-signature" cols="72">-- 
-Khem</pre>
  </body>
</html>

--------------0ak9twVeSOB6HltTjpacaDdH--

