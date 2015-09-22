Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-ig0-f174.google.com (mail-ig0-f174.google.com
	[209.85.213.174])
	by mail.openembedded.org (Postfix) with ESMTP id DE6B676417
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Sep 2015 18:05:19 +0000 (UTC)
Received: by igbkq10 with SMTP id kq10so85764557igb.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Sep 2015 11:05:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc:content-type;
	bh=Untb2KHwntFd9FuX18GY3xcmbvsMdPLNoWj0S/WI3Zg=;
	b=U3/q0Mn9tzz+5QjUBvWBa/rAZ9vGcdiwd9veb06Z8S/hKjXWN/NXjUxBtTbanOvbkH
	SIJFv0KBRxvcI1BOHRwswd07MeYcHkFrxeQxD+/0mb2O+ou4xdNATz6niXCuxtC20ORK
	lyxmbq4wHB2qG47PzsdZ5Gyr3ZMMsG7URFmRZ8zghJJABZDtO/At1W35ebp6P7Uva9Hm
	pLnBcwjL+sRyMI2T7ER//mnSDHDKjjVS74FEw9DYxcxemPp4RE05ddENcnrL+Qfs9Kfp
	xAwM7xJ9PUXahlQ07y92TKFsKOCEzGfhtz8dka8ATrSglQXrs7c4rYWPnMgVmQey4UAI
	EKLg==
X-Gm-Message-State: ALoCoQmJnmpouV8kFJQE1X6XuucgwrZ1pGrSlDYdCh19Ym2SFUqPYRDCLgLlRbphy36sRAdX0k+X
X-Received: by 10.50.30.106 with SMTP id r10mr18991345igh.69.1442945119751;
	Tue, 22 Sep 2015 11:05:19 -0700 (PDT)
Received: from mail-io0-f175.google.com (mail-io0-f175.google.com.
	[209.85.223.175]) by smtp.gmail.com with ESMTPSA id
	r40sm1680943ioe.20.2015.09.22.11.05.18
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 22 Sep 2015 11:05:19 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by ioii196 with SMTP id i196so22524741ioi.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Sep 2015 11:05:18 -0700 (PDT)
MIME-Version: 1.0
X-Received: by 10.107.131.134 with SMTP id n6mr33216319ioi.192.1442945118648; 
	Tue, 22 Sep 2015 11:05:18 -0700 (PDT)
Received: by 10.36.218.7 with HTTP; Tue, 22 Sep 2015 11:05:18 -0700 (PDT)
In-Reply-To: <560173B5.1000408@mlbassoc.com>
References: <560173B5.1000408@mlbassoc.com>
Date: Tue, 22 Sep 2015 15:05:18 -0300
Message-ID: <CAP9ODKpcr+YgGsvnRrsxy9Z2xsN5+KP4KiP-UvYij5eyN+1V1g@mail.gmail.com>
To: Gary Thomas <gary@mlbassoc.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Error building gdk-pixbuf-native
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
X-List-Received-Date: Tue, 22 Sep 2015 18:05:22 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Sep 22, 2015 at 12:28 PM, Gary Thomas <gary@mlbassoc.com> wrote:
> When building gdk-pixbuf-native, I got this error:
> | DEBUG: Staging files from
> /home/local/rpi2_2015-03-05/tmp/work/i686-linux/gdk-pixbuf-native/2.30.8-r0/sysroot-destdir/home/local/rpi2_2015-03-05/tmp/sysroots/i686-linux
> to /home/local/rpi2_2015-03-05/tmp/sysroots/i686-linux
> | DEBUG: Executing shell function pixbufcache_sstate_postinst
> | g_module_open() failed for
> /home/local/rpi2_2015-03-05/tmp/sysroots/i686-linux/usr/lib/gdk-pixbuf-2.0/2.10.0/loaders/libpixbufloader-svg.so:
> libharfbuzz.so.0: cannot open shared object file: No such file or directory
>
> It seems that [at least] gdk-pixbuf-native needs harfbuzz-native
> I looked at the recipe, but it's not 100% obvious to me how to
> add this, especially w.r.t. all of the PACKAGECONFIG options.
>
> Guidance?

I had similar failures[1] at O.S. Systems autobuilder and rebuilding
made it work.

1. http://ci.ossystems.com.br/view/FSL%20Community%20BSP%20-%20master-next/job/fsl-community-bsp-master-next_wayland-imx28evk/827/console

The builds are now succeeding but I did no change to fix it. This
seems like a race for me.

I tried very hard to reproduce the issue locally at my laptop without
success. Do you can reliably reproduce it?

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

