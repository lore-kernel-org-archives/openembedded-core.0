Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49EFBC43458
	for <webhook@archiver.kernel.org>; Wed,  8 Jul 2026 06:24:58 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2714.1783491895554555359
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Jul 2026 23:24:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=hq+S2l+0;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.50, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-493c19bad03so2097405e9.2
        for <openembedded-core@lists.openembedded.org>; Tue, 07 Jul 2026 23:24:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1783491894; x=1784096694; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ZaQuXz/9S65vriJVtPL5BICs2oqTYRO9Jfm9LDgOEkE=;
        b=hq+S2l+0oZ3OiVegdOsFJuGvlgB+buIawP6Es9hbQGbTyRvlZThkGDPIbB5Q19bpYb
         DqTMDyx5Y1X2zz4GIu8zfFCRBWHZyCI/xY9ZhCWV4myxOxzYh7p3NQPDMnlbhaKp7Olc
         6if8JGmvUFcJN2XEFZhVdgP1gLdFRCzqqJWVY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783491894; x=1784096694;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZaQuXz/9S65vriJVtPL5BICs2oqTYRO9Jfm9LDgOEkE=;
        b=Wvo07FImFzTzz1n7wQAVL2Pl3vpSOluuXbsHvtZWlKIk9/yrbNr8sVMV/rFclv/dYl
         uWV3AyHSwrv6w3oRETPz7Ust9wWEkletC9HiuqHgJ51JVJ6kzKlNGkSwfETq74WUud14
         fqLUS5F9zz25XhlnC2q7NWevnJ4QOzUAEsZixHsCZaTuAzOpGO98ZywsT+0CM7bAD1YK
         8hxha+luQMUqvhszwi3VnjaEaVETBaWrJKe5MQ0gS3qF2TLWHodVKDXG6KKrLVH9eROI
         GMG5lm4D2J4fXSf9FUM3QnMT2UFH55KZkvWqZF+2zyMdtj/D2kYHDwiI1fMscsQjFMf1
         iKdw==
X-Forwarded-Encrypted: i=1; AHgh+Rqd6ZsGRECstQemQHmbgdQeAb2BHxLRmAiI8pGpWktfdouQRfkOOpV0bk8lYFzbYVrQVh0hoGx8MsIPYauT7jVJTQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0YyhXwLRQcpIFOzbwuMke8zHNcep0rpPHUxB7E7Z+QSdMp2ooVku
	7F4wCFlvgqXa9Td9cNJjTjS6u2OGCMGspfv2u1f88cVk0EVcBFee3odfyI9/t1QoKuQ=
X-Gm-Gg: AfdE7cn3vt/Jy/XHNqi2aSQfyt/0BqhBqpRwUcbVHOvMGLmj8syLVOBRcC/gQAllYeo
	RdF0ih1SNeCHlaF++gTdDERhFxaQ9bcTfsIGtVnMgqJchvO22uSCXZtG9qeCDLAXnX29sLW2eQP
	rg/d1CueKWW3uhHpM21o8dlfMpUdjUcsDQJYrwaRzGUWUoSW2ueeedWFr5EAjQf57u4uxAyjIEm
	+8/h20NQmxefabCr6cmihTGWTikz2gcI2jFheANN1czu2FFql4Th85coPTRmLr9jzUg1CUzLGm4
	KJuM9ZoAxN8enZAr6qvQo8IJjS4FvhJbWMkxB7GzQwzEm6Zdh04YS4am1qt7HcVAc4MYjnHzLyC
	NA4roKe60shmDY9KXfuTi1VHHNU7k46gx1b9olMd6TE4q2jTsS5vxDTXpLPFmwNn+vNjXRy68ed
	MtW7QdFt2Vgq/XivnSY5YDS0egVvqoWdfd4H7bC3DHS17GxbxftMKQvvtrH7gxgPL6NVql6asyN
	hAl8Q==
X-Received: by 2002:a05:600c:1d0f:b0:493:aaf5:6e04 with SMTP id 5b1f17b1804b1-493e6843302mr9669235e9.15.1783491893692;
        Tue, 07 Jul 2026 23:24:53 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:b60a:b356:19ef:1131? ([2001:8b0:aba:5f3c:b60a:b356:19ef:1131])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493e0f44b3bsm99600785e9.9.2026.07.07.23.24.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 23:24:53 -0700 (PDT)
Message-ID: <05b306c913f651de16530f8a745e7ea4ba48c2f2.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v4] gstreamer1.0-plugins-rs: add new package
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: tarun@centricular.com, openembedded-core@lists.openembedded.org
Cc: sebastian@centricular.com, nirbheek@centricular.com
Date: Wed, 08 Jul 2026 07:24:52 +0100
In-Reply-To: <18C03C30DCBC1651.550146@lists.openembedded.org>
References: <20260524012357.3178877-1-tarun@centricular.com>
		 <20260707081701.1525114-1-tarun@centricular.com>
	 <18C03C30DCBC1651.550146@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Jul 2026 06:24:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240438

On Wed, 2026-07-08 at 07:20 +0100, Richard Purdie via lists.openembedded.or=
g wrote:
> On Tue, 2026-07-07 at 13:47 +0530, Taruntej Kanakamalla via lists.openemb=
edded.org wrote:
> > Adapted from an existing patch:
> > https://patchwork.yoctoproject.org/project/oe-core/patch/20220606132653=
.60232-5-brgl@bgdev.pl
> >=20
> > Update the recipe to track the latest upstream release of the official
> > GStreamer Rust plugins.
> >=20
> > Remove the `flavors` and `ffv1` plugins from local manifest file becaus=
e
> > they depend on packages that are not published on crates.io and also th=
ey
> > are not actively maintained in the gst-plugins-rs upstream anyway.
> >=20
> > Unlike the other GStreamer submodules, the Rust plugins follow a
> > separate release cycle and versioning scheme. These plugins are fully
> > stable and required for a fully-featured GStreamer installation, as mos=
t
> > new features and plugins are being written in Rust. They are also shipp=
ed
> > by multiple Linux distributions such as Fedora.
>=20
> I put this into testing and it showed there was no maintainer entry for t=
he new recipe:
>=20
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/111/builds/2830
>=20
> WARNING: gstreamer1.0-plugins-rs-0.15.3-r0 do_recipe_qa: QA Issue:
> Recipe gstreamer1.0-plugins-rs in /srv/pokybuild/yocto-worker/musl-
> qemuarm64/build/layers/openembedded-core/meta/recipes-
> multimedia/gstreamer/gstreamer1.0-plugins-rs_0.15.3.bb does not have an
> assigned maintainer. Please add an entry into
> meta/conf/distro/include/maintainers.inc. [missing-maintainer]

Sorry I missed this initially, there was also:

https://autobuilder.yoctoproject.org/valkyrie/#/builders/59/builds/4122
https://autobuilder.yoctoproject.org/valkyrie/#/builders/17/builds/3940

which has two failures, one with 32 bit x86 multilib failing (missing
sse?) and secondly, a packaging issue.


(as well as the maintainer issue above triggering selftest failures
too).

Cheers,

Richard


