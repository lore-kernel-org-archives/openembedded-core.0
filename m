Return-Path: <alistair23@gmail.com>
Received: from mail-lf1-f65.google.com (mail-lf1-f65.google.com
	[209.85.167.65])
	by mail.openembedded.org (Postfix) with ESMTP id 79E7D7DD6A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Nov 2019 18:07:32 +0000 (UTC)
Received: by mail-lf1-f65.google.com with SMTP id y186so7821169lfa.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Nov 2019 10:07:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=Ky78Xvi0kS31sIF2dNkjZ2hFM4VdXq+MTlmnRFJfpR0=;
	b=udMuGpKHC97K+AdZJjUsUAeVyCqqS6kWh+8q3sqTpYqNQ9JjV5Jp5d8dyU16GFdDx6
	38o/C9/hsjco1F/7wwHWDt58MlC7NYi6DBA8xVIdsrrqStNNWZxIdtkRsXzCgYdxrNFc
	bUFseglSrOwzDw1iKNX80XAKciazYuIMyrnNVgumlwAXs9jKUOI4ZRk2a4X/UG3ru1P5
	aGYdRpI0tt/iCWWl62ZwQMDfIau99NuA+i9dieHGDRVQRjrBGyzwMuhyAE/5ggvQnML5
	gOeUlmyYg1OOEjXG+H5oMpgULJ9PbVFdjHRi1cBU9VeM0aM9B3Smn5Sv2LLsZjndGG0i
	MsXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=Ky78Xvi0kS31sIF2dNkjZ2hFM4VdXq+MTlmnRFJfpR0=;
	b=cpNRfHvAbygIXtrlj8akKWER44GucPuJZqQLJzT1GGXBqKfoS1pzBrr+9rg/gPfbVt
	w8nsmG/GuJbvCgJOI7Z8nt7Ht9290c40hJIViSlyeEoeqfUoeRir8p8OVybEJLsVl8YF
	I3mPCBSSMkVThd4xmhgUljnM0Chu6EtA0PihLj0pJeBl/xGZLScPz/75IXr63uMDC2WX
	yEEOaS27mQ/hfSyzzGSsNSWUrjOkl2UCfwfDxlFHeQsr0l4Fo176I2MAsfOiICbGSIRt
	qpQGvxwDwEs4ghshL2dcySzlV/KPsk/u/w7VSAWywwN1GYO5PLzaDqXBcwJBO8WFe0Au
	k1Eg==
X-Gm-Message-State: APjAAAVE9fBbwpP1T4ocyNyDzBmnVsOZYEdGSzyUKqIdGXZcPQT1M0Oz
	dpZ+5FPZunDkKYE2dbBmw084N7eUaiLD2nQPV6k=
X-Google-Smtp-Source: APXvYqzR6fUdrDtDoJZ4DXmTtGR6FKtfGPG0KmEuQFWS3Dbr0pp+3Gkssl4JMe3kzI1dbwUNhr1mpuef8Q8lJn7bNdE=
X-Received: by 2002:ac2:4a8f:: with SMTP id l15mr20198041lfp.5.1573582053116; 
	Tue, 12 Nov 2019 10:07:33 -0800 (PST)
MIME-Version: 1.0
References: <20191104224805.3149-1-alistair.francis@wdc.com>
	<fd81b5bc-cb84-8857-ea5e-bce2c931750b@intel.com>
	<CAMKF1srMzPL4pBAQYscX6fxPPL2SExcYFw+Ti2B656nK3hyH0g@mail.gmail.com>
	<CAKmqyKNtUpuqodwxjsseOwdQn3AhG+yU0kJx1K0DCXH3sc4VBw@mail.gmail.com>
	<CANNYZj8=PbGVmE+9C4mnJv3BW0Y-G8f5zG=AmGD0vDpoPNU2XQ@mail.gmail.com>
	<CAMKF1srk1NG6Eu6_CKiw=18fwnZef0GeZUPwj0_vFmv8atq9sQ@mail.gmail.com>
In-Reply-To: <CAMKF1srk1NG6Eu6_CKiw=18fwnZef0GeZUPwj0_vFmv8atq9sQ@mail.gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 12 Nov 2019 10:01:42 -0800
Message-ID: <CAKmqyKOxaSvL5cq_SkucYZOmfoCX6o6piSr0iW-r+sFbCJL9Lw@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
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
X-List-Received-Date: Tue, 12 Nov 2019 18:07:33 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Nov 12, 2019 at 8:19 AM Khem Raj <raj.khem@gmail.com> wrote:
>
> On Sat, Nov 9, 2019 at 7:36 AM Alexander Kanavin <alex.kanavin@gmail.com> wrote:
> >
> > On Sat, 9 Nov 2019 at 00:02, Alistair Francis <alistair23@gmail.com> wrote:
> >>
> >> > right this means glx-tls is not working anymore, and it will fail on
> >> > musl at runtime
> >> > see
> >> > https://gitlab.freedesktop.org/mesa/mesa/issues/966
> >>
> >> So what do we do here?
> >>
> >> There are some patches in that issue, but they don't cleanly apply and
> >> seem hacky anyway. Can we have two versions of mesa? One for musl and
> >> one for others until this is fixed upstream?
> >
> >
> > Maybe we can silence the warning for musl only, via INSANE_SKIP_..._libc-musl = "textrel"?
> > ffmpeg does the same already.
>
> in this case, texrel will endup causing sigsegv, this is a mesa issue,
> primarily we have been working it around so far.

I sent a new patch, it probably doesn't fix this issue though.

We can't just not update mesa because of this. What about having two
versions, or for musl and one for glibc?

Alistair

>
> >
> > Alex

