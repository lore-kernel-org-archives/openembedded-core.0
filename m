Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com
	[209.85.160.173])
	by mail.openembedded.org (Postfix) with ESMTP id 1DDC27C344
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Jan 2019 03:23:09 +0000 (UTC)
Received: by mail-qt1-f173.google.com with SMTP id t33so9280574qtt.4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Jan 2019 19:23:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=aZusevVWPec75EsiQR12Pz2NMrTeubXIoZ64a/jBrmQ=;
	b=tAMDosDGDvJjuFz75gitzWztdCCqTwRIHbNGpa8Len5PP6qR7uzpUqfPjNaiHT3bU7
	8+cfnG01YV9Mfduq9sIO6C+Lv+HpJoHvqN1lc7G0CvlYbjP7Vp+Khh6v3KmtOvfIvdbb
	jmbKB1Fy1KKouPgullQWt//HmbLRJDv4NAYQDhKwj86vHLMip7wvQNVa8to+Fc9GLok1
	hxd9nj2V4jg+wYV+kmda7kwBoE/zkfz+CtogDE3ZnosD3o/meBjfY1jB3dkVacbCKEfz
	+u6K3YvmdwakOK/EHLf9dblvck5rlmpqzc9FRWwve/B3NtKiHGlCSF1iFN1c6mU3okle
	/grw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=aZusevVWPec75EsiQR12Pz2NMrTeubXIoZ64a/jBrmQ=;
	b=S5r4aCYDyclwGv8dO//98naX8j7GRJej5oXvvI5docN7Njomv5po6+4ZNTyJCknQq7
	qgz1kmRH4EGFRNumRTStrHEsz9MZoLyoaSgSphKbD3qwg4WLbAfgxL+ktysRBO6AKZvM
	dqhPonq+BA2+jDUKLX9XTtrPyGGSFFE6uApFlj628HAdMItifRcxKi9kJNT4wNRixmSm
	a9e2F2qdagpsuBE/9TgxVaiuXvqY8+3m9WBD7pEE1Qjtrmlno8rE+Iqhjm+2WbXTqHbJ
	BU3V0U4/6SEE//XppJK9vhoaY6lTP4of+1iTcraggoANVfMrKlerhtnH3QyUVSKNU4yo
	54OA==
X-Gm-Message-State: AJcUukeDLLrpXHoH9yLD7Miul2hA/u83g2SMTh2qKkVYQgZuuLQW9P0/
	nDs/Xjmrp8719u3//F4j1IY1xnKufNfsFa0F/uQ=
X-Google-Smtp-Source: ALg8bN7hSjOJphlskdZ0FAm4sRfFJGseDSVdftEF50I+dP4QfVXeA64DQM5EF57REijzO6RnwbNBxiYHhKcye4hvLCA=
X-Received: by 2002:a0c:98a1:: with SMTP id f30mr8348896qvd.224.1548386590680; 
	Thu, 24 Jan 2019 19:23:10 -0800 (PST)
MIME-Version: 1.0
References: <20190123200520.14956-1-raj.khem@gmail.com>
	<CAJ86T=XF3Xr0x6zEH2nsHhLQ3afEMP3Ot31pbK9-66ORrCjnsg@mail.gmail.com>
	<CAMKF1srPt+fiSotytF2jczPEoCsCP5x7U=bODNe23476CA_ABQ@mail.gmail.com>
	<CAJ86T=Xp_KgsZWv=oj4kEdWqAihMNASpOMc0s7nLHgcpVozWsg@mail.gmail.com>
In-Reply-To: <CAJ86T=Xp_KgsZWv=oj4kEdWqAihMNASpOMc0s7nLHgcpVozWsg@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 24 Jan 2019 22:22:44 -0500
Message-ID: <CAMKF1sqcKnd1ZaGxjQqPH2oYVhyuO=h1wSREii2jXsGkf=5QFQ@mail.gmail.com>
To: Andre McCurdy <armccurdy@gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] arch-arm: Do not add -march options for arm architecture
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
X-List-Received-Date: Fri, 25 Jan 2019 03:23:10 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Jan 23, 2019 at 6:11 PM Andre McCurdy <armccurdy@gmail.com> wrote:
>
> On Wed, Jan 23, 2019 at 2:50 PM Khem Raj <raj.khem@gmail.com> wrote:
> >
> > On Wed, Jan 23, 2019 at 5:27 PM Andre McCurdy <armccurdy@gmail.com> wrote:
> > >
> > > On Wed, Jan 23, 2019 at 12:05 PM Khem Raj <raj.khem@gmail.com> wrote:
> > > >
> > > > tune files which inherit the arch definitions already define appropriate
> > > > -mcpu option, which is equivalent of right -march and -mtune combination
> > >
> > > And what about machines which inherit an arch definition instead of a
> > > cpu definition? Is that no longer supported?
> >
> > I could not find such a machine configuration in several BSP layers I looked at.
> > Do you know of machine definitions where these files are included
> > directly in machine configs ?
>
> Using a CPU specific include but then leaving the generic DEFAULTTUNE
> (ie not enabling any CPU specific TUNE_CCARGS) is equivalent, and I
> guess quite common.

