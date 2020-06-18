Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
 by mx.groups.io with SMTP id smtpd.web11.9897.1592493427348240237
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Jun 2020 08:17:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=qMESblxu;
 spf=pass (domain: gmail.com, ip: 209.85.216.44, mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f44.google.com with SMTP id u8so2678454pje.4
        for <openembedded-core@lists.openembedded.org>; Thu, 18 Jun 2020 08:17:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:autocrypt:message-id:date:user-agent
         :mime-version:in-reply-to:content-language;
        bh=kNMts1y2x4WTDEj4sQduHb+QReJEyeJqcAiKHWZUiSY=;
        b=qMESblxuW5uZlWRm8xfQeq/yIsgHvCNNe7U8ZmTgPV4qgxhCybeEDgCsN6kecAqU6a
         tluOI4vIcR6Odv4bRak+eHyrcRfpwn77HD9KwScKz0jgZXTUBt93CTCMg7iaJrQ1zlAN
         O6tnydaUo5SKMzK+V3PcoWmuSZEFtfEPRJ3Cpp75+hjdVzPLqg1/1EDlhRc7tyvIFfV/
         phH2/5zvUjxCkvSGUlsfvumhzdfm7n8ErpL8pv3WaXA944JZeY6AmoN83hfappok/ivi
         ORunKTROuugezm8Esc6KUdhxdOcX1M8C6o6hCQQVmt4lDeo6fsnJudv/vnqThf7EuDj8
         vX1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:autocrypt:message-id
         :date:user-agent:mime-version:in-reply-to:content-language;
        bh=kNMts1y2x4WTDEj4sQduHb+QReJEyeJqcAiKHWZUiSY=;
        b=X9Xtc7dN9uMQm1DrHAfJF6AAVIr72Pc3fr7VvNOEDGtxLjMfAF2woj7bXBqec3W0Bq
         2pC+rrXIClm0DTdXGZPTpx2GgqJVu0kThP68gJsVgZ/8UTn3jIjpx6NoBNaygt1jidqz
         f5sIolYL7CIYgY6c++l+X9/vO3G8BpuNUjbUiXjU+tR/o7tydvn8FWGvqLSS9AK0ofZp
         /+hpiUJawH6t+2Uwn6ct7subSGOABYnvt+pD26J8RjX2Y5QmKy2qeI1YMJfnTs+tOEIR
         Hsxy25+09ybmD5twre2Nwyn6u+RtLPOnRdAFtC+KOg1Vw38Ees6rjkgAwfi6OxCJG30C
         LWVA==
X-Gm-Message-State: AOAM531MNiFtQT0XzFxQ3IW4xLjpr+ij97qUv+81BoJAXAAGWayU4gJm
	lCcH/xGpe5tUJ6mmrwxDJf6kACA1
X-Google-Smtp-Source: ABdhPJwDg8pzum41UZ8h6B1Dv5Fhpv1HgIDhe3HabowAvxTf7mttEIGze5So55Uc0Nr3WMfPfp542w==
X-Received: by 2002:a17:90b:e8f:: with SMTP id fv15mr5023747pjb.47.1592493426572;
        Thu, 18 Jun 2020 08:17:06 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from ?IPv6:2601:202:4180:a5c0:88de:dadb:4f45:bd2e? ([2601:202:4180:a5c0:88de:dadb:4f45:bd2e])
        by smtp.gmail.com with ESMTPSA id 125sm3116186pff.130.2020.06.18.08.17.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Jun 2020 08:17:05 -0700 (PDT)
Subject: Re: [OE-core][master][PATCH] libjpeg-turbo: Fix CVE-2020-13790
To: "jason.lau" <Haitao.Liu@windriver.com>,
 openembedded-core@lists.openembedded.org
References: <1592469081-109960-1-git-send-email-haitao.liu@windriver.com>
From: "akuster" <akuster808@gmail.com>
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
 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
 8CS2NxU=
Message-ID: <ec710973-8b2e-9c19-4d02-1c44d09797b7@gmail.com>
Date: Thu, 18 Jun 2020 08:17:04 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <1592469081-109960-1-git-send-email-haitao.liu@windriver.com>
Content-Type: multipart/alternative;
 boundary="------------9DC137CF69694299ACFCA5F5"
Content-Language: en-US

--------------9DC137CF69694299ACFCA5F5
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit



On 6/18/20 1:31 AM, jason.lau wrote:
> libjpeg-turbo 2.0.4 has a heap-based buffer over-read
> in get_rgb_row() in rdppm.c via a malformed PPM input file.
>
> CVE: CVE-2020-13790

What about dunfell?

-armin
>
> Upstream-Status: Backport
> [https://github.com/libjpeg-turbo/libjpeg-turbo/commit/3de15e0c344d11d4b90f4a47136467053eb2d09a]
>
> Signed-off-by: Liu Haitao <haitao.liu@windriver.com>
> ---
>  ...buf-overrun-caused-by-bad-binary-PPM.patch | 81 +++++++++++++++++++
>  .../jpeg/libjpeg-turbo_2.0.4.bb               |  1 +
>  2 files changed, 82 insertions(+)
>  create mode 100644 meta/recipes-graphics/jpeg/files/0001-rdppm.c-Fix-buf-overrun-caused-by-bad-binary-PPM.patch
>
> diff --git a/meta/recipes-graphics/jpeg/files/0001-rdppm.c-Fix-buf-overrun-caused-by-bad-binary-PPM.patch b/meta/recipes-graphics/jpeg/files/0001-rdppm.c-Fix-buf-overrun-caused-by-bad-binary-PPM.patch
> new file mode 100644
> index 0000000000..518df2d28e
> --- /dev/null
> +++ b/meta/recipes-graphics/jpeg/files/0001-rdppm.c-Fix-buf-overrun-caused-by-bad-binary-PPM.patch
> @@ -0,0 +1,81 @@
> +From ae2fc496c622bdf0c409b93006bbb69d2cabd41f Mon Sep 17 00:00:00 2001
> +From: DRC <information@libjpeg-turbo.org>
> +Date: Tue, 2 Jun 2020 14:15:37 -0500
> +Subject: [PATCH] rdppm.c: Fix buf overrun caused by bad binary PPM
> +
> +This extends the fix in 1e81b0c3ea26f4ea8f56de05367469333de64a9f to
> +include binary PPM files with maximum values < 255, thus preventing a
> +malformed binary PPM input file with those specifications from
> +triggering an overrun of the rescale array and potentially crashing
> +cjpeg, TJBench, or any program that uses the tjLoadImage() function.
> +
> +Fixes #433
> +
> +CVE: CVE-2020-13790
> +
> +Signed-off-by: Liu Haitao <haitao.liu@windriver.com>
> +---
> + ChangeLog.md | 20 ++++++++++++++++----
> + rdppm.c      |  4 ++--
> + 2 files changed, 18 insertions(+), 6 deletions(-)
> +
> +diff --git a/ChangeLog.md b/ChangeLog.md
> +index 4d1219e..250bcaa 100644
> +--- a/ChangeLog.md
> ++++ b/ChangeLog.md
> +@@ -1,3 +1,15 @@
> ++2.0.5
> ++=====
> ++
> ++### Significant changes relative to 2.0.4:
> ++
> ++1. Fixed an issue in the PPM reader that caused a buffer overrun in cjpeg,
> ++TJBench, or the `tjLoadImage()` function if one of the values in a binary
> ++PPM/PGM input file exceeded the maximum value defined in the file's header and
> ++that maximum value was less than 255.  libjpeg-turbo 1.5.0 already included a
> ++similar fix for binary PPM/PGM files with maximum values greater than 255.
> ++
> ++
> + 2.0.4
> + =====
> + 
> +@@ -562,10 +574,10 @@ application was linked against.
> + 
> + 3. Fixed a couple of issues in the PPM reader that would cause buffer overruns
> + in cjpeg if one of the values in a binary PPM/PGM input file exceeded the
> +-maximum value defined in the file's header.  libjpeg-turbo 1.4.2 already
> +-included a similar fix for ASCII PPM/PGM files.  Note that these issues were
> +-not security bugs, since they were confined to the cjpeg program and did not
> +-affect any of the libjpeg-turbo libraries.
> ++maximum value defined in the file's header and that maximum value was greater
> ++than 255.  libjpeg-turbo 1.4.2 already included a similar fix for ASCII PPM/PGM
> ++files.  Note that these issues were not security bugs, since they were confined
> ++to the cjpeg program and did not affect any of the libjpeg-turbo libraries.
> + 
> + 4. Fixed an issue whereby attempting to decompress a JPEG file with a corrupt
> + header using the `tjDecompressToYUV2()` function would cause the function to
> +diff --git a/rdppm.c b/rdppm.c
> +index 87bc330..a8507b9 100644
> +--- a/rdppm.c
> ++++ b/rdppm.c
> +@@ -5,7 +5,7 @@
> +  * Copyright (C) 1991-1997, Thomas G. Lane.
> +  * Modified 2009 by Bill Allombert, Guido Vollbeding.
> +  * libjpeg-turbo Modifications:
> +- * Copyright (C) 2015-2017, D. R. Commander.
> ++ * Copyright (C) 2015-2017, 2020, D. R. Commander.
> +  * For conditions of distribution and use, see the accompanying README.ijg
> +  * file.
> +  *
> +@@ -720,7 +720,7 @@ start_input_ppm(j_compress_ptr cinfo, cjpeg_source_ptr sinfo)
> +     /* On 16-bit-int machines we have to be careful of maxval = 65535 */
> +     source->rescale = (JSAMPLE *)
> +       (*cinfo->mem->alloc_small) ((j_common_ptr)cinfo, JPOOL_IMAGE,
> +-                                  (size_t)(((long)maxval + 1L) *
> ++                                  (size_t)(((long)MAX(maxval, 255) + 1L) *
> +                                            sizeof(JSAMPLE)));
> +     half_maxval = maxval / 2;
> +     for (val = 0; val <= (long)maxval; val++) {
> +-- 
> +2.17.0
> +
> diff --git a/meta/recipes-graphics/jpeg/libjpeg-turbo_2.0.4.bb b/meta/recipes-graphics/jpeg/libjpeg-turbo_2.0.4.bb
> index 1f49fd3d3b..e210635c4f 100644
> --- a/meta/recipes-graphics/jpeg/libjpeg-turbo_2.0.4.bb
> +++ b/meta/recipes-graphics/jpeg/libjpeg-turbo_2.0.4.bb
> @@ -12,6 +12,7 @@ DEPENDS_append_x86_class-target    = " nasm-native"
>  
>  SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BPN}-${PV}.tar.gz \
>             file://0001-libjpeg-turbo-fix-package_qa-error.patch \
> +           file://0001-rdppm.c-Fix-buf-overrun-caused-by-bad-binary-PPM.patch \
>             "
>  
>  SRC_URI[md5sum] = "d01d9e0c28c27bc0de9f4e2e8ff49855"
>
> 


--------------9DC137CF69694299ACFCA5F5
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <br>
    <br>
    <div class="moz-cite-prefix">On 6/18/20 1:31 AM, jason.lau wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:1592469081-109960-1-git-send-email-haitao.liu@windriver.com">
      <pre class="moz-quote-pre" wrap="">libjpeg-turbo 2.0.4 has a heap-based buffer over-read
in get_rgb_row() in rdppm.c via a malformed PPM input file.

CVE: CVE-2020-13790</pre>
    </blockquote>
    <br>
    What about dunfell?<br>
    <br>
    -armin<br>
    <blockquote type="cite"
      cite="mid:1592469081-109960-1-git-send-email-haitao.liu@windriver.com">
      <pre class="moz-quote-pre" wrap="">

Upstream-Status: Backport
[<a class="moz-txt-link-freetext" href="https://github.com/libjpeg-turbo/libjpeg-turbo/commit/3de15e0c344d11d4b90f4a47136467053eb2d09a">https://github.com/libjpeg-turbo/libjpeg-turbo/commit/3de15e0c344d11d4b90f4a47136467053eb2d09a</a>]

Signed-off-by: Liu Haitao <a class="moz-txt-link-rfc2396E" href="mailto:haitao.liu@windriver.com">&lt;haitao.liu@windriver.com&gt;</a>
---
 ...buf-overrun-caused-by-bad-binary-PPM.patch | 81 +++++++++++++++++++
 .../jpeg/libjpeg-turbo_2.0.4.bb               |  1 +
 2 files changed, 82 insertions(+)
 create mode 100644 meta/recipes-graphics/jpeg/files/0001-rdppm.c-Fix-buf-overrun-caused-by-bad-binary-PPM.patch

diff --git a/meta/recipes-graphics/jpeg/files/0001-rdppm.c-Fix-buf-overrun-caused-by-bad-binary-PPM.patch b/meta/recipes-graphics/jpeg/files/0001-rdppm.c-Fix-buf-overrun-caused-by-bad-binary-PPM.patch
new file mode 100644
index 0000000000..518df2d28e
--- /dev/null
+++ b/meta/recipes-graphics/jpeg/files/0001-rdppm.c-Fix-buf-overrun-caused-by-bad-binary-PPM.patch
@@ -0,0 +1,81 @@
+From ae2fc496c622bdf0c409b93006bbb69d2cabd41f Mon Sep 17 00:00:00 2001
+From: DRC <a class="moz-txt-link-rfc2396E" href="mailto:information@libjpeg-turbo.org">&lt;information@libjpeg-turbo.org&gt;</a>
+Date: Tue, 2 Jun 2020 14:15:37 -0500
+Subject: [PATCH] rdppm.c: Fix buf overrun caused by bad binary PPM
+
+This extends the fix in 1e81b0c3ea26f4ea8f56de05367469333de64a9f to
+include binary PPM files with maximum values &lt; 255, thus preventing a
+malformed binary PPM input file with those specifications from
+triggering an overrun of the rescale array and potentially crashing
+cjpeg, TJBench, or any program that uses the tjLoadImage() function.
+
+Fixes #433
+
+CVE: CVE-2020-13790
+
+Signed-off-by: Liu Haitao <a class="moz-txt-link-rfc2396E" href="mailto:haitao.liu@windriver.com">&lt;haitao.liu@windriver.com&gt;</a>
+---
+ ChangeLog.md | 20 ++++++++++++++++----
+ rdppm.c      |  4 ++--
+ 2 files changed, 18 insertions(+), 6 deletions(-)
+
+diff --git a/ChangeLog.md b/ChangeLog.md
+index 4d1219e..250bcaa 100644
+--- a/ChangeLog.md
++++ b/ChangeLog.md
+@@ -1,3 +1,15 @@
++2.0.5
++=====
++
++### Significant changes relative to 2.0.4:
++
++1. Fixed an issue in the PPM reader that caused a buffer overrun in cjpeg,
++TJBench, or the `tjLoadImage()` function if one of the values in a binary
++PPM/PGM input file exceeded the maximum value defined in the file's header and
++that maximum value was less than 255.  libjpeg-turbo 1.5.0 already included a
++similar fix for binary PPM/PGM files with maximum values greater than 255.
++
++
+ 2.0.4
+ =====
+ 
+@@ -562,10 +574,10 @@ application was linked against.
+ 
+ 3. Fixed a couple of issues in the PPM reader that would cause buffer overruns
+ in cjpeg if one of the values in a binary PPM/PGM input file exceeded the
+-maximum value defined in the file's header.  libjpeg-turbo 1.4.2 already
+-included a similar fix for ASCII PPM/PGM files.  Note that these issues were
+-not security bugs, since they were confined to the cjpeg program and did not
+-affect any of the libjpeg-turbo libraries.
++maximum value defined in the file's header and that maximum value was greater
++than 255.  libjpeg-turbo 1.4.2 already included a similar fix for ASCII PPM/PGM
++files.  Note that these issues were not security bugs, since they were confined
++to the cjpeg program and did not affect any of the libjpeg-turbo libraries.
+ 
+ 4. Fixed an issue whereby attempting to decompress a JPEG file with a corrupt
+ header using the `tjDecompressToYUV2()` function would cause the function to
+diff --git a/rdppm.c b/rdppm.c
+index 87bc330..a8507b9 100644
+--- a/rdppm.c
++++ b/rdppm.c
+@@ -5,7 +5,7 @@
+  * Copyright (C) 1991-1997, Thomas G. Lane.
+  * Modified 2009 by Bill Allombert, Guido Vollbeding.
+  * libjpeg-turbo Modifications:
+- * Copyright (C) 2015-2017, D. R. Commander.
++ * Copyright (C) 2015-2017, 2020, D. R. Commander.
+  * For conditions of distribution and use, see the accompanying README.ijg
+  * file.
+  *
+@@ -720,7 +720,7 @@ start_input_ppm(j_compress_ptr cinfo, cjpeg_source_ptr sinfo)
+     /* On 16-bit-int machines we have to be careful of maxval = 65535 */
+     source-&gt;rescale = (JSAMPLE *)
+       (*cinfo-&gt;mem-&gt;alloc_small) ((j_common_ptr)cinfo, JPOOL_IMAGE,
+-                                  (size_t)(((long)maxval + 1L) *
++                                  (size_t)(((long)MAX(maxval, 255) + 1L) *
+                                            sizeof(JSAMPLE)));
+     half_maxval = maxval / 2;
+     for (val = 0; val &lt;= (long)maxval; val++) {
+-- 
+2.17.0
+
diff --git a/meta/recipes-graphics/jpeg/libjpeg-turbo_2.0.4.bb b/meta/recipes-graphics/jpeg/libjpeg-turbo_2.0.4.bb
index 1f49fd3d3b..e210635c4f 100644
--- a/meta/recipes-graphics/jpeg/libjpeg-turbo_2.0.4.bb
+++ b/meta/recipes-graphics/jpeg/libjpeg-turbo_2.0.4.bb
@@ -12,6 +12,7 @@ DEPENDS_append_x86_class-target    = " nasm-native"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BPN}-${PV}.tar.gz \
            <a class="moz-txt-link-freetext" href="file://0001-libjpeg-turbo-fix-package_qa-error.patch">file://0001-libjpeg-turbo-fix-package_qa-error.patch</a> \
+           <a class="moz-txt-link-freetext" href="file://0001-rdppm.c-Fix-buf-overrun-caused-by-bad-binary-PPM.patch">file://0001-rdppm.c-Fix-buf-overrun-caused-by-bad-binary-PPM.patch</a> \
            "
 
 SRC_URI[md5sum] = "d01d9e0c28c27bc0de9f4e2e8ff49855"
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
    <br>
  </body>
</html>

--------------9DC137CF69694299ACFCA5F5--
