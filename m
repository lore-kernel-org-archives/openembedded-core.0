Return-Path: <armccurdy@gmail.com>
Received: from mail-wr0-f174.google.com (mail-wr0-f174.google.com
	[209.85.128.174])
	by mail.openembedded.org (Postfix) with ESMTP id 71EAE787FD
	for <openembedded-core@lists.openembedded.org>;
	Sat, 18 Nov 2017 01:27:06 +0000 (UTC)
Received: by mail-wr0-f174.google.com with SMTP id p96so3529413wrb.7
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Nov 2017 17:27:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=jhYbqmGhAzAwZ+cPqHz1BrdtsIhNBr1wgmeoPzWOgro=;
	b=exLflb/yx5xqUX82CN7VIOhxU1aYeph/uG0+jJaT9QWx/DQRrPZAlpteeCH7Bprg6z
	dkxXmJuSDZ38+uziG69dEU3dgzRSalWYCepnlk4RuPpAxJk+xWxArUEIQbAoNZm18/oi
	rjxpET7h8mnIk/ViW3kKpYMw76wbWTHNpUdw31AOyE6UkUSkcM8Tz7S5/XDRO3SrhEqL
	kIXeIdSD5eO1Rm5OvO/PIPy4GULcI+B7bKm4XtJZeNllhFDpg4Jzv4y5t96Hm1bX8FUA
	88NqLSzGUIL8r1TnCM+xumPgYJsqRmpeXy/r9Nu0OqRm79Dgzr0LARHCeOOzBaz9XRFf
	Lpog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=jhYbqmGhAzAwZ+cPqHz1BrdtsIhNBr1wgmeoPzWOgro=;
	b=igUt/d6aE0kf+yXdzIGcEje3jHBfXYPSp2JtLqj+Df6+a1a7WLQ/cq1XKJli925Hpz
	a7MCgpxZjBHPgc4ktTvkukBi6Tmb45CCv1qhzwFgqXOWzqtSQmN3bPizu5/LCEqzqVPY
	7OXYRnohQPMkeGMhrHS7TMQ8nio8ptzKjWk9Ap3N5e8OerTIMvAtxW32RDyi4LJS17NQ
	ZXlY3BbTB9skwVRDXC9sKp6kMpZowrRMl3WJ5cGoWM+47n0MDqGFPlrJvtQG6teZUW2b
	v2wDmo+guoQHqoVuShAY2piM6/Bf05IlpCDRKjOqX/ng3llKogBgJTMwVlNunAVRsaZH
	b+9A==
X-Gm-Message-State: AJaThX7zmWSucUgrqAgvIowmSwMUW1vcsfcn/nRrG5iKTOQN7AjqJ/JC
	ucEZzdvr0tv4Mnn5PuEu/wMmTR+BEXzCMuy8LCk=
X-Google-Smtp-Source: AGs4zMb4m56MB2j3kVV97P3rgOrV/WdPT9A/057L1A7ImT5dXN1zmOmvAUS7BhSa+ByJQAPXdU8q5owwfWzo7ZKWJVw=
X-Received: by 10.223.196.189 with SMTP id m58mr6213662wrf.7.1510968428114;
	Fri, 17 Nov 2017 17:27:08 -0800 (PST)
MIME-Version: 1.0
Received: by 10.223.133.98 with HTTP; Fri, 17 Nov 2017 17:27:07 -0800 (PST)
In-Reply-To: <CABcZAN=WRku1y27c_KXfhLs3b=vBAiNRBPaP_RRn0+rbzbvkXA@mail.gmail.com>
References: <1510861730-82471-1-git-send-email-juro.bystricky@intel.com>
	<1510861730-82471-2-git-send-email-juro.bystricky@intel.com>
	<CAJ86T=Xs5b3dNfaNFE_kzDJ1AMknRPqMw60gC_c+8gBA21SiNw@mail.gmail.com>
	<6E51916E4A1F32428260031F4C7CD2B6404703B8@ORSMSX112.amr.corp.intel.com>
	<CABcZAN=WRku1y27c_KXfhLs3b=vBAiNRBPaP_RRn0+rbzbvkXA@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Fri, 17 Nov 2017 17:27:07 -0800
Message-ID: <CAJ86T=X41Cg9wQ0sJPXe56SLv0GjGidvKa3ZcNRyvLwSxcKojQ@mail.gmail.com>
To: Christopher Larson <kergoth@gmail.com>
Cc: Juro Bystricky <jurobystricky@hotmail.com>,
	OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/4] gnutls: improve reproducibility
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
X-List-Received-Date: Sat, 18 Nov 2017 01:27:07 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Nov 17, 2017 at 5:08 PM, Christopher Larson <kergoth@gmail.com> wrote:
> On Fri, Nov 17, 2017 at 5:23 PM, Bystricky, Juro <juro.bystricky@intel.com>
> wrote:
>> > Is there a configure option we could use (perhaps via
>> > CACHED_CONFIGUREVARS) to achieve the same end result without needing
>> > to run sed on config.h?
>>
>> Sorry Andre, I am not quite sure I understand the question. Do you suggest
>> to have a "config.h"
>> cached somewhere instead of generating the file at build time?
>
> config.h is generally generated from config.h.in by the configure script
> (and the config.h.in is generated in some cases by autoheader), and the
> values of those defines are generally based on autoconf test results, which
> are often cached. By supplying different cached results to those tests, you
> can change the emitted config.h without having to explicitly and manually do
> so.

Yes, exactly that.

Looking at the gnutls configure script, it seems that POSIX_SHELL is
detected using a custom test (rather than using a standard autotools
macro) and doesn't respect any over-rides, so running sed on config.h
may indeed be the easiest approach, but you should confirm that first.

Note also that if POSIX_SHELL is used at all at run-time then setting
it to "bash" is probably not the right approach as gnutls has no
run-time dependency on bash (and so there's no guarantee that bash
will be available in the target rootfs). If POSIX_SHELL is only used
at build time and never gets embedded in the build output then perhaps
completely removing POSIX_SHELL from any headers etc installed by
gnutls may be a better fix than just removing the path?

