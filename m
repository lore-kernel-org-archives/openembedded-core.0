Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f196.google.com (mail-qt1-f196.google.com
	[209.85.160.196])
	by mail.openembedded.org (Postfix) with ESMTP id C8A5479B13
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Oct 2018 21:14:02 +0000 (UTC)
Received: by mail-qt1-f196.google.com with SMTP id o17-v6so15376855qtr.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Oct 2018 14:14:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=R9R8/fLrIFMTFdKpF3QGSDtC3i5g1r0lpS+Md6Ru3lI=;
	b=VcnNBlb6+mqcGjJDQr/R8oe9019240midA7Z40LeTSg0icXACcIDYbzZ1eQJZljvTH
	H2x/S4dQFoGlcFDCnjsS9kmFJQe7Zfk4n8waWvSRCoX+c/T/yiDNlvl1QS4ZpqaL/rHJ
	/QORY7b5QNkCdzt4GMEw7ra2UbKbJ57ivLVGllGXhxMbtCDKaBxP4V7Z63PN4w1Yazaq
	JF1g3eGStFpzxkr3Oqfj7NlSdbX/K/9vHmqnskzHumTKl2LLkTgqjyKTn2bDJSgxW3+A
	BEb6sBrFBM0bWmqo2h2z3CZTshtToqkpr8ErE9a1FUxhYzLgg2s9Ou2ScuP1+9lEnyDn
	8xFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=R9R8/fLrIFMTFdKpF3QGSDtC3i5g1r0lpS+Md6Ru3lI=;
	b=YCSVWDtSuE+jF7c5GL26eMzJXNzX8MT7Cl2/FRBOA5QaW4SI1Blhj91bLBdO+/W65r
	BcmUHqb6SAnBywLK2sx6yOLL1ZL/ERyI0W5alERFRk4sKW1HUNB+nq7iY+wHewwMBwIz
	e4IuWDLHH3Cb2erdMz5EJL96XbskNXv8QltCwsQ9f8czWDIzzZjbI/AyndfG2boAsVVT
	q/AH70FvSANLxlzREepgUKcFesPAhvz10at3OQMwPxZ5SuNP/ZrWMWG5T4qn3cUF4IEz
	HvWL3JcYSU0TSrnH7tPdekFnRz6YQOn9PtFa6KVrgDVQZlhVteT7GWrrag8w4QjJ19rQ
	9ljg==
X-Gm-Message-State: ABuFfogTVDwknn7cwj/6AK4K4cXvetCxTnzriLSp221f8Fgz16wC44d1
	vhj0mq6TQ86F7u6+gN0InP0RPCKKbCWBG+ADhi8=
X-Google-Smtp-Source: ACcGV62uEbnxzQmH+f8EzOPGNpnLN0Tx6hefy5JCI2DSsPgQbK3y6Sqs9CIjH26HltkbIBCx8kCrmYVaPZx2hc/dqiY=
X-Received: by 2002:aed:3024:: with SMTP id 33-v6mr2966639qte.29.1539378843478;
	Fri, 12 Oct 2018 14:14:03 -0700 (PDT)
MIME-Version: 1.0
References: <20181012202823.4003-1-raj.khem@gmail.com>
	<CAJ86T=WjWNPB+upTuQN8EndUGFC_jBqSRO59Xy=7RZANoaSPdA@mail.gmail.com>
In-Reply-To: <CAJ86T=WjWNPB+upTuQN8EndUGFC_jBqSRO59Xy=7RZANoaSPdA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 12 Oct 2018 14:13:37 -0700
Message-ID: <CAMKF1sqEBLiSmzJALVmvRep0jzAGpgqtuZZVaoWu69D-X3dktg@mail.gmail.com>
To: Andre McCurdy <armccurdy@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] glibc: Do not use thumb1 ISA on armv6
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
X-List-Received-Date: Fri, 12 Oct 2018 21:14:03 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Oct 12, 2018 at 1:56 PM Andre McCurdy <armccurdy@gmail.com> wrote:
>
> On Fri, Oct 12, 2018 at 1:28 PM, Khem Raj <raj.khem@gmail.com> wrote:
> > This does not work and is unsupported so lets compile glibc in ARM mode
> > always on armv6 SOCs
>
> Note the comments in glibc-collateral.inc:
>
>   # This needs to match with glibc.inc, otherwise glibc-scripts and glibc-locale
>   # will fail to find main glibc, for details see
>   # http://lists.openembedded.org/pipermail/openembedded-core/2015-January/100679.html
>   ARM_INSTRUCTION_SET_armv4 = "arm"
>   ARM_INSTRUCTION_SET_armv5 = "arm"
>
> Either the two recipes need to be kept in sync or the comment no longer applies?

I think we can delete comment in a followup

>
> > Fixes [YOCTO #12929]
> >
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > ---
> >  meta/recipes-core/glibc/glibc.inc | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/meta/recipes-core/glibc/glibc.inc b/meta/recipes-core/glibc/glibc.inc
> > index ddf0c6b80e..99c92ce46e 100644
> > --- a/meta/recipes-core/glibc/glibc.inc
> > +++ b/meta/recipes-core/glibc/glibc.inc
> > @@ -56,6 +56,7 @@ INHIBIT_DEFAULT_DEPS = "1"
> >  # http://lists.openembedded.org/pipermail/openembedded-core/2015-January/100679.html
> >  ARM_INSTRUCTION_SET_armv4 = "arm"
> >  ARM_INSTRUCTION_SET_armv5 = "arm"
> > +ARM_INSTRUCTION_SET_armv6 = "arm"
> >
> >  # glibc uses PARALLELMFLAGS variable to pass parallel build info so transfer
> >  # PARALLEL_MAKE into PARALLELMFLAGS and empty out PARALLEL_MAKE
> > --
> > 2.19.1
> >
> > --
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core

