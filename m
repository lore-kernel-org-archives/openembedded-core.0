Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	by mail.openembedded.org (Postfix) with ESMTP id D7FEE7961F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Sep 2018 12:27:52 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id y13-v6so2122392wmi.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Sep 2018 05:27:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=qKTnoVOs+xQB14jZWeY86TyiO+pUHmed6QFpYiiOqY0=;
	b=S4WAGmc4p5NFvXZQHHeTkBScjdpvFgemEgxya8fyYBB5c7I9Q/d0l9i2WEKrkN2Zew
	upvnhOhKbpBw/MTXO+xJ1ay7/J25hJXt5zkXZ0rZCz2ikhuU8epBltCriPStNpmtCHEl
	okY1GfmZOk0GBcpk5DxcJiM3ilx+J1cvSBTn8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=qKTnoVOs+xQB14jZWeY86TyiO+pUHmed6QFpYiiOqY0=;
	b=SH+zWbfUhW/juAv9roiTWgCiuMujCX939db3+sAuGwwOaaHJYFh1Q9bXJ1vcL0HtDC
	7tg1/ibI5SlHpC82O4oSBT2OTLlbzHGdQqYZBsGR6MLqtfQ+OkyGx24sb8/sCJ95kGq6
	9y/E09uVpxvZ5FNBEHS2jry3hRr6EB3pvRmkrPhcvi9xBfDJQMXw5GXb8/OY+fOVtHJX
	khZ0AaZcB1xPkzxFSSLLi2lH3QI9RwxG1u8Qj42Lvjll+rh12+yrJnElX8mO3MpkQB74
	v3yOpAZqt0pbmWrZxRmdfF+n/bLKXubr2qy4HLtsoVIQfY2lXcpWIvHGjYfCK13b6H2d
	6IEQ==
X-Gm-Message-State: ABuFfohfqzDZvYedPs4ghM1jMGwLCa2ym8xZz5LQXFu/Ur0IKKNaO3Jz
	e1PHDrpHMKiDwSYf5JKHYZFNxA==
X-Google-Smtp-Source: ACcGV624LJDJcOdx3RUS+wK8/xb05d1c0irJg6lCS9H7xt+isZ9IwSvMdP1G4baytMITEE1zTbgp9g==
X-Received: by 2002:a1c:889:: with SMTP id
	131-v6mr4055876wmi.142.1537964873539; 
	Wed, 26 Sep 2018 05:27:53 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	s2-v6sm10405726wrn.83.2018.09.26.05.27.51
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 26 Sep 2018 05:27:52 -0700 (PDT)
Message-ID: <2a024a84749d6b6a838c92efad8a2ddf7f262dbe.camel@linuxfoundation.org>
From: richard.purdie@linuxfoundation.org
To: Andrej Valek <andrej.valek@siemens.com>, Khem Raj <raj.khem@gmail.com>
Date: Wed, 26 Sep 2018 13:27:51 +0100
In-Reply-To: <7f369514-092a-6a76-0262-ac9a84309b10@siemens.com>
References: <711648b8-d33e-3f5d-1ce2-c130ce066166@siemens.com>
	<b747d8c76cefee96ac29304de59799b4f5da0050.camel@linuxfoundation.org>
	<7f369514-092a-6a76-0262-ac9a84309b10@siemens.com>
X-Mailer: Evolution 3.28.1-2 
Mime-Version: 1.0
Cc: "bluehills7@comcast.net" <bluehills7@comcast.net>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: SDK and out of tree modules
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
X-List-Received-Date: Wed, 26 Sep 2018 12:27:53 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2018-09-26 at 14:22 +0200, Andrej Valek wrote:
> Hello Richard,
> 
> I am working on derivate of pyro branch.
> So I have setup new machine based on master (without my
> modifications),
> but the problem is still there.
> 
> What I have made:
> IMAGE_INSTALL += "kernel-devsrc"
> 
> core-image-minimal -c populate_sdk_ext
> 
> Now the manifests in directory have different names:
> $ find . -name "*kernel*"
> ./manifest-qemuarm-kernel-devsrc.populate_lic
> ./manifest-qemuarm-kernel-devsrc.package
> ./manifest-qemuarm-kernel-devsrc.packagedata
> ./manifest-qemuarm-kernel-devsrc.package_write_rpm
> ./manifest-qemuarm-kernel-devsrc.package_qa
> 
> So now allarch has been replaced by qemuarm. Seems to be, that
> something
> has been changed in PKG_ARCH.
> 
> But warnings are still the same:
> WARNING: core-image-minimal-1.0-r0 do_sdk_depends: Manifest
> build/tmp/sstate-control/manifest-x86_64_x86_64-nativesdk-kernel-
> devsrc.populate_sysroot
> not found in qemuarm armv5te armv5e armv5t armv5 armv4t armv4 arm
> allarch x86_64_x86_64-nativesdk (variant '')?
> WARNING: core-image-minimal-1.0-r0 do_populate_sdk_ext: Manifest
> build/tmp/sstate-control/manifest-x86_64_x86_64-nativesdk-kernel-
> devsrc.populate_sysroot
> not found in qemuarm armv5te armv5e armv5t armv5 armv4t armv4 arm
> allarch x86_64_x86_64-nativesdk (variant '')?
>
> But why is trying to find nativesdk manifests instead of qemuarm? 

It will search all the PACKAGE_ARCHS variants in order.

> Isn't it caused by IMAGE_INSTALL in populate task?
> Anyway, the problem is the same. Still couldn't find the
> .populate_sysroot manifest file due to mentioned [noxec].

I've given this a fair bit of thought. Could you try replacing the
[noexec] with:

deltask do_populate_sysroot
deltask do_populate_sysroot_setscene

I think thay may be the right fix. Whether it causes other issues,
we'll see...

Cheers,

Richard



