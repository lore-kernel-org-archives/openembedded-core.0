Return-Path: <ross.burton@intel.com>
Received: from mail-io1-f65.google.com (mail-io1-f65.google.com
	[209.85.166.65])
	by mail.openembedded.org (Postfix) with ESMTP id 24DEE6BA0E
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Jan 2019 09:19:22 +0000 (UTC)
Received: by mail-io1-f65.google.com with SMTP id v10so1461991ios.13
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Jan 2019 01:19:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=lcHHjUOJ0kG3eaqyWwneBsyjdUpDcBWKE3JxNdHBf/I=;
	b=DHBYts/rGS5S5pH4huX4InCQq/vaBLxpVdDz+DrFlHCEIrzMjHSgXPPkqGsCq1cJKV
	ndiYrJKM/NmDZ7lkAFkd6N7EP4yK52qd4VfRpswyncwuXYU4ouWMKqP9s348ztCBingk
	Hw5b2Q9DC4GWXPVEF+pLQQvpdUXWvi4FGMVu4/PhW6u0jI2CzQ8xoaAY2CdC+9EycNt+
	ahxbYeSb4GUIHN/RueF0lHnNzvTLmft8WGqY+2vElQLJtR643jn3uaaMkRfGlChSR1tN
	4TBo/Hwgo7enKbmmq2ogaX5gRTZR1jNg7nTbiZ4PYEx+z/vBEVken3qVkJRa34iFcz23
	4cNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=lcHHjUOJ0kG3eaqyWwneBsyjdUpDcBWKE3JxNdHBf/I=;
	b=RhIlacU1vHduV1kBWRDtP2byINYTCTqSNol2u4Dr+Hb0Z6I+qC5ZhermE+R/Zc82Wy
	ABhgxm6q+7VOlm3aluqmHow9FpYmKMb8cdU19XO4sYFfvHWu0AV1I3U0wnDNY42y0F3V
	llrB7ivZevXMq8vOiRieFDKVpVJTTTQZY9rlP+hS6h07wm/botOverpyrJ+XeVrhl8E6
	0JGtioMg4kNiaVkvqe7O5hJHDOFl1O8ry4TgqhSjA8F3PMWVImZUUwMs9p+gGVNTdYmh
	aq0Q8mU4xb76iIEVZhCcOAy6vm80mn8SgTSJQMPkCZfBZ3d2kpdIegtPonEFt0If0fbl
	8t7A==
X-Gm-Message-State: AJcUukfrUt8j7ZJmkohzrgbx5MvdI/f/mCPDEwMHs6T7TSoifWmVxS1m
	YULcsxh7nwFouko//+kpb60XzkbsWMMKOyfiFeV1Jw==
X-Google-Smtp-Source: ALg8bN6OMC1aiKFi50/7Sqlf4jsIBNc85MzLKxjS4CWPJmFqept9oSo+R7qF3F7nZkmRxq3lVfATHC8xUKJP/vXZJSs=
X-Received: by 2002:a5e:820d:: with SMTP id l13mr1352705iom.201.1547543963217; 
	Tue, 15 Jan 2019 01:19:23 -0800 (PST)
MIME-Version: 1.0
References: <1547530093-50658-1-git-send-email-changqing.li@windriver.com>
	<1547530093-50658-3-git-send-email-changqing.li@windriver.com>
In-Reply-To: <1547530093-50658-3-git-send-email-changqing.li@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 15 Jan 2019 09:19:12 +0000
Message-ID: <CAJTo0La-p53Onb4bNXJ50XJi4XXyJe+b1p6RtfCEHo-B_7R8EA@mail.gmail.com>
To: changqing.li@windriver.com
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] piglit: support build piglit without x11
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
X-List-Received-Date: Tue, 15 Jan 2019 09:19:22 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, 15 Jan 2019 at 05:29, <changqing.li@windriver.com> wrote:
> +X11_DEPS = "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'virtual/libx11 libxrender libglu', '', d)}"
> +DEPENDS = "libpng waffle libxkbcommon virtual/libgl python3-mako-native python3-numpy-native python3-six-native virtual/egl ${X11_DEPS}"

This...

> +       ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'mesa-demos', '', d)} \

...and this are basically the buildtime and runtime dependencies for
the 'opengl' packageconfig, so they should be in the
PACKAGECONFIG[opengl] line.

Also if you rename [opengl] to [x11] and then you can just use
bb.utils.filter().

Ross

