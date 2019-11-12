Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com
	[209.85.222.195])
	by mail.openembedded.org (Postfix) with ESMTP id 5A3C67CECE
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Nov 2019 18:16:16 +0000 (UTC)
Received: by mail-qk1-f195.google.com with SMTP id z16so15320195qkg.7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Nov 2019 10:16:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=D/QgEMPWMdQujE7riIeKFPWbDgNBdquzPRDdyYwBDmc=;
	b=ShmHmcrc7b/l5Y3bF/s4qQ9ZW7bf1/BK42LceXCHYGprmnVHqyUIVb6F+hqz5BmZbq
	hkKQlerGTrcYftMnWb9C1m+I1ZIs2aVWMsJZSKKwID/9PFmKwkT6a9e5H5MbBe+ns6jj
	PEMYtyl8n2kscex3fjynq/fnQ+6Ss9wyYggmHEu3HyuDuTU9fGpBoufjnJ96ihCVTddH
	wyIGtOn0UmkD4RLJ2n4LBZsNQpfjIdVR1KCmV5xO2PA3zBaTDBZXTo/0PF94jJ6d1Rkp
	lqn1z7B+hyH1A3d9h84HS8LiMBXKtjeUoDhW9Ri6XGb5ZqQHqwiBJrKrEzSG/75FKYuP
	o7IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=D/QgEMPWMdQujE7riIeKFPWbDgNBdquzPRDdyYwBDmc=;
	b=rzvegJeMOKMgRD8CJvmW3XD5AMC6ZeQr2UB+fv4jK9TfdcwzIe6LnORhLvoBwdPKWf
	Ilye1qkDGpjX5ZsSihAEsi8BhuiS3d+24YBPpoU37Rt5Sn613g6rmgzvW4YwVAYrdyXw
	LxRyeGW13gqJYBfOQylcmgloYFt9An1BCPtaNUOvNrt7BLIZ0vkgXqYEtA94QKTlNICZ
	ooOcFo2fpSentd7PP0lNb6HW+MrCGN2C/QgZE7cNflHmvlp+O4ffEdBRuWbSETc/HAEC
	5keOwUCME8sLBS1tNQzo4v9m9HPer/hFNZzVr7F9b/f1eYX9hsl9kjm3L1Aox+bwMAzf
	lJFA==
X-Gm-Message-State: APjAAAWkHtu/vHLCKOy9G4v9+S4vxBXJelThnKtivxDkkgVL+5omHRva
	nCYXLncHPQqfrAMU3H5IqZ3tV+GzW5YbKoHjkG8=
X-Google-Smtp-Source: APXvYqxVy82UQqDptxxT6lNz7aJkvc+gVv5Pai6+sfOjAMLshMCAsNaeqm4CatQrL63/8dauYLZkfunaeNA1o8Ulm+c=
X-Received: by 2002:a05:620a:a9a:: with SMTP id
	v26mr16123524qkg.71.1573582576645; 
	Tue, 12 Nov 2019 10:16:16 -0800 (PST)
MIME-Version: 1.0
References: <20191104224805.3149-1-alistair.francis@wdc.com>
	<fd81b5bc-cb84-8857-ea5e-bce2c931750b@intel.com>
	<CAMKF1srMzPL4pBAQYscX6fxPPL2SExcYFw+Ti2B656nK3hyH0g@mail.gmail.com>
	<CAKmqyKNtUpuqodwxjsseOwdQn3AhG+yU0kJx1K0DCXH3sc4VBw@mail.gmail.com>
	<CANNYZj8=PbGVmE+9C4mnJv3BW0Y-G8f5zG=AmGD0vDpoPNU2XQ@mail.gmail.com>
	<CAMKF1srk1NG6Eu6_CKiw=18fwnZef0GeZUPwj0_vFmv8atq9sQ@mail.gmail.com>
	<CAKmqyKOxaSvL5cq_SkucYZOmfoCX6o6piSr0iW-r+sFbCJL9Lw@mail.gmail.com>
In-Reply-To: <CAKmqyKOxaSvL5cq_SkucYZOmfoCX6o6piSr0iW-r+sFbCJL9Lw@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 12 Nov 2019 10:15:46 -0800
Message-ID: <CAMKF1sqyrY3mA+5rjx1VBBE=SFst=QnBZzVR5yOAWH+zambVqA@mail.gmail.com>
To: Alistair Francis <alistair23@gmail.com>
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v6] mesa: Upgrade to 19.2.1
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
X-List-Received-Date: Tue, 12 Nov 2019 18:16:16 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Nov 12, 2019 at 10:07 AM Alistair Francis <alistair23@gmail.com> wrote:
>
> On Tue, Nov 12, 2019 at 8:19 AM Khem Raj <raj.khem@gmail.com> wrote:
> >
> > On Sat, Nov 9, 2019 at 7:36 AM Alexander Kanavin <alex.kanavin@gmail.com> wrote:
> > >
> > > On Sat, 9 Nov 2019 at 00:02, Alistair Francis <alistair23@gmail.com> wrote:
> > >>
> > >> > right this means glx-tls is not working anymore, and it will fail on
> > >> > musl at runtime
> > >> > see
> > >> > https://gitlab.freedesktop.org/mesa/mesa/issues/966
> > >>
> > >> So what do we do here?
> > >>
> > >> There are some patches in that issue, but they don't cleanly apply and
> > >> seem hacky anyway. Can we have two versions of mesa? One for musl and
> > >> one for others until this is fixed upstream?
> > >
> > >
> > > Maybe we can silence the warning for musl only, via INSANE_SKIP_..._libc-musl = "textrel"?
> > > ffmpeg does the same already.
> >
> > in this case, texrel will endup causing sigsegv, this is a mesa issue,
> > primarily we have been working it around so far.
>
> I sent a new patch, it probably doesn't fix this issue though.
>

sure, and I think we should be able to address it with a patch or some
feature disable/enable a mechanism
I wonder what changed in new build system that it cant be knobbed out
as it used to be with autotools

> We can't just not update mesa because of this.

We can certainly take time to fix it, we are early in release cycle.

What about having two
> versions, or for musl and one for glibc?
>

Probably a bad idea

> Alistair
>
> >
> > >
> > > Alex

