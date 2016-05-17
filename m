Return-Path: <andre.draszik@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 71001731BA
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 May 2016 02:22:02 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id w143so1054425wmw.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 May 2016 19:22:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=6InBOHFhpZ4t0VoWlw9aL36+LVx+RxhQ+a+XyTGEDzE=;
	b=IP4w9KJ1CvHrp3pSxAjnNVRd8V6OYV49znm4bxU7PVY+LpXtzWv6OjseIvMlr9FsYO
	ht3AkQ/p5aXvr/tfNdqM8RydPHEQy49Q3/mlt3AXk8KjzzWGdz3v69tMET7u3A6xE2dM
	zJmd5hSKoM8mwmV9JA4y8QjwOxAuHx9roK3Zv+U9RMf9LRmpKTp7O/GhAIvrudknXxE3
	G9JTBe7HSZbU56SXiyPvawFYeGlKtqDwjlMBXJqxvXrJ8xaD41vzFpxnph+gzrvzn8Ql
	YHxlJSsUalaEz1v4iJY07tDOR9goNJaRNTcvMg7qyXW/euYrhVjmzM+j1N7y2pjhPxsi
	bmFg==
X-Gm-Message-State: AOPr4FXiMJ2xVmkEFNXbNkqWidS8/grWdm9NMzkmebAEaYbG7/z42qsS+SvfOHyPqaEFNg==
X-Received: by 10.194.189.231 with SMTP id gl7mr35013245wjc.129.1463451723254; 
	Mon, 16 May 2016 19:22:03 -0700 (PDT)
Received: from localhost (sushi.andred.org. [85.214.105.253])
	by smtp.gmail.com with ESMTPSA id a75sm845489wme.18.2016.05.16.19.22.00
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 16 May 2016 19:22:01 -0700 (PDT)
Message-ID: <1463451718.2828.16.camel@andred.net>
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <git@andred.net>
To: Khem Raj <raj.khem@gmail.com>
Date: Mon, 16 May 2016 22:21:58 -0400
In-Reply-To: <55B50CC1-24B9-47C3-8120-1794775A93D0@gmail.com>
References: <1463066880-17505-1-git-send-email-git@andred.net>
	<1463126191-24272-1-git-send-email-git@andred.net>
	<55B50CC1-24B9-47C3-8120-1794775A93D0@gmail.com>
X-Mailer: Evolution 3.18.5.1-1+b1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v3][krogoth] feature-arm-neon.inc: restore vfpv3-d16 support
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
X-List-Received-Date: Tue, 17 May 2016 02:22:03 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Fr, 2016-05-13 at 10:08 -0700, Khem Raj wrote:
> > 
> > On May 13, 2016, at 12:56 AM, André Draszik <git@andred.net> wrote:
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
> 
> V1 worked fine for my case. V3 doesnt even apply. Can you rebase it on top
> of master and resend ?

V1 on krogoth should have the same issue as the original patch on master,
i.e. should break on your raspberry pi2?

Since V1 hasn't made it onto krogoth yet, V3 contains the two patches from
the master branch squashed into one. Maybe you need to undo the V1 patch on 
your local krogoth branch?

Or should we apply both patches (not squashed) from master onto krogoth, so
as to have fewer diversions?

Cheers,
Andre

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
> > index 4247255..9ef31e7 100644
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
> > True).split()[-1].replace('vfpv3-d16', 'vfpv3d16')) if
> > (d.getVar('TUNE_CCARGS_MFPU', True) != '') else ''}"
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

