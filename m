Return-Path: <jpewhacker@gmail.com>
Received: from mail-it0-f47.google.com (mail-it0-f47.google.com
	[209.85.214.47])
	by mail.openembedded.org (Postfix) with ESMTP id 4B9B87888F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Dec 2017 17:56:47 +0000 (UTC)
Received: by mail-it0-f47.google.com with SMTP id x28so546816ita.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Dec 2017 09:56:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:message-id:subject:to:cc:in-reply-to:references:date
	:mime-version:content-transfer-encoding;
	bh=gDuT4eHQkXepbrAog+2RheJK5VuYt4jLJgp98zDdlxM=;
	b=jF7j7eNZyLT/bgQ5jcsJFPrYxfLD6rIUBaEqId+sFBkiW/4QsCu7tcsWzOpL0T3mZC
	9E/I5C1gJWoEWjfcxh2E/kDt7shxik8MMk0FY7hI5gkBwXzfdAICwoh7xiQN5/8m+bAe
	XP0HMee7k6X/uJzEzWFLDYoNnRJ9hMEIoAPOrAfDI7a7uYODwRnIjv5EAvznlTki6OHj
	/vWzIevfarBhziYNuSNmfkzHuI8tZcVAtPXjTTCbtKN59zZVko0anKmFhDINJ0+y6XH1
	QmpH9W25oaZ+Ga4npG/rRL4fKVVQxF0ee174tY8WH7kMuKrQg2qsrveb8se7EYBz813S
	Q14w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:message-id:subject:to:cc:in-reply-to
	:references:date:mime-version:content-transfer-encoding;
	bh=gDuT4eHQkXepbrAog+2RheJK5VuYt4jLJgp98zDdlxM=;
	b=HLVS8dO1dGmygX878B87xyQA/12Fd2CSirWoZXlsk2MyICaOBNJdm8Mix1nqkAaaWp
	M1eGkP85zJhhd8AU20Aa+Pg6Ox0JCDbfDFewAbSWH/MbDf9z7uzynn+jZeLhrZl+Ut2C
	Vm7/DZ4k4EHD8yVbXUz+3ltOOVI8+Ph61L3ciRdbv8v//we3zajRn7TUI/EcA/QXj8ym
	xWvGQluX/y8tF/LfmO07erOQtnlCUoLaup5ZuEdy2J0Zm6YT7CEMhicWEAmVuxnNcBba
	Si8SxO6eNDamJ5s8NZR6o6847nIkdEPUr93q33j2W9+dV1OLzk6f2hmVPKsA4u1fyhmd
	5hlg==
X-Gm-Message-State: AKGB3mJBHX0r8XYyhh+wV9OMO/JVcPdP9X7o0/AcfUYrdkvapz6B7s7E
	Xhc6ovD0bUSI7IhE2EVhLuE=
X-Google-Smtp-Source: ACJfBovS83AnoKXy/OpOhrKod/JtiBhUHInqZu7AyVjJ2as8KCgXFuDjJ6bkao4ZUabH6UKdQoovsw==
X-Received: by 10.107.107.6 with SMTP id g6mr6705743ioc.305.1513101409097;
	Tue, 12 Dec 2017 09:56:49 -0800 (PST)
Received: from ola-842mrw1.ad.garmin.com ([204.77.163.55])
	by smtp.googlemail.com with ESMTPSA id
	t188sm47606ita.23.2017.12.12.09.56.48
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 12 Dec 2017 09:56:48 -0800 (PST)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
Message-ID: <1513101288.9676.31.camel@gmail.com>
To: Stefan Agner <stefan@agner.ch>, Otavio Salvador
	<otavio.salvador@ossystems.com.br>
In-Reply-To: <773c1d79355fe916a4b41cb79ff89b72@agner.ch>
References: <20171212132755.30556-1-stefan@agner.ch>
	<CAJTo0LaPCqFQ9asGmRUpEZ4G146GT42j0xQvMVpsW3xOeddN4Q@mail.gmail.com>
	<abb98b6343d1fe28ec45a0243cc5ec1d@agner.ch>
	<CAJTo0LYBEhgD6vc07pVk_QMCkHjLXGFP9RazatMM_nOL-8RjVw@mail.gmail.com>
	<370cbd8d94d10bbb85e12e08b742f060@agner.ch>
	<CAP9ODKrZ+5JKO-KkF88LcL8aE+DY5svJ5to8_XfDyeA7hxY-ig@mail.gmail.com>
	<773c1d79355fe916a4b41cb79ff89b72@agner.ch>
