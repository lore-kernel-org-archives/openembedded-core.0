Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	by mail.openembedded.org (Postfix) with ESMTP id EE74B6C491
	for <openembedded-core@lists.openembedded.org>;
	Sat, 23 Feb 2019 13:25:28 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id a62so4278333wmh.4
	for <openembedded-core@lists.openembedded.org>;
	Sat, 23 Feb 2019 05:25:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=8hf3EVNJVF9RKErrnmEn3ziMnUZnpr4Ke7542UpB6F0=;
	b=aUEiC7vwmytGSuI7xAoAkNKnbqbP05cMHsuzTQPNewwGTVvnpDHOCOEL26eW3Llp5y
	n/bKAzfiZ4ql63lPm3dJ8DrqPahOm3t5jwTj4/qJdqunI+TGEIcCSVTC2Kcvr47ygs5V
	18rHU6esGLUZNE24H8K//0rZt6786N7WrQUXw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=8hf3EVNJVF9RKErrnmEn3ziMnUZnpr4Ke7542UpB6F0=;
	b=Aea2gPUot38WHN7K5axsfeB6beYLvg+wZH0vN0VYuI9RncFYq24OO7DhzFmBWuOplq
	zC3Z/illDrj5Wlot9KTajYw+gdfJG0dY9xn1nV4aQ7uHylWgPkqGmA5Sx4g/ZWsEYcte
	S/caRFkgOohyzQT/uelA+05wAVez/YM8QRuR3oE1h0KoJFyRpHlug9HSMmnnkOFowZ40
	SzV7xmZIKKanwHDNXLgs12hNQOoeoZwkbcCj378EJzwgvNBBsD8K0DMPBpPsHUzkFQi5
	K5jOUiJ0MrhV0o3Y0ck/JK+k9R3wu2kZlQaEbzhYfKxKuzIqQ0UNDGoqjDWeqq0T8TtT
	Qhrw==
X-Gm-Message-State: AHQUAuanmUylOHknOZs0IhnHEfsQUWUzZF1zo5MP65XflJY6tKlPpWD8
	2pHuNgiYKiiE0TznpOdLhG8mXQ==
X-Google-Smtp-Source: AHgI3IZpIkGrYYoHBCvx0I7lCZho9O61qt+5obfzZmjoJ0PWuDzpJ7isAhoRAE7JfM579ycll4rLlg==
X-Received: by 2002:a1c:c60b:: with SMTP id w11mr5414802wmf.39.1550928329576; 
	Sat, 23 Feb 2019 05:25:29 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	b18sm2537580wro.80.2019.02.23.05.25.27
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Sat, 23 Feb 2019 05:25:28 -0800 (PST)
Message-ID: <04f40efe02dcc883306aa15a611952ad2aeddece.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Sat, 23 Feb 2019 13:25:26 +0000
In-Reply-To: <CANNYZj-Q96NJ9eh-DxTHhCC0CFPtQ26jx2cJG3PkNdDYprDLGw@mail.gmail.com>
References: <20190220201026.70803-1-alex.kanavin@gmail.com>
	<20190220201026.70803-3-alex.kanavin@gmail.com>
	<6378eef56d799e4b91da708cc8fff92c0e4bc13e.camel@linuxfoundation.org>
	<10aa3afa4b558884e16f600954422435aa8a6023.camel@linuxfoundation.org>
	<CANNYZj-Q96NJ9eh-DxTHhCC0CFPtQ26jx2cJG3PkNdDYprDLGw@mail.gmail.com>
User-Agent: Evolution 3.31.90-1 
MIME-Version: 1.0
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/4] gdk-pixbuf: convert from autotools to meson
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 23 Feb 2019 13:25:29 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sat, 2019-02-23 at 13:51 +0100, Alexander Kanavin wrote:
> On Sat, 23 Feb 2019 at 13:43, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> > On Sat, 2019-02-23 at 12:29 +0000, Richard Purdie wrote:
> > > On Wed, 2019-02-20 at 21:10 +0100, Alexander Kanavin wrote:
> > > > Drop autotools-specific patches.
> > > > 
> > > > Rework jku's thumbnailer patch into meson configuration.
> > > > 
> > > > Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> > > 
> > > We've seen it before but its happened again:
> > > 
> > > https://autobuilder.yoctoproject.org/typhoon/#/builders/73/builds/326
> > > 
> > > I went into the failed build directory and ran "bitbake core-
> > > image-
> > > sato -c testsdkext" and it succeeded so I'm not sure sure how
> > > we're
> > > going to debug this one...
> > 
> > From staring at the log, I think do_build_target_sysroot in build-
> > sysroots.bb may need to depend on do_build_native_sysroot.
> > 
> > They're both running at the same time and potentially racing?
> 
> I'm at the same time staring at this bit in pixbufcache.bbclass:
> 
> gdkpixbuf_complete() {
> GDK_PIXBUF_FATAL_LOADER=1
> ${STAGING_LIBDIR_NATIVE}/gdk-pixbuf-2.0/gdk-pixbuf-query-loaders
> --update-cache || exit 1
> }
> 
> DEPENDS_append_class-native = " gdk-pixbuf-native"
> SYSROOT_PREPROCESS_FUNCS_append_class-native = "
> pixbufcache_sstate_postinst"
> 
> # See base.bbclass for the other half of this
> pixbufcache_sstate_postinst() {
>         mkdir -p ${SYSROOT_DESTDIR}${bindir}
>         dest=${SYSROOT_DESTDIR}${bindir}/postinst-${PN}
>         echo '#!/bin/sh' > $dest
>         echo "${gdkpixbuf_complete}" >> $dest
>         chmod 0755 $dest
> }
> 
> It's all written for -native, yet the script that fails, resides in
> tmp/sysroots/qemux86-64/usr/bin/postinst-gdk-pixbuf-native (e.g. the
> target sysroot which is racing with the native one). Why is it even
> there?
> I haven't written this code :) and haven't really seen it before, but
> this might be a lead.

I'm sure I've worked on the above before, my memory of why we need it
is fuzzy. I do now have a reproducer though:

bitbake gdk-pixbuf gdk-pixbuf-native
then
bitbake build-sysroots -c build_target_sysroot

If you bake build_native_sysroot first, the problem goes away.

Cheers,

Richard





