Return-Path: <net147@gmail.com>
Received: from mail-io0-f176.google.com (mail-io0-f176.google.com
	[209.85.223.176])
	by mail.openembedded.org (Postfix) with ESMTP id 70418781CD
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Jun 2017 11:08:21 +0000 (UTC)
Received: by mail-io0-f176.google.com with SMTP id i7so18533513ioe.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 08 Jun 2017 04:08:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=PWhueBieR7cHFeRxs99uiR5/iCx95S/YWXLcKm8ZPig=;
	b=f6atrA2WQURfLZ7S5n0d1IrZZU9yqgcQkQMJ8s8AaHA+ymLigVnQmA8YAUnf9vrI/O
	kk8fAR2CKA2ee648bQa5+qe9LDI7Ty5DJqEZ0ZEXvnKutUb1/msWZbNQ5M1Y3Pmj5m6r
	JmNJ0lldvCkzAwZQ2zliKrdnveMkFvHHyg3pY9C3GL0eoQHGIKezBLsV01KCzljpBoJV
	1mJXfZ2t71bS6BjzNSXMdws+9/OILFVhPHNi4+e5q3bYj/yzppf5f6GzDqdTGoifpHX1
	fr4KJEMSf1RVB3jQtiHnJeCXAj/LxJ3PIezGvXVb8+hPHmxTfa8itWBGtlwpWSChaNxL
	Wy1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=PWhueBieR7cHFeRxs99uiR5/iCx95S/YWXLcKm8ZPig=;
	b=JfCNtJwm6ukqtt77/RySeHpR3/iJ09w56QNGxATYlTmgqf7mZ90/umu3+6igrbKgoV
	mSumYDuE+UdpD22nlMp0DWDpDA2YgANRqHTZQJUusDxMvvfjHazk+IGbSn5HjgsArUTm
	9qKz9h7dx28VTANJxFjqPbY4UJFmCTzpnaOxAlEHBT8vHgA49sDfoyQePgANwLw9u2ch
	DU/BSEXG+M9BGqEyIcbNFJ1V/O4Kw+UdjEv7lTjTriFKSBO9pr4TpqQHyXJHA9H8Mrc4
	cwwfV80zmHOaJWmLWyj1jjXfMObwI/SS3kzaxE8HPyRwIozxQPSh9WAS9aBu64mENa0Y
	SO4Q==
X-Gm-Message-State: AODbwcBKU+yznCXrRJksNT2fQgJeU41m09a8eoKr4fyBuPStIcwJvlfM
	w2Y/hrOyerjg5e5jejDQs4MZKi2taQ==
X-Received: by 10.107.158.144 with SMTP id h138mr35117376ioe.212.1496920102530;
	Thu, 08 Jun 2017 04:08:22 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.131.68 with HTTP; Thu, 8 Jun 2017 04:08:21 -0700 (PDT)
In-Reply-To: <655290B7709079438B7932553958E60DA131231B@ESS-EX01.essvote.corp.local>
References: <655290B7709079438B7932553958E60DA13093A0@ESS-EX01.essvote.corp.local>
	<CANwerB2eshSg18OsfbP7fA=EyFBBnrON-PvqeXTRkZrfFngFvQ@mail.gmail.com>
	<655290B7709079438B7932553958E60DA1311709@ESS-EX01.essvote.corp.local>
	<CANwerB2o98GhytVTMtG97AGjS+dnFEKaq9BsSNv27X=XFGwzKQ@mail.gmail.com>
	<655290B7709079438B7932553958E60DA131231B@ESS-EX01.essvote.corp.local>
From: Jonathan Liu <net147@gmail.com>
Date: Thu, 8 Jun 2017 21:08:21 +1000
Message-ID: <CANwerB01SW-s_jBHv+1nykCU5WHR2eQ6xPHbi7cJ=_txbEEzpg@mail.gmail.com>
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
X-List-Received-Date: Thu, 08 Jun 2017 11:08:21 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Michael,

I have sent a patch to the mailing list and CC-ed you.
Let me know if it fixes the issue.

Regards,
Jonathan

On 8 June 2017 at 02:12, Davis, Michael <michael.davis@essvote.com> wrote:
> I tried using  ROOT_VM =3D "root=3DPARTUUID=3D${DISK_SIGNATURE}-02"
>
> The resulting PARTUUID in syslinux append line still doesn=E2=80=99t matc=
h the one
> on the actual disk.
>
>
>
>
>
> From: Jonathan Liu [mailto:net147@gmail.com]
> Sent: Tuesday, June 06, 2017 5:01 PM
>
>
> To: Davis, Michael
> Cc: openembedded-core@lists.openembedded.org
> Subject: Re: [OE-core] [oe-core] DISK_SIGNATURE no longer functional
>
>
>
> Hi Michael,
>
>
>
> See https://patchwork.openembedded.org/patch/128565/. SYSLINUX_ROOT was
> renamed to ROOT_VM in Krogoth.
>
>
>
> Regards,
>
> Jonathan
>
>
>
> On Tue., 6 Jun. 2017 at 11:29 pm, Davis, Michael <michael.davis@essvote.c=
om>
> wrote:
>
> Pyro.
>
> Guessing something with all the new wic additions killed it.
>
>
> -----Original Message-----
> From: Jonathan Liu [mailto:net147@gmail.com]
> Sent: Monday, June 05, 2017 7:17 PM
> To: Davis, Michael
> Cc: openembedded-core@lists.openembedded.org
> Subject: Re: [OE-core] [oe-core] DISK_SIGNATURE no longer functional
>
> Hi Michael,
>
> On 21 May 2017 at 03:16, Davis, Michael <michael.davis@essvote.com> wrote=
:
>> I am trying to create a generic MSDOS PC_BIOS hdddirect image with a roo=
t
>> partition set by the DISK_SIGNATURE.
>>
>> SYSLINUX_ROOT =3D "root=3DPARTUUID=3D${DISK_SIGNATURE}-02"
>>
>>
>>
>> However the signature generated in syslinux.cfg and the one on the disk
>> don=E2=80=99t match.
>>
>> I tried defining my own signature and the one in syslinux changes, but t=
he
>> one on the disk doesn=E2=80=99t match.
>>
>>
>>
>> root=3DPARTUUID=3D22aaf83b-02
>>
>>
>>
>> NAME   PARTUUID
>>
>> sdd
>>
>> =E2=94=9C=E2=94=80sdd2 341e84a7-02
>>
>> =E2=94=9C=E2=94=80sdd3 341e84a7-03
>>
>> =E2=94=94=E2=94=80sdd1 341e84a7-01
>
> Which release did DISK_SIGNATURE stop working?
>
> Regards,
> Jonathan

