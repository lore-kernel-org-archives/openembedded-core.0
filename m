Return-Path: <sakoman@gmail.com>
Received: from mail-oa0-f43.google.com (mail-oa0-f43.google.com
	[209.85.219.43])
	by mail.openembedded.org (Postfix) with ESMTP id 6FDFB6007C
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Jun 2013 16:34:05 +0000 (UTC)
Received: by mail-oa0-f43.google.com with SMTP id i7so13683554oag.30
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Jun 2013 09:34:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=kn8i3TLromAG+5ScgKjo8hBmLIS+9b4nug9tzc8+1rI=;
	b=ad2Hu90Zv9ONvRuR1Bwll3NRvgUbyyten4YCB58loxGzpLlP8i4Cbz3lfPSCW+D9fz
	fV4JOZuIobMHOyejd8WEGR1rBPCOMYq5ozEz59XpYeAGh2fBnOW35pmP0Viv0lYtO0KZ
	Nd0xsRW1msNF+5kFwXpRT4H5TAk6Jnd5lpzKBt1UC7394HVyiPcQYTl1Bl/CFoGhYJcQ
	be5SsQSyqrhhAcCv+GiNZRxzRgrPeacPsB7Xu18RLW83Ld+0VvgRuDQY2tgc0d8PyAbP
	zWKnPuf3nZHL7DLFAFF2nbS7Wt6cy3xVBkjPGV4iATCpihqrN9fymoQH7F3pBV+YtXAz
	GIsQ==
MIME-Version: 1.0
X-Received: by 10.60.123.18 with SMTP id lw18mr13118231oeb.81.1372178045828;
	Tue, 25 Jun 2013 09:34:05 -0700 (PDT)
Received: by 10.182.213.130 with HTTP; Tue, 25 Jun 2013 09:34:05 -0700 (PDT)
Date: Tue, 25 Jun 2013 09:34:05 -0700
Message-ID: <CAGDS+nmpNmSwSV9qW3aQ22BBkss1PhCVtg7A-JzSx+bL-ngqCQ@mail.gmail.com>
From: Steve Sakoman <sakoman@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Qt embedded, touchscreens, and cursors
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
X-List-Received-Date: Tue, 25 Jun 2013 16:34:05 -0000
Content-Type: text/plain; charset=ISO-8859-1

I'm new to the Qt world, so perhaps this is a stupid question . . .

I'm helping a client create a custom layer for their touchscreen based
hardware and Qt applications.

They've decided to use Qt4e and we are including the stock danny qt4e
binaries in the image.

All works as desired with one exception:  the Qt cursor appears at app
launch time with a green 16x16 background, converts to the app
background shortly thereafter, and then stays on the screen until the
first time you touch the screen, then disappears and stays gone.

Some quick googling indicates this is a common problem with touchsceen
Qt implementations and that there are no satisfactory runtime
solutions.  The most often recommended solution is to disable the
cursor at build time with -no-feature-CURSOR added to the Qt config
options.  This option is also claimed to give a significant
performance boost.

I tried adding a bbappend to add this option, but as some of the above
mentioned sources indicated the Qt build will fail unless you disable
demos, examples, and a couple of other build features.  I started
going down this path but I suspect it will require changes to the base
Qte recipe.

Have others run into this issue?  I suspect that most target hardware
for Yocto builds are touchscreen based, so this will likely come up
over and over again.

Any suggestions?

Steve

