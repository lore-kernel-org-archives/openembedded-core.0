Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9802C433FE
	for <webhook@archiver.kernel.org>; Tue, 22 Nov 2022 15:22:00 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web10.21813.1669130516180838125
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Nov 2022 07:21:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=hKiv9tDh;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.44, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f44.google.com with SMTP id g12so25188353wrs.10
        for <openembedded-core@lists.openembedded.org>; Tue, 22 Nov 2022 07:21:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=lxmIdpw690iZhrA3mmbb8qt4PBOnMA+mwYtiW/0nVlQ=;
        b=hKiv9tDhLyZ2sRgqFzx0MdvEMISnAsCmtJ3p+F5biLjJ0P4YCn/Hxg8hNdIvog4zMP
         NEpjsczFtQaesrFfVNs4Fzul+nu32doP2qk5ZRn9os2oXupgcUiqDoKW6uSpKt2uC7T9
         e2ErziiU4Pz/alJq2kfwPV/mnQ0va9o7dGxug=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lxmIdpw690iZhrA3mmbb8qt4PBOnMA+mwYtiW/0nVlQ=;
        b=MOO/s8l2WxCuUymqR52mH1YQSNdY/vTX6fjGzgJfQSLW3PtUaUbwOOmVsCwwUzkw1/
         u/otl+n5dwVRUiYimpdk5h3jrLN4FSqJ4B81QtUtFxAQ3smtUHLs9E9ksUCDxnI7/8hB
         I1ZcTh7h0ESiLbiuT6MSJw8crhdPhb0SS4nLR53S4y2KsTjEsRyo7pS0FAPueLzSiEYK
         +ZD+yeTdFgChQ8KmamOUH6zKjhk9PkmGJUpoXMixknAiCvUx5xxm3K+tWA0PuIMLLblO
         DwiFE0CeEIpO/NOkJCgTFYXsjWZI6qKripkchQob67DHP+ohL7NRUHTJtDbuaazWaIU6
         si1A==
X-Gm-Message-State: ANoB5pmnbo/RXFZrnN+SwHp8/FHrZlu46XgGOkEPwHiVnvYmYegnTqzV
	yUufza1PpzpIe0zD/65XKt1Smg==
X-Google-Smtp-Source: AA0mqf6uf5QZGxzDPHzuLSfaPxlmNO7xiqeS3PXUXq3H/VKEQ/iKeaNH6qANugKq5eo1FnnH/Mhayw==
X-Received: by 2002:a05:6000:683:b0:241:dac7:5282 with SMTP id bo3-20020a056000068300b00241dac75282mr5101473wrb.135.1669130514565;
        Tue, 22 Nov 2022 07:21:54 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:2b3e:5e6:6ca6:2445? ([2001:8b0:aba:5f3c:2b3e:5e6:6ca6:2445])
        by smtp.gmail.com with ESMTPSA id bi18-20020a05600c3d9200b003cfd42821dasm17827466wmb.3.2022.11.22.07.21.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Nov 2022 07:21:54 -0800 (PST)
Message-ID: <034045b1e1ea7e23f19cab664e9c1491ba667658.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 13/17] webkitgtk: update 2.36.7 -> 2.38.2
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>, 
	openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Date: Tue, 22 Nov 2022 15:21:53 +0000
In-Reply-To: <20221120133122.2464634-13-alex@linutronix.de>
References: <20221120133122.2464634-1-alex@linutronix.de>
	 <20221120133122.2464634-13-alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 22 Nov 2022 15:22:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173685

On Sun, 2022-11-20 at 14:31 +0100, Alexander Kanavin wrote:
> Upstream has rewritten gobject introspection support,
> so the two related patches are ported to that:
> 0001-FindGObjectIntrospection.cmake-prefix-variables-obta.patch
> 0001-When-building-introspection-files-do-not-quote-CFLAG.patch
> The latter patch is also promoted from Inappropriate to Pending
>=20
> gtk-doc has been replaced with gi-docgen, accordingly
> 0001-Tweak-gtkdoc-settings-so-that-gtkdoc-generation-work.patch is remove=
d.
>=20
> Drop
> fix-gstreamer-include-paths.patch
> (backport)
> 0001-Fix-build-without-opengl-or-es.patch
> (upstream fixed the issue; follow the link in the patch for details)
>=20
> Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> ---
>  ...spection.cmake-prefix-variables-obta.patch |  39 ++---
>  .../0001-Fix-build-without-opengl-or-es.patch | 133 ------------------
>  ...tings-so-that-gtkdoc-generation-work.patch |  47 -------
>  ...trospection-files-do-not-quote-CFLAG.patch |  67 +++------
>  .../fix-gstreamer-include-paths.patch         |  51 -------
>  ...ebkitgtk_2.36.7.bb =3D> webkitgtk_2.38.2.bb} |   9 +-
>  6 files changed, 40 insertions(+), 306 deletions(-)
>  delete mode 100644 meta/recipes-sato/webkit/webkitgtk/0001-Fix-build-wit=
hout-opengl-or-es.patch
>  delete mode 100644 meta/recipes-sato/webkit/webkitgtk/0001-Tweak-gtkdoc-=
settings-so-that-gtkdoc-generation-work.patch
>  delete mode 100644 meta/recipes-sato/webkit/webkitgtk/fix-gstreamer-incl=
ude-paths.patch
>  rename meta/recipes-sato/webkit/{webkitgtk_2.36.7.bb =3D> webkitgtk_2.38=
.2.bb} (94%)

I was going to say I was worried this introduces a reproducibility
issue:

https://autobuilder.yoctoproject.org/typhoon/#/builders/117/builds/1907

however I see the failure we encountered is on the previous version :(

Diffoscope failed but the packages are here:

http://autobuilder.yocto.io/pub/repro-fail/oe-reproducible-20221120-kpjhpoe=
p/packages/reproducibleA/tmp/deploy/deb/core2-64/
http://autobuilder.yocto.io/pub/repro-fail/oe-reproducible-20221120-kpjhpoe=
p/packages/reproducibleB/tmp/deploy/deb/core2-64/

I've not looked into what happened as yet.

Cheers,

Richard

