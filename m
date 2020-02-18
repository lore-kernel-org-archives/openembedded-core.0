Return-Path: <jupiter.hce@gmail.com>
Received: from mail-io1-f47.google.com (mail-io1-f47.google.com
	[209.85.166.47])
	by mail.openembedded.org (Postfix) with ESMTP id 99A3060618
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Feb 2020 11:30:40 +0000 (UTC)
Received: by mail-io1-f47.google.com with SMTP id s24so21884412iog.5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Feb 2020 03:30:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=/RBi8SoKNDspD7E9lgdHgVr2AFtLsqWbw/Bb8plyQGw=;
	b=TTbrjQ+yq6XmICDySdrkLt5tF2+ipqzg568h4wpVGlngQKOrcms1WBL8U3Hvp8Pf7Y
	WXzaMyoLFMcim8YAhOpAvUQhz/Ygg0AqJtDqiR8agHAKVOee/LBSUacCcwSy/OnEYx4b
	ZCZYIDZJJLVCaTVrfutxnGPjIyibiz1TM61ovtVy9b4uWuO4txrtFF7IEYl/syJaOjwZ
	N3bVQ+BE8/z6kwN2FRN3Tk9Nfflau6QdnUEDrkkrL17Q1y9OqvPzATIEbp65d1mLxkL6
	xTS5QxjxtfHhw06Tln0QFuDFC9bqULm0dFLiI1tPtwKb1v8HN4wl6ME8BePMtcfgVSjm
	MYrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=/RBi8SoKNDspD7E9lgdHgVr2AFtLsqWbw/Bb8plyQGw=;
	b=n7an80N+R76sNjuMpHfW6Px7dLJCQhV0nO2FtOHZu1f8hT1auEMzIvGPMTjOUs16d5
	AhUwALKFdHqguFVV1yOqeJNnTkuEGvjIYi+CO6DrO40YAVisunEHRZVtgoxHSa+gd22Q
	3hHcErlapx/zPUwQSYdAK+KVVwzlOCRm1U7K4dPo2gjRbGbj6fx+Jkg5npKEkmdeYpcF
	ugFSrffzxywdHioDZZhGNo5d3GWMuu8t7bajfyMkbULKr6jUB2P30Qi9l/Bt4h3blfsz
	lXb3/gIkiUGbK/C2ZCJt9VMXdmHQdR7Vwy/pLpY3KXOCQwFHFg3/PlT5zN6Z2UdUPc2C
	nUgQ==
X-Gm-Message-State: APjAAAX8F2XZLB0jBxaHTD6s1l2/jj2EbJtUpwv0CTxyfBiglw0itRz0
	MxonNEUCyyLs+ii0wNvceD1yAf+RVPRTHgzwIac=
X-Google-Smtp-Source: APXvYqxgwI3J339KH2qrTwbM/cpAHugZLBLcJXu0ryitnCPbREgA2d7l8pmjfZo09tqPgERCe5fN2k6KQ+3FKtDtFp0=
X-Received: by 2002:a5d:87ca:: with SMTP id q10mr15999273ios.192.1582025441431;
	Tue, 18 Feb 2020 03:30:41 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:ad5:5d0d:0:0:0:0:0 with HTTP; Tue, 18 Feb 2020 03:30:40
	-0800 (PST)
In-Reply-To: <20200218101122.GE104502@korppu>
References: <CAA=hcWTDqhJEE7MXFY9rvN93nf8=nWvshLoXKF3EMXYGLmZGbA@mail.gmail.com>
	<CAAfyv34yO7bSR9GBod1bXpD0sFnsSETsJQAzcmSgyY0orGtfcg@mail.gmail.com>
	<CAA=hcWQFcdUJKGTOitOAx1URD7r=9PPxsdd=hQO-Yb77=QHTDg@mail.gmail.com>
	<20200218085848.GA104502@korppu>
	<CAA=hcWREdVeYqnOs-3aSFOhobaQWvLoaEU8Rdku_RM=Q5q2Ruw@mail.gmail.com>
	<20200218101122.GE104502@korppu>
From: JH <jupiter.hce@gmail.com>
Date: Tue, 18 Feb 2020 22:30:40 +1100
Message-ID: <CAA=hcWTwmnCWuT73xqgiQQjwHXxSX0ww2g3g1YY6RLw5XS2_vg@mail.gmail.com>
To: Mikko.Rapeli@bmw.de
Cc: openembedded-core@lists.openembedded.org, yocto@yoctoproject.org
Subject: Re: [yocto] Change RO rootfs failed RF Kill Switch Status and Failed to start Run pending postinsts
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
X-List-Received-Date: Tue, 18 Feb 2020 11:30:40 -0000
Content-Type: text/plain; charset="UTF-8"

Hi Mikko,

On 2/18/20, Mikko.Rapeli@bmw.de <Mikko.Rapeli@bmw.de> wrote:
> Well I have zeus and am using read-only rootfs with volatile binds and
> I did not need anything extra. I would dig into this /var/log thing
> and patch it away. I use systemd journal so no need for syslogs.

I actually not too worry about the rfkill error but more worried about
why the rfkill failed? Was it caused by some system problem? At the
moment, I could not get WiFi or LTE connected, which used to be
working in RW partition.

Thank you.

Kind regards,

- jh

