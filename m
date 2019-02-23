Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id 045EF7CB9C
	for <openembedded-core@lists.openembedded.org>;
	Sat, 23 Feb 2019 13:36:27 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id f14so5266880wrg.1
	for <openembedded-core@lists.openembedded.org>;
	Sat, 23 Feb 2019 05:36:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=ARu1x83XQ2gjYRbPjutWN4MnT+JN+HH0xxvir9RFcgI=;
	b=TxB5fBgTpQuhUPn7EsWXchi1aSfhcmDmkk2qoKXpgOe0VQDpXJOMktndNFN32P4ZYR
	gK4Wmxf0nLbqcGqWS2xB8ggZn/+fNDu96OcIrh1rJ6WIo8Q3siDSbAFjDnIhNDx/NKkS
	wzUeoX9rWDkZ9/DzIO/ZlvD/pb735/ed0ybQI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=ARu1x83XQ2gjYRbPjutWN4MnT+JN+HH0xxvir9RFcgI=;
	b=ldDmQ1LyZvPFIeAoxVq2riCMbPiCctspZSkPUIDaF1S3AoMfVE39rCL8Pyw/ZlecJS
	86Hi/AnefZnxKfLuuXWUmycmVJ0Qct1lifurs/MuqtNQ/Lr7oo/ysHn/jcsB6d/lvQf8
	kk0lBIaevOIjZAwilztF1/N4SigBflysxw/u2+1kCks3B6WVQCqBqXu67dg5bkrTKUHm
	yIcMcEy/1A6qrE4Oirsog3g2Wa+6zxPm/lr3PG7lJBY9utMVdwhoRiDn7iy976oq8sbc
	/GDzmGpzzQ/AYuDvUru2L/nJ1yDXTAbm91xUhdPVSBTEqbKNG0yigEu4Oizwuae43ngB
	MfNw==
X-Gm-Message-State: AHQUAuYAXkdPJWydi/CysCT0f2MKiIZGjyM5ogRlUsIHueCLHep9Dhtk
	nmfp6Ii8VypfmYRWs75WznsPMw==
X-Google-Smtp-Source: AHgI3IYDnf14p3/7MxY/+b5VC6niR29axzm9+wK996M2NmJU6oF5eIaho/KuC470sC51KIcqXNzuwA==
X-Received: by 2002:adf:fb05:: with SMTP id c5mr6263149wrr.297.1550928988718; 
	Sat, 23 Feb 2019 05:36:28 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	j124sm3746498wmb.48.2019.02.23.05.36.27
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sat, 23 Feb 2019 05:36:27 -0800 (PST)
Message-ID: <b17f7567b65f6b1ee4e33345364b489058d96b80.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Sat, 23 Feb 2019 13:36:26 +0000
In-Reply-To: <04f40efe02dcc883306aa15a611952ad2aeddece.camel@linuxfoundation.org>
References: <20190220201026.70803-1-alex.kanavin@gmail.com>
	<20190220201026.70803-3-alex.kanavin@gmail.com>
	<6378eef56d799e4b91da708cc8fff92c0e4bc13e.camel@linuxfoundation.org>
	<10aa3afa4b558884e16f600954422435aa8a6023.camel@linuxfoundation.org>
	<CANNYZj-Q96NJ9eh-DxTHhCC0CFPtQ26jx2cJG3PkNdDYprDLGw@mail.gmail.com>
	<04f40efe02dcc883306aa15a611952ad2aeddece.camel@linuxfoundation.org>
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
X-List-Received-Date: Sat, 23 Feb 2019 13:36:28 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sat, 2019-02-23 at 13:25 +0000, Richard Purdie wrote:
> On Sat, 2019-02-23 at 13:51 +0100, Alexander Kanavin wrote:
> > I'm at the same time staring at this bit in pixbufcache.bbclass:
> > 
> > gdkpixbuf_complete() {
> > GDK_PIXBUF_FATAL_LOADER=1
> > ${STAGING_LIBDIR_NATIVE}/gdk-pixbuf-2.0/gdk-pixbuf-query-loaders
> > --update-cache || exit 1
> > }
> > 
> > DEPENDS_append_class-native = " gdk-pixbuf-native"
> > SYSROOT_PREPROCESS_FUNCS_append_class-native = "
> > pixbufcache_sstate_postinst"
> > 
> > # See base.bbclass for the other half of this
> > pixbufcache_sstate_postinst() {
> >         mkdir -p ${SYSROOT_DESTDIR}${bindir}
> >         dest=${SYSROOT_DESTDIR}${bindir}/postinst-${PN}
> >         echo '#!/bin/sh' > $dest
> >         echo "${gdkpixbuf_complete}" >> $dest
> >         chmod 0755 $dest
> > }
> > 
> > It's all written for -native, yet the script that fails, resides in
> > tmp/sysroots/qemux86-64/usr/bin/postinst-gdk-pixbuf-native (e.g.
> > the
> > target sysroot which is racing with the native one). Why is it even
> > there?
> > I haven't written this code :) and haven't really seen it before,
> > but
> > this might be a lead.
> 
> I'm sure I've worked on the above before, my memory of why we need it
> is fuzzy. I do now have a reproducer though:
> 
> bitbake gdk-pixbuf gdk-pixbuf-native
> then
> bitbake build-sysroots -c build_target_sysroot
> 
> If you bake build_native_sysroot first, the problem goes away.

I think the problem is in staging_populate_sysroot_dir(). It's
confusing target and native package_archs since in the case we see this
its x86_64 where the target and build archs match.

Not entirely sure how we'll fix this but that is where I think the
problem is.

Not sure why we're suddenly seeing it now and whether the patches
somehow trigger it or not...

Cheers,

Richard



