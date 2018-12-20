Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f194.google.com (mail-qt1-f194.google.com
	[209.85.160.194])
	by mail.openembedded.org (Postfix) with ESMTP id A733A6C3B2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Dec 2018 17:04:50 +0000 (UTC)
Received: by mail-qt1-f194.google.com with SMTP id r14so2612554qtp.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Dec 2018 09:04:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=mn993nIKFxJBx55dGKo744l1m0HeJilGuzoTT10UWZI=;
	b=OliCi3c1DFY1glcnFZk8s9Ngbk7RRjAnz+nbGB39r4WfG5hR3MjfjmVbIrxrDaGZCe
	4vIEHru5URWkyw09L7VwV/3hfWSmaGBE+2a/C4ZD+MjGfPrzvZQjCo03+6VZ3To9m773
	AZj5Nje2wRggvMz9T9i0B3M+7fN7T7yiZ8tTdRdJJyA+MrS7Ev3IXm+YRfxkAmtimgJk
	Q1oFHXiKCBUhqJnpMXJwfZRYHi8DUiGTCn2a5W5naRNdVRyHJbxWcHZeR/n16PND1/RX
	ilvSLQY/mZjD+Z2regKsW+DSfi2nD2YThcLvpux1wi8lWP9k9ZEYv7YFWv3SYzqvatXS
	zhJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=mn993nIKFxJBx55dGKo744l1m0HeJilGuzoTT10UWZI=;
	b=cjYPit6aGkZcjqx6fIZjCyJVGwxy7u9l9qPFxq4gWv0omKI5xAz2+QQXa94scnWyCw
	X3hm4IP/h2PPnd0Kkh4p/m4A7P57p00ENmMkCBjcTOTs7g8WRCJ+gbm2xmEg8Ur0tWGA
	lmM80iDMKH+4bFs/fzQnKWTGtpx+Lxd557saGlzhNGX6Cdf9a6klscQb+EwwvymHiG4i
	v64AbaThWST0qwmZQ3zjOaeFmg0D+cwtRiXza7YyLKvTOuj514/A9jMLbyzhi3rEJWVL
	Wu95Za3AY57r8V8Iv0z00xm7vrs5ovSLoc3x1tfbGirahb6OhzPpbvT0+ygDDbQcrMGs
	U5vw==
X-Gm-Message-State: AA+aEWYhqFVa5qrh6hujjh7mkPjVw5G8NbhmFg1DWaGmfDhg5NYakfKj
	0qCG9kqEnZxyXxCddw0lBCuglaL5Hmz0SkSeVKM=
X-Google-Smtp-Source: AFSGD/WgAblbVfUYAGcs5FWwBKmX+BfvPcLBkpnF/07QY+8tbayU3cquHBD0+LEZFYQi+gzb/5WdF9x51JV5i20Z1cI=
X-Received: by 2002:a0c:a144:: with SMTP id d62mr27223966qva.50.1545325491126; 
	Thu, 20 Dec 2018 09:04:51 -0800 (PST)
MIME-Version: 1.0
References: <e0464c53-3d11-884c-75bd-1e78aed97ded@linux.intel.com>
	<E4F39B19-40EF-4774-B2B3-6C37A2CB98DC@fuzziesquirrel.com>
	<CAJTo0LayfGOMkwFrLStd9_93fBBG8ZH4b806T5CCo=A1nbTCWg@mail.gmail.com>
	<CAMKF1sp1DLQwANi8sbHp4pP-YPPMbVOOsArUoxa286QAgTx-Lw@mail.gmail.com>
	<CAJTo0Lb1Vq7-UXWKZf5hs4L4HzKAu45HTOnxtFXkOCttA0BiiA@mail.gmail.com>
	<CAMKF1speLVxgZXojHO5ZBNO1LQXS4CMFvhK6VEbkeJL3giyMiQ@mail.gmail.com>
	<CAJTo0LZi9oF4cW815RP7XkHR6vj_qOgOb5LUrCGSCBK1oa1cfw@mail.gmail.com>
In-Reply-To: <CAJTo0LZi9oF4cW815RP7XkHR6vj_qOgOb5LUrCGSCBK1oa1cfw@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 20 Dec 2018 09:04:25 -0800
Message-ID: <CAMKF1sow0bZU_vkOVkT7zJYqcuKvqy2HxfDHdWyJGC+f3YRy1g@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OpenBMC <openbmc@lists.ozlabs.org>,
	Bradley Bishop <bradleyb@fuzziesquirrel.com>,
	James Feist <james.feist@linux.intel.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: flto automake
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
X-List-Received-Date: Thu, 20 Dec 2018 17:04:50 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Dec 20, 2018 at 7:48 AM Burton, Ross <ross.burton@intel.com> wrote:
>
> On Thu, 20 Dec 2018 at 15:37, Khem Raj <raj.khem@gmail.com> wrote:
> > > Well, I built core-image-sato core-image-weston with AR=gcc-ar
> > > RANLIB=gcc-ranlib globally and it worked fine.
> >
> > Please build a lot more. These images cover only handful of recipes
> > there are problems like
> >
> > https://gcc.gnu.org/bugzilla/show_bug.cgi?id=77576
> >
> > which we might have to contend.
>
> That bug from two years ago suggests that the gcc-ar wrapper isn't
> required if GCC has been configured properly.  I guess we need a test
> case.

cmake's approach of defined COMPILER_AR and COMPILER_RANLIB etc seems
better to me. where it can be uses selectively only when LTO is in
play.

>
> Ross

