Return-Path: <jpewhacker@gmail.com>
Received: from mail-it0-f67.google.com (mail-it0-f67.google.com
	[209.85.214.67])
	by mail.openembedded.org (Postfix) with ESMTP id 5A311606B2
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Feb 2018 21:19:12 +0000 (UTC)
Received: by mail-it0-f67.google.com with SMTP id i144so4021251ita.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 07 Feb 2018 13:19:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:message-id:subject:to:cc:date:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=08CcwHzgw8gUT5gKRRPi2u9GE9LiLHh2BO+5aPhQrBc=;
	b=SJ3MNC6ccI4qyh90V4muFmOtFxUr1oyzIM//8oQ2xErwBJgEEFzOxu82BHWBHNm+13
	76I5x4aHzBNBIpqRo82hZPMe0vSY9jtPEvhEVv+yvsJ/79pwFDL/J9So6sM5a8PZjX2R
	FW6FNtTSvLR3TDV1ujU8BQKFKgIqrnGJ0AR+qjNFQAmCxA6kWBouGM/C2YLlr9tGV6ss
	9vIJ8MzzNcuBUGk7PbIo0JTLrlrPEf8ssg8dFXCwNu8zHps40uDP7dnk7q7c2ocU880B
	+nBCEFWabljQRnVoFR6rKD6Yw5xRoAUeJ8xNop5LtCSANJpVzNRX2cOXfUhdxxY6ylQ5
	mTFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:message-id:subject:to:cc:date:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=08CcwHzgw8gUT5gKRRPi2u9GE9LiLHh2BO+5aPhQrBc=;
	b=egbNTI15cBa2NBOm5aaVGSL4OKJYEXVVDsVskZ1j3uPl5juh5a1Xsjd0F8r9ys6sEZ
	p38d3ckXR62vtpKk1L6005kvgKcxF0VRsuDKDXWE3VP3PawHFLqlbcCDB5bo+AwiIkdp
	ihAn8YgNrcaJDTZuvpjMxOuxJqDFnKijqeNWQ8E3kKbO4W/YQ4ljFsF/yioulu5WVPCV
	Q6AoSULSTtoM7lKMImAnokP0naaamaHRuyEtPrzq/a6g5yuPO03tNHnuWfIqjwzWpWrs
	xfTh5YiizUgw+UviEcbDYKF2qkj4cfxi4K3xxz6I7fg5Xb8CMOMkWHrTcbllzlSb4n2N
	/N0A==
X-Gm-Message-State: APf1xPAuPg9w9V1TJisaVVmdamn0o9wZxxI39Blx3CDfYBJIa1f3gCfO
	Ocs8/NqbKUPqOrJ3yx6Cn0o=
X-Google-Smtp-Source: AH8x226fcY1SmHRBMBxm1XgCh7jx2MEUjw+o38CBvoZ9QOqv3HIXxug3WjmbPi8P1IVJ8H9ndbgBrg==
X-Received: by 10.36.5.81 with SMTP id 78mr10315623itl.135.1518038353367;
	Wed, 07 Feb 2018 13:19:13 -0800 (PST)
Received: from ola-842mrw1.ad.garmin.com ([204.77.163.55])
	by smtp.googlemail.com with ESMTPSA id
	r13sm2593754ioa.4.2018.02.07.13.19.12
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 07 Feb 2018 13:19:12 -0800 (PST)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
Message-ID: <1518038352.3509.18.camel@gmail.com>
To: Tomas Novotny <tomas@novotny.cz>
Date: Wed, 07 Feb 2018 15:19:12 -0600
In-Reply-To: <20180207215913.1efc2300@tomas.local.tbs-biometrics.cz>
References: <cover.1517857764.git.JPEWhacker@gmail.com>
	<20180207215913.1efc2300@tomas.local.tbs-biometrics.cz>
