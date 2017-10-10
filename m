Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f196.google.com (mail-pf0-f196.google.com
	[209.85.192.196])
	by mail.openembedded.org (Postfix) with ESMTP id 4B43672F91
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Oct 2017 19:05:08 +0000 (UTC)
Received: by mail-pf0-f196.google.com with SMTP id i23so37753298pfi.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Oct 2017 12:05:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=b9Kef3i81qJKhu7l2l0jfB9jegZkRY4YXAThmzqAPf8=;
	b=VlC+pVAwrTwwxCPcpJArO+YhFJtpx6EzWmcv5Fbd1wmdc1m4x3S01k0/YRJS9VbnSz
	XppUOuSg6uDV/DL51MA5NKELuF+iz2Cfs0pdYeozOc8Hv4rKTY2r8s51k8B8vBMy+STK
	0EjLU0wvN8DmQQPj2tCKu0TlYlkngS6Ew+m0Mvg84KlISIfNFg7znjCzfp4K+9i/Px7n
	zyl55z1hJjzjJz0pIXAxNX1HJGi8tKpjla9vQrDbHzZO1JZN69r0fS7vQptfuXdDMiUv
	vUVC7+NguNmVXE4I6sCnfvC/nBBQQcC8+yQYJMgPvmW8myxr7wycHZqqBymq9qeFA53Z
	z8lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=b9Kef3i81qJKhu7l2l0jfB9jegZkRY4YXAThmzqAPf8=;
	b=TOFKKna8liNK95O2bpt3Jnlr2p1gM5f2IJRqCwGRdQbqPbEpwapSDrjPn8RhzlFNUp
	InR/jIUrgOxZjs5EwBgKFXtVPa8SVduQuZg/eUnrSRd6LN3m7bkxQM8dkBPBgXkaZ0+m
	0t0oPQZOTdeFHzJl4GEo0w9zVvWg5NQC1azQpoJQoyfyyiAM58m75FlKJmpGMBIpQPi9
	Uc9n7BWzdt2c7QPyi5AkazreggD2s+lJXcwOQi4C2mh16y91I9nOTnSq2rHkxGfR5irS
	GNcUZLKDF1KiDv8v4a0pz0szWrCT9OJkI01ZfCYhyP8RZFht8wTCGBMotoo29P4uNafb
	HU6w==
X-Gm-Message-State: AMCzsaXgJKqUxiymqaLbmZQVvVJcajM/XiX4tJQyHrZM3GxDFpEjUalH
	kwyuerDozVKHIXJYW/w99t3fHlZpKqdF8x/cLo8=
X-Google-Smtp-Source: AOwi7QBi5C8AYjEgcNYcwzmHByqqF7AirCLImzcRQ0XnH/TO4hX7DNM4uvuwM2BkDEU7GMg8GaZ78c+JhzPfQmh0obE=
X-Received: by 10.99.152.17 with SMTP id q17mr13017872pgd.287.1507662309613;
	Tue, 10 Oct 2017 12:05:09 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.100.187.66 with HTTP; Tue, 10 Oct 2017 12:04:39 -0700 (PDT)
In-Reply-To: <CAJ86T=X78ockUQ_9tVizxo4JZwbDQu9s0B2dG2ud50Xg6q=28A@mail.gmail.com>
References: <20171007172923.36429-1-raj.khem@gmail.com>
	<CAJ86T=X78ockUQ_9tVizxo4JZwbDQu9s0B2dG2ud50Xg6q=28A@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 10 Oct 2017 12:04:39 -0700
Message-ID: <CAMKF1sobsTEyLA+8ade5ti8dZ5QeH-87qWw1Ot6fwb0Cw8oSRQ@mail.gmail.com>
To: Andre McCurdy <armccurdy@gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gcc-6.3: Backport patch to fix ICE on ARM
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
X-List-Received-Date: Tue, 10 Oct 2017 19:05:08 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Oct 10, 2017 at 10:59 AM, Andre McCurdy <armccurdy@gmail.com> wrote:
> On Sat, Oct 7, 2017 at 10:29 AM, Khem Raj <raj.khem@gmail.com> wrote:
>> Fixes
>> internal compiler error: Max. number of generated reload insns per insn is achieved (90)
>
> Is there a plan to update gcc 6.3 -> 6.4 in OE 2.5?

actually, I was thinking of not touching 6.x at all since it solely
for backward compatibility
so upgrading it might cause issues for users, and since we do not test
it actively, we would
not know them. I would rather keep it to the version we have once
tested but I am open
to maintaining an upgraded version if community thinks that is
beneficial for them. there
wont be any testing on it in 2.5 release cycle,

>
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> ---

