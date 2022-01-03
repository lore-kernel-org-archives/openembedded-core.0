Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 048FFC433EF
	for <webhook@archiver.kernel.org>; Mon,  3 Jan 2022 17:43:44 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
 [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web10.31789.1641231823033164452
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Jan 2022 09:43:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=OMrSyVes;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.54,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f54.google.com with SMTP id e5so71255776wrc.5
        for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Jan 2022 09:43:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=j/a53JILj1l3xJ4mPv7xnetvj8G4zJsNO1zM/Zf78l4=;
        b=OMrSyVesEx9IStSzCtzurzbEOJksWcINda7DPjLIsa0UR9WOqT2U0sGDRynTKjeG8W
         e16BsOketVYnOIKk9SfOS8OdzvYJaZhIq3dIRPmYm23WTrYySN93H3yU6LgcBODYMSyn
         OIh7Nz7eHbEpfHTSKGeNn6rtRpwlACz2zwut4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=j/a53JILj1l3xJ4mPv7xnetvj8G4zJsNO1zM/Zf78l4=;
        b=Rowfna34z+rewXQmb5oeOwqoObOgZyzTVjoYTHCqJ1weBblEU0QjvDPCNOmSr1CKor
         aCMK7dG3pP2Ltl5r9OIZgKrfd2Gww8/j5ifydARqc+9Br5Xlr9Vvs8ps9gGKGaL8Y71X
         3Vn9w8QWei8hQqK+FQ/AjPLjI+AkMcJeUYphuY2YlELgednSUrD00YTTXGfpnYg9joSA
         LQU8ZqhwJCLcyGyc7+vZuAeT+b4NnCc7XpCh8rB/I7efYoSHpghdmSIuyPC5ctZNWBrJ
         3WfKouY+bGrQgAYpbImo9Q6ZxxXvB2Ob06osqFw213kIQ0G3O3eHo4tatCGXGxEEVCGM
         zRBw==
X-Gm-Message-State: AOAM532+kMcZCtv+mm+6dRiq0yVJTZb9TYvs5fuWVBJxefOTi932uNMY
	3t5EHysG8ZCJZTPGYsjB4NXZE0WES0gfgA==
X-Google-Smtp-Source: 
 ABdhPJzE2kIiU1lgl7MCsRMa+V45MaYaNVu4K5L8vFIQ0iw1t3NoG00OKIJ1dCT3UoLz8rgNlU8m5Q==
X-Received: by 2002:adf:f40c:: with SMTP id
 g12mr39285528wro.287.1641231821697;
        Mon, 03 Jan 2022 09:43:41 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:6e9d:9e0c:645b:fce3?
 ([2001:8b0:aba:5f3c:6e9d:9e0c:645b:fce3])
        by smtp.gmail.com with ESMTPSA id
 g9sm38661758wmq.22.2022.01.03.09.43.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Jan 2022 09:43:41 -0800 (PST)
Message-ID: 
 <7a6436e388ed72f2321bb8fc4228eea365752c0b.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 10/24] libxcrypt-compat: upgrade 4.4.26 ->
 4.4.27
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Otavio Salvador <otavio.salvador@gmail.com>, OpenEmbedded Core Mailing
	List <openembedded-core@lists.openembedded.org>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Date: Mon, 03 Jan 2022 17:43:40 +0000
In-Reply-To: <20220103161854.301148-10-otavio@ossystems.com.br>
References: <20220103161854.301148-1-otavio@ossystems.com.br>
	 <20220103161854.301148-10-otavio@ossystems.com.br>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Jan 2022 17:43:44 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160143

