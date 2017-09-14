Return-Path: <andre.draszik@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 0D2487857F
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Sep 2017 10:26:08 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id 187so2848765wmn.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Sep 2017 03:26:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=2ksYd+RrX5w4YCq2t8aw77u/lnI+dplRlq60ezS2snQ=;
	b=ZJ1ksjOg7p+fPyQRQKPliPFyboXJ7Q+Htt2RtxM8u0EZpeEzIWh1/d/e+EUCiIMEKd
	MKQc0wxHNNrOQZK80NmqTHcng6EYUGj7/kBr1l6X4NHL4q2dvS4RahdeR39biK+4RUPz
	TxWuN/OEExIhfsktsVh5Y3o7uVPwhNJvTnbrgJCTGAkscJ2+Ry4qu8qSDmG9y/ojQ2sJ
	VE6iFqioIYaOYyB0ZdPRwlxnAxzywkaAG6RaPymTRuwP3hISn3xFy1mtDYlhK7PS1XSr
	/odhrnNKOIEfZotTYiBl+gxf8kOPm43ay69rrmpk8WbNq5BAkn1rY0+cNQ6or5mz30pV
	+Apg==
X-Gm-Message-State: AHPjjUj001qGBWth1ZRdqVPtSqVP4+xPjGP+QAgEi7l9EdIw2H8q4D+u
	LZdjn+4eXrA28f8FK8I=
X-Google-Smtp-Source: AOwi7QAKZ0DeTzlpcF6WiombojgW/NV4VXOWcyj+5p9k+ZxGt93GisXeyZ4R2cdCRlmOvc166PZXyA==
X-Received: by 10.28.163.198 with SMTP id m189mr1353496wme.76.1505384769277;
	Thu, 14 Sep 2017 03:26:09 -0700 (PDT)
Received: from tfsielt31850 ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id
	b72sm1384540wmf.30.2017.09.14.03.26.07
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 14 Sep 2017 03:26:08 -0700 (PDT)
Message-ID: <1505384767.19222.4.camel@andred.net>
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <git@andred.net>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Thu, 14 Sep 2017 11:26:07 +0100
In-Reply-To: <CAP9ODKoRrYs0SB1f6GCvFW6fStoEQNYkv7YbMfZdqbhLfGnXJw@mail.gmail.com>
References: <20170912203608.14327-1-otavio@ossystems.com.br>
	<20170912203608.14327-3-otavio@ossystems.com.br>
	<1505290515.32675.4.camel@andred.net>
	<CAP9ODKoRrYs0SB1f6GCvFW6fStoEQNYkv7YbMfZdqbhLfGnXJw@mail.gmail.com>
X-Mailer: Evolution 3.22.6-1 
Mime-Version: 1.0
Subject: Re: [PATCH v8 3/3] kernel-devicetree.bbclass: Add support to generate append to kernel
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
X-List-Received-Date: Thu, 14 Sep 2017 10:26:09 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Wed, 2017-09-13 at 09:30 -0300, Otavio Salvador wrote:
> On Wed, Sep 13, 2017 at 5:15 AM, André Draszik <git@andred.net> wrote:
> > On Tue, 2017-09-12 at 17:36 -0300, Otavio Salvador wrote:
> 
> ...
> > AFAICS, zImage is specific to x86 and arm, all other arches, including
> > MIPS
> > have no zImage Makefile target, so we'll never get here.
> 
> Do you know which types we can use here?

* for CONFIG_MIPS_RAW_APPENDED_DTB this can be either vmlinux.bin, or
  vmlinuz.bin
* for for CONFIG_MIPS_ELF_APPENDED_DTB this should be vmlinux

see other mail :-)

A.


