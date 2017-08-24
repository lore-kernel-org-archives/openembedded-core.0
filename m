Return-Path: <patrick.ohly@intel.com>
Received: from mail-pg0-f52.google.com (mail-pg0-f52.google.com [74.125.83.52])
	by mail.openembedded.org (Postfix) with ESMTP id 42DC3779C6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Aug 2017 07:47:24 +0000 (UTC)
Received: by mail-pg0-f52.google.com with SMTP id t3so13115634pgt.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Aug 2017 00:47:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:organization:mime-version:content-transfer-encoding;
	bh=8GdihU0XW4XEGdqqLiqBLGj2DSS7+61z47RhG5GYxis=;
	b=LjYFLvZdl0l43UsY6pZjB28QDoO0juaTIUvUur5Hv56ysbPymjTYEGUeHsJPGynH/1
	XCexUfNMOBAQwZTnWPBSdGIQbOrfNUjY2nON89Fj+6ZNrbk6AGkSIWmaYnH9EP6iO1+e
	LQO5WQkn34Ht6rV/8rkVf+g9jDgWekgoJwd0vpXNy9fiPVQc1ZeZM9ExKm4L/VgkuNc4
	OhglJYr+rGzdiDD2G2FzNF7xsXU/FnUB/ZaH0uwA6whFtulh20PU/AWaZ141CUZpgu2v
	Y1lS57eZheEv2bLC02j7xHD44AbYoV33fmT7NaCZeKRjkwhoPCfhijCcB/MSAi0Kyx43
	ZtVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:organization:mime-version:content-transfer-encoding;
	bh=8GdihU0XW4XEGdqqLiqBLGj2DSS7+61z47RhG5GYxis=;
	b=p//EWxK4igl3DrLs3sFAEkVAc/z9AmuT2nVME3xckn+CfBCTm22Cz2v1rTlolfhoJY
	t3gXkelB+85T6BfRSzKVqYeAKCAEdenlzjcIfRHWhDyTDjBPqDFtq1hYs2k3kfJn62kz
	g2HrShzyWUGlehB2lyXRLbiNu8hLh6cBmARKaud3toyfmvk257yZBJEJHyE3ViMhlomw
	bT6V0Xw5l1tec72h46eHC8TbyFEfMREhKm0g2E8w9vIxACeteu7L/QxZRd/3SAgz1dSL
	KGxFBODtH1VaGnw4n6LduommizCUceT6+r7g2LYFbZA4+NvmNGnQGRsHprAnaTKtMzPv
	FuWw==
X-Gm-Message-State: AHYfb5hGmHOHskTyUiSLrDYust8jybDH+8f5qA6Ljs8zpvQunqnU8ofO
	I+mZJDMqvrs8Y9tG
X-Received: by 10.84.217.201 with SMTP id d9mr5989696plj.335.1503560846118;
	Thu, 24 Aug 2017 00:47:26 -0700 (PDT)
Received: from pohly-mobl1 (p5DE8F93A.dip0.t-ipconnect.de. [93.232.249.58])
	by smtp.gmail.com with ESMTPSA id
	l79sm4422027pfk.66.2017.08.24.00.47.22
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 24 Aug 2017 00:47:24 -0700 (PDT)
Message-ID: <1503560838.3674.2.camel@intel.com>
From: Patrick Ohly <patrick.ohly@intel.com>
To: Mark Hatle <mark.hatle@windriver.com>, Martin Jansa
	<martin.jansa@gmail.com>
Date: Thu, 24 Aug 2017 09:47:18 +0200
In-Reply-To: <a7fc84e4-f364-ad8e-faf6-7d156f10d5cf@windriver.com>
References: <f05e1212a87f739cf27fe9a6c32f45ef92a6fdab.1501250341.git-series.patrick.ohly@intel.com>
	<CAMKF1sq98x8jpV_A0Fz2doMO25Cii9v4Ez178ex4uUoPqnnB8A@mail.gmail.com>
	<CA+chaQetLEuL79Utj_C+e7yQpg9Hw1ZhVQsOdCEeLZNziAzMqQ@mail.gmail.com>
	<04c5a375-93ee-7f32-4f91-a4dc3f7c9b1c@windriver.com>
	<20170810235637.GA3320@jama>
	<a7fc84e4-f364-ad8e-faf6-7d156f10d5cf@windriver.com>
Organization: Intel GmbH, Dornacher Strasse 1, D-85622 Feldkirchen/Munich
X-Mailer: Evolution 3.22.6-1 
Mime-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] autoconf-archive: move from meta-oe to OE-core
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
X-List-Received-Date: Thu, 24 Aug 2017 07:47:25 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Thu, 2017-08-10 at 20:53 -0500, Mark Hatle wrote:
> On 8/10/17 6:56 PM, Martin Jansa wrote:
> > On Thu, Aug 10, 2017 at 03:34:48PM -0500, Mark Hatle wrote:
> > > On 8/10/17 3:18 PM, Martin Jansa wrote:
> > > > -2
> > > 
> > > I agree that autoconf-archive should be in oe-core.  But...
> > 
> > No argument about that, it was already merged to oe-core, I was
> > only commenting about the gnome-common change included in this
> > commit.

The meta-oe patch is here:

https://patchwork.openembedded.org/series/7995/#

> Sorry, I missed the context.. ya if the gnome change is arch or board
> specific that is wrong.  There should be no reason for that.

The patch itself doesn't change anything around that, autoconf-archive
already was arch specific.

Martin is right, because of that the gnome-common->autoconf-archive
dependency can't be done as in the patch above. But what is the right
fix? Is autoconf-archive really arch specific or can "inherit allarch"
be added to it?

If not, can we add it to SIGGEN_EXCLUDERECIPES_ABISAFE to allow the
gnome-common->autoconf-archive dependency? That would also prevent
rebuilding software when updating autoconf-archive, which may or may
not be the right thing to do - I'm undecided myself.

-- 
Best Regards, Patrick Ohly

The content of this message is my personal opinion only and although
I am an employee of Intel, the statements I make here in no way
represent Intel's position on the issue, nor am I authorized to speak
on behalf of Intel on this matter.



