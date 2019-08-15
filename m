Return-Path: <armccurdy@gmail.com>
Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com
	[209.85.217.41])
	by mail.openembedded.org (Postfix) with ESMTP id 465A17F2AE
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Aug 2019 21:31:12 +0000 (UTC)
Received: by mail-vs1-f41.google.com with SMTP id u3so2410686vsh.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Aug 2019 14:31:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=SclboWennSpdCWebM1QFQ5O0VPQHQGCLN2DwLCIHCk0=;
	b=RnXi8uyWc9bYVU2RebaDfV4U+jS4WXlYpSKPhaBLdJVFFuQhv15fHS261X9vKkUgI9
	Xq7RPN3C7NA+0QAGhrl7sn3dY++vODdFOxeWcVPEQUl+hLVVshVD/ruHUyYrS65yUfMr
	oJGN5hDQf1q1LgjPqb/Oi9I57P0N3s4TDZhcdTJkfFxpIB01hMGlEGR8G7bVPB39CSFJ
	VLla6MH+VH6HaSaFWpyVZSRKWz4g0C5H6E8axOpnYaCWgtxbumSy+wy3kQsKnzHk4XdC
	belmdLqGLKaRBzUjSOq14ae4iPU1SSZXBHmvtfFZBvYapsB3VdYHD4hzqd1wg05RL+uD
	yHlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=SclboWennSpdCWebM1QFQ5O0VPQHQGCLN2DwLCIHCk0=;
	b=pQne+OTBymDzemKb5H984hsQR4u4X2x//uE0AcOZQchbOu3RUpRnqm/kCzkOefh3mH
	rac4Hhv3WyKYzDCDdmeRG2EqghaygAL91dVsXffXAzrzy2guy+Ajp/JcbLuDsGTu8gbQ
	lm8ipBAnPlsp9tmmAXcvR91G8tefxLzGPe13mxY8ieknkyTuZWP9vrvjGWfN5zZ7L4eg
	BNvjpzrhbKli5RkREcbT+Vc9tkENaz+sVuZnyGgj4anUrDS83PsqV5Eh+fS1fzB+RrO7
	vVyeLZ7bHCjQ1iK4EWoVa6jsjCJiGWuKFTG0te6ewCo9OG++EhD3QNkP0lcpDhCVkoad
	Fn2Q==
X-Gm-Message-State: APjAAAXDG/+xvvmghdN+db0DjVt3lfi6tNtvMX8FWGIyzgVFhacUXTlT
	NCQstO65AH2WFhiz8rnyscxUi5O/KkClp1yFpmI=
X-Google-Smtp-Source: APXvYqx7DdcOn3sNEnoYIgr/L4DPFYHC/6kOsmvOsqczc5SR3WpscvgsJeZaIb8z3yiW7L0bPlx34LU4K0qqtExqRx4=
X-Received: by 2002:a67:12c1:: with SMTP id 184mr4598338vss.222.1565904672915; 
	Thu, 15 Aug 2019 14:31:12 -0700 (PDT)
MIME-Version: 1.0
References: <20190815065343.5291-1-naveen.kumar.saini@intel.com>
	<7128b7d3-78c0-0a66-8e55-65fedeab2dd1@intel.com>
	<CA+chaQeeS+Ludz64ke19Hr5h1knrvbe769N5vhMQLH7=E_dmbQ@mail.gmail.com>
	<b2ae3b8bff8bf0c2f42d588841347ad8b6844ef6.camel@linuxfoundation.org>
In-Reply-To: <b2ae3b8bff8bf0c2f42d588841347ad8b6844ef6.camel@linuxfoundation.org>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Thu, 15 Aug 2019 14:31:01 -0700
Message-ID: <CAJ86T=Ux9UQs3eVJR5NOyZYJMMDtNRHr-Nppq0d5D5JFMryaMw@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [warrior][PATCH] bitbake.conf: add git-lfs to HOSTTOOLS_NONFATAL
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
X-List-Received-Date: Thu, 15 Aug 2019 21:31:12 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Aug 15, 2019 at 2:09 PM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Thu, 2019-08-15 at 09:23 +0200, Martin Jansa wrote:
> > NAK
> >
> > Yes, the first part was merged in warrior and is correct.
> >
> > But this second part isn't good (you don't want git-lfs to sometimes
> > work and sometimes fail) and that's why it was rejected for master
> > and _shouldn't_ be merged to warrior. If you have recipes which need
> > git-lfs, then add it to normal HOSTTOOLS in your builds to make sure
> > it's always present when needed.
>
> I don't like the patch but it did merge to master.
>
> Building a git-lfs-native is a nightmare due to all its dependencies (I
> think its go based?) and there wasn't really any other way to sort it.

Upstream provides generic binaries for at least x86, x86-64 and ARM64:

  https://github.com/git-lfs/git-lfs/releases
  https://github.com/git-lfs/git-lfs/releases/download/v2.8.0/git-lfs-linux-386-v2.8.0.tar.gz
  https://github.com/git-lfs/git-lfs/releases/download/v2.8.0/git-lfs-linux-amd64-v2.8.0.tar.gz
  https://github.com/git-lfs/git-lfs/releases/download/v2.8.0/git-lfs-linux-arm64-v2.8.0.tar.gz

Would just downloading and installing the official upstream binaries be so bad?

> Having recipe specific hosttools would be ideal but we don't have that.
>
> Cheers,
>
> Richard
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

