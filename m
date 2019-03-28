Return-Path: <ross.burton@intel.com>
Received: from mail-it1-f195.google.com (mail-it1-f195.google.com
	[209.85.166.195])
	by mail.openembedded.org (Postfix) with ESMTP id 766947CE73
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Mar 2019 12:48:21 +0000 (UTC)
Received: by mail-it1-f195.google.com with SMTP id e24so5768630itl.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Mar 2019 05:48:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=66PQHj2+8lAKsFdXpENENz9vfsY2zCCgO7nmOljCSDk=;
	b=fe/ik3Hu6d/rDtCdkY7QK77186TJC/+eN58pyjw/kgjyBipS6Tn8bpYirPpMEVYKVN
	1OFeEGSzx82n6wCXJFxmAZEn+UMnR9I1bqkrNqFo3M6dLpNtSxn3ruvFopUVMF9bE4gT
	rt4hDKYd69QoL5fykaaxUxbwsKcYyOyEns8slpgzVo8z+al5ICvSMMOh6Flf8EiIKg0B
	yd9y+rGK5jxj73Bfn/ep8iOCoRwXkppDPgS/bYR6kZZAhOFVoyJCCajjymlyOqjXaz0T
	RP3oJI0ia+djIzzSruK5PP3pcSadMBSMIoremJ3yLC2Awm6aC/SnQFgaE+Am3g247VgC
	x9vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=66PQHj2+8lAKsFdXpENENz9vfsY2zCCgO7nmOljCSDk=;
	b=NHSL6GvgCBUNm9xJvb3UNyYNHhPGlIIn00TnShIiE+Ql8WUNG2tI1In5Ewo6fXE1w4
	OVPc6uPkGMAuyM8ShizBOk3ySA3RwA/cQBiBrtrsewKhu04BYBLefYaXQieJIXugnrus
	N9uy33PAWk5xhK6VwH/mJhWu7VjNRVZrS+6Bmhb3GUw97NkuOcPchjRaI5s6tgQ/QcRM
	CnusgaOeKID41b3mFYrkdA63nrICc0/QxE/GXHrjGx7aGEis12nDneN0tYYWSZHVRlfz
	dq+ZZ5TxNAIx/bn5toTb8sFqDIurW/7txVMPJ6DcXQkAaKMNgqYfdoXoX1X42YPWJihv
	Cn+w==
X-Gm-Message-State: APjAAAW65YhmA5TvKg8mjvBFW5lZ+BBBrQjTT7Q+zNWCC49/LK+kOp8U
	UQYFTPdfNRjWIQYeYNGfkvwDkXT9iL05/g5zSHqSXQ==
X-Google-Smtp-Source: APXvYqzuK0o5SXMYG/BhiM3g1syR9YEl/PcO9oheHGlf7WOPga/X4nPZWk7dxp3KkNMkdAPnsBl3hwajMIhCs874zyA=
X-Received: by 2002:a05:660c:111:: with SMTP id
	w17mr7265462itj.62.1553777302501; 
	Thu, 28 Mar 2019 05:48:22 -0700 (PDT)
MIME-Version: 1.0
References: <20190326120157.4397-1-ross.burton@intel.com>
	<CAMKF1sprxcvAtLQsu-dueRZtvPXvo+ozg9HZ+w+yU417sU3AfQ@mail.gmail.com>
	<CAJ86T=VZpLxYwh2Su+HLFCJFvbEm043fyiaBf4Dezo66O-h=aQ@mail.gmail.com>
In-Reply-To: <CAJ86T=VZpLxYwh2Su+HLFCJFvbEm043fyiaBf4Dezo66O-h=aQ@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 28 Mar 2019 12:48:11 +0000
Message-ID: <CAJTo0LbEU7BUHyYYCOi7rvEFmyPq5te1fJhPiW4yTYbtHVpGZA@mail.gmail.com>
To: Andre McCurdy <armccurdy@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] glib: set glib-specific cross properties
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
X-List-Received-Date: Thu, 28 Mar 2019 12:48:21 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, 26 Mar 2019 at 19:41, Andre McCurdy <armccurdy@gmail.com> wrote:
> > > +growing_stack = false
> >
> > this is mostly true for arches we support but maybe a comment
> > to check it when doing explicit arch ports ( e.g. arm can grown both ways)
>
> Not on EABI or any other ARM ABI which could possibly be targeted by
> OE... unless you have evidence to prove otherwise?

Evidence, no.  Anecdotally:

$ grep glib_cv_stack_grows *
arc-common:glib_cv_stack_grows=${glib_cv_stack_grows=no}
arm-common:glib_cv_stack_grows=${glib_cv_stack_grows=no}
arm-darwin:glib_cv_stack_grows=${glib_cv_stack_grows=no}
arm-darwin8:glib_cv_stack_grows=${glib_cv_stack_grows=no}
ix86-common:glib_cv_stack_grows=${glib_cv_stack_grows=no}
microblaze-linux:glib_cv_stack_grows=${glib_cv_stack_grows=no}
mips64el-linux:glib_cv_stack_grows=${glib_cv_stack_grows=no}
mips64el-linux:glib_cv_stack_grows=${glib_cv_stack_grows=no}
mips64-linux:glib_cv_stack_grows=${glib_cv_stack_grows=no}
mips64-linux:glib_cv_stack_grows=${glib_cv_stack_grows=no}
mipsel-linux:glib_cv_stack_grows=${glib_cv_stack_grows=no}
mipsel-linux:glib_cv_stack_grows=${glib_cv_stack_grows=no}
mipsisa32r6el-linux:glib_cv_stack_grows=${glib_cv_stack_grows=no}
mipsisa32r6el-linux:glib_cv_stack_grows=${glib_cv_stack_grows=no}
mipsisa32r6-linux:glib_cv_stack_grows=${glib_cv_stack_grows=no}
mipsisa32r6-linux:glib_cv_stack_grows=${glib_cv_stack_grows=no}
mipsisa64r6el-linux:glib_cv_stack_grows=${glib_cv_stack_grows=no}
mipsisa64r6el-linux:glib_cv_stack_grows=${glib_cv_stack_grows=no}
mipsisa64r6-linux:glib_cv_stack_grows=${glib_cv_stack_grows=no}
mipsisa64r6-linux:glib_cv_stack_grows=${glib_cv_stack_grows=no}
mips-linux:glib_cv_stack_grows=${glib_cv_stack_grows=no}
mips-linux:glib_cv_stack_grows=${glib_cv_stack_grows=no}
nios2-linux:glib_cv_stack_grows=${glib_cv_stack_grows=no}
powerpc-linux:glib_cv_stack_grows=${glib_cv_stack_grows=no}
riscv32-linux:glib_cv_stack_grows=${glib_cv_stack_grows=no}
riscv64-linux:glib_cv_stack_grows=${glib_cv_stack_grows=no}
sh-common:glib_cv_stack_grows=${glib_cv_stack_grows=no}
sparc-linux:glib_cv_stack_grows=${glib_cv_stack_grows=no}
x86_64-linux:glib_cv_stack_grows=${glib_cv_stack_grows=no}

Yes, this technique needs to be extended and generalised so it can be
overridden on a per-platform basis, but for now it appears that
everything we care about has the same values.

Ross