On Mon, 2022-01-03 at 13:18 -0300, Otavio Salvador wrote:
> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
> ---
>  .../libxcrypt/files/fix_cflags_handling.patch |  11 +-
>  .../libxcrypt/libxcrypt-compat_4.4.26.bb      |  18 ---
>  .../libxcrypt/libxcrypt-compat_4.4.27.bb      | 103 ++++++++++++++++++
>  meta/recipes-core/libxcrypt/libxcrypt.inc     |   4 +-
>  4 files changed, 111 insertions(+), 25 deletions(-)
>  delete mode 100644 meta/recipes-core/libxcrypt/libxcrypt-compat_4.4.26.bb
>  create mode 100644 meta/recipes-core/libxcrypt/libxcrypt-compat_4.4.27.bb
> 
> diff --git a/meta/recipes-core/libxcrypt/files/fix_cflags_handling.patch b/meta/recipes-core/libxcrypt/files/fix_cflags_handling.patch
> index 0772998c72..d979796226 100644
> --- a/meta/recipes-core/libxcrypt/files/fix_cflags_handling.patch
> +++ b/meta/recipes-core/libxcrypt/files/fix_cflags_handling.patch
> @@ -1,7 +1,8 @@
> -From fd9a46695594c3cd836ecb7d959f03f605e69a2f Mon Sep 17 00:00:00 2001
> +From 7b2a0cdc281d94a5782c37ef87040c341447b4b4 Mon Sep 17 00:00:00 2001
>  From: Richard Purdie <richard.purdie@linuxfoundation.org>
>  Date: Fri, 30 Apr 2021 10:35:02 +0100
>  Subject: [PATCH] libxcrypt: Update to 4.4.19 release and fix symbol version
> +Organization: O.S. Systems Software LTDA.
>  
>  If you pass CFLAGS with a leading space, " " gets passed to popen and convinces
>  gcc to try and open a file called " ". This results in a confusing error message
> @@ -15,13 +16,13 @@ Upstream-Status: Submitted [https://github.com/besser82/libxcrypt/pull/126]
>  Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>  
>  ---
> - build-aux/compute-symver-floor | 2 ++
> + build-aux/scripts/compute-symver-floor | 2 ++
>   1 file changed, 2 insertions(+)
>  
> -diff --git a/build-aux/compute-symver-floor b/build-aux/compute-symver-floor
> +diff --git a/build-aux/scripts/compute-symver-floor b/build-aux/scripts/compute-symver-floor
>  index 4ec82e1..8117342 100644
> ---- a/build-aux/compute-symver-floor
> -+++ b/build-aux/compute-symver-floor
> +--- a/build-aux/scripts/compute-symver-floor
> ++++ b/build-aux/scripts/compute-symver-floor
>  @@ -36,6 +36,8 @@ sub preprocessor_check {
>           die "C compiler not available\n" unless @CC;
>   
> diff --git a/meta/recipes-core/libxcrypt/libxcrypt-compat_4.4.26.bb b/meta/recipes-core/libxcrypt/libxcrypt-compat_4.4.26.bb
> deleted file mode 100644
> index ec9f9f4fa3..0000000000
> --- a/meta/recipes-core/libxcrypt/libxcrypt-compat_4.4.26.bb
> +++ /dev/null
> @@ -1,18 +0,0 @@
> -#
> -# This provides libcrypto.so.1 which contains obsolete APIs, needed for uninative in particular
> -#
> -
> -require libxcrypt.inc
> -
> -PROVIDES = ""
> -AUTO_LIBNAME_PKGS = ""
> -EXCLUDE_FROM_WORLD = "1"
> -
> -API = "--enable-obsolete-api"
> -
> -do_install:append () {
> -	rm -rf ${D}${includedir}
> -	rm -rf ${D}${libdir}/pkgconfig
> -	rm -rf ${D}${datadir}
> -}
> -
> diff --git a/meta/recipes-core/libxcrypt/libxcrypt-compat_4.4.27.bb b/meta/recipes-core/libxcrypt/libxcrypt-compat_4.4.27.bb
> new file mode 100644
> index 0000000000..fd773fc859
> --- /dev/null
> +++ b/meta/recipes-core/libxcrypt/libxcrypt-compat_4.4.27.bb
> @@ -0,0 +1,103 @@
> +# FIXME: the LIC_FILES_CHKSUM values have been updated by 'devtool upgrade'.
> +# The following is the difference between the old and the new license text.
> +# Please update the LICENSE value if needed, and summarize the changes in
> +# the commit message via 'License-Update:' tag.
> +# (example: 'License-Update: copyright years updated.')
> +#

Needs further review!

Cheers,

Richard



