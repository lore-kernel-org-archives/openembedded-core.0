Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
 by mx.groups.io with SMTP id smtpd.web11.150.1623876167783040395
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Jun 2021 13:42:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=KExnHKXp;
 spf=pass (domain: gmail.com, ip: 209.85.210.43, mailfrom: jpewhacker@gmail.com)
Received: by mail-ot1-f43.google.com with SMTP id w23-20020a9d5a970000b02903d0ef989477so3853281oth.9
        for <openembedded-core@lists.openembedded.org>; Wed, 16 Jun 2021 13:42:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:subject:to:references:message-id:date:user-agent:mime-version
         :in-reply-to:content-language;
        bh=aeA3mbedojZlauyj0IB7i9XhvS1rnr9GKHq7b1u2LrA=;
        b=KExnHKXp2/4K6bzKLlr+BOs8tvrJejrxMgsPUJj5EnpXwUwZRPFuDSx6v+lqnuqHvj
         QGrbcd3857F6kNWhlEa97JpsiDYPX84eUOD7WKW0rmrC0to2+iCudZS1lvsrC53aFSML
         XZyn0VffrCvjcr+kDj0g9sRuZGfaUhOKozpVDDSx2fYXB+teZBe/0lIiHyBs4QAwNF2J
         OkU8N1UdGzv1lnp2/x4YnsDLZvWcR/urTpTnOnK/FVUOLTG9tKSV0ilioGaPXilBaaPh
         /nTzqTG6u5I358LK/hFPRZ4Xf0FFXOxvrprDzxcXbJ8eiMvPyLdi7FnFsFWWOxNKerNU
         4HZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:subject:to:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language;
        bh=aeA3mbedojZlauyj0IB7i9XhvS1rnr9GKHq7b1u2LrA=;
        b=dwxGP3vJjJHFFfF+GhmxLcXuYFaRTRymQhFGCQBa0ZU8gQUQHy2ojJbhZ07SFjMYWj
         sGd9UxMgcqFc9jYLIJVJIWtDTKVptoUscHMehB4fUFsOJ9EdyeYtlOTdcsVDZfaqFsbb
         4pf3/43/+QLy6m981jLcqFiUceo5kevDD7AxcW8pYNgqX4IfBIMxQaBa+t1FUzsrYEAL
         Rhm4z9DeqZT3h3Jg8GRadZzQs3ov86FC3VO42UwJzFAm2WKeg0dfupzBmDK8Zm2WkHSN
         kK2DwzIV9zq59UD72z8nRrVDfjb7KiPDk2b2aQRdRaIk+4wH5gGo7PRX3w9YVEMEvYDF
         kTwg==
X-Gm-Message-State: AOAM531L9kK+vGozZ+EXGjfFDRScIQ/warVUmvvWMol1dOeIp/F1eZGs
	amcMQrabpwmLbCWJkuIW3DpVGbY/l9o=
X-Google-Smtp-Source: ABdhPJw4A4v5Q6HQEXrMtZnY/b0ZLQW6ZBrzrH5GryBYmQ7Dpb3y1UtSzNvKG0NPaIW9bq7P/4M7nQ==
X-Received: by 2002:a9d:17d0:: with SMTP id j74mr1476519otj.92.1623876166771;
        Wed, 16 Jun 2021 13:42:46 -0700 (PDT)
Return-Path: <jpewhacker@gmail.com>
Received: from ?IPv6:2605:a601:ac3d:c100:e3e8:d9:3a56:e27d? ([2605:a601:ac3d:c100:e3e8:d9:3a56:e27d])
        by smtp.gmail.com with ESMTPSA id n11sm761035otq.63.2021.06.16.13.42.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Jun 2021 13:42:46 -0700 (PDT)
From: "Joshua Watt" <JPEWhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
Subject: Re: [OE-core] [PATCH] populate_sdk_ext: copy BBMULTICONFIG files
To: Justin Bronder <jsbronder@cold-front.org>,
 openembedded-core@lists.openembedded.org
References: <20210616202709.5143-1-jsbronder@cold-front.org>
Message-ID: <5a4482c8-a237-3195-eb6f-95c0ded9920f@gmail.com>
Date: Wed, 16 Jun 2021 15:42:45 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210616202709.5143-1-jsbronder@cold-front.org>
Content-Type: multipart/alternative;
 boundary="------------D27919FF2F5DD6071FA9547C"
Content-Language: en-US

