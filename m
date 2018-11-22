Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	by mail.openembedded.org (Postfix) with ESMTP id 0C2B46BA22
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Nov 2018 13:42:31 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id u13-v6so9190811wmc.4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Nov 2018 05:42:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=+/bD9sBTdrSNrPC5eE93XxzaLwogdk2AqpWw/OVi2iI=;
	b=IRz3n9IvWSB07k67bRSQnKf7cn3C4KdDEvY0KCUEyqLNwtF0uw7hVCl2P9VuA3b8LQ
	nryCpywaGBKFj+yQeu/qMqyJ8yHPUuvZ5fhUL0dswhbI11+FTTlGYcs8gsVxDVYUL90u
	dFhoZk9O2FbcpbebA69OE7h6/9IJ6SkC9PyRo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=+/bD9sBTdrSNrPC5eE93XxzaLwogdk2AqpWw/OVi2iI=;
	b=EG8uUrgt2BRTTTmx5R4V7FIwL8QrQZMUsRPAE5TF/YB8JkdFQuEqyrrhT2G/OWmk+Q
	y6THKTfQmzAQ7zf3b/eD1H/W4M21hCa7DZwj9jtLMyiBDYM+Ef2Yr86spwfVKdSf1DdE
	YerWRuN+daFsjaYfzpRCbdxqBY7Jv9ZcnS9wEhhILloBXeXO+AEAcI59KusQLL5wX+Bs
	meqpq3gtCsR8Qk7rXZSfwOtgazHHN1ZVMjbQ/TEP7JSmJcBpk1t8Yva8/fLPRk/cd6RJ
	C+oYtZl3kxNxlm+DmQXoIV1t71VkOYvjVfhzRPhwdUSivqmGo9N0gDTSJOO47fKUpV4N
	+PzQ==
X-Gm-Message-State: AA+aEWakJB/fx27mZGHDw/UE9LYuc3zM/xaZAFkgsgutPsZvQUxK+2Mp
	ddOfSRkV8JxcEPmvzSLOlmqp+A==
X-Google-Smtp-Source: AFSGD/WxAkK5QRZD7lV9q+WrqNMULQvtitl7oqPoB4J8RYULStE3ZHnC1+ZEqIYZMf7GYZUVKswY5w==
X-Received: by 2002:a7b:c245:: with SMTP id b5mr7949071wmj.42.1542894152455;
	Thu, 22 Nov 2018 05:42:32 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	x79sm9715631wmd.42.2018.11.22.05.42.31
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 22 Nov 2018 05:42:31 -0800 (PST)
Message-ID: <ec8e8102f61407b19a6341a77858f7d825cab603.camel@linuxfoundation.org>
From: richard.purdie@linuxfoundation.org
To: Alexey Brodkin <alexey.brodkin@synopsys.com>, 
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Date: Thu, 22 Nov 2018 13:42:30 +0000
In-Reply-To: <dee5be3f45002c06f318bf633364aa842548cef8.camel@synopsys.com>
References: <20181122082807.39508-1-abrodkin@synopsys.com>
	<dee5be3f45002c06f318bf633364aa842548cef8.camel@synopsys.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
Cc: "marex@denx.de" <marex@denx.de>,
	"otavio@ossystems.com.br" <otavio@ossystems.com.br>,
	"linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>
Subject: Re: [PATCH v6] u-boot: Add mkenvimage tool
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
X-List-Received-Date: Thu, 22 Nov 2018 13:42:32 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2018-11-22 at 13:18 +0000, Alexey Brodkin wrote:
> Hi, Richard, Otavio,
> 
> On Thu, 2018-11-22 at 11:28 +0300, Alexey Brodkin wrote:
> > This utility is used for creation of images containing
> > usable in run-time U-Boot environment.
> > 
> > As of today this utility is added per-board like here [1]
> > for Intel Edison board.
> > 
> > [1] 
> > http://git.yoctoproject.org/cgit/cgit.cgi/meta-intel-edison/tree/meta-intel-edison-bsp/recipes-bsp/u-boot/u-boot-tools_2014.04.bb
> > 
> > Given there're quite some U-Boot tools that we may want to add
> > later
> > this recipe name switch from "u-boot-mkimage" to generic "u-boot-
> > tools"
> > still for compatibility we provide "u-boot-mkimage" with help
> > of PROVIDES as well as proposed "u-boot-mkenvimage".
> > 
> > Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
> > Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
> > Cc: Otavio Salvador <otavio@ossystems.com.br>
> > Cc: Martin Jansa <martin.jansa@gmail.com>
> > Cc: Ross Burton <ross.burton@intel.com>
> > Cc: Marek Vasut <marex@denx.de>
> > ---
> > 
> > Changes v5 -> v6:
> >  * Really enable separate  pakaging of mkimage and mkenvimage
> > 
> > Changes v4 -> v5:
> >  * Added backward compatibility with "u-boot-mkimage" recipe
> >  * Improved handling of nativesdk
> >  * Update all references from "u-boot-mkimage" to "u-boot-tools"
> > 
> > Changes v3 -> v4:
> >  * Updated maintainer info to make Yocto autobuilder happy again
> > 
> > Changes v2 -> v3:
> >  * Recipe renamed to "u-boot-tools" to better match its contents
> >    (especially in the future as we add more tools there)
> >  * Existing "u-boot-mkimage" and newly introduced "u-boot-
> > mkenvimage"
> >    made avaialble via PROVIDES
> > 
> > Changes v1 -> v2:
> >  * Got rid of a separate recipe and instead added mkenvimage
> >    to u-boot mkimage recipe
> 
> So apparently something is still broken :(
> ------------------------->8-------------------------------
> NOTE: Resolving any missing task queue dependencies
> ERROR: Nothing RPROVIDES 'u-boot-tools-native-mkimage-native' (but
> virtual:native:.../openembedded-core/meta/recipes-bsp/u-boot/u-boot-
> tools_2018.07.bb RDEPENDS on or otherwise requires it)
> 
> NOTE: Runtime target 'u-boot-tools-native-mkimage-native' is
> unbuildable, removing...
> Missing or unbuildable dependency chain was: ['u-boot-tools-native-
> mkimage-native']
> 
> ERROR: Required build target 'core-image-base' has no buildable
> providers.
> Missing or unbuildable dependency chain was: ['core-image-base',
> 'virtual/kernel', 'u-boot-tools-native', 'u-boot-tools-native-
> mkimage-native']
> ------------------------->8-------------------------------
> 
> Indeed "u-boot-tools-native-mkimage-native" looks quite odd.
> 
> Any hints on how that could be addressed?

Just guessing but maybe

RDEPENDS_${PN}_class-native = ""

?

Cheers,

Richard


