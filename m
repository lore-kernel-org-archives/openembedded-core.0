Return-Path: <nirbheek.chauhan@gmail.com>
Received: from mail-it0-f50.google.com (mail-it0-f50.google.com
	[209.85.214.50])
	by mail.openembedded.org (Postfix) with ESMTP id 03B7D75260
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Jun 2018 05:17:50 +0000 (UTC)
Received: by mail-it0-f50.google.com with SMTP id n7-v6so15442376itn.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Jun 2018 22:17:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=Z4EWfxHxBBXzd4unTLmp7Li7kUnNT31aWIn3A42cSjg=;
	b=D0BUZPqwia7oblWqQWDGHPE32Zb1DNlcyoZd9j3929nngITJo0T98eoKmEqEDQtCfx
	NNeXx4fI7r20g3yG5lMc4y4X2LTBILKMDi/jo6hHlP+7cH70NTXEMeFRkXnzFIKwRCHe
	pAIEjr07JEJ3OmHmD07Jj7KAxyjPG6WSTlxePaoSqIRhZ6Qw6x0QxdVzCGaWHm3fF0TI
	MRflW6YBsXRe6lMfuLTaZ2tW871yu6HQ53n34V/TZtJcGKKCU4hNBeUMDCd8/6kd56EH
	QY1B6dhJoZ0x6QG6gw9B59zYbEJ0xMGhMCMGH4RhbegPW0OVrLh7xmcVkCWplU/m+aGx
	l1+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=Z4EWfxHxBBXzd4unTLmp7Li7kUnNT31aWIn3A42cSjg=;
	b=cmsBFckunMMZO3kihQ54uDVw7FdSfQ5ScsKeRQ70bsznsWpN/GV2QoU7ZiSFgDFMT6
	aFTBpo7jzFvUQtbxAPNQCnUvzxwGeFDjJy/dTcIsV2LPnU/FIXDd150/bQn7YdPVrK63
	mNWFL2rjIm4UT08vm/dgXdj903DbiFBJtpYgOinpao5T+AFdMfXaa2fdzWabYl20yB12
	SdSNnHW1r3GzX63fGsY2HMbU+AvZt8IElrE+45eQt6w03iEwQFjltZi390TKPHZLBbm7
	fOXPrw/fsGKf//09T/fLY3HfKcfOAlGXeHrUJ0lawlKJB0elfZUt59ZNuZC0ef31Pf2G
	ylUA==
X-Gm-Message-State: APt69E2nPHVhge03bEz6wMvu5HnP4/Dr/0kuRJF+9N1iHdAMJp9CZFbM
	q41b6YHtn8be4ocrsqzmviAed0yZ18u7/h2OIt0=
X-Google-Smtp-Source: ADUXVKIWzH6Ou4FRpTE7r04LPjLHWrGhvBQXEkZ11rzvWWbdGKkNpjY3Y5funk+WU2lgA4SDjaMXXcs9bhijCChT1J0=
X-Received: by 2002:a24:2745:: with SMTP id
	g66-v6mr11788598ita.77.1529385471928; 
	Mon, 18 Jun 2018 22:17:51 -0700 (PDT)
MIME-Version: 1.0
References: <20180504123244.43049-1-alexander.kanavin@linux.intel.com>
	<20180504123244.43049-12-alexander.kanavin@linux.intel.com>
	<32602a82-f07d-3c69-2305-3f0f17f4c9dc@windriver.com>
In-Reply-To: <32602a82-f07d-3c69-2305-3f0f17f4c9dc@windriver.com>
From: Nirbheek Chauhan <nirbheek.chauhan@gmail.com>
Date: Tue, 19 Jun 2018 10:47:37 +0530
Message-ID: <CADqQcK6eDewTcE0VVHGPvqBO=DzgJD1_PmF0TEW1p_xgp-JS=A@mail.gmail.com>
To: randy.macleod@windriver.com
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 12/14] meson: update to 0.46.0 -- broke systemd on qemuppc
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
X-List-Received-Date: Tue, 19 Jun 2018 05:17:51 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Jun 19, 2018 at 10:34 AM Randy MacLeod
<randy.macleod@windriver.com> wrote:
> It seems that this meson update broke systemd on qemuppc.
> I'll look into it a more tomorrow but below is what I know so far.
> It looks like the libsystemd-shared.so size increased by 18% despite
> the build flags being the same!
>
> Despite my IRC handle, I'm a meson newbie so any tips will
> be appreciated. I'll work on getting meson/ninja to be more
> verbose tomorrow to track down what really changed.
>

Just FYI, Meson 0.47 will be released next week so if there are any
important regressions, this might be a good time to bring them up. We
will be working on the stable release for 2 weeks after that, so
that's another window.

If you need help with Meson, #mesonbuild on FreeNode is a good place to ask.

Cheers,
Nirbheek