--------------D27919FF2F5DD6071FA9547C
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 6/16/21 3:27 PM, Justin Bronder wrote:
> As the generated local.conf includes BBMULTICONFIG, the referenced files
> in conf/multiconfig also need to be copied.  Otherwise with
> BBMULTICONFIG="abc" for instance, building the esdk fails with:
>
> ERROR: ParseError at tmp/build-glibc/work/qemux86_64-oe-linux/core-image-ssh/1.0-r0/sdk-ext/image/tmp-renamed-sdk/layers/openembedded-core/meta/conf/bitbake.conf:767: Could not include required file conf/multiconfig/abc.conf
>
> Signed-off-by: Justin Bronder <jsbronder@cold-front.org>
> ---
>   meta/classes/populate_sdk_ext.bbclass | 12 +++++++++++-
>   1 file changed, 11 insertions(+), 1 deletion(-)
>
> diff --git a/meta/classes/populate_sdk_ext.bbclass b/meta/classes/populate_sdk_ext.bbclass
> index fe840d9cfb..71f601fa9b 100644
> --- a/meta/classes/populate_sdk_ext.bbclass
> +++ b/meta/classes/populate_sdk_ext.bbclass
> @@ -397,6 +397,13 @@ python copy_buildsystem () {
>               f.write('require conf/locked-sigs.inc\n')
>               f.write('require conf/unlocked-sigs.inc\n')
>   
> +    # Copy multiple configurations if they exist
> +    if d.getVar('BBMULTICONFIG') is not None:
> +        bb.utils.mkdirhier(os.path.join(baseoutpath, 'conf', 'multiconfig'))
> +        for mc in d.getVar('BBMULTICONFIG').split():
> +            dest_stub = "/conf/multiconfig/%s.conf" % (mc,)
> +            shutil.copyfile(builddir + dest_stub, baseoutpath + dest_stub)
multiconfig files can live in layers also, so they may not be in the the 
users conf/multiconfig directory. I'm not sure if you need to copy them 
for the esdk to work, but at a minimum if you don't find a multiconfig 
in the users conf directory it shouldn't be an error
> +
>       if os.path.exists(builddir + '/cache/bb_unihashes.dat'):
>           bb.parse.siggen.save_unitaskhashes()
>           bb.utils.mkdirhier(os.path.join(baseoutpath, 'cache'))
> @@ -556,6 +563,9 @@ python copy_buildsystem () {
>       # sdk_ext_postinst() below) thus the checksum we take here would always
>       # be different.
>       manifest_file_list = ['conf/*']
> +    if d.getVar('BBMULTICONFIG') is not None:
> +        manifest_file_list.append('conf/multiconfig/*')
> +
>       esdk_manifest_excludes = (d.getVar('ESDK_MANIFEST_EXCLUDES') or '').split()
>       esdk_manifest_excludes_list = []
>       for exclude_item in esdk_manifest_excludes:
> @@ -564,7 +574,7 @@ python copy_buildsystem () {
>       with open(manifest_file, 'w') as f:
>           for item in manifest_file_list:
>               for fn in glob.glob(os.path.join(baseoutpath, item)):
> -                if fn == manifest_file:
> +                if fn == manifest_file or os.path.isdir(fn):
>                       continue
>                   if fn in esdk_manifest_excludes_list:
>                       continue
>
> 
>

--------------D27919FF2F5DD6071FA9547C
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 6/16/21 3:27 PM, Justin Bronder
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:20210616202709.5143-1-jsbronder@cold-front.org">
      <pre class="moz-quote-pre" wrap="">As the generated local.conf includes BBMULTICONFIG, the referenced files
in conf/multiconfig also need to be copied.  Otherwise with
BBMULTICONFIG="abc" for instance, building the esdk fails with:

ERROR: ParseError at tmp/build-glibc/work/qemux86_64-oe-linux/core-image-ssh/1.0-r0/sdk-ext/image/tmp-renamed-sdk/layers/openembedded-core/meta/conf/bitbake.conf:767: Could not include required file conf/multiconfig/abc.conf

Signed-off-by: Justin Bronder <a class="moz-txt-link-rfc2396E" href="mailto:jsbronder@cold-front.org">&lt;jsbronder@cold-front.org&gt;</a>
---
 meta/classes/populate_sdk_ext.bbclass | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/meta/classes/populate_sdk_ext.bbclass b/meta/classes/populate_sdk_ext.bbclass
index fe840d9cfb..71f601fa9b 100644
--- a/meta/classes/populate_sdk_ext.bbclass
+++ b/meta/classes/populate_sdk_ext.bbclass
@@ -397,6 +397,13 @@ python copy_buildsystem () {
             f.write('require conf/locked-sigs.inc\n')
             f.write('require conf/unlocked-sigs.inc\n')
 
+    # Copy multiple configurations if they exist
+    if d.getVar('BBMULTICONFIG') is not None:
+        bb.utils.mkdirhier(os.path.join(baseoutpath, 'conf', 'multiconfig'))
+        for mc in d.getVar('BBMULTICONFIG').split():
+            dest_stub = "/conf/multiconfig/%s.conf" % (mc,)
+            shutil.copyfile(builddir + dest_stub, baseoutpath + dest_stub)</pre>
    </blockquote>
    multiconfig files can live in layers also, so they may not be in the
    the users conf/multiconfig directory. I'm not sure if you need to
    copy them for the esdk to work, but at a minimum if you don't find a
    multiconfig in the users conf directory it shouldn't be an error<br>
    <blockquote type="cite"
      cite="mid:20210616202709.5143-1-jsbronder@cold-front.org">
      <pre class="moz-quote-pre" wrap="">
+
     if os.path.exists(builddir + '/cache/bb_unihashes.dat'):
         bb.parse.siggen.save_unitaskhashes()
         bb.utils.mkdirhier(os.path.join(baseoutpath, 'cache'))
@@ -556,6 +563,9 @@ python copy_buildsystem () {
     # sdk_ext_postinst() below) thus the checksum we take here would always
     # be different.
     manifest_file_list = ['conf/*']
+    if d.getVar('BBMULTICONFIG') is not None:
+        manifest_file_list.append('conf/multiconfig/*')
+
     esdk_manifest_excludes = (d.getVar('ESDK_MANIFEST_EXCLUDES') or '').split()
     esdk_manifest_excludes_list = []
     for exclude_item in esdk_manifest_excludes:
@@ -564,7 +574,7 @@ python copy_buildsystem () {
     with open(manifest_file, 'w') as f:
         for item in manifest_file_list:
             for fn in glob.glob(os.path.join(baseoutpath, item)):
-                if fn == manifest_file:
+                if fn == manifest_file or os.path.isdir(fn):
                     continue
                 if fn in esdk_manifest_excludes_list:
                     continue
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">


</pre>
    </blockquote>
  </body>
</html>

--------------D27919FF2F5DD6071FA9547C--
