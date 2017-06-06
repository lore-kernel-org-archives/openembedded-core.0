Return-Path: <net147@gmail.com>
Received: from mail-it0-f54.google.com (mail-it0-f54.google.com
	[209.85.214.54])
	by mail.openembedded.org (Postfix) with ESMTP id D6EA877FFE
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Jun 2017 00:16:40 +0000 (UTC)
Received: by mail-it0-f54.google.com with SMTP id m47so93417920iti.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 05 Jun 2017 17:16:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=J5wPwsh9EeVHAECrh7JgrQ4Gd+3Ky8G+LtcyPJdLr1o=;
	b=P5unxW88V7HIU17YHZOp8BJrF3v0E9SLwKG1Dzmb3A3kcJ9oKpeypxmkFe7LPM2Z7v
	W3KM2WYY9raHnhsX24ndXCJUxd9LlRamNfUif7vV/gix2Y1Yuw7SJpJ+u5+HShcKYEZg
	IpYCm+WE41Ury75YdvuR7+1BI8zwTeQsEWCmBM/MTyhyDsvhKi4U646ndk1GTrMnQsGu
	RxpL7O/4glmalRRUKOhV/qXyqwFd9qO9wPozTk4ilcvMvZrSAbWQkqsdxU6d55lcgIy1
	Yoo79psZINe2NAvealz3GSOuzUNud4fb4zyv5Jf4bXBRLOEr/IOqWLm1rh6EAWPGDlLk
	3wRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=J5wPwsh9EeVHAECrh7JgrQ4Gd+3Ky8G+LtcyPJdLr1o=;
	b=gtDpuhsLDVcwT7zIqzUBU6P++V/punFpvf5NXBa9nSW5CtkEVC/EnGaH5dS1arBYPy
	g8CaCEEWKc7kB1AuVcr/rTOCtv5T/8d6Ic7yvQDypXhsZR8hpTmdriYL62JRcfsI76RA
	YVY1n+rbxwvL2Bqi112pzgfuYLjT7lNgS3LWSIVqXVni9CoRCKTvR2Q5ME57yVhV3LcL
	LSXlQh1doUmNSVIM9vUumatcxwk8qFQwywHzVSqjx5YGQ3LDcJgUFRyJV1tmbxrmLlKc
	XioIm+XXXF5A7jJiSSeOIkIu1rpdtzCIwukT+f9FAhg2HYCr58+TV/8cY0SLN5xv2bDY
	nSrg==
X-Gm-Message-State: AODbwcAcandTXNjclsw5dx7CGqhWWwq1nbH66LI7h7T3ZLRvfNCxouAh
	EUiJa5ZdwhTv+aL1Wl33niFQ3uPXYA==
X-Received: by 10.36.115.1 with SMTP id y1mr15459660itb.117.1496708201627;
	Mon, 05 Jun 2017 17:16:41 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.131.68 with HTTP; Mon, 5 Jun 2017 17:16:41 -0700 (PDT)
In-Reply-To: <655290B7709079438B7932553958E60DA13093A0@ESS-EX01.essvote.corp.local>
References: <655290B7709079438B7932553958E60DA13093A0@ESS-EX01.essvote.corp.local>
From: Jonathan Liu <net147@gmail.com>
Date: Tue, 6 Jun 2017 10:16:41 +1000
Message-ID: <CANwerB2eshSg18OsfbP7fA=EyFBBnrON-PvqeXTRkZrfFngFvQ@mail.gmail.com>
To: "Davis, Michael" <michael.davis@essvote.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: DISK_SIGNATURE no longer functional
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
X-List-Received-Date: Tue, 06 Jun 2017 00:16:41 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Michael,

On 21 May 2017 at 03:16, Davis, Michael <michael.davis@essvote.com> wrote:
> I am trying to create a generic MSDOS PC_BIOS hdddirect image with a root
> partition set by the DISK_SIGNATURE.
>
> SYSLINUX_ROOT =3D "root=3DPARTUUID=3D${DISK_SIGNATURE}-02"
>
>
>
> However the signature generated in syslinux.cfg and the one on the disk
> don=E2=80=99t match.
>
> I tried defining my own signature and the one in syslinux changes, but th=
e
> one on the disk doesn=E2=80=99t match.
>
>
>
> root=3DPARTUUID=3D22aaf83b-02
>
>
>
> NAME   PARTUUID
>
> sdd
>
> =E2=94=9C=E2=94=80sdd2 341e84a7-02
>
> =E2=94=9C=E2=94=80sdd3 341e84a7-03
>
> =E2=94=94=E2=94=80sdd1 341e84a7-01

Which release did DISK_SIGNATURE stop working?

Regards,
Jonathan

