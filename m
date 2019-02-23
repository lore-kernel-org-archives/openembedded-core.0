Return-Path: <alex.kanavin@gmail.com>
Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com
	[209.85.167.179])
	by mail.openembedded.org (Postfix) with ESMTP id 3F33B7CBF3
	for <openembedded-core@lists.openembedded.org>;
	Sat, 23 Feb 2019 13:43:43 +0000 (UTC)
Received: by mail-oi1-f179.google.com with SMTP id q81so3945360oic.5
	for <openembedded-core@lists.openembedded.org>;
	Sat, 23 Feb 2019 05:43:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=nMC0Up4GsLsZ4wyuh8vMjCs/WN3hDXLAS5POXCGVhMI=;
	b=P5fPcnGNvuvhgQA1tBqCpt7sQrvzOSmqtpZxE0MuJ2CY4L5WG7KHqtHDYnuyRAnblE
	L8AibnXTZKA9PhtzAQ1/VpmAvRbYh20r5G2gxnFDgWW/MOeVqSNlxgICkVfMWb1Ff7Il
	jmHJV5XxC/8VKOtYa1URhqzPzCWtCHxG0+L107Am+N3ZsE3IXdfDLLTN5+gXrEqjQWSu
	PqQFnpNWgH5wi9kh3Qn1IVlsGyWDD3G3eVWse6zvUMi5GgFrc9PqP1CUSf94PPsXTgC2
	aaYqGXLT5uCUXHWh6lValp3FbG9NqQRILfJqaJ5injK4nDE6yde1kPUfzjj1pcdnd0se
	LNcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=nMC0Up4GsLsZ4wyuh8vMjCs/WN3hDXLAS5POXCGVhMI=;
	b=kFxuftPZPuvtBn8g71POWXU21ct/yBgRhhU6qlgdqZVRo+YSnTaj1lSqIPTwQDhFHt
	UPHCVShoJQKioSKU7esBgnC6aHy+6kaAvjOhi5s3lnvuJLDoEc7MCj9myAhv9ZurNAms
	7PITnlEiM2cQ8Zp9HHI05RGm6SVLid/buTanM/36ZrOVThVvLgybv7fzTWzKlv3LZt5t
	v2+cgAJ1bIkhtWXj+/bAMDzmyLwi9L7N/XvO6VfXr8sCCt9MpJHaoEFCH//eKJWbx8VZ
	NfQmuE6vxHpaeh2Q5sQzEZyzvnyl+3vwdxgr2ReBy2g4A0f6pYlcsil8XtlH1nIVd0ct
	tyng==
X-Gm-Message-State: AHQUAuaKa3XcmDffvqs/Y4k2wlwsL+6HI2NQgLcQqmOObAN9M2fv1+dl
	E7m4trvoF2Tn0SoQJ2I/no67KvczQJYZZhUh5mIH5g==
X-Google-Smtp-Source: AHgI3IZgs/WAxG1NK7QVZHNCAEmHk6bZmaXmeq6uDKDlftkrJkcmmtPbZmBmPJ0v/Wzqs3KJ93VvLH3cv3xmzTcWBzI=
X-Received: by 2002:aca:4c58:: with SMTP id z85mr5458555oia.140.1550929424138; 
	Sat, 23 Feb 2019 05:43:44 -0800 (PST)
MIME-Version: 1.0
References: <20190220201026.70803-1-alex.kanavin@gmail.com>
	<20190220201026.70803-3-alex.kanavin@gmail.com>
	<6378eef56d799e4b91da708cc8fff92c0e4bc13e.camel@linuxfoundation.org>
	<10aa3afa4b558884e16f600954422435aa8a6023.camel@linuxfoundation.org>
	<CANNYZj-Q96NJ9eh-DxTHhCC0CFPtQ26jx2cJG3PkNdDYprDLGw@mail.gmail.com>
	<04f40efe02dcc883306aa15a611952ad2aeddece.camel@linuxfoundation.org>
	<b17f7567b65f6b1ee4e33345364b489058d96b80.camel@linuxfoundation.org>
In-Reply-To: <b17f7567b65f6b1ee4e33345364b489058d96b80.camel@linuxfoundation.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Sat, 23 Feb 2019 14:43:31 +0100
Message-ID: <CANNYZj8es+kfAvJ-TadGefJGR0WvAehrGdi7ALrNXQoiTx-p+w@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
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
X-List-Received-Date: Sat, 23 Feb 2019 13:43:43 -0000
Content-Type: text/plain; charset="UTF-8"

On Sat, 23 Feb 2019 at 14:36, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> > > I'm at the same time staring at this bit in pixbufcache.bbclass:
> > >
> > > gdkpixbuf_complete() {
> > > GDK_PIXBUF_FATAL_LOADER=1
> > > ${STAGING_LIBDIR_NATIVE}/gdk-pixbuf-2.0/gdk-pixbuf-query-loaders
> > > --update-cache || exit 1
> > > }
> > >
> > > DEPENDS_append_class-native = " gdk-pixbuf-native"
> > > SYSROOT_PREPROCESS_FUNCS_append_class-native = "
> > > pixbufcache_sstate_postinst"
> > >
> > > # See base.bbclass for the other half of this
> > > pixbufcache_sstate_postinst() {
> > >         mkdir -p ${SYSROOT_DESTDIR}${bindir}
> > >         dest=${SYSROOT_DESTDIR}${bindir}/postinst-${PN}
> > >         echo '#!/bin/sh' > $dest
> > >         echo "${gdkpixbuf_complete}" >> $dest
> > >         chmod 0755 $dest
> > > }
> > >
> > > It's all written for -native, yet the script that fails, resides in
> > > tmp/sysroots/qemux86-64/usr/bin/postinst-gdk-pixbuf-native (e.g.
> > > the
> > > target sysroot which is racing with the native one). Why is it even
> > > there?
> > > I haven't written this code :) and haven't really seen it before,
> > > but
> > > this might be a lead.
> >
> > I'm sure I've worked on the above before, my memory of why we need it
> > is fuzzy. I do now have a reproducer though:
> >
> > bitbake gdk-pixbuf gdk-pixbuf-native
> > then
> > bitbake build-sysroots -c build_target_sysroot
> >
> > If you bake build_native_sysroot first, the problem goes away.
>
> I think the problem is in staging_populate_sysroot_dir(). It's
> confusing target and native package_archs since in the case we see this
> its x86_64 where the target and build archs match.
>
> Not entirely sure how we'll fix this but that is where I think the
> problem is.
>
> Not sure why we're suddenly seeing it now and whether the patches
> somehow trigger it or not...

The reproducer does fail on master too, so the patches may only have
shifted the timings such that the race outcome is sometimes the
failing one.

Alex

