Return-Path: <andre.draszik@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id A0065731A5
	for <openembedded-core@lists.openembedded.org>;
	Fri,  2 Sep 2016 11:27:24 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id c133so2465908wmd.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 02 Sep 2016 04:27:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=ivsF21/hITlOMleJbvE6OHgutBTHPYlCGTHndO8ZmOM=;
	b=cpnpE4GGC+bTaKTp+lQWiqqQluhuttKotaCi8l4nSgEMaEABoKklmAn3ttarCJk6Gy
	XWN6bN721RyuFpInloSy/1DRPUNjRksf9znhQw3kG10aTo2OY31VwIu+gbfxU3PMF0Jp
	hJQEbSsq/CTgtX2OKj3e4E28v/VPs3A3S5lG36OMEIikcdZyf1jh1enTUhElwahaKqvX
	J/Wqs11+NuVZ2ftQV1tymT6H8e67t/1qHDb/RO3xN4n3ONLpDsPn8tNMHnk/CsEb8tgg
	NIVV+wWmmMETvRZNX5XM/NDJcFOYnjfMH7Kf5CjWpHlhoJbhelhhfFjkBzcTXmmyElzY
	XKtw==
X-Gm-Message-State: AE9vXwMAnkYN4g8L0SfB2PPxL7hTA4MqpsZ+8vUtoLKM7WkacaTedyOrpJdWeDuWZEG3cg==
X-Received: by 10.194.97.17 with SMTP id dw17mr18967683wjb.8.1472815644763;
	Fri, 02 Sep 2016 04:27:24 -0700 (PDT)
Received: from localhost ([185.46.212.59])
	by smtp.gmail.com with ESMTPSA id c16sm3177801wme.4.2016.09.02.04.27.23
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 02 Sep 2016 04:27:23 -0700 (PDT)
Message-ID: <1472815640.9440.45.camel@andred.net>
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <git@andred.net>
To: Robert Yang <liezhi.yang@windriver.com>
Date: Fri, 02 Sep 2016 12:27:20 +0100
In-Reply-To: <4c8005dd-65b2-145d-86aa-5470cd21b2e8@windriver.com>
References: <cover.1472794137.git.liezhi.yang@windriver.com>
	<b506d54a2cb91ebf6e166775b9f05c0311c650d0.1472794137.git.liezhi.yang@windriver.com>
	<1472804818.9440.14.camel@andred.net>
	<4c8005dd-65b2-145d-86aa-5470cd21b2e8@windriver.com>
X-Mailer: Evolution 3.20.5-1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] libnl: remove RREPLACES and RCONFLICTS for libnl-genl
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
X-List-Received-Date: Fri, 02 Sep 2016 11:27:26 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Fr, 2016-09-02 at 17:53 +0800, Robert Yang wrote:
> Good questions, the libnl-genl2 in provides is introduced by
> REPLACES_${PN}-genl = "libnl-genl2", so libnl-genl2 should be preserved.
> And there was no libnl-genl.rpm in the past, but libnl-3-genl.rpm,
> please see commit message for more info.
> 
> Here is the updated patch:
> 
>    git://git.openembedded.org/openembedded-core-contrib rbt/libnl
>    http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=
> rbt/libnl
> 
> Robert Yang (1):
>    libnl: fix RREPLACES and RCONFLICTS for libnl-genl
> 
> 
> Subject: [PATCH 1/1] libnl: fix RREPLACES and RCONFLICTS for libnl-genl
> 
> The libnl-genl.rpm provides libnl-genl-3-200 after the following 2 fixes:
> libnl: update to v3.2.28
> libnl: fix packaging mistakes
> 
> $ rpm -qp --provides 
> tmp/deploy/rpm/core2_64/libnl-genl-3-200-3.2.28-r0.4.core2_64.rpm
> elf(buildid) = 4e753b2361ba0b02f162244a87cc0680796e46cc
> libnl-genl = 3.2.28
> libnl-genl-3.so.200()(64bit)
> libnl-genl-3.so.200(libnl_3)(64bit)
> libnl-genl2
> libnl-genl-3-200 = 1:3.2.28-r0.4
> 
> Note, the libnl-genl2 is introduced by REPLACES_${PN}-genl = "libnl-
> genl2".

Ah, ok. And so is the last line, libnl-genl-3-200, I suppose. (The IPK
backend doesn't seem to do that)

> So that we don't need set libnl-genl-3-200 in the RREPLACES and
> RCONFLICTS, otherwise it would cause do_rootfs errors when install both
> libnl-genl.rpm and lib32-libnl-genl.rpm:
> 
> Computing transaction...error: Can't install 
> libnl-genl-3-200-1:3.2.28-r0.0@core2_64: conflicted package 
> libnl-genl-3-200-1:3.2.28-r0.0@lib32_x86 is locked
> 
> We didn't meet this error before was because there was no libnl-genl.rpm,
                                                            ^^^^^^^^^^^^^^^
Should that be libnl-genl-3-200.rpm ?

> but libnl-3-genl.rpm, and it doesn't provide libnl-genl-3-200 by default.

OK.

So now that there is nothing in ${bindir} of the -genl package anymore, it
applies the normal package renaming using the SONAME, resulting in libnl-
genl-3-200.

Whereas previously it used ${PN}-genl as package name, where PN was set to
libnl-3 during package creation. Why was it libnl-3 (why did it not use
libnl-3-200 as prefix)?

Cheers,
Andre'


