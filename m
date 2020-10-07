Received: from mail-ot1-f66.google.com (mail-ot1-f66.google.com [209.85.210.66])
 by mx.groups.io with SMTP id smtpd.web10.2756.1602099677344588167
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Oct 2020 12:41:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=TQK1Bphj;
 spf=pass (domain: gmail.com, ip: 209.85.210.66, mailfrom: jpewhacker@gmail.com)
Received: by mail-ot1-f66.google.com with SMTP id o8so3358379otl.4
        for <openembedded-core@lists.openembedded.org>; Wed, 07 Oct 2020 12:41:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:subject:to:references:message-id:date:user-agent:mime-version
         :in-reply-to:content-language;
        bh=mq4l8cg86gq0n5wx+0bBWlvbmhwnpSUCznfjxdceLK4=;
        b=TQK1BphjnOZKdDev7CPGpU7hJyFuL7grGd6AZwfaaYaN2RweSroWSBYYmUpGIEEMv5
         uBPfilOLmVS7NlkyAaa+WIHZwONu4atQ3DBjDcjDmHaYKgJ1cALdHfStvJzsqGgMaPb8
         D2Q3Zpi2VbxAySv968plevuKxCVuK5+97HqGL4T1OgJAt9olFleeCZQBMl9LXxhd3qN9
         NKcmt43f1onnhGZ4VxU0ehm1DPQEdnWd8T5l/QrF3h/Oog2+E3zXbLOehLlLwfPLgpwJ
         OvszhhOL9YYJZW3/gVxvaZYEmq+oFDsiB8XfdKBCHzF/htHIIeDFDYrDe396B0d4xQ/e
         sn3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:subject:to:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language;
        bh=mq4l8cg86gq0n5wx+0bBWlvbmhwnpSUCznfjxdceLK4=;
        b=IRYlEy4QPhH0EOGHbgGoaguuRR8bJlSyNYeMUeMH49dEhA/IuQAX0ntCVvATUOR2vP
         u1fPM5/QKkE//ohlzacRzg4ZjgN54rwwmc8i9/4o/iOswAjL/mIYYHcyIP7SzuqzBsKp
         MUo42KOX2s/dv5uhtenwlWz3I74IJO9ygBla0ILVynER2BynQ2rakk4SpqQ3zrTdKvqC
         ymb8l3mNvqNAGh4/nSmBMdf05sOYddmQDnjsexFnfRrRxGGiFNHpeQf7I8XtS8q3Lc57
         LyZiiDgg6XIvsG4i8WfVKTJ94ZBJcRM4V72lXGe6sRVHjQsXvt8/KqM/UL3OJDOAkwox
         D7yQ==
X-Gm-Message-State: AOAM533pdZCqT0m20W2jO4HY0Q1JkpzWumgUjEyWf2SFI79FDun5BWrp
	u5cMASVYRboerzHmhBPf1XFB9e29QnI=
X-Google-Smtp-Source: ABdhPJyhZP5FR09HvJVX/HtNy8KjYS5AZ7sLs4tnnR4hAgj9Ri4RelIqAiUFgba7EvXBXZoGpTGiqg==
X-Received: by 2002:a9d:2009:: with SMTP id n9mr2613328ota.41.1602099676253;
        Wed, 07 Oct 2020 12:41:16 -0700 (PDT)
Return-Path: <jpewhacker@gmail.com>
Received: from ?IPv6:2605:a601:ac3d:c100:e3e8:d9:3a56:e27d? ([2605:a601:ac3d:c100:e3e8:d9:3a56:e27d])
        by smtp.gmail.com with ESMTPSA id i6sm2720082oig.54.2020.10.07.12.41.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Oct 2020 12:41:15 -0700 (PDT)
From: "Joshua Watt" <JPEWhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
Subject: Re: [OE-core] [PATCH] meson: ensure out-of-tree build when under externalsrc/devtool
To: chris.laplante@agilent.com, openembedded-core@lists.openembedded.org
References: <20201007164534.123373-1-chris.laplante@agilent.com>
Message-ID: <15be7caa-aa27-1776-6f41-6ef0bd64a9fb@gmail.com>
Date: Wed, 7 Oct 2020 14:41:15 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201007164534.123373-1-chris.laplante@agilent.com>
Content-Type: multipart/alternative;
 boundary="------------7FD5700F127AB329A73B6C6D"
Content-Language: en-US

--------------7FD5700F127AB329A73B6C6D
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 10/7/20 11:45 AM, Chris Laplante via lists.openembedded.org wrote:
> Avoids the error:
> | ERROR: Source and build directories must not be the same. Create a pristine build directory.
>
> Signed-off-by: Chris Laplante <chris.laplante@agilent.com>
> ---
>   meta/classes/meson.bbclass | 3 +++
>   1 file changed, 3 insertions(+)
>
> diff --git a/meta/classes/meson.bbclass b/meta/classes/meson.bbclass
> index 83aa854b7e..1b4b244018 100644
> --- a/meta/classes/meson.bbclass
> +++ b/meta/classes/meson.bbclass
> @@ -6,6 +6,9 @@ DEPENDS_append = " meson-native ninja-native"
>   B = "${WORKDIR}/build"
>   do_configure[cleandirs] = "${B}"
>   
> +CLASSOVERRIDE .= ":class-meson"
> +EXTERNALSRC_BUILD_class-meson = "${WORKDIR}/build"
> +
Why is devtool telling the recipe to do an in-tree build? It seems like 
it should be consistent with externalsrc.bbclass, which works fine for 
meson because it always does an out-of-tree build. FWIW, this would 
*also* be a problem when using waf.bbclass, but I suspect no one cares 
too much about that :)
>   # Where the meson.build build configuration is
>   MESON_SOURCEPATH = "${S}"
>   
>
> 
>

--------------7FD5700F127AB329A73B6C6D
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 10/7/20 11:45 AM, Chris Laplante via
      lists.openembedded.org wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:20201007164534.123373-1-chris.laplante@agilent.com">
      <pre class="moz-quote-pre" wrap="">Avoids the error:
| ERROR: Source and build directories must not be the same. Create a pristine build directory.

Signed-off-by: Chris Laplante <a class="moz-txt-link-rfc2396E" href="mailto:chris.laplante@agilent.com">&lt;chris.laplante@agilent.com&gt;</a>
---
 meta/classes/meson.bbclass | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/classes/meson.bbclass b/meta/classes/meson.bbclass
index 83aa854b7e..1b4b244018 100644
--- a/meta/classes/meson.bbclass
+++ b/meta/classes/meson.bbclass
@@ -6,6 +6,9 @@ DEPENDS_append = " meson-native ninja-native"
 B = "${WORKDIR}/build"
 do_configure[cleandirs] = "${B}"
 
+CLASSOVERRIDE .= ":class-meson"
+EXTERNALSRC_BUILD_class-meson = "${WORKDIR}/build"
+</pre>
    </blockquote>
    Why is devtool telling the recipe to do an in-tree build? It seems
    like it should be consistent with externalsrc.bbclass, which works
    fine for meson because it always does an out-of-tree build. FWIW,
    this would *also* be a problem when using waf.bbclass, but I suspect
    no one cares too much about that :)<br>
    <blockquote type="cite"
      cite="mid:20201007164534.123373-1-chris.laplante@agilent.com">
      <pre class="moz-quote-pre" wrap="">
 # Where the meson.build build configuration is
 MESON_SOURCEPATH = "${S}"
 
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">


</pre>
    </blockquote>
  </body>
</html>

--------------7FD5700F127AB329A73B6C6D--
