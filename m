Return-Path: <andre.draszik@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id E22A5605FE
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 May 2016 09:51:33 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id r12so14928129wme.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 May 2016 02:51:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=APxR757WVSlrEQci9py1llsV4ghFkvaLX9w5gUoVh3s=;
	b=POmc7Wa9X/CV2henp2qwtPB1KjcmjITfVvCcMSlmRXXfAIFUnd2sQaoYzuyXGmyjeZ
	5bp9viVCs7j6gODuQ6KjxRK7qJdLG9GP1eESXg9raoi0UalQCQjYQnP8utdFVFM63Bv/
	DDljzim/pBDwt4Di/y2gXAdZ5xGCJq7eKgk21c+ICNMc6HoDZdLFwHzBsqabp9bS0gy1
	sPZnUnAnbQkuGvrZ56g1gnED89J82VLmW3yDR9UJmJjxuZGbfQ7jV+MNghoHucpJmqDB
	zrWG+iXoKO7a1rpsDDtHkXMm+07bXlm0kD1sAxAkfoV68XsRD1d0QIiOeAG9fAVATngB
	mi3w==
X-Gm-Message-State: AOPr4FUzHcYD9Vu1S6CbzWFL0EdBtWkN5XG7t1m5R7yLiuBiFMiz0ulM/mMLYw9QqCTgJA==
X-Received: by 10.194.139.104 with SMTP id qx8mr8469118wjb.14.1463046693773;
	Thu, 12 May 2016 02:51:33 -0700 (PDT)
Received: from localhost ([185.46.212.56]) by smtp.gmail.com with ESMTPSA id
	m14sm12946233wmc.4.2016.05.12.02.51.32
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 12 May 2016 02:51:32 -0700 (PDT)
Message-ID: <1463046684.29915.33.camel@andred.net>
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <git@andred.net>
To: openembedded-core@lists.openembedded.org
Date: Thu, 12 May 2016 10:51:24 +0100
In-Reply-To: <571935B4-DB58-4820-BBEA-AA6668098755@gmail.com>
References: <1461662879-21557-1-git-send-email-git@andred.net>
	<571935B4-DB58-4820-BBEA-AA6668098755@gmail.com>
X-Mailer: Evolution 3.18.5.1-1 
Mime-Version: 1.0
Subject: Re: [PATCH] feature-arm-neon.inc: restore vfpv3-d16 support
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
X-List-Received-Date: Thu, 12 May 2016 09:51:35 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

OK. Any suggestions for how to best fix that?

I could be more specific and .replace('vfpv3-d16', 'vfpv3d16') only, but
that seems ugly :-)


Thanks,
André

