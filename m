Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58916C43334
	for <webhook@archiver.kernel.org>; Tue, 26 Jul 2022 09:04:42 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
 [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web12.4428.1658826272684648208
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Jul 2022 02:04:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=GxcXnepo;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.49,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f49.google.com with SMTP id
 v67-20020a1cac46000000b003a1888b9d36so10926044wme.0
        for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Jul 2022 02:04:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references
         :content-transfer-encoding:user-agent:mime-version;
        bh=ht5y29cMFzcLrRes/i6LTtErK0s5tnreg/RUZxx7gvA=;
        b=GxcXnepoPBM8RuVmPJC4IfsNCdqqlyzdtWzLrEDLF+u7CXdMaCngV6kHgCgrtDP8yU
         hVPDUHUDyKzgD655hNo5yhLD1taLRrGyCkGnYAh6Rm8yDX61SCxtEeDOlm0zsE+ZTcf0
         hF7qWwnh7eVXcMQXYAVoMTrYpbmTCT4p8YljY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:content-transfer-encoding:user-agent:mime-version;
        bh=ht5y29cMFzcLrRes/i6LTtErK0s5tnreg/RUZxx7gvA=;
        b=dmr5GsBrcEZFJYLnq02kp3sFZLO4YcG9xGRTcSLJBw6zoOEkHjjOsVhA1l9S1Lvwvx
         iSwHscLIq4nA3+LECD3mqf0ZhunLUqnIqTTuK9+COBXTH71V4I+tD3IJrmKuObKtbUBO
         KNtQHweLXyU2+q8eCjMjbFbU1LDy8KuZb2BEDk4BltK4eaKgC2dA/NELOPZa/YgJR8XH
         WStvGzYRLBcjxXhEObgoiv25dk/xKfTZqiCKIrXEv7l48WQMKaMZ5Z6wGR87cHMFlGPJ
         btZMmo765KpzxeLnkTXmIWQLbScWm7bM7y5mv+UVsXQ2tKRB4Tiw16QaoQm70bSSFQ+g
         gEWQ==
X-Gm-Message-State: AJIora80t6Gjgd6k2AFnM+oPE7448mGG6mDaZwh7IXAB79N7e3idGLQM
	QAsSs3mhYm696ybarSjCYvpJwZ/AUDffRg==
X-Google-Smtp-Source: 
 AGRyM1sy8wBXqJxmHAxjEG7sU9FVmNMKHvLZExAIu1YnCgYxIgkFTD6k5sfFA9xnpVRbKksC4g1ZwQ==
X-Received: by 2002:a05:600c:3c91:b0:3a3:5230:1a6d with SMTP id
 bg17-20020a05600c3c9100b003a352301a6dmr7811226wmb.11.1658826270864;
        Tue, 26 Jul 2022 02:04:30 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:289a:8162:dbfe:813c?
 ([2001:8b0:aba:5f3c:289a:8162:dbfe:813c])
        by smtp.gmail.com with ESMTPSA id
 u8-20020a05600c19c800b0039db31f6372sm19960073wmq.2.2022.07.26.02.04.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Jul 2022 02:04:30 -0700 (PDT)
Message-ID: 
 <86fda0d8e0e6ff22b0609c607d2bb2cd4d82459b.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] classes: rootfs-postcommands: autologin root
 on serial-getty
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: johannes.schneider@leica-geosystems.com,
	openembedded-core@lists.openembedded.org
Date: Tue, 26 Jul 2022 10:04:29 +0100
In-Reply-To: <20220726085139.464795-1-johannes.schneider@leica-geosystems.com>
References: 
	<20220726085139.464795-1-johannes.schneider@leica-geosystems.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 26 Jul 2022 09:04:42 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168501

On Tue, 2022-07-26 at 10:51 +0200, Johannes Schneider via
lists.openembedded.org wrote:
> when debug-tweaks or empty-root-password are part of the
> IMAGE_FEATURES, save some of the developers time by not having to type
> the (then still sole) 'root' username on the serial consoleafter each
> and every reboot
>=20
> by inserting '--autologin root' into the command line of the
> responsible 'getty' service
>=20
> Signed-off-by: Johannes Schneider <johannes.schneider@leica-geosystems.co=
m>
> ---
>  meta/classes/rootfs-postcommands.bbclass | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
>=20
> diff --git a/meta/classes/rootfs-postcommands.bbclass b/meta/classes/root=
fs-postcommands.bbclass
> index a8a952f31d..39992b101e 100644
> --- a/meta/classes/rootfs-postcommands.bbclass
> +++ b/meta/classes/rootfs-postcommands.bbclass
> @@ -8,6 +8,9 @@ ROOTFS_POSTPROCESS_COMMAND +=3D '${@bb.utils.contains_any=
("IMAGE_FEATURES", [ 'deb
>  # Allow dropbear/openssh to accept root logins if debug-tweaks or allow-=
root-login is enabled
>  ROOTFS_POSTPROCESS_COMMAND +=3D '${@bb.utils.contains_any("IMAGE_FEATURE=
S", [ 'debug-tweaks', 'allow-root-login' ], "ssh_allow_root_login; ", "",d)=
}'
> =20
> +# Autologin the root user on the serial console, if debug-tweaks or empt=
y-root-password are active
> +ROOTFS_POSTPROCESS_COMMAND +=3D '${@bb.utils.contains_any("IMAGE_FEATURE=
S", [ 'debug-tweaks', 'empty-root-password' ], "serial_autologin_root; ", "=
",d)}'
> +
>  # Enable postinst logging if debug-tweaks or post-install-logging is ena=
bled
>  ROOTFS_POSTPROCESS_COMMAND +=3D '${@bb.utils.contains_any("IMAGE_FEATURE=
S", [ 'debug-tweaks', 'post-install-logging' ], "postinst_enable_logging; "=
, "",d)}'
> =20


I really want to remove debug-tweaks as an image feature as it isn't
clear to the user enabling it what they're signing up to.

I'd suggest we name this feature specific to what it actually is
(serial-autologin) and then ask users to specifically select it if
they=C2=A0want it rather than making things too magic.

Cheers,

Richard


