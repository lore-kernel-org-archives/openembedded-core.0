Return-Path: <ross.burton@intel.com>
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com
	[209.85.167.46])
	by mail.openembedded.org (Postfix) with ESMTP id 633FA6B5C5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Dec 2018 15:47:22 +0000 (UTC)
Received: by mail-lf1-f46.google.com with SMTP id b20so1700264lfa.12
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Dec 2018 07:47:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=q07xltA2elmqykK1jzoNSl+3vdBvATAbeYQqt+XUXbg=;
	b=jUyH5d63hWe6zeVMEuANx92VU1oUiK++EHSyaGu3l1MK4FytQwvctSbg0G1xINQfYs
	3tC2lktVY3r9+9qK8oRuH9W27sw0V7Aku1XFt9pY8oGEd0jRGCiEtMnODC/KYToHgbOe
	tzVDIdlQ3RKjZNI5ALCYpVUQHBblEI4DmBguHCChEG82+C8Vo+nH9DyYnrVg+2+n/ttp
	JyEJ4gUSYb/Bx97tUWRKqdj7ldrJrjG0XzVCLCjVzEup/g7KhsyB5TAarxPpQrIPdn/k
	uuyrpllzqt6yzxMQJZlZtY4S2VWdJv2fhMsa5+aGzO/evZnoiWj41v7Ii5HVAw57ceMb
	PJgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=q07xltA2elmqykK1jzoNSl+3vdBvATAbeYQqt+XUXbg=;
	b=jFqe5OnxUKBw8uSIRJBweVwsGs/qmuUVstsb8hrw7BLdm2u2qelPTBP0Nx65TNMkxu
	8MzNPYacStFYiIQdZjrqK3I6cJOJLMQDT6uiZ47fWtJMb80yMmqquAQeu1a0GrAY/n0I
	/MUSTZL/i7tHanRCaLIeHAdoiRyvceT2Lpc9HDMJKSoiHMHETTcvF9F9gi53mZF0GPTD
	wrpLiumCa+jX1dqbwuypvOc8NeLVBM9LLz/48CUCrP6Z+i2X4QktcgA77o9pCAuCprnT
	jTWP6gp8HDQ4q9VL+VexI5Fl0FdaR6nirGtX+3VNDmnmbbEg8q/5WazsiO6GjgIfRWTm
	Ql2A==
X-Gm-Message-State: AA+aEWb1+XkB9VeqyONpX24dNgXbw8EUJBR2+93vn/I395DTrn7e6sVE
	fAp9L8SNwhJAfEMMRTUGZLNhOhQ28x4TSHzz6V19lg==
X-Google-Smtp-Source: AFSGD/XHBug5qXlSpSnX39zpfHGYSCCueUV3I0L8d8Ysz/6gpJ4h/+G5LhDZt127NzbicpGbHv/cR5N8rvi63lbKrNs=
X-Received: by 2002:a19:641d:: with SMTP id y29mr15249620lfb.14.1545320842771; 
	Thu, 20 Dec 2018 07:47:22 -0800 (PST)
MIME-Version: 1.0
References: <e0464c53-3d11-884c-75bd-1e78aed97ded@linux.intel.com>
	<E4F39B19-40EF-4774-B2B3-6C37A2CB98DC@fuzziesquirrel.com>
	<CAJTo0LayfGOMkwFrLStd9_93fBBG8ZH4b806T5CCo=A1nbTCWg@mail.gmail.com>
	<CAMKF1sp1DLQwANi8sbHp4pP-YPPMbVOOsArUoxa286QAgTx-Lw@mail.gmail.com>
	<CAJTo0Lb1Vq7-UXWKZf5hs4L4HzKAu45HTOnxtFXkOCttA0BiiA@mail.gmail.com>
	<CAMKF1speLVxgZXojHO5ZBNO1LQXS4CMFvhK6VEbkeJL3giyMiQ@mail.gmail.com>
In-Reply-To: <CAMKF1speLVxgZXojHO5ZBNO1LQXS4CMFvhK6VEbkeJL3giyMiQ@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 20 Dec 2018 15:47:10 +0000
Message-ID: <CAJTo0LZUEDT48YAEGc=+XPW9b-+qJU_RYAzw85hQLwYm-J2AVQ@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OpenBMC <openbmc@lists.ozlabs.org>,
	Bradley Bishop <bradleyb@fuzziesquirrel.com>, james.feist@linux.intel.com,
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
X-List-Received-Date: Thu, 20 Dec 2018 15:47:22 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, 20 Dec 2018 at 15:37, Khem Raj <raj.khem@gmail.com> wrote:
> > As we build the cross gcc we know what is in it.  Other toolchains be
> > they clang, ICC, or external GCCs, can override AR just like they do
> > the other variables.
>
> Yes they can, but what doe this buy us ? except we make Core toolchain
> gcc dependent one step more.

The core toolchain is currently GCC dependent already by definition.
I'm actually about to start working on abstracting the core so it
doesn't make any assumptions, like how there's no hard assumption of
glibc in the core.

Ross

