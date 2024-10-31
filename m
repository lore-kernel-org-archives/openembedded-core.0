Return-Path: <danismostlikely@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BCCDCD767DF
	for <webhook@archiver.kernel.org>; Thu, 31 Oct 2024 15:54:08 +0000 (UTC)
Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com [209.85.221.176])
 by mx.groups.io with SMTP id smtpd.web10.15923.1730390039991053274
 for <openembedded-core@lists.openembedded.org>;
 Thu, 31 Oct 2024 08:54:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=JOQs6lLg;
 spf=pass (domain: gmail.com, ip: 209.85.221.176, mailfrom: danismostlikely@gmail.com)
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-50d3365c29cso1112325e0c.0
        for <openembedded-core@lists.openembedded.org>; Thu, 31 Oct 2024 08:53:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730390039; x=1730994839; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=dDrNQ9wMIqqhFGolkqR9Le8iFU8iByZSZhUsKPI0J5Y=;
        b=JOQs6lLg70rqcyCLg1KF+/yQTCrLIJNAmIQ3KGW3kCyrfn05DsfXJoGnKfic9pUt7Y
         ErtRjRbBNGsTrtyWHwHZVrKoLb3Rh9ggLG29un4MZNa/hSlrnAsBzLMES9SIQQ93hVWZ
         pWbFJvaLH1G0+/n6bFbPuMjSScxQYWBT61LMZvzzJTGi+nvmD/WQ+n3qYk5oGXZarm87
         TpyD29ibhPlnR4TNw7+h+ISm/oSv/dv/Dvn4w6KL/zSrgdlxKhaV5Ok1i6bdRXeOpjyI
         qUM2ITBWjj9xlXjaLMuQca7v7hL2i7HHjLoi5oh9NzSiRzvXGjEvOCzNgjXSk4O5ljxN
         tSzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730390039; x=1730994839;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dDrNQ9wMIqqhFGolkqR9Le8iFU8iByZSZhUsKPI0J5Y=;
        b=LKC/8Mwz4ojos8+xdSboAq+kRLG37/E4joJjKyMURZfuJgcZZcvO/hKLbYkKw9BkVq
         v7YUH+291+/0UCDSql4uKy5cDKZ3aAO0vxCd8kgSxsCwWD3DHc26RLN9R/y8RlP8OYMo
         q89NwDV7Qdu0oCMBlVhOOAeStWPjfzV+q/K0JNeSASY5A8w2JcnxwDZZWSPlP0EgtjSH
         9sX5Gbn1jdgpLON3ICtbNr//FDuSIgpash1yJc4qgO/ViBpvb4BV5/MZUzB+q3d6e9Vk
         PQqIUMg7kS5rME7Q66rfPJWb2fQQ036D1enVB76zQJqgOCflP0dt3QwBt2Y1LfDc4GZ+
         oMsg==
X-Gm-Message-State: AOJu0YwOJngXyVRF3KVzwsly4Whg9/Ki1w9JTi6Gdb3abRA4gSxHJlGO
	y/wpL4CqVH34qIWpMsU+R3R/MPL3TLxf5ZQ59SBLgPt6Cm/7aXn+zzaOUMy3FFhjlQEPLspnKRj
	qnH8C1NenwBhXDjufnovqPpIAt7JVGw==
X-Google-Smtp-Source: AGHT+IGZG9L4GErs8+LK1TkfsjSU2EJxEBDuw3sk7rx6yccneCzNDHU/CtX+Y9j8wFbsvdBn9Eo5Nm6TCtl2fJOVaxs=
X-Received: by 2002:a05:6122:3c4d:b0:50d:34fe:fef0 with SMTP id
 71dfb90a1353d-5106fcb8b86mr2323042e0c.6.1730390038840; Thu, 31 Oct 2024
 08:53:58 -0700 (PDT)
