Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-lf1-f65.google.com (mail-lf1-f65.google.com
	[209.85.167.65])
	by mail.openembedded.org (Postfix) with ESMTP id 343357F51A
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Sep 2019 20:42:04 +0000 (UTC)
Received: by mail-lf1-f65.google.com with SMTP id c195so1021650lfg.9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Sep 2019 13:42:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=FGmpQhBjPMMzl0TCQjo+JfLVD6WOMuLB0QOHOvSFPh0=;
	b=Nwk7fCdgyzUbz7SDTwiu62VeVHQR42BvFZPG4fIu1lQfdr72nbmuWXEIYBSB1/noXS
	WUprVMTEgILpjAtf+pvHvphdr5Vi14OSewhqPTEbXMUWttoIcmaMJOYdtAHHoggn6diW
	jYBd2eq4y6Yk4C7f9TftWEogZsOQnt8txhgGwV8YFqhSkbnAfaM6I65wZg6+QWUeBqWI
	rkLKrvcgJlQ5XbEmK1DKhXeax6Vn5H1T3lGipLPq5m4/8SwSfVzoC2OtmWLaap54qjDR
	J/egXd2MFV4r5ouPb2Fr26RMn1wm8nhjRpAYUZWg0YSHVORoYRdntqxcQuPZ+hhHh7kl
	Iz0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=FGmpQhBjPMMzl0TCQjo+JfLVD6WOMuLB0QOHOvSFPh0=;
	b=Zzlw21BHH84HAgg3X41+Mp0anJCfbyTFFLoXnfHJcp247C+cM59h1BvveYnT6zsvoJ
	QxNi979Y7MMdiyqjFxW81ieiuq0a1wrxj5JUjHLJiNtOm9Lx05lbOwhddnSj9Q6m1F6z
	z74fzVWTLwSYyNvhaTzsfw6P0nS17Y8DbuYUTOv6tEgauMGCB/nUKNrBn74+/LM1pcY4
	DxDA5H4S3B4QkhVK4Fk8E2AgvMI5yfMoY6XgSVtGLKfAWap4PvJ1AWsXvxHotUURlcqn
	f9cC9xrL0TMYG0lKRlJxkOJyVd1hRhecLGnw6vn6azbMSYibFydJ+fxJSLNoTHN+J6Fe
	ZBoA==
X-Gm-Message-State: APjAAAVm4y9U2ABYvJwbPSQoq0K3qWFmCVS1sQk4XrR70LnSZbbdGsRC
	sKquQCm/30MFv4S/VfWVkX+svomc154fafhFj5c=
X-Google-Smtp-Source: APXvYqyj/gZFd4O7QpnrUglFfdqYFUrjm8tq6c27x8CYtQLP3jmZlbXk7v+yT8FyFsekI/KJvgY17IK9n/R51Wmm3xc=
X-Received: by 2002:a19:c80b:: with SMTP id y11mr54618lff.184.1568666524488;
	Mon, 16 Sep 2019 13:42:04 -0700 (PDT)
MIME-Version: 1.0
References: <20190916124144.28576-1-ross.burton@intel.com>
	<CADkTA4NPu1wUZL7Qri=CXS8QjoFv-KpTCk08-yXRkYLAgaUN=w@mail.gmail.com>
	<6379bdb4-31f1-7c95-e883-b585899da45d@intel.com>
In-Reply-To: <6379bdb4-31f1-7c95-e883-b585899da45d@intel.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Mon, 16 Sep 2019 16:41:53 -0400
Message-ID: <CADkTA4P8bbH1C0BGkSVs6Wh_zaxNADcCAYvicqemPc2yTsz1-w@mail.gmail.com>
To: Ross Burton <ross.burton@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] kernel: do verbose builds
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
X-List-Received-Date: Mon, 16 Sep 2019 20:42:04 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Sep 16, 2019 at 4:27 PM Ross Burton <ross.burton@intel.com> wrote:
>
> On 16/09/2019 14:18, Bruce Ashfield wrote:
> > On Mon, Sep 16, 2019 at 8:41 AM Ross Burton <ross.burton@intel.com> wrote:
> >>
> >> Pass V=1 to kernel builds so that the compile log is more useful if it all goes
> >> wrong.
> >>
> >> Signed-off-by: Ross Burton <ross.burton@intel.com>
> >> ---
> >>   meta/classes/kernel.bbclass | 2 +-
> >>   1 file changed, 1 insertion(+), 1 deletion(-)
> >>
> >> diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
> >> index ebcb79a5286..9d2e1e476d4 100644
> >> --- a/meta/classes/kernel.bbclass
> >> +++ b/meta/classes/kernel.bbclass
> >> @@ -324,7 +324,7 @@ kernel_do_compile() {
> >>          fi
> >>          cc_extra=$(get_cc_option)
> >>          for typeformake in ${KERNEL_IMAGETYPE_FOR_MAKE} ; do
> >> -               oe_runmake ${typeformake} CC="${KERNEL_CC} $cc_extra " LD="${KERNEL_LD}" ${KERNEL_EXTRA_ARGS} $use_alternate_initrd
> >> +               oe_runmake ${typeformake} CC="${KERNEL_CC} $cc_extra " LD="${KERNEL_LD}" ${KERNEL_EXTRA_ARGS} V=1 $use_alternate_initrd
> >
> > Personally, I wouldn't want this on all the time. Most of what V=1
> > provides, I never use for debugging and it just clutters the logs.
> >
> > Can't this be triggered off a packageconfig-like setting for those
> > that want it ?
>
> If you object then I guess it's easy enough to add it to
> KERNEL_EXTRA_ARGS or something when required.  I only did this because I
> was chasing that build paths thing and needed the full build log, and
> typically we enable the full build log so it's there if required.

'object' is a strong word :D I just know that for the most part, I'm
not looking at CFLAGS or other Make/path issues when I'm looking at
the kernel build for issues (and that could be different for other
folks), and that I've found I end up doing custom instrumentation to
debug Make issues, versus getting anything really useful out of V=1
(it's a bit chatty). That and I've never done production builds with
V=1 (even if it won't impact the output).

It would make the logs a bit bigger, but I can't see it having a
performance impact .. so really, it isn't a big deal. But it sounded
like a knob that we could add, since clearly there are two different
points of view and modes that people may use.

Cheers,

Bruce

>
> Ross



-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