On Mi, 2016-05-11 at 11:55 -0700, Khem Raj wrote:
> This causes raspberrypi2 not parse anymore
> 
> ERROR:  OE-core's config sanity checker detected a potential
> misconfiguration.
>     Either fix the cause of this error or at your own risk disable the
> checker (see sanity.conf).
>     Following is the list of potential problems / advisories:
> 
>     Error, the PACKAGE_ARCHS variable (all any noarch armv5hf-vfp
> armv5thf-vfp armv5ehf-vfp armv5tehf-vfp armv6hf-vfp a
> rmv6thf-vfp armv7ahf-vfp armv7at2hf-vfp armv7vehf-vfp armv7vet2hf-vfp
> armv7vehf-neon armv7vet2hf-neon armv7vehf-neon-vf
> pv4 armv7vet2hf-neon-vfpv4 cortexa7hf-vfp cortexa7hf-neon cortexa7hf-neon-
> vfpv4 cortexa7t2hf-vfp cortexa7t2hf-neon cort
> exa7t2hf-neon-vfpv4 raspberrypi3) for DEFAULTTUNE (cortexa7thf-neon-vfpv4) 
> does not contain TUNE_PKGARCH (cortexa7hf-ne
> onvfpv4).
> 
> 
> > 
> > On Apr 26, 2016, at 2:27 AM, André Draszik <git@andred.net> wrote:
> > 
> > Commit 6661718 (feature-arm-{neon,vfp}.inc: refactor and fix issues)
> > effectively changed the gcc -mfpu= option from -mfpu=vfpv3-d16 to
> > -mfpu=vfpv3d16, which gcc doesn't understand.
> > 
> > Restore the original value.
> > 
> > After doing that, we also need to adjust ARMPKGSFX_FPU which should
> > contain the same value without dash '-' as it is used that way
> > throughout.
> > 
> > Signed-off-by: André Draszik <git@andred.net>
> > ---
> > meta/conf/machine/include/arm/feature-arm-neon.inc | 2 +-
> > meta/conf/machine/include/arm/feature-arm-vfp.inc  | 2 +-
> > 2 files changed, 2 insertions(+), 2 deletions(-)
> > 
> > diff --git a/meta/conf/machine/include/arm/feature-arm-neon.inc
> > b/meta/conf/machine/include/arm/feature-arm-neon.inc
> > index 50d9175..b34af8e 100644
> > --- a/meta/conf/machine/include/arm/feature-arm-neon.inc
> > +++ b/meta/conf/machine/include/arm/feature-arm-neon.inc
> > @@ -8,7 +8,7 @@ TUNEVALID[neon] = "Enable Neon SIMD accelerator unit."
> > TUNE_CCARGS_MFPU .= "${@bb.utils.contains('TUNE_FEATURES', 'neon', '
> > neon', '', d)}"
> > 
> > TUNEVALID[vfpv3d16] = "Enable Vector Floating Point Version 3 with 16
> > registers (vfpv3-d16) unit."
> > -TUNE_CCARGS_MFPU .= "${@bb.utils.contains('TUNE_FEATURES', 'vfpv3d16',
> > ' vfpv3d16', '', d)}"
> > +TUNE_CCARGS_MFPU .= "${@bb.utils.contains('TUNE_FEATURES', 'vfpv3d16',
> > ' vfpv3-d16', '', d)}"
> > 
> > TUNEVALID[vfpv3] = "Enable Vector Floating Point Version 3 with 32
> > registers (vfpv3) unit."
> > TUNE_CCARGS_MFPU .= "${@bb.utils.contains('TUNE_FEATURES', 'vfpv3', '
> > vfpv3', '' , d)}"
> > diff --git a/meta/conf/machine/include/arm/feature-arm-vfp.inc
> > b/meta/conf/machine/include/arm/feature-arm-vfp.inc
> > index 4247255..bd366a1 100644
> > --- a/meta/conf/machine/include/arm/feature-arm-vfp.inc
> > +++ b/meta/conf/machine/include/arm/feature-arm-vfp.inc
> > @@ -6,7 +6,7 @@ TUNEVALID[vfp] = "Enable Vector Floating Point (vfp)
> > unit."
> > TUNE_CCARGS_MFPU .= "${@bb.utils.contains('TUNE_FEATURES', 'vfp', '
> > vfp', '', d)}"
> > 
> > TUNE_CCARGS  .= "${@ (' -mfpu=%s ' % d.getVar('TUNE_CCARGS_MFPU',
> > True).split()[-1]) if (d.getVar('TUNE_CCARGS_MFPU', True) != '') else
> > ''}"
> > -ARMPKGSFX_FPU = "${@ ('-%s'        % d.getVar('TUNE_CCARGS_MFPU',
> > True).split()[-1]) if (d.getVar('TUNE_CCARGS_MFPU', True) != '') else
> > ''}"
> > +ARMPKGSFX_FPU = "${@ ('-%s'        % d.getVar('TUNE_CCARGS_MFPU',
> > True).split()[-1].replace('-', '')) if (d.getVar('TUNE_CCARGS_MFPU',
> > True) != '') else ''}"
> > 
> > TUNEVALID[callconvention-hard] = "Enable EABI hard float call
> > convention, requires VFP."
> > TUNE_CCARGS_MFLOAT = "${@ bb.utils.contains('TUNE_FEATURES',
> > 'callconvention-hard', 'hard', 'softfp', d) if
> > (d.getVar('TUNE_CCARGS_MFPU', True) != '') else '' }"
> > --
> > 2.8.1
> > 
> > --
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core

