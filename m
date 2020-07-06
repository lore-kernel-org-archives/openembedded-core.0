Received: from mail-io1-f47.google.com (mail-io1-f47.google.com [209.85.166.47])
 by mx.groups.io with SMTP id smtpd.web10.10.1594055568240775172
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Jul 2020 10:12:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=KTxuHIy7;
 spf=pass (domain: gmail.com, ip: 209.85.166.47, mailfrom: jpewhacker@gmail.com)
Received: by mail-io1-f47.google.com with SMTP id i4so40090177iov.11
        for <openembedded-core@lists.openembedded.org>; Mon, 06 Jul 2020 10:12:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:subject:to:references:message-id:date:user-agent:mime-version
         :in-reply-to:content-language;
        bh=/7rjQEfqddy8xE0S/Z6G2K42FUr9kDShO0gsv3RWt8k=;
        b=KTxuHIy7XLiD4SSaAj7/QIZUPu6PxKXazjTulGPrIE7NiXlpgvdSbsMt3q3II7t8al
         AtVe17Pb07xY3liSr/5b4OyAmLJyJYgckNldbGYN4RHPCXfftM2qhEfr5rCYh/xh2fgu
         EwBXwfTwpv1oWVmFlLnKk/lC0DoykTZ3lP6ZpkjfYsVWWc5u4LBH/3MeHX0/Imuh5GI+
         AiVMctmsf37+G5QQcJmKUCyEYbrn+73tfsVb7TuVz+WMd+qtpGr/miWdHARz36Dda3xA
         pM5JwS9fBzromxH4eyJQKtF8Tl66LEG5Yhfi8gJwzBzRWH8uExzJ3MNez0ek9q6V/TyT
         fXCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:subject:to:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language;
        bh=/7rjQEfqddy8xE0S/Z6G2K42FUr9kDShO0gsv3RWt8k=;
        b=UHtM07CMYISw1q5T6lGNgOzc7jQ4bP4f7ystSaJRAADUC/cUQHxt8TedhDp/lPo2Pz
         1jbOtNeytrwL4U/lqAMcOWvpILmoX0h4TfuJ5C5sciPh00TZ7YHqyPXuzqoQK8Kxvtgy
         lKQVVSutzD9QZi41Yc8LGUiM1xaqgzuEMc3ifFdVC6t+9oF3XC+d6Hx8JuEAVsrM9QW0
         nMBuRkilZ/LxyRweggf2iASCAmHzfHZFuFNep4s0/p7klHsxg0RKPWqKPRk+OG7X7Yoh
         sJ/uAKVGqTvC6BI/s0UG2a90bg3vc/aJq1gBTtjCUE9HFm1z2WZcgiAT0zjuUmpyGrzg
         Yw5A==
X-Gm-Message-State: AOAM531ZQ1W4hUO9ooTRaNx8T6YZx+HCHbFWKrLdBVivIRlzfTTaUwyD
	a/hL/y4X4i3ZNUEXRX5chnybOFidOk4=
X-Google-Smtp-Source: ABdhPJw44lKyJuZSWNGYJy5v6FfvvavTQrQY+ld7BbSIY9/YoJRe0s7/uOKPKk1y8EDNY3HNlJRsWw==
X-Received: by 2002:a5e:9309:: with SMTP id k9mr25915474iom.135.1594055567397;
        Mon, 06 Jul 2020 10:12:47 -0700 (PDT)
Return-Path: <jpewhacker@gmail.com>
Received: from ?IPv6:2605:a601:ac3d:c100:656d:925d:1c0d:96dd? ([2605:a601:ac3d:c100:656d:925d:1c0d:96dd])
        by smtp.gmail.com with ESMTPSA id o16sm11036429ilt.59.2020.07.06.10.12.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2020 10:12:46 -0700 (PDT)
From: "Joshua Watt" <JPEWhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
Subject: Re: [OE-core][dunfell 14/25] classes/archiver: run do_unpack_and_patch after do_preconfigure
To: Steve Sakoman <steve@sakoman.com>,
 openembedded-core@lists.openembedded.org
References: <cover.1594050175.git.steve@sakoman.com>
 <3c9dfa31c3ffcb882fb400f2513e14ae1d830ae6.1594050175.git.steve@sakoman.com>
Message-ID: <4d68fb48-b134-cba3-5500-59db0b3f2433@gmail.com>
Date: Mon, 6 Jul 2020 12:12:45 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <3c9dfa31c3ffcb882fb400f2513e14ae1d830ae6.1594050175.git.steve@sakoman.com>
Content-Type: multipart/alternative;
 boundary="------------3B091B906C15DBF8F8B4190E"
Content-Language: en-US

--------------3B091B906C15DBF8F8B4190E
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Steve,