Date: Tue, 12 Dec 2017 11:54:48 -0600
Mime-Version: 1.0
X-Mailer: Evolution 3.26.2 (3.26.2-1.fc27) 
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	Stefan Agner <stefan.agner@toradex.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] waf.bbclass: explicitly pass bindir and libdir
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
X-List-Received-Date: Tue, 12 Dec 2017 17:56:48 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2017-12-12 at 16:56 +0100, Stefan Agner wrote:
> On 2017-12-12 16:47, Otavio Salvador wrote:
> > On Tue, Dec 12, 2017 at 12:38 PM, Stefan Agner <stefan@agner.ch>
> > wrote:
> > > On 2017-12-12 15:13, Burton, Ross wrote:
> > > 
> > > > On 12 December 2017 at 14:03, Stefan Agner <stefan@agner.ch>
> > > > wrote:
> > > > 
> > > > > On 2017-12-12 15:00, Burton, Ross wrote:
> > > > > 
> > > > > > On 12 December 2017 at 13:27, Stefan Agner <stefan@agner.ch
> > > > > > > wrote:
> > > > > > 
> > > > > > > On some build hosts distros (e.g. Fedora 26) waf tries to
> > > > > > > be
> > > > > > > smart about libdir detection and defaults to
> > > > > > > [EXEC_PREFIX/lib64].
> > > > > > > This obviously is not what we want for 32-bit targets and
> > > > > > > usually
> > > > > > > fails in the do_package phase:
> > > > > > > WARNING: gstreamer1.0-plugins-imx-0.13.0-r0 do_package:
> > > > > > > QA Issue: gstreamer1.0-plugins-imx: Files/directories
> > > > > > > were installed but not shipped in any package:
> > > > > > > /usr/lib64/libgstimxcommon.so.0
> > > > > > > 
> > > > > > > Waf knows prefix, bindir and libdir as default options.
> > > > > > > Explicitly
> > > > > > > pass those three.
> > > > > > 
> > > > > > Obviously not.
> > > > > > 
> > > > > > ERROR: eglinfo-x11-1.0.0-r0 do_configure: Function failed:
> > > > > > do_configure (log file is located at /data/poky-
> > > > > > tmp/master/build/work/corei7-64-poky-linux/eglinfo-
> > > > > > x11/1.0.0-r0/temp/log.do_configure.17278)
> > > > > > ERROR: Logfile of failure stored in: /data/poky-
> > > > > > tmp/master/build/work/corei7-64-poky-linux/eglinfo-
> > > > > > x11/1.0.0-r0/temp/log.do_configure.17278
> > > > > > Log data follows:
> > > > > > > DEBUG: Executing shell function do_configure
> > > > > > > waf [commands] [options]
> > > > > > > 
> > > > > > > Main commands (example: ./waf build -j4)
> > > > > > >   build    : executes the build
> > > > > > >   clean    : cleans the project
> > > > > > >   configure: configures the project
> > > > > > >   dist     : makes a tarball for redistributing the
> > > > > > > sources
> > > > > > >   distcheck: checks if the project compiles (tarball from
> > > > > > > 'dist')
> > > > > > >   distclean: removes the build directory
> > > > > > >   install  : installs the targets on the system
> > > > > > >   list     : lists the targets to execute
> > > > > > >   step     : executes tasks in a step-by-step fashion,
> > > > > > > for debugging
> > > > > > >   uninstall: removes the targets installed
> > > > > > >   update   : updates the plugins from the *waflib/extras*
> > > > > > > directory
> > > > > > > 
> > > > > > > waf: error: no such option: --bindir
> > > > > 
> > > > > Hm, eglinfo seems to come with a old waf version, 1.7.8 to be
> > > > > specific.
> > > > > 
> > > > > It seems bindir/libdir got added in 1.8 series:
> > > > > https://github.com/waf-project/waf/blob/waf-1.8/waflib/Option
> > > > > s.py
> > > > > 
> > > > > Make version specific variables?
> > > > 
> > > > That neatly shows where the "clever code" that was breaking
> > > > libdir earlier is:
> > > > 
> > > > https://github.com/waf-project/waf/commit/823b4cd2dc03d06a81e0a
> > > > b003606067da03d8745#diff-b44b0c8f383b2fd1b19f2ba039d30237
> > > > 
> > > 
> > > Yeah that seems to be it.
> > > 
> > > That go added in the 1.8.6 dev cycle afaik.
> > > 
> > > I am thinking about adding some kind of version autodetection
> > > 
> > > WAFMINOR=$(${S}/waf --version | sed -e '1{s/waf [0-9]\.//;s/\.[0-
> > > 9]*
> > > (.*//};q')
> > > 
> > > if [ $WAFMINOR -gt "7" ] ...
> > > 
> > > Maybe there is a nicer way of doing this?
> > 
> > What about we provide a package waf version and replace the
> > binaries
> > prior building? So we know what version we'd be using. Kinda
> > autoreconf run in autotools class.
> 
> Waf seems to be extensible using wscript. I don't know how exactly
> wscript depends on waf (version) and whether the API is considered
> stable...
> 
> I'd rather prefer not taking chances...

I agree.

Using a "packaged waf" is against one of the philosophies of waf.
Consequently, this is one of the reasons software built with waf has
trouble getting into things like Debian packages. 

Also, from expirence this is probably not a good idea for 2 reasons:
 1) Different versions of waf behave differently and it can cause
strange build issues if you replace the version a package is normally
built and tested with
 2) A project can "prebuild" waf with all the extra tools it wants. If
there was a packaged version of waf it would have to include every tool
possible, which can be imposible if there are custom project tools
which have been prebuilt. I don't know how common it is to include
custom project tools into the prebuilt waf, but it is certainly
possible.

> 
> --
> Stefan

