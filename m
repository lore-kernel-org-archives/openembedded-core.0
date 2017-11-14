Return-Path: <patrick.ohly@intel.com>
Received: from mail-wr0-f178.google.com (mail-wr0-f178.google.com
	[209.85.128.178])
	by mail.openembedded.org (Postfix) with ESMTP id CF6DC784F7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Nov 2017 16:09:29 +0000 (UTC)
Received: by mail-wr0-f178.google.com with SMTP id y9so17969815wrb.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Nov 2017 08:09:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:organization:mime-version:content-transfer-encoding;
	bh=gJfQsYc7IzT7dxTQVYJZhKY0yNiXeuNrmfkn4gi1/W8=;
	b=DytOkI5kwSZJJY+dByBjXZ+g9LrLZrDy5lzqpj768q7U04IddtKX1neT+pYUGiYpbR
	8pc2PQFna4cKf6aQxnOsrLE5t6tpbI6Js43++oMraLn/alwAGTMURQ+yaRB7NvuKE5XA
	4d3kK3+rn2zjxDftpSe1lzTSgIvVHifesc3fHQub1tV7iyjJj04OzlIGW8qAGVcR3nKw
	yI0V/4fAWfkGwEeeoneeLh4v7zXVyZFOX3YNFDrPLfREu7Da/a/WhWGfx7p6sTAcgJ2n
	OD184hSNDGV8WVgCUIwO2+4voq833hKR6QdsnlAJRYHMSVU7AxOB3gklJr0kmzQMc4ny
	JdgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:organization:mime-version:content-transfer-encoding;
	bh=gJfQsYc7IzT7dxTQVYJZhKY0yNiXeuNrmfkn4gi1/W8=;
	b=qWOwcLZavgqOaEqIpbnPL5E9y4wbYYHrUR7rG5xZ9DeMVI93Qnx9hCTf37ZbZm1aei
	etLaIhawJuTmBXtMqrY4QVNWK/dBwMjxfTozmoR/Y6FmNXQFmOS5wcJtLLP7FIoh90sU
	cHWml+Trs/nFUvPDKv9XDhkZbOT+DlSG0pmlTDkuIGZ9QD0STNz1ICW72SpfmUlDTkt7
	nnxkfQGGUyu1m5cA5y47MouOBUuEELV5BpkWC8BOK9OHC68kSCW/jOtrKGq/0Rm649LV
	OnrkzCu/uX/SWKBrO0KlMbFfas/4OPSAEWGt9+OjounC0faCgmx4TwsmvVy32a5BY5Rp
	F+nw==
X-Gm-Message-State: AJaThX5Z4yIzO6vb6PGFj2bz3dm3jniki3DJPwZHduCuDiHMssjgtTUx
	QAHJXynu1BPa8H1g42+dPpUHA2Q=
X-Google-Smtp-Source: AGs4zMbfcoW0EpIF3kgwlEvV5Aq8wsHrSv88UiTfmdjBQSNPjgxHzpMDGoY2cH5MUnVd1LV/OEBvxQ==
X-Received: by 10.223.186.71 with SMTP id t7mr9913965wrg.75.1510675770276;
	Tue, 14 Nov 2017 08:09:30 -0800 (PST)
Received: from pohly-mobl1 (p54BD5874.dip0.t-ipconnect.de. [84.189.88.116])
	by smtp.gmail.com with ESMTPSA id w5sm9698332wre.18.2017.11.14.08.09.28
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 14 Nov 2017 08:09:29 -0800 (PST)
Message-ID: <1510675768.5979.9.camel@intel.com>
From: Patrick Ohly <patrick.ohly@intel.com>
To: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
Date: Tue, 14 Nov 2017 17:09:28 +0100
In-Reply-To: <20171114100939.12d4c1df@lsandov1-mobl2.zpn.intel.com>
References: <20171113181721.79781-1-leonardo.sandoval.gonzalez@linux.intel.com>
	<1510647870.5979.4.camel@intel.com>
	<20171114100939.12d4c1df@lsandov1-mobl2.zpn.intel.com>
Organization: Intel GmbH, Dornacher Strasse 1, D-85622 Feldkirchen/Munich
X-Mailer: Evolution 3.22.6-1+deb9u1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2 1/2] scripts/oe-selftest: oe-selftest-internal wrapper scripts that isolates execution
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
X-List-Received-Date: Tue, 14 Nov 2017 16:09:30 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Tue, 2017-11-14 at 10:09 -0600, Leonardo Sandoval wrote:
> On Tue, 14 Nov 2017 09:24:30 +0100
> Patrick Ohly <patrick.ohly@intel.com> wrote:
> 
> > On Mon, 2017-11-13 at 10:17 -0800,
> > leonardo.sandoval.gonzalez@linux.intel.com wrote:
> > > From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.c
> > > om>
> > > 
> > > The main idea is to isolate the oe-selftest execution so neither
> > > the
> > > current build dir nor the configuration data is touch/polluted.
> > > This
> > > approach uses a wrapper script (which is the one presented on
> > > this
> > > commit) which creates a unique directory and inside it copies all
> > > scripts and metadata, re-initializes the enviroment (re-sources
> > > oe-
> > > init-build-env) and finally launches the oe-selftest-internal
> > > (which
> > > used to be oe-selftest) command, passing command arguments to the
> > > latter.  
> > 
> > This mode of operation may or may not be desirable. Can it be made
> > optional?
> 
> good idea. However, you can call the oe-selftest-internal for the
> this purpose.

While doable, it feels wrong to rename something as "internal" and then
still expect people to call it directly.

A command line parameter for the new oe-selftest which controls this
behavior and just calls oe-selftest-internal directly when requested
feels cleaner and more discoverable.

Is oe-selftest-internal even going to be in the default PATH? It
probably shouldn't be, once it truly becomes an implementation detail.

> > In refkit CI testing, several selftests run tests on build
> > artifacts
> > (primarily the images) produced during the previous build and only
> > build them if needed, i.e. they run "bitbake some-image" and that
> > is
> > usually fast because the image already exists. Reusing sstate and
> > download dir also is important for speed.
> 
> oe-selftest creates a new build/conf folder, with the same conf files
> as the ones present in your current build/conf, so this means that
> you can set there DL_DIR and SSTATE_DIR (for example) on your main
> local.conf and these will be used by oe-selftest, effectively reusing
> these folders.

Instead of leaving it to the developer to figure this out, should the
oe-selftest have --[no-]reuse-download and --[no]-reuse-sstate options?

> > 
-- 
Best Regards, Patrick Ohly

The content of this message is my personal opinion only and although
I am an employee of Intel, the statements I make here in no way
represent Intel's position on the issue, nor am I authorized to speak
on behalf of Intel on this matter.