Please also grab f02c190433 ("classes/archive: do_configure should not 
depend on do_ar_patched") as it fixes a bug introduced by this patch

On 7/6/20 11:10 AM, Steve Sakoman wrote:
> From: Joshua Watt <JPEWhacker@gmail.com>
>
> The commit 8a7c779487 ("classes/archiver: Create patched archive before
> configuring") fixed a race condition when using the archiver, but
> introduced a bug where the GCC source would occasionally be deleted due
> to the archiving code running before do_preconfigure. Instead, make sure
> the archiving code runs after do_preconfigure by making
> do_unpack_and_patch depend on it. This makes more sense anyway since
> do_preconfigure is effectively an extension of do_patch.
>
> This fixes errors like:
>
>   cat: .../gcc/defaults.h: No such file or directory
>
> when making certain configuration changes
>
> Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> (cherry picked from commit d4be264061023ae0ea6e023d82a7b99605bfc22c)
> Signed-off-by: Steve Sakoman <steve@sakoman.com>
> ---
>   meta/classes/archiver.bbclass | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta/classes/archiver.bbclass b/meta/classes/archiver.bbclass
> index a8d3afcbe9..bf275f4543 100644
> --- a/meta/classes/archiver.bbclass
> +++ b/meta/classes/archiver.bbclass
> @@ -583,8 +583,8 @@ do_deploy_archives[sstate-outputdirs] = "${DEPLOY_DIR_SRC}"
>   addtask do_deploy_archives_setscene
>   
>   addtask do_ar_original after do_unpack
> -addtask do_unpack_and_patch after do_patch
> -addtask do_ar_patched after do_unpack_and_patch before do_preconfigure do_configure
> +addtask do_unpack_and_patch after do_patch do_preconfigure
> +addtask do_ar_patched after do_unpack_and_patch before do_configure
>   addtask do_ar_configured after do_unpack_and_patch
>   addtask do_ar_mirror after do_fetch
>   addtask do_dumpdata
>
> 

--------------3B091B906C15DBF8F8B4190E
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p>Steve,</p>
    <p>Please also grab f02c190433 ("classes/archive: do_configure
      should not depend on do_ar_patched") as it fixes a bug introduced
      by this patch<br>
    </p>
    <div class="moz-cite-prefix">On 7/6/20 11:10 AM, Steve Sakoman
      wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:3c9dfa31c3ffcb882fb400f2513e14ae1d830ae6.1594050175.git.steve@sakoman.com">
      <pre class="moz-quote-pre" wrap="">From: Joshua Watt <a class="moz-txt-link-rfc2396E" href="mailto:JPEWhacker@gmail.com">&lt;JPEWhacker@gmail.com&gt;</a>

The commit 8a7c779487 ("classes/archiver: Create patched archive before
configuring") fixed a race condition when using the archiver, but
introduced a bug where the GCC source would occasionally be deleted due
to the archiving code running before do_preconfigure. Instead, make sure
the archiving code runs after do_preconfigure by making
do_unpack_and_patch depend on it. This makes more sense anyway since
do_preconfigure is effectively an extension of do_patch.

This fixes errors like:

 cat: .../gcc/defaults.h: No such file or directory

when making certain configuration changes

Signed-off-by: Joshua Watt <a class="moz-txt-link-rfc2396E" href="mailto:JPEWhacker@gmail.com">&lt;JPEWhacker@gmail.com&gt;</a>
Signed-off-by: Richard Purdie <a class="moz-txt-link-rfc2396E" href="mailto:richard.purdie@linuxfoundation.org">&lt;richard.purdie@linuxfoundation.org&gt;</a>
(cherry picked from commit d4be264061023ae0ea6e023d82a7b99605bfc22c)
Signed-off-by: Steve Sakoman <a class="moz-txt-link-rfc2396E" href="mailto:steve@sakoman.com">&lt;steve@sakoman.com&gt;</a>
---
 meta/classes/archiver.bbclass | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes/archiver.bbclass b/meta/classes/archiver.bbclass
index a8d3afcbe9..bf275f4543 100644
--- a/meta/classes/archiver.bbclass
+++ b/meta/classes/archiver.bbclass
@@ -583,8 +583,8 @@ do_deploy_archives[sstate-outputdirs] = "${DEPLOY_DIR_SRC}"
 addtask do_deploy_archives_setscene
 
 addtask do_ar_original after do_unpack
-addtask do_unpack_and_patch after do_patch
-addtask do_ar_patched after do_unpack_and_patch before do_preconfigure do_configure
+addtask do_unpack_and_patch after do_patch do_preconfigure
+addtask do_ar_patched after do_unpack_and_patch before do_configure
 addtask do_ar_configured after do_unpack_and_patch
 addtask do_ar_mirror after do_fetch
 addtask do_dumpdata
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------3B091B906C15DBF8F8B4190E--
