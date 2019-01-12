Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f194.google.com (mail-qt1-f194.google.com
	[209.85.160.194])
	by mail.openembedded.org (Postfix) with ESMTP id BA6697C0F4
	for <openembedded-core@lists.openembedded.org>;
	Sat, 12 Jan 2019 18:30:51 +0000 (UTC)
Received: by mail-qt1-f194.google.com with SMTP id e5so22384246qtr.12
	for <openembedded-core@lists.openembedded.org>;
	Sat, 12 Jan 2019 10:30:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=j62NP+astsKcx+SCFphp41UPKo3dr7WUi+S4CROeUrc=;
	b=ZRcYPeChRUcsuUpS3YyvaoqiMVW6STZ1xpXXmfPcc9hx9QBQVX8IJUcfCRdiVORvBX
	RyMYUVtUaotQ8SriabJDsT2+p3Oth8x5z/rAoBQsC4dVpX3R19h3KdfxcVWFcRxsG5ln
	U6zRZFT1KxOB7G7EQ7/NZfVmpBMrqs5m4qOA+zfD1ve8n0Vqa1m+wTCPQ/2R4AB1garX
	r3AuRV6/wd1LndfKL1KtGlAx/8lghcTD9RhnX+iz7kHM5SYHX2OuaXaLFZredxKoAztK
	jk63MEZeRtGq9nxFVrQT25OCF+c3GfRbgOWk9wwA/3vC2pyKBy3axwiCnGva9Bt7lGh2
	sSOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=j62NP+astsKcx+SCFphp41UPKo3dr7WUi+S4CROeUrc=;
	b=P6xlDqu8RxMdIEqSzuoSRtk/aJ3g1j3WtY43QhTERGmJ3whaXTnoPT02ddBRyAy1Be
	qx8UW1x4h3bojOxgWBfjdO772mlyjABuSgynqNiUFkjL24fR3WAcq34DqXMp+MAkgVRF
	IjmFVOqf/ajf5POIylg36V7q2FW7/uGxm5WLi+qi7vcg1XtIjidsZWEaQFFyt0ToYq5Q
	Il1ml9JXWb17jPV0/MdqmkNZ14hk+rvIl4Pf2fkoxAIk2D49bF6TISzoXy2SAQl1vf3x
	mxBFWeeQuZ0MvLDw4RBxBiLF5mkrcoE7f38DXLa67nV2uW6JQxYC5n4MoaxeIwJ+RcgM
	9OHA==
X-Gm-Message-State: AJcUukeH7ap8Lzj9oP7T4LLGCHI3Wn7KYgEoDkhZxEhwcEbiqWPt3k91
	bwuwHUlSLVq8epWIOIHyrcAW1TM6hyD0JlnDv1U=
X-Google-Smtp-Source: ALg8bN5tKOlBANU6YZpQsBuPFLM/AxLDqQ69dkTWd0r0ic7ekg9a7x+aK8gQX2exQ+3I4hSfUpkX1WddMo5oo3/V4Lw=
X-Received: by 2002:ac8:518d:: with SMTP id c13mr17815803qtn.254.1547317852448;
	Sat, 12 Jan 2019 10:30:52 -0800 (PST)
MIME-Version: 1.0
References: <1547284970-20783-1-git-send-email-serhe.popovych@gmail.com>
	<1547284970-20783-5-git-send-email-serhe.popovych@gmail.com>
	<CAMKF1spcERO0rDuBS4ynFPRaNWa34dqTcYuxgzQ=+HQ=M6tmZg@mail.gmail.com>
	<005a80f5-312d-9fb4-4d94-1345d61a0115@gmail.com>
In-Reply-To: <005a80f5-312d-9fb4-4d94-1345d61a0115@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 12 Jan 2019 10:30:26 -0800
Message-ID: <CAMKF1sqyNgcBYSkm2=cfU3=Qfeab5Mxaxk5dq+vyz8_9MsB_Cg@mail.gmail.com>
To: Serhey Popovych <serhe.popovych@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 4/4] valgrind: Mark powerpc64 with musl as incompatible
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
X-List-Received-Date: Sat, 12 Jan 2019 18:30:52 -0000
Content-Type: text/plain; charset="UTF-8"

On Sat, Jan 12, 2019 at 8:53 AM Serhey Popovych
<serhe.popovych@gmail.com> wrote:
>
> Khem Raj wrote:
> > On Sat, Jan 12, 2019 at 1:23 AM Serhey Popovych
> > <serhe.popovych@gmail.com> wrote:
> >>
> >> Building musl for powerpc64 enforces elfv2 ABI since commit 68c964185519
> >> ("arch-powerpc64.inc: Use elfv2 ABI when building with musl") that is
> >> not compatible with valgrind.
> >>
> >> Signed-off-by: Serhey Popovych <serhe.popovych@gmail.com>
> >> ---
> >>  meta/recipes-devtools/valgrind/valgrind_3.14.0.bb | 3 +++
> >>  1 file changed, 3 insertions(+)
> >>
> >> diff --git a/meta/recipes-devtools/valgrind/valgrind_3.14.0.bb b/meta/recipes-devtools/valgrind/valgrind_3.14.0.bb
> >> index 4d15a50..d882319 100644
> >> --- a/meta/recipes-devtools/valgrind/valgrind_3.14.0.bb
> >> +++ b/meta/recipes-devtools/valgrind/valgrind_3.14.0.bb
> >> @@ -58,6 +58,9 @@ COMPATIBLE_HOST_linux-muslx32 = 'null'
> >>  COMPATIBLE_HOST_mipsarchr6 = 'null'
> >>  COMPATIBLE_HOST_linux-gnun32 = 'null'
> >>
> >> +# Disable for powerpc64 with musl
> >> +COMPATIBLE_HOST_libc-musl_powerpc64 = 'null'
> >
> > lets do it for powerpc64el too
>
> I guess powerpc64le is GNU standard target, not *el.
>
> Support for powerpc64le is missing in OE. Before it is
> added I'd prefer not to do this for powerpc64le.

IIRC there were some posts for EL in past, but OK lets not
do it here

>
> >> +
> >>  inherit autotools ptest multilib_header
> >>
> >>  EXTRA_OECONF = "--enable-tls --without-mpicc"
> >> --
> >> 2.7.4
> >>
> >> --
> >> _______________________________________________
> >> Openembedded-core mailing list
> >> Openembedded-core@lists.openembedded.org
> >> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
>
>
>

