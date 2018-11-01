Return-Path: <petr.vorel@gmail.com>
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	by mail.openembedded.org (Postfix) with ESMTP id BB5C079EEF
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Nov 2018 17:58:17 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id q19-v6so2136221wmc.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 01 Nov 2018 10:58:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:subject:message-id:reply-to:references:mime-version
	:content-disposition:content-transfer-encoding:in-reply-to
	:user-agent; bh=lBnC50pUjgF5pVcfUuvBgdbBblWwvLf9S1whWuPi2Tg=;
	b=KUlo3oJJ0LxQKRmuVOJgp+xg2SfjYTK0ywzILeL/NREL4O0wuwoI/fbVxeqGZix2RL
	BhVUbXtrNAhtQK3m71Yt+iJ1Mw3Luwu/DuA6f52JQneHArLOhNIhLFF91y4wGp5gWIZ2
	aM+3VhR8SZZjBs45n/BpOXO2sAcJOn5R1IJbmTqGGfFaULzj9aOGQOhN5MceWKjchVo0
	6nHn30aSQuImfjHgp8a1KXBuYxFQvP8oUGTIqaJDQkc/XjifDT05UUhUDO4wTFwj4chm
	fGy4XvcdQR0szMYGVimmssmv2ifMbzrI70Jwm4YyOCBVgmkTDzbpNyp56qdxY6RXCAA5
	BMFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:reply-to
	:references:mime-version:content-disposition
	:content-transfer-encoding:in-reply-to:user-agent;
	bh=lBnC50pUjgF5pVcfUuvBgdbBblWwvLf9S1whWuPi2Tg=;
	b=I+JWutqisuAaEExCZcfJJZdireC2vMEVPRfqPWqWPxIIbLoyCV/CbLAFJHxwZcOXSD
	ETwKVWBXhZ79yR0iwf8IFHOKc9VSROPABOmUymJ1WAMEsmx8j4SmEWXTMiHfDSV3JE0R
	ljoi96ROMqt7i3V38NdWd8fsHzBP6x3y6OBUSq1qvlK1vKc4MrUQ6DDKnvynglP1b+TU
	+uqTROWqna83YFJRgWh+4+0UbkfpcN3+U/Xn06ki4fYOgaPZAFzhEMQfTOR7ALgmqQnv
	AsUn+5RM6jg7ReGx70GVXL7UL6SKLhda9ja6tnykHI6Gawh/gL0Z++TcNAjk4uElIs/Z
	Ip7w==
X-Gm-Message-State: AGRZ1gLmZG0n0c8cWTaFzjuUM6G7szlFT189FVKdHkxcBuYdDiNr/tfg
	guo0hyKn9syXhRawzQAqmEA=
X-Google-Smtp-Source: AJdET5eJS513jw+V03R7iLn6NlDCmoWT07IVG/eX+j7Ad2gM4sf+4LOyU5KYP5RHcT5X1hkqIdKmEg==
X-Received: by 2002:a1c:b309:: with SMTP id
	c9-v6mr6404325wmf.146.1541095098253; 
	Thu, 01 Nov 2018 10:58:18 -0700 (PDT)
Received: from x230 ([62.201.25.198]) by smtp.gmail.com with ESMTPSA id
	109-v6sm13239493wrb.81.2018.11.01.10.58.17
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 01 Nov 2018 10:58:17 -0700 (PDT)
Date: Thu, 1 Nov 2018 18:58:15 +0100
From: Petr Vorel <petr.vorel@gmail.com>
To: Daniel =?iso-8859-2?Q?D=EDaz?= <daniel.diaz@linaro.org>
Message-ID: <20181101175803.GA22705@x230>
Reply-To: Petr Vorel <petr.vorel@gmail.com>
References: <20181007194243.2264-1-petr.vorel@gmail.com>
	<CAEUSe78cdBVy2A2HVO6jEjaDk6-0h7kuKTH__7NUMthg_PUoow@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAEUSe78cdBVy2A2HVO6jEjaDk6-0h7kuKTH__7NUMthg_PUoow@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2 1/1] ltp: Update to 20180926
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
X-List-Received-Date: Thu, 01 Nov 2018 17:58:18 -0000
Content-Type: text/plain; charset=iso-8859-2
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Hello Daniel,

I've rebased patch for actual master and sent it as v2.
Please use this one.

> > New patches
> > * 0001-statx-fix-compile-errors.patch

> Oh, boy, thanks for finding that patch -- caused me lots of troubles.
:-)

About patches bellow. LTP is full of patches, if you want to have best LTP
use git master branch. That's why I'm for including only build fixes,
release is roughly each 4 months.

I kept patches bellow, let's keep them, but IMHO they're not that important.

> Since you sent v2 of this patch there's been a couple of patches added:
> * 0001-sigwaitinfo01-recent-glibc-calls-syscall-directly.patch
This one was accepted.

> * 0001-netns_helper.sh-use-ping-6-when-ping6-is-not-avaliab.patch
This one as well. There is more effective fix for ping6 for all networking tests
which use new shell API (IMHO the only relevant tests):
7f10a1910 tst_net.sh: Fix ping detection
d57ac0b7a net: Fix missing ping6

> * 0001-open_posix_testsuite-mmap24-2-Relax-condition-a-bit.patch
We're waiting for v2 of this patch.

> Do we want those in?

> > Rebased patches
> > * 0039-commands-ar01-Fix-for-test-in-deterministic-mode.patch

> > Removed removed (accepted in upstream)
> > * 0041-cve-2017-5669-shmat-for-0-or-PAGESIZE-with-RND-flag-.patch
> > * 0042-fs-ftest-ftest06.c-Fix-too-small-name-string-and-rel.patch
> > * 0043-open-creat-skip-S_ISGID-check-on-files-created-by-no.patch

> Patch 0040-read_all-Define-FNM_EXTMATCH-if-not-already-like-und.patch
> also made it upstream, albeit with a different implementation. See
> commit 822ad20433799193e2180862137c36f24e5d27d6.
Well, I haven't replaced this one with upgrade :(.
Shell I post v3? Or will you do it in separate commit?

> Thanks and greetings!

> Daniel Díaz
> daniel.diaz@linaro.org

Kind regards,
Petr

