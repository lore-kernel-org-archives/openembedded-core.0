Return-Path: <ross.burton@intel.com>
Received: from mail-io1-f54.google.com (mail-io1-f54.google.com
	[209.85.166.54])
	by mail.openembedded.org (Postfix) with ESMTP id BB3DA7D139
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Mar 2019 15:37:24 +0000 (UTC)
Received: by mail-io1-f54.google.com with SMTP id c4so17587380ioh.9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Mar 2019 08:37:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=AnmbRdUXFU5/2+kS5AYZ0A/ABnPhC6YniNSktLgHgyA=;
	b=aR/gDdUf7rhq6X3xPNBWN6ec7n+ed8CeowH6sIfA84Iw3bjyb2NGASqjylNIFX06Qn
	3LAgNxg360xgCs6Kf8TEa55dsPzITGh3Z01o90X604GhGuIcvQ3qRgFQ7EdX9bInQSrv
	ULclXAqSltyLisUJy7BrZHb1KBMWyRllGuMN2RWHJi8K/1jUq3dKiMsCQ0dCp8hMeO9h
	ykU7Y3tnnGl3zCADbG8rjYSt2pNV3/U5jVWtnxM3/M31bG8YHK0+cx+Bjre/Ua4RYcOg
	6S+vqZF7/PLlLkr0rGjsoAkMMq9H0rkZa8qwsprrdacqI1UVFuzNlcm6imS08NnlNF5s
	7KkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=AnmbRdUXFU5/2+kS5AYZ0A/ABnPhC6YniNSktLgHgyA=;
	b=FTEnlmjNHN3HXbZqFSYLroPYrgyh0weaPpG4eMoMOQYrUPOolmzIe6tXxlwAzbbIIm
	acCGQtOgaYsbl40t98cXGF4g3eYgWDliOiBBgkz+Xn9NEyoaGoMdCWt4dFrKWeRFDlwf
	d6jalJJjfDTwdWK6zBlF/dGg+TBBJT40bNMmRFgxDK37VC8m/pptOzhxc2qTsvlkvHWa
	yosWwXPbq0tpd+HWjpii7k82w0hYKW82I7X9xqlRTuCCZ1Y/y0I1rL5a4aF1Sd7JLkpy
	xq823PCol8X5iD3OHx0UzGdnOj6BuMqbqy28rTFlloy0sE9qW7Vc9qdCCw8dUYJBxX6G
	Nb5w==
X-Gm-Message-State: APjAAAVzmeUaolvU6DECQVE/PVhQ6iFvnvPxhAgn4v4yl/q64WXJUJOu
	Pi6oQBMwVfCe5eTq0HHlU3HPazfb9ejKSQm9o9ViH3pD4+4=
X-Google-Smtp-Source: APXvYqwfjGpamd5cc2yRHbpk/CQZtypYeeefZRMSZANu1gZGCiDy9PBWntAy83fQXdH+HobW3Fw0+XODplJV74hu0ug=
X-Received: by 2002:a6b:1495:: with SMTP id 143mr28738659iou.201.1553787445780;
	Thu, 28 Mar 2019 08:37:25 -0700 (PDT)
MIME-Version: 1.0
References: <20190328033340.18022-1-zangrc.fnst@cn.fujitsu.com>
In-Reply-To: <20190328033340.18022-1-zangrc.fnst@cn.fujitsu.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 28 Mar 2019 15:37:14 +0000
Message-ID: <CAJTo0LZyL1GdHMGe9XHTkfSwc1jzRTu0a-BL1N+RHAp06DBUeA@mail.gmail.com>
To: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gdk-pixbuf:upgrade 2.38.0 -> 2.38.1
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
X-List-Received-Date: Thu, 28 Mar 2019 15:37:24 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, 28 Mar 2019 at 03:33, Zang Ruochen <zangrc.fnst@cn.fujitsu.com> wrote:
> -Upgrade from gdk-pixbuf_2.38.0.bb to gdk-pixbuf_2.38.1.bb.
>
> -Delete gdk-pixbuf/0001-Fix-a-couple-of-decisions-around-cross-compilation.patch beacuse this patch has been fixed.
>
> -Delete gdk-pixbuf/0001-loaders.cache-depend-on-loaders-being-fully-build.patch beacuse this patch has been fixed.

packages/corei7-64-poky-linux/gdk-pixbuf/gdk-pixbuf-bin: FILELIST:
removed "/usr/share/thumbnailers/gdk-pixbuf-thumbnailer.thumbnailer
/usr/bin/gdk-pixbuf-thumbnailer"

Why?

packages/corei7-64-poky-linux/gdk-pixbuf/gdk-pixbuf-dev: FILELIST:
removed "/usr/bin/gdk-pixbuf-print-mime-types"

Why?

packages/corei7-64-poky-linux/gdk-pixbuf/gdk-pixbuf-ptest: PKGSIZE
changed from 17746564 to 52 (-100%)
packages/corei7-64-poky-linux/gdk-pixbuf/gdk-pixbuf-ptest: FILELIST:
removed "/usr/libexec/installed-tests/gdk-pixbuf/large.png
/usr/libexec/installed-tests/gdk-pixbuf/pixbuf-stream
/usr/libexec/installed-tests/gdk-pixbuf/aero.gif
/usr/libexec/installed-tests/gdk-pixbuf/test-images/reftests/tga/gtk-logo-gray-8bpp-top-right.tga.ref.png
/usr/share/installed-tests/gdk-pixbuf/pixbuf-jpeg.test
/usr/libexec/installed-tests/gdk-pixbuf/test-images/reftests/tga/gtk-logo-24bpp-top-right.tga.ref.png
/usr/share/installed-tests/gdk-pixbuf/pixbuf-randomly-modified.test
/usr/libexec/installed-tests/gdk-pixbuf/test-images/reftests/tga/gtk-logo-cmap.ref.png
/usr/libexec/installed-tests/gdk-pixbuf/test-images/reftests/tga/gtk-logo-rle-24bpp-bottom-right.tga
/usr/libexec/installed-tests/gdk-pixbuf/bug775229.pixdata
/usr/libexec/installed-tests/gdk-pixbuf/test-images/reftests/tga/gtk-logo-cmap-rle-8bpp-top-right.tga.ref.png
/usr/libexec/installed-tests/gdk-pixbuf/test-images/reftests/bug696331.png
...

Where's the test suite gone?

Ross

