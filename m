Return-Path: <armccurdy@gmail.com>
Received: from mail-vs1-f65.google.com (mail-vs1-f65.google.com
	[209.85.217.65])
	by mail.openembedded.org (Postfix) with ESMTP id 428F56C108
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Mar 2019 18:16:26 +0000 (UTC)
Received: by mail-vs1-f65.google.com with SMTP id z25so4632637vsk.8
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Mar 2019 11:16:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=4Fb0A9M53rJBu2KI6QmKAvzmrREX4sSAtUwAXkjlpME=;
	b=pdH+JzqZzi5eVwrWcTr1acPlNI7eFb3SgCBx9YLgttat5FEEtS1Dlc5dPueetN3It4
	ICahsjtizRI1FvLGJARV6H1MoKgxUAcXf7/zMncMe6Gk/xPuTPRDIA6Gm8P1C/b0ONFD
	b+7ePd+Y7YgPIPzUx2rAmoYrcgpZ3eIRllWAw+crs//xpDlSITk1AB2iIcxiOy+SyLKd
	8lMvzDkaM85Qisc+Rv8xgzGl53UZ+pGSdtjsZB6MQi8KwXM+BeXa8/RFbG9phVFjjEjG
	rbczsfjFQVhvAeSe+52xG3dEcTMfPi7arY1CKGD7XbRtdbKlAetYBngxFOCZaJn82TCU
	2AWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=4Fb0A9M53rJBu2KI6QmKAvzmrREX4sSAtUwAXkjlpME=;
	b=Uo5Sl1rxkO+i76QId9tDbvjJU6J1oy+3frR2fJOHZuhQR/hPUpaUp7XRJZ3lyyxz9Q
	406E7Jgt7cp2/6Fvfxe8zy5rYtm2Bkpw9kXHUgmWItkx9DnZLCkGkTl+V4Rt2PtLIU4X
	10FhMVgCvQLyzLw7+7kuOPT56gnRufOiSszPsJnT/fXgi8e7zoeEjRj2hdTOCX7inhNw
	YCmSPvoWPMk79ESTpQ521/GiYSWPAUwdP9enVzng64RNdwdtIzXGlihfPTRYdC7d1pgV
	u1b+wH44o4J+Y6r5BZ5k3qB9mBtgEKwggr7OWxzJaHDd9y08V3466ClpwETKSD/fmGqy
	MN6g==
X-Gm-Message-State: APjAAAVawYNhR3hZD2EDrNLDvd6QUCbRuZwF0X9Rr0NSD8NuL8AZro+9
	+5zfe0YCV43+yOhDxnyKotA858/FM4fcThXnArg=
X-Google-Smtp-Source: APXvYqwo5VxcVjTuSq7UZj8ydsYfziaaNXJCbyrM0QTfbBXcqDMgd8eBnbxI2Pa/cNsC/7sLiU5UCHwOH0/FziFKlVg=
X-Received: by 2002:a67:c301:: with SMTP id r1mr2605797vsj.137.1552673786901; 
	Fri, 15 Mar 2019 11:16:26 -0700 (PDT)
MIME-Version: 1.0
References: <1552593854-14059-1-git-send-email-mark.asselstine@windriver.com>
	<CAJ86T=WWWxg3aLGWUQtFn+CD7ruoBh9HFoBWebafQm4MK+2RbA@mail.gmail.com>
	<1934985.lny8BXKYyr@yow-masselst-lx1>
	<4551918.WFr7QzWy3N@yow-masselst-lx1>