defaulttune does not play much part in appending -mcpu option to
compiler flags, A case
where this could bypass the setting mcpu is when we do not include a
tune-* for arm based machine
and thats the case I was interested to know.

again if there is such a BSP I would be interested to test it out.
>
> > if so, then we have to either use _remove or introduce a weak variable
> > to set march only if
> > mcpu is not set which
>
> I think the solution is to ensure that the CPU specific tuning options
> are always compatible with any architecture specific options which may
> be active.
>
> In general our CPU specific tuning files are a little sloppy (e.g.
> defaulting to combinations of VFP versions and architecture levels
> which never exist in the real world). If newer versions of gcc are
> making those issues more apparent then why not take the opportunity to
> fix them properly?

the mcpu option is helping with right march/mtune combination. while we can
use specific -march=arch(+-)features syntax and combine with right
-mtune to match -mcpu I think we should use
compiler defaults and not try to recreate something that -mcpu would
do it easily for us.

So either we drop the idea of setting mcpu and use basic -march value
combined with -mtune ( which btw. was default in past)
or if we want to let compiler use ISA for a particular arch
implementation ( cortexXXX ) then we should just use -mcpu and drop
using -mtune and -march.

I would include towards option 1.

>
> > > > and is preferred since gcc is getting stricter and stricter with option
> > > > check semantics and can now find incompatible -march and -mcpu options
> > > > better with every release. It does internal feature consistency check
> > > > and if it finds out discrepency between what -mcpu would expand to as
> > > > compared to -march it will flag the options to be incompatible, for
> > > > naked eye it sounds wrong but gcc would translate -mcpu to a given
> > > > -march internally and it might not match to what we set in these arch
> > > > files.
> > > >
> > > > The effects are quite subtle, where this can result in configure test
> > > > failing to compile due to these incompatible options and a feature
> > > > option getting disabled for a recipe for no reason.
> > > >
> > > > e.g. with gcc9 which can now detect that -mcpu=cortex-a5 and
> > > > -march=armv7-a are incompatible, many features in libstdc++ ends up
> > > > disabled due to configure check failures e.g. size_t size, ptrdiff_t
> > > > sizes, which inturn results in compiling libstdc++ with unwanted
> > > > disabled features.
> > >
> > > It would be interesting to see more specific details of this.
> >
> > These are configure tests which fail when -Werror is in use and is not
> > limited to libstdc++
> > it can happen in any package. Since the diagnostic about incompatible
> > march mcpu pair
> > is a warning in general, it does not matter, but when we have -Werror
> > enabled this turns
> > into error, You can simply try a small helloworld example to see the effects.
> >
> > >
> > > > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > > > ---
> > > >  meta/conf/machine/include/arm/arch-armv4.inc   | 1 -
> > > >  meta/conf/machine/include/arm/arch-armv5.inc   | 1 -
> > > >  meta/conf/machine/include/arm/arch-armv6.inc   | 1 -
> > > >  meta/conf/machine/include/arm/arch-armv7a.inc  | 1 -
> > > >  meta/conf/machine/include/arm/arch-armv7ve.inc | 1 -
> > > >  meta/conf/machine/include/tune-iwmmxt.inc      | 2 +-
> > > >  6 files changed, 1 insertion(+), 6 deletions(-)
> > > >
> > > > diff --git a/meta/conf/machine/include/arm/arch-armv4.inc b/meta/conf/machine/include/arm/arch-armv4.inc
> > > > index 47a7ad2830..52d8ab1e8f 100644
> > > > --- a/meta/conf/machine/include/arm/arch-armv4.inc
> > > > +++ b/meta/conf/machine/include/arm/arch-armv4.inc
> > > > @@ -2,7 +2,6 @@ DEFAULTTUNE ?= "armv4"
> > > >
> > > >  TUNEVALID[arm] = "Enable ARM instruction set"
> > > >  TUNEVALID[armv4] = "Enable instructions for ARMv4"
> > > > -TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'armv4', ' -march=armv4t', '', d)}"
> > > >  # enable --fix-v4bx when we have armv4 in TUNE_FEATURES, but then disable it when we have also armv5 or thumb
> > > >  # maybe we should extend bb.utils.contains to support check for any checkvalues in value, now it does
> > > >  # checkvalues.issubset(val) which cannot be used for negative test of foo neither bar in value
> > > > diff --git a/meta/conf/machine/include/arm/arch-armv5.inc b/meta/conf/machine/include/arm/arch-armv5.inc
> > > > index f9068af9de..1fe1b6b8e4 100644
> > > > --- a/meta/conf/machine/include/arm/arch-armv5.inc
> > > > +++ b/meta/conf/machine/include/arm/arch-armv5.inc
> > > > @@ -2,7 +2,6 @@ DEFAULTTUNE ?= "armv5"
> > > >
> > > >  TUNEVALID[armv5] = "Enable instructions for ARMv5"
> > > >  TUNECONFLICTS[armv5] = "armv4"
> > > > -TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'armv5', ' -march=armv5t${ARMPKGSFX_DSP}', '', d)}"
> > > >  MACHINEOVERRIDES =. "${@bb.utils.contains('TUNE_FEATURES', 'armv5', 'armv5:', '' ,d)}"
> > > >
> > > >  require conf/machine/include/arm/arch-armv4.inc
> > > > diff --git a/meta/conf/machine/include/arm/arch-armv6.inc b/meta/conf/machine/include/arm/arch-armv6.inc
> > > > index 6c838e999c..adb9be8050 100644
> > > > --- a/meta/conf/machine/include/arm/arch-armv6.inc
> > > > +++ b/meta/conf/machine/include/arm/arch-armv6.inc
> > > > @@ -2,7 +2,6 @@ DEFAULTTUNE ?= "armv6hf"
> > > >
> > > >  TUNEVALID[armv6] = "Enable instructions for ARMv6"
> > > >  TUNECONFLICTS[armv6] = "armv4 armv5"
> > > > -TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'armv6', ' -march=armv6', '', d)}"
> > > >  MACHINEOVERRIDES =. "${@bb.utils.contains('TUNE_FEATURES', 'armv6', 'armv6:', '' ,d)}"
> > > >
> > > >  require conf/machine/include/arm/arch-armv5-dsp.inc
> > > > diff --git a/meta/conf/machine/include/arm/arch-armv7a.inc b/meta/conf/machine/include/arm/arch-armv7a.inc
> > > > index a2663d8008..09d2c03a5d 100644
> > > > --- a/meta/conf/machine/include/arm/arch-armv7a.inc
> > > > +++ b/meta/conf/machine/include/arm/arch-armv7a.inc
> > > > @@ -3,7 +3,6 @@ ARM_INSTRUCTION_SET ?= "thumb"
> > > >
> > > >  TUNEVALID[armv7a] = "Enable instructions for ARMv7-a"
> > > >  TUNECONFLICTS[armv7a] = "armv4 armv5 armv6 armv7"
> > > > -TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'armv7a', ' -march=armv7-a', '', d)}"
> > > >  MACHINEOVERRIDES =. "${@bb.utils.contains('TUNE_FEATURES', 'armv7a', 'armv7a:', '' ,d)}"
> > > >
> > > >  require conf/machine/include/arm/arch-armv6.inc
> > > > diff --git a/meta/conf/machine/include/arm/arch-armv7ve.inc b/meta/conf/machine/include/arm/arch-armv7ve.inc
> > > > index 4d9260fecb..31e334f645 100644
> > > > --- a/meta/conf/machine/include/arm/arch-armv7ve.inc
> > > > +++ b/meta/conf/machine/include/arm/arch-armv7ve.inc
> > > > @@ -2,7 +2,6 @@ DEFAULTTUNE ?= "armv7vethf"
> > > >
> > > >  TUNEVALID[armv7ve] = "Enable instructions for ARMv7ve"
> > > >  TUNECONFLICTS[armv7ve] = "armv4 armv5 armv6 armv7 armv7a"
> > > > -TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'armv7ve', ' -march=armv7ve', '', d)}"
> > > >  MACHINEOVERRIDES =. "${@bb.utils.contains('TUNE_FEATURES', 'armv7ve', 'armv7ve:', '' ,d)}"
> > > >
> > > >  require conf/machine/include/arm/arch-armv7a.inc
> > > > diff --git a/meta/conf/machine/include/tune-iwmmxt.inc b/meta/conf/machine/include/tune-iwmmxt.inc
> > > > index f27423cb2e..6e577697cc 100644
> > > > --- a/meta/conf/machine/include/tune-iwmmxt.inc
> > > > +++ b/meta/conf/machine/include/tune-iwmmxt.inc
> > > > @@ -6,7 +6,7 @@ DEFAULTTUNE ?= "iwmmxt"
> > > >  require conf/machine/include/arm/arch-armv5-dsp.inc
> > > >
> > > >  TUNEVALID[iwmmxt] = "Enable Intel PXA27x specific processor optimizations"
> > > > -TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'iwmmxt', ' -march=iwmmxt -mcpu=iwmmxt', '', d)}"
> > > > +TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'iwmmxt', ' -mcpu=iwmmxt', '', d)}"
> > > >
> > > >  AVAILTUNES += "iwmmxt"
> > > >  ARMPKGARCH_tune-iwmmxt = "iwmmxt"
> > > > --
> > > > 2.20.1
> > > >
> > > > --
> > > > _______________________________________________
> > > > Openembedded-core mailing list
> > > > Openembedded-core@lists.openembedded.org
> > > > http://lists.openembedded.org/mailman/listinfo/openembedded-core

