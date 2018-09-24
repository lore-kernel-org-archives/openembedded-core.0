Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	by mail.openembedded.org (Postfix) with ESMTP id CC85F74598
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Sep 2018 13:38:38 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id o18-v6so10113403wmc.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Sep 2018 06:38:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=1+30uVTfcZ9jqx14V6pL002KmktZBebl7Gjocshs178=;
	b=iKsucs+2+z22TA61gTWCS5deGzeCk5Y28Qdy99rgDLVLM1Gh1p7NUkklNL8LJqy78j
	/3yHM9gi+zaAR+/fdu3+eV57NXzg4QpCA47iwITNksy/U1pM/rrjo6piQvPiIzDSpMGq
	+hV3Sv18kbCH48Y54Bs5K6eAfl+bAOXYCBezM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=1+30uVTfcZ9jqx14V6pL002KmktZBebl7Gjocshs178=;
	b=NH0HW20nwpNTSswR8J3FY0Zo5CXmdhMIWwQvZn9O29wSkLiyFzCLgwcpW05A0+ef85
	zzsKOKF8IA8xnEvVeXU6KEiPte4MulM3UXxa9rPSl5B/PtKiOGBxka/l2fQpiPNugo5r
	5NSoc/40Nj8DO4RJWDgLTSc4lttOepaOZrBQ8D4+L32w/25XA9oL9FC5NLoGpfS36f8s
	G5RGPFICvukMRtUabfqIRkHJSJE2i4j06XLIcqj5oKJiqgOYnvKEZQijP+fqwCFQ/JFB
	KzzQV9u1PiHFOwBhrn71I8T1Nssfzv8lJ1nHOzthelKlIUU1Uk4ANQtNwDN96Eb/P+Jw
	ABKA==
X-Gm-Message-State: ABuFfoiM6/xwYe+fzH/8p90YMcv0d5AuMuUkywNb99d0NiMoRkkelxHw
	6giLUaobZYcTG1WPfwRPm7bWOQ==
X-Google-Smtp-Source: ANB0Vdaw42K1TPIzsHOCia9YRNMj3txwu6YTcfZf0o+1B8V+vpE5/e4rYQj+GA6okh39h0yARae3XQ==
X-Received: by 2002:a1c:99c2:: with SMTP id
	b185-v6mr7706977wme.15.1537796319148; 
	Mon, 24 Sep 2018 06:38:39 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	e16-v6sm8024920wrw.17.2018.09.24.06.38.37
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 24 Sep 2018 06:38:38 -0700 (PDT)
Message-ID: <36b0c47b199a55e4c385f437aad964980c20dd61.camel@linuxfoundation.org>
From: richard.purdie@linuxfoundation.org
To: Mikko.Rapeli@bmw.de
Date: Mon, 24 Sep 2018 14:38:36 +0100
In-Reply-To: <20180924132013.GJ9430@hiutale>
References: <1537530567-8604-1-git-send-email-mikko.rapeli@bmw.de>
	<20180924072539.GE9430@hiutale>
	<CADkTA4MBwLt_7AHDqVfh79KNB_sG58+gGWLz=4KqMg1Qpk1Ngg@mail.gmail.com>
	<20180924121927.GI9430@hiutale>
	<045ad825c6999fe4876a7aa90cb427ca2d0d8c87.camel@linuxfoundation.org>
	<20180924132013.GJ9430@hiutale>
X-Mailer: Evolution 3.28.1-2 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] kernel.bbclass: allow exporting files from kernel recipes to sysroot
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
X-List-Received-Date: Mon, 24 Sep 2018 13:38:39 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2018-09-24 at 13:20 +0000, Mikko.Rapeli@bmw.de wrote:
> On Mon, Sep 24, 2018 at 02:11:13PM +0100, Richard Purdie wrote:
> > On Mon, 2018-09-24 at 12:19 +0000, Mikko.Rapeli@bmw.de wrote:
> > > > That was one old way, but not the only. And not for exposing
> > > > non
> > > > uapi
> > > > headers.
> > > 
> > > What other ways exist?
> > > 
> > > I don't care how, but I must export custom kernel specific
> > > headers
> > > and
> > > other files to other recipes in a build in ways which are
> > > compatible
> > > with
> > > yocto upstream.
> > > 
> > > I have not seen any documented ways for this.
> > 
> > It may not be documented, perhaps because its actually very simple.
> > 
> > Any recipe can expose headers into the recipe sysroot, they simply
> > install them where needed in do_install as normal.
> > 
> > So all you need is a recipe which installs the right headers and
> > then
> > you DEPEND on that recipe. Where that recipe gets the headers isn't
> > relevant.
> 
> No, this does not work on sumo. My patch is needed for this to work.
> 
> Without my patch, users of kernel.bbclass have zero files in
> tmp/sysroot-components even if they install extra files and extra
> header only binary packages.
> 
> A generated image or SDK will have the files if the binary package is
> installed but sysroot not.

I was replying from the perspective of how this should work in general.
I agree that for this to work with a kernel recipe we do need the
change that started this thread and that is probably a reasonable thing
to do.

Cheers,

Richard




