Return-Path: <andre.draszik@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 85F5D77123;
	Mon,  8 Aug 2016 09:15:55 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id x83so14164008wma.3;
	Mon, 08 Aug 2016 02:15:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=ja9PqtSnsGTJp1Kn7ks02qBujTWWYqMItyUKXUR9SRA=;
	b=AdtczZk4XUlzaz2VwcGdPLqmj03N/wgAQlhtDkkGhofWSpeKHdczx9q2GkpwiSW88F
	akSTf3pKkHSH4BKrMUXH9xyYikj5hDFmWUCf65Js3tsFEBmX2OJnZYTc14GIWUwA4R9r
	Tbe5y0tobsyQ+/LEhQYLkQcC3hBspPk3v+7r9Bki5z+Qi8V68MJpBlogHkQ3CCMZaBwT
	UI0rBexE04vD9WLsramgtQxMuIxhjYG9onAGdHLce+v19IXNwz9UlKGq73ctjBOkba0S
	6GGrjQ46MdhKrcXnmhBE+hWBlQFahV6ZMvL22ePi8Y843yzCCz8gJ24jfaI3j6nFROV0
	5YAw==
X-Gm-Message-State: AEkoouuzbrVGKzxvZ+hdPLY4/qc2opq2gYpONBFySZ/RQ1WDRIoDhY8MTS6C+XL1UTylWQ==
X-Received: by 10.28.57.131 with SMTP id g125mr14092936wma.31.1470647756001;
	Mon, 08 Aug 2016 02:15:56 -0700 (PDT)
Received: from localhost ([185.46.212.59]) by smtp.gmail.com with ESMTPSA id
	p83sm22642281wma.18.2016.08.08.02.15.54
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 08 Aug 2016 02:15:54 -0700 (PDT)
Message-ID: <1470647765.4581.23.camel@andred.net>
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <git@andred.net>
To: Richard Purdie <rpurdie@rpsys.net>, Khem Raj <raj.khem@gmail.com>
Date: Mon, 08 Aug 2016 10:16:05 +0100
In-Reply-To: <1470646210.8166.38.camel@rpsys.net>
References: <CC61EFE1-5F39-4848-AD71-8E9C8DEC43C8@gmail.com>
	<1470637705.8166.29.camel@linuxfoundation.org>
	<8C207C42-3D61-4C3F-A1DE-F305AA6617BA@gmail.com>
	<1470644094.8166.37.camel@linuxfoundation.org>
	<1470646210.8166.38.camel@rpsys.net>
X-Mailer: Evolution 3.20.4-1 
Mime-Version: 1.0
Cc: Yocto Discussion Mailing List <yocto@yoctoproject.org>,
	OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [RFT] binutils 2.27
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
X-List-Received-Date: Mon, 08 Aug 2016 09:15:57 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Mon, 2016-08-08 at 09:50 +0100, Richard Purdie wrote:
> On Mon, 2016-08-08 at 09:14 +0100, Richard Purdie wrote:
> > 
> > On Mon, 2016-08-08 at 00:24 -0700, Khem Raj wrote:
> > > 
> > > > 
> > > > On Aug 7, 2016, at 11:28 PM, Richard Purdie <
> > > > richard.purdie@linuxfoundation.org> wrote:
> > > > 
> > > > On Sun, 2016-08-07 at 01:39 -0700, Khem Raj wrote:
> > > > > 
> > > > > I have put together upgrade for binutils 2.27 here (
> > > > > kraj/master
> > > > > branch )
> > > > > 
> > > > > https://github.com/kraj/openembedded-core/commit/b98f5761d2285f
> > > > > fd
> > > > > 773e
> > > > > c6ecb901b799302ebd6b
> > > > > 
> > > > > I have started bunch of test builds. but I would appreciate any
> > > > > help
> > > > > in testing it out in your
> > > > > environments and report any issues you see.
> > > > 
> > > > I ran this through the autobuilder:
> > > > 
> > > > bitbake world shows issues in libunwind (from gold?):
> > > > 
> > > 
> > > yes, however, use of gold for libunwind in OE was an escape route
> > > where we were relying upon gold’s inability to detect this issue
> > > while BFD linker
> > > was detecting it earlier. Now in 2.27 gold has caught up as well.
> > > 
> > > see
> > > https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;h=6eeb0170
> > > bb
> > > b43ffb73e8f01b8b481adde8194c21
> > > 
> > > so now we have to get to nub of this issue to resolve it.
> > 
> > Ok. I think we also have:
> > 
> > https://autobuilder.yoctoproject.org/main/builders/nightly-ppc/builds
> > /8
> > 96
> > https://autobuilder.yoctoproject.org/main/builders/nightly-ppc/builds
> > /8
> > 96
> > 
> > in that "connmand --help" is segfaulting on ppc. I've not 100%
> > confirmed its the binutils patch but its seeming likely at this
> > point.
> 
> Its also sefgaulting on all mips builds:
> 
> https://autobuilder.yoctoproject.org/main/builders/nightly-mips/builds/883
> https://autobuilder.yoctoproject.org/main/builders/nightly-mips-lsb/builds
> /863
> https://autobuilder.yoctoproject.org/main/builders/nightly-mips64/builds/5
> 28
> 
> :(

binutils 2.27 brings GOLD to mips, but debian has disabled GOLD on all MIPS
for now due to segfaulting... Maybe the same issue...


A.



