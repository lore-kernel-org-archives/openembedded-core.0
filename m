Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id 2710F6010D
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Mar 2019 12:34:00 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id t18so17243253wrx.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 07 Mar 2019 04:34:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=0FpqvZjECH5vO2vXvuv36MvmueI2fzY2fI++8aAyljo=;
	b=fSZXfJ5ZwgYFsWAec5PW4wSaT6G4whhP6Ob667jfncoTe9aQqyqqnojAfkQqOIeZ8y
	RJ6rXQTnFz8T0oo6DAhTuj2DlrhI45DVyEhiJ5qRanYDD4FuThfXDSzDF6b+EoaPaP4t
	vcRCzPxRKZ9gw7cgSyrL/ehepJHkrLksYAcpI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=0FpqvZjECH5vO2vXvuv36MvmueI2fzY2fI++8aAyljo=;
	b=Kact/QrJoHYGZSxkNSAbpuP98FLfZ2Op37jE1efRhBVnX2Av1hm/HqLfKjxmmUK5EV
	PGhd+hUbdE4d/de7xZIw1bJm4jhWqSVsQjt7ynEHz8fv+AZWl9nB2LcZF/Qh7t0mPs77
	GQ+jwv7ucOLyojv9TX9UY5TxH110FpRBEJacW2LFND5qrLxfFKh2+HwxxoVmeVfnq1ga
	wykdz/VMSukfi27P1wZnZke93T60guuwnnR0sZpFSC4hfcRpD6p9mrDiyUtZ/7jgRuCm
	BQllwsn5f8nQfm/moOwOZ1UY5Cz8QswmU7gzxkef3L9XrNot7YEqE+TdNR3MmUb9qnXC
	xRzQ==
X-Gm-Message-State: APjAAAXV15LU+Ip7c4PKrjsBl5SCLZsutl+1ZbxyoHrO4OngTVJt4UFJ
	spMd08lyks8RsscIo5p5amDkkg==
X-Google-Smtp-Source: APXvYqy9wOQiD0cDaQJlJnyuv/EjHluS9FITZrvF7AxsMgLhGoLH+6/3ZmZzXYm7VfnKYZpXKUGCJg==
X-Received: by 2002:adf:fd46:: with SMTP id h6mr6600412wrs.170.1551962041697; 
	Thu, 07 Mar 2019 04:34:01 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	o30sm5736556wro.57.2019.03.07.04.33.59
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 07 Mar 2019 04:34:00 -0800 (PST)
Message-ID: <8d5794a8bfe5ac118a77efbdb4b8f712d53116c6.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Zhixiong Chi <zhixiong.chi@windriver.com>, "Burton, Ross"
	<ross.burton@intel.com>
Date: Thu, 07 Mar 2019 12:33:59 +0000
In-Reply-To: <eadbbfcd-6dd6-929e-1fbc-8aee74b5961b@windriver.com>
References: <20190307065138.54589-1-zhixiong.chi@windriver.com>
	<CAJTo0LbsGET5t6AyfgfQ2L=jR01g+uM8Ec0FA5L5nxpchGd49g@mail.gmail.com>
	<eadbbfcd-6dd6-929e-1fbc-8aee74b5961b@windriver.com>
User-Agent: Evolution 3.31.90-1 
MIME-Version: 1.0
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] core-image-minimal-initramfs: add libgcc into the initramfs image
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
X-List-Received-Date: Thu, 07 Mar 2019 12:34:01 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2019-03-07 at 18:00 +0800, Zhixiong Chi wrote:
> It's not for dependency of the package in the initramfs image,
> 
> just for the multithread application while the customer use initramfs
> image.
> 
> Since we use PACKAGE_INSTALL to override the rootfs in the initramfs
> bb 
> file,
> 
> so we couldn't use the IMAGE_INSTALL_append to add the package in
> the 
> local.conf.
> 
> Did you think if it should be added into the image? :-)
> 
> I know the initramfs is just to bootup the system. If the customer
> want to support the multithread app, they can use the other types of
> the image.

The customer needs to depend on libgcc in their app, or their
initramfs, we're not adding random dependencies to the initramfs "just
in case".

Cheers,

Richard