In-Reply-To: <4551918.WFr7QzWy3N@yow-masselst-lx1>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Fri, 15 Mar 2019 11:16:15 -0700
Message-ID: <CAJ86T=V2eM7srorHzCE6wpPn2AwAjSV1aun5Ow3kjxqUJcu23g@mail.gmail.com>
To: Mark Asselstine <mark.asselstine@windriver.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [v2][PATCH 2/2] goarch.bbclass: set TARGET_GOARM as '7' for valid cortexa* targets
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
X-List-Received-Date: Fri, 15 Mar 2019 18:16:26 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Mar 15, 2019 at 8:44 AM Mark Asselstine
<mark.asselstine@windriver.com> wrote:
>
> On Friday, March 15, 2019 9:28:16 AM EDT Mark Asselstine wrote:
> > On Thursday, March 14, 2019 7:44:36 PM EDT Andre McCurdy wrote:
> > > On Thu, Mar 14, 2019 at 1:05 PM Mark Asselstine
> > >
> > > <mark.asselstine@windriver.com> wrote:
> > > > Per https://github.com/golang/go/wiki/GoArm we need to set GOARM when
> > > > building for ARMv5, ARMv6 and ARMv7. The current code in go_map_arm()
> > > > does not account for the Cortex* TUNINGs and as such misses several
> > > > Cortex variants which implement ARMv7. Here we add an additional check
> > > > that will include Cortex-A5 through Cortex-A17 as ARMv7 variants
> > > > (ie. GOARM='7'). The Cortex-R and Cortex-M variants are also captured
> > > > even though there are no tunings for these currently (lack MMU support
> > > > so not supported).
> > > >
> > > > Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
> > > > ---
> > > >
> > > > V2
> > > > * Cover all ARMv7 Cortex* variants
> > >
> > > Still worried this might not be complete. It's basically fixing the
> > > fallout from Khem's patches to remove -march options from the CPU
> > > specific ARM machine includes, right?
> >
> > Although this came in via meta-virtualization, which I usually review most
> > changes, I wasn't involved in the original implementation or discussion of
> > go_map_arm() and since I was simply extending the existing framework I
> > didn't go back and look into the history.
> >
> > Looking now I don't see any specific discussions as to why TUNE_FEATURES
> > were used instead of something else, such as the overrides. My guess is it
> > had to be something and the original implementation was incorrectly
> > oversimplified so the level of complexity was equivalent to any other
> > choice.
> >
> > At any rate I will review if changing to something else such as overrides
> > would simplify the now more complex logic but until I investigate I would
> > hesitate to say that the approach will be any less prone to breaking.
> >
> > > If so then any ARM machine with
> > > CPU specific tuning (other than cortex) is still going to be affected.
> > >
> > > What's the reason for parsing TUNE_FEATURES to detect the ARM
> > > architecture level?
> >
> > That's just what was in place when I started to work on this.
> >
> > > Couldn't GOARM be set correctly just by using of
> > > the _armv5, _armv6, _armv7a and _armv7ve over-rides?
> >
> > At a quick glance I would say yes, but again I need to poke around to see if
> > this is just swapping one thing for another with no real gains.
>
> The MACHINEOVERRIDES do already distill down the TUNE_FEATURES so yes we could
> potentially use this to the logic from getting more complex. After digging
> around the various tuning/maching/arch files I don't see any exceptions (at
> least none are immediately visible). Would you be happier with the following:
>
> ---
>  HOST_GOARCH = "${@go_map_arch(d.getVar('HOST_ARCH'), d)}"
> -HOST_GOARM = "${@go_map_arm(d.getVar('HOST_ARCH'), d.getVar('TUNE_FEATURES'), d)}"
> +HOST_GOARM = "${@go_map_arm(d.getVar('HOST_ARCH'), d.getVar('BASE_GOARM'), d)}"
>  HOST_GO386 = "${@go_map_386(d.getVar('HOST_ARCH'), d.getVar('TUNE_FEATURES'), d)}"
>  HOST_GOMIPS = "${@go_map_mips(d.getVar('HOST_ARCH'), d.getVar('TUNE_FEATURES'), d)}"
>  HOST_GOTUPLE = "${HOST_GOOS}_${HOST_GOARCH}"
>  TARGET_GOOS = "${@go_map_os(d.getVar('TARGET_OS'), d)}"
>  TARGET_GOARCH = "${@go_map_arch(d.getVar('TARGET_ARCH'), d)}"
> -TARGET_GOARM = "${@go_map_arm(d.getVar('TARGET_ARCH'), d.getVar('TUNE_FEATURES'), d)}"
> +TARGET_GOARM = "${@go_map_arm(d.getVar('TARGET_ARCH'), d.getVar('BASE_GOARM'), d)}"
>  TARGET_GO386 = "${@go_map_386(d.getVar('TARGET_ARCH'), d.getVar('TUNE_FEATURES'), d)}"
>  TARGET_GOMIPS = "${@go_map_mips(d.getVar('TARGET_ARCH'), d.getVar('TUNE_FEATURES'), d)}"
>  TARGET_GOTUPLE = "${TARGET_GOOS}_${TARGET_GOARCH}"
>  GO_BUILD_BINDIR = "${@['bin/${HOST_GOTUPLE}','bin'][d.getVar('BUILD_GOTUPLE') == d.getVar('HOST_GOTUPLE')]}"
>
> +# Use the MACHINEOVERRIDES to map ARM CPU architecture passed to GO via GOARM.
> +# This is combined with *_ARCH to set HOST_GOARM and TARGET_GOARM.
> +BASE_GOARM = ''
> +BASE_GOARM_armv7ve = '7'
> +BASE_GOARM_armv7a = '7'
> +BASE_GOARM_armv6 = '6'
> +BASE_GOARM_armv5 = '5'
> +
>  # Go supports dynamic linking on a limited set of architectures.
>  # See the supportsDynlink function in go/src/cmd/compile/internal/gc/main.go
>  GO_DYNLINK = ""
> @@ -74,12 +82,7 @@ def go_map_arch(a, d):
>  def go_map_arm(a, f, d):
>      import re
>      if re.match('arm.*', a):
> -        if 'armv7' in f:
> -            return '7'
> -        elif 'armv6' in f:
> -            return '6'
> -        elif 'armv5' in f:
> -            return '5'
> +        return f
>      return ''
> ---
>
> Before I send out a V3 can you comment if the above would be
> inline with your expectations?

This looks OK to me.