MIME-Version: 1.0
References: <20241030225457.1522289-1-raj.khem@gmail.com>
In-Reply-To: <20241030225457.1522289-1-raj.khem@gmail.com>
From: Dan McGregor <danismostlikely@gmail.com>
Date: Thu, 31 Oct 2024 09:53:47 -0600
Message-ID: <CACS+7ZT1OXBT3tOtGhEpn2SbgAWAsus74UD9v=yD2urh255VQA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] ppp: Add pam and openssl via packageconfig
To: raj.khem@gmail.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 31 Oct 2024 15:54:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206588

On Wed, 30 Oct 2024 at 16:55, Khem Raj via lists.openembedded.org
<raj.khem=gmail.com@lists.openembedded.org> wrote:
>
> Explicitly enable pam support, otherwise it goes into
> detection mode and ends up poking at build host
>
> Turn openssl into packageconfig as well
>
> cc1: warning: include location "/usr/include" is unsafe for cross-compilation [-Wpoison-system-directories]
> conftest.c: In function 'main':
> conftest.c:68:1: warning: argument 1 null where non-null expected [-Wnonnull]
>    68 | pam_authenticate(NULL, 0);
>       | ^~~~~~~~~~~~~~~~
> In file included from conftest.c:63:
> /usr/include/security/pam_appl.h:38:1: note: in a call to function 'pam_authenticate' declared 'nonnull'
>    38 | pam_authenticate(pam_handle_t *pamh, int flags);
>       | ^~~~~~~~~~~~~~~~
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta/recipes-connectivity/ppp/ppp_2.5.1.bb | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/meta/recipes-connectivity/ppp/ppp_2.5.1.bb b/meta/recipes-connectivity/ppp/ppp_2.5.1.bb
> index 5b8c49ca850..2b917905b24 100644
> --- a/meta/recipes-connectivity/ppp/ppp_2.5.1.bb
> +++ b/meta/recipes-connectivity/ppp/ppp_2.5.1.bb
> @@ -4,7 +4,7 @@ the Point-to-Point Protocol (PPP) on Linux and Solaris systems."
>  SECTION = "console/network"
>  HOMEPAGE = "http://samba.org/ppp/"
>  BUGTRACKER = "http://ppp.samba.org/cgi-bin/ppp-bugs"
> -DEPENDS = "libpcap openssl virtual/crypt"
> +DEPENDS = "libpcap virtual/crypt"
>  LICENSE = "BSD-3-Clause & BSD-3-Clause-Attribution & GPL-2.0-or-later & LGPL-2.0-or-later & PD & RSA-MD & MIT"
>  LIC_FILES_CHKSUM = "file://pppd/ccp.c;beginline=1;endline=29;md5=1bea10e81fc6f2df105b1f8b733cb149 \
>                      file://pppd/plugins/passprompt.c;beginline=1;endline=10;md5=3bcbcdbf0e369c9a3e0b8c8275b065d8 \
> @@ -29,7 +29,9 @@ SRC_URI[sha256sum] = "733b7f5840b613da4eab0429a5081293275f06ba8b528e1b8eea6964fa
>
>  inherit autotools systemd
>
> -EXTRA_OECONF += "--with-openssl=${STAGING_EXECPREFIXDIR}"
> +PACKAGECONFIG = "${@bb.utils.filter('DISTRO_FEATURES', 'pam', d)} openssl"
> +PACKAGECONFIG[pam] = "--with-pam=${STAGING_EXECPREFIXDIR},--with-pam=no,libpam"
> +PACKAGECONFIG[openssl] = "--with-openssl=${STAGING_EXECPREFIXDIR},--with-openssl=no,openssl"

If inherit pkgconfig, we can avoid explicitly pointing to the
installed path for openssl and libpam, otherwise this is a good
substitute for my original patch.

>
>  do_install:append () {
>         mkdir -p ${D}${bindir}/ ${D}${sysconfdir}/init.d
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#206565): https://lists.openembedded.org/g/openembedded-core/message/206565
> Mute This Topic: https://lists.openembedded.org/mt/109305795/3617261
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [danismostlikely@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

