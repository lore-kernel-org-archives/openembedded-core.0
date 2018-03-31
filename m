Return-Path: <armccurdy@gmail.com>
Received: from mail-wr0-f194.google.com (mail-wr0-f194.google.com
	[209.85.128.194])
	by mail.openembedded.org (Postfix) with ESMTP id C1D2674792
	for <openembedded-core@lists.openembedded.org>;
	Sat, 31 Mar 2018 06:02:29 +0000 (UTC)
Received: by mail-wr0-f194.google.com with SMTP id u11so9380731wri.12
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Mar 2018 23:02:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=odMLHoUcbMxHma9cTnWnp8fmISMsSpyybsVnyp/lJNs=;
	b=tfEoN5zT0Gmi2S1c532JN5uXrI8/On2LVX9zFurGm3aa0eNvYfqwFYbvjHktGK0rot
	ushpT2eOX7AEdQJnv9FqmuQcANSuUtHEqOm4GUN3kHHjOE5b9Ems7kTAnh7qQW6bzJ/c
	Guh+W3hZo23boNw7xHqCvKMdvePtU3ZLqbJsS13PmL4a7EzEEKqWHWkpTzS4HPJyvD3r
	rE+S6SLZ2RjPo3GwFA1mee5/XwCQdt+Pt7L34h8mkt0mwtpShtTQfoJJAREPbbqUsqtU
	9Q7dXNKlENUxFnPEaw931QkD1D2mtrRcb/D+6GAx9dDwFfjy7c+DY7pZX35yTe9e4j8y
	kYPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=odMLHoUcbMxHma9cTnWnp8fmISMsSpyybsVnyp/lJNs=;
	b=ljb+qRue5IGXr4SQ9SIy6SLR9/HsZwgbVF7ce2Xw5KV0Rq5Ch/VhST1mdF2c+jyMmS
	dog/uB4qq76BC/GUGv+i/ghU0Jj0dYQbKBfAU4ACcdZSpzv8mkm7CZTtLbel0qHId16w
	Da6sZlaPEN6mtxc5bnEE9U0GMNVbpunm+YKI45sR5dspvFh+N7PCyTYW+xVqj+ffNiU/
	XJhsepP4jHTONPcnkyNlV3d4Z6XwqFvr0d21RdvAEFefcObXXsEGUcHs/SKV5TtzmaTH
	PkaatOT7QCN1hg8PglW2WRdM6TfwwP0HH1fKdFciLXYTjoWmjVTWBKjBDNb0xn0wJscZ
	DR9w==
X-Gm-Message-State: AElRT7HB8417s3a0vpfQNbhGWbd9mgUEjxn0kb4yWbLs9B39crzTNct8
	znveGP+xVr0kFzqw/HvLiRXF/0KF9U7JBAnVXPk=
X-Google-Smtp-Source: AIpwx4+nTgDcAYqjfSii+HSfyVdY6f1xrk+kade2kBuyRkF5VqklMBVE1xrCFqL6YCmXANiz/Dr2GwyivKtV37vTMdA=
X-Received: by 10.223.177.213 with SMTP id r21mr1128878wra.89.1522476150495;
	Fri, 30 Mar 2018 23:02:30 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.163.65 with HTTP; Fri, 30 Mar 2018 23:02:29 -0700 (PDT)
In-Reply-To: <20180331000631.5f050451@seebsdell>
References: <20180327154802.14611-1-ross.burton@intel.com>
	<CAJ86T=WCAKWoQhxM+2ako7cYJH2RieuGyuLMXcmjNETBidbsaA@mail.gmail.com>
	<CAJTo0LZUdMAtWKtGnPstotRGiHUPwZ_80PmuSzj5wpAFWGcN0Q@mail.gmail.com>
	<CAJ86T=WcgEo8SFRLPeRXyFXU-tRwXn0bXdYjiV4D9G19BOWuDg@mail.gmail.com>
	<20180331000631.5f050451@seebsdell>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Fri, 30 Mar 2018 23:02:29 -0700
Message-ID: <CAJ86T=UOuOWaOtQ8Y7bDc1170kckLvgg+FAfLx_sHT68r=mJRA@mail.gmail.com>
To: Seebs <seebs@seebs.net>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH][RFC] pseudo: intercept syscall() and return ENOTSUP for renameat2
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
X-List-Received-Date: Sat, 31 Mar 2018 06:02:31 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Mar 30, 2018 at 10:06 PM, Seebs <seebs@seebs.net> wrote:
> That's the problem: There's no sane way to express "the size that you
> would have gotten for these arguments of unknown types"

And there I think lies the key point that you still haven't grasped.
The arguments are not of unknown types - they are all of types which
are the same size as integer registers. The syscall manpage very
clearly documents the fact that all arguments to Linux syscalls are
passed to the kernel in registers. I think you even asked me why that
was important or useful.

If there's any user space code out there which calls libc syscall()
and does not pass variables which libc syscall() (or a wrapper for it)
can unconditionally treat as a type which fits into integer registers
than it's a bug the caller. End of story.

