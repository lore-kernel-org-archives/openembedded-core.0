Return-Path: <armccurdy@gmail.com>
Received: from mail-wr0-f176.google.com (mail-wr0-f176.google.com
	[209.85.128.176])
	by mail.openembedded.org (Postfix) with ESMTP id D0F7F7827A
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Jul 2017 23:26:26 +0000 (UTC)
Received: by mail-wr0-f176.google.com with SMTP id y43so64158632wrd.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Jul 2017 16:26:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=xD3w5EjLS0GkVsRLcBdukwtJ+kaGqLRhgcWqfkNR5Vo=;
	b=vM+w3Bq5iWhZVLBzF8zykL+0Jj+TaS4bOfagpDX2JObnE75U6PJ7IyuSusOLeMb2FG
	lmJocgCJXg8ydhRb3ztezrF71HHyHam5T4Si4g/gSEljcB4o5ExARFvGSS6b2irP44Jc
	Q9YZ6WojG7KxMZ6vT3SFNYztlG/Hk2SMJXiGhZvIGeHfbfZHX+EN53N/ulRUoBoB4H0u
	5nHVFVeacrqH6H0RYdE2BYGDY6Nh3l8eBZwmGR8bVIKRuGwkLAJ64tUET8+EnqAF/0yG
	gSfkOX3YLjZLbwKHFlt0A8rNjY3TjNTo2jyMoKNFqA793qNx+drqaAABjPJI8J7XuTPw
	FEaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=xD3w5EjLS0GkVsRLcBdukwtJ+kaGqLRhgcWqfkNR5Vo=;
	b=Fqb35lIsNnTipPwfmmH6OO58dgPs7TFkFuw0mwfkjv8v8Zgbm1Wf3WPQ2Q380UUjyz
	qjy/9EIIzqiC3ubLIXc35rBVBrj/Xm7tyvmRVHsILnadQb8Z2Ut/bcATDQawiopIuV9r
	m5nFQ7nAYN6qtjk2ZVqmuzgZhbR0oDHXT9/rR7SjexgV5vhO9XzAPGhNbsnZn9eR94m9
	jS+CVNGgKQjashrvOIrXRHNNPT2W+ypB7fWHH5h/HURFFiLQTa4MZ/dj5m002OJCqnSC
	czPzyIaQoBEQwaElWs3wBtgAxlTeJvKLYOVWgOiPgMBBrr9n6p7lmd62jrLSDFcKH6fo
	aAlA==
X-Gm-Message-State: AIVw111T2HrZxba3qFZk89EvPfxCq8De0B9lpEybISgbUtBwjtA6dXHp
	Tk1Q3/6XZENO6per/8zMEBU49eJcEA==
X-Received: by 10.223.179.216 with SMTP id x24mr5178208wrd.7.1500506787732;
	Wed, 19 Jul 2017 16:26:27 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.177.136 with HTTP; Wed, 19 Jul 2017 16:26:26 -0700 (PDT)
In-Reply-To: <6E51916E4A1F32428260031F4C7CD2B6119BDF6B@ORSMSX112.amr.corp.intel.com>
References: <1500417901-4667-1-git-send-email-juro.bystricky@intel.com>
	<CAMKF1spivq5cRcMDz-uehbqWRUzXyJf6TQ53sOtmFJu+_i1iqw@mail.gmail.com>
	<CAJ86T=XT9yufogwxMbV-0dW1ooYdvy5DOequ_X4fRQ7=nFWdOQ@mail.gmail.com>
	<CAMKF1soRVeHPLh_LFSxpcGG=1u1OcKvMv3yEifihP_Y7Y-eXUw@mail.gmail.com>
	<6E51916E4A1F32428260031F4C7CD2B6119BDF6B@ORSMSX112.amr.corp.intel.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Wed, 19 Jul 2017 16:26:26 -0700
Message-ID: <CAJ86T=XYR9Z=aMO-BAAZYJ2Lh=ZXQy+J5J-LjSuT-n_Hx-1ayA@mail.gmail.com>
To: "Bystricky, Juro" <juro.bystricky@intel.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gcc-7.inc: add new warning "Wnot-cross-compiler"
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
X-List-Received-Date: Wed, 19 Jul 2017 23:26:27 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 19, 2017 at 2:57 PM, Bystricky, Juro
<juro.bystricky@intel.com> wrote:
>> precisely, the problem is that some host compiler may silently ignore
>> unknown warnings and some host may not be using gcc as default system
>> compiler at all e.g. mageia distro and may be more in future.
>
> Yes, it does not nor it attempts to solve all toolchain issues.
> The expectation is that a compiler will choke on an unrecognized option.
> For example, gcc will do the following:
>
> $ gcc -Wnot-cross-compiler hello_world.c
> gcc: error: unrecognized command line option =E2=80=98-Wnot-cross-compile=
r=E2=80=99
>
> As for non-gcc compilers: yes, they may silently ignore unrecognized opti=
ons
> (which IMHO is just wrong). In that case the new options does not work as=
 intended,
> but it does no harm either.
> Anyway, the intended use was to add something like this a .conf file:
>
> TARGET_CC_ARCH_append_class-target =3D " -Wnot-cross-compiler -Werror=3Dn=
ot-cross-compiler"

Personally, I think we already try to pass too much via CC or the
compiler command line (e.g. -fdebug-prefix-map=3DXXX). Has there ever
been any thought of OE providing a toolchain wrapper, which could pass
these kinds of housekeeping options to the underlying toolchain while
keeping build logs clean and without the worry that CC, CFLAGS, etc
get ignored or clobbered by a custom Makefile somewhere?