X-Mailer: Evolution 3.26.2 (3.26.2-1.fc27) 
Mime-Version: 1.0
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 00/14] Fix support for Icecream
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
X-List-Received-Date: Wed, 07 Feb 2018 21:19:12 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2018-02-07 at 21:59 +0100, Tomas Novotny wrote:
> Hi Joshua,
> 
> On Tue,  6 Feb 2018 16:01:19 -0600
> Joshua Watt <jpewhacker@gmail.com> wrote:
> 
> > Fix up support for using Icecream to do distributed builds, which
> > appears to have been broken for some time.
> 
> we were using icecream a year ago and we set ICECC_CARET_WORKAROUND
> env
> variable to 0 (in set_icecc_env() in icecc.bbclass). The default is 1
> and it
> causes a local rebuild when any warning is emitted.
> 
> I don't have exact numbers, but the extreme case was opencv. There
> was so
> many warnings that distributed build on ~10 threads was slower than
> local
> build on 4 threads.

Ok, that make sense. I'll add a patch to default to
ICECC_CARET_WORKAROUND to my patch series. Thanks for the heads up!

> 
> I know that it is some kind of configuration, but I would set the
> default to
> 0. Or do it at least configurable.
> 
> > In addition, Icecream support can now be enabled in the SDK. When
> > enabled, the SDK install process will check if the host supports
> > icecc
> > and if so will construct a proper environment tarball and use it
> > when
> > compiling.
> 
> Thanks for work on that, I'm keen to use it in our environment.
> 
> Tomas
> 
> > Most of the changes should be straightforward. icecc-create-env has
> > been almost completely re-written but the changes were broken up
> > into
> > hopefully logical chunks.
> > 
> > The following changes since commit
> > 385944254d0ef88bd6450a221a54cbcb40020b42:
> > 
> >   tcmode-default.inc: drop preferred version of gzip-native (2018-
> > 01-31 17:01:20 +0000)
> > 
> > are available in the Git repository at:
> > 
> >   git://push.yoctoproject.org/poky-contrib jpew/icecream
> > 
> > Joshua Watt (14):
> >   icecc.bbclass: Move to shared work directory
> >   icecc.bbclass: Fix STAGING_BINDIR_TOOLCHAIN usage
> >   icecc.bbclass: Skip canadian-cross compiles
> >   icecc-create-env: Reformat
> >   icecc-create-env: Add /bin/true to environment
> >   icecc-create-env: Use program interpreter for deps
> >   icecc-create-env: Symlink alternate names
> >   icecc-create-env: Archive directory
> >   icecc-create-env: Fix executable rpaths
> >   icecc-create-env: Add support for nativesdk
> >   icecc-create-env: Allow multiple tool aliases
> >   toolchain-shar-extract: Add post-relocate scripts
> >   icecc-toolchain: Add SDK icecream setup
> >   icecc.bbclass: Add IceCream support to SDK
> > 
> >  meta/classes/icecc.bbclass                         |  37 ++-
> >  meta/classes/toolchain-scripts.bbclass             |  15 +
> >  meta/files/toolchain-shar-extract.sh               |   8 +
> >  meta/recipes-core/meta/meta-environment.bb         |   2 +
> >  .../icecc-create-env/icecc-create-env              | 328
> > ++++++++++++++-------
> >  ...e-env-native_0.1.bb => icecc-create-env_0.1.bb} |   4 +-
> >  .../icecc-toolchain/icecc-toolchain/icecc-env.sh   |  37 +++
> >  .../icecc-toolchain/icecc-toolchain/icecc-setup.sh |  43 +++
> >  .../nativesdk-icecc-toolchain_0.1.bb               |  38 +++
> >  9 files changed, 390 insertions(+), 122 deletions(-)
> >  rename meta/recipes-devtools/icecc-create-env/{icecc-create-env-
> > native_0.1.bb => icecc-create-env_0.1.bb} (98%)
> >  create mode 100644 meta/recipes-devtools/icecc-toolchain/icecc-
> > toolchain/icecc-env.sh
> >  create mode 100644 meta/recipes-devtools/icecc-toolchain/icecc-
> > toolchain/icecc-setup.sh
> >  create mode 100644 meta/recipes-devtools/icecc-
> > toolchain/nativesdk-icecc-toolchain_0.1.bb
> > 

