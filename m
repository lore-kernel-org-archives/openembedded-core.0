Return-Path: <armccurdy@gmail.com>
Received: from mail-wr0-f196.google.com (mail-wr0-f196.google.com
	[209.85.128.196])
	by mail.openembedded.org (Postfix) with ESMTP id 6F1C778213
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Jan 2018 19:52:34 +0000 (UTC)
Received: by mail-wr0-f196.google.com with SMTP id g21so1826741wrb.13
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Jan 2018 11:52:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=LnlP3oakmbv0taiwyfE5mk3r3tGwaOmUBg1tVQPg57Y=;
	b=OaYhLgGY7BosiRaIP2x0ixaUx9yjkGfbAXwU3ZMjxdxAELH5eoBJ6FtOTnsJW6euSs
	BLGVfDZlOydhFxVPkVjRGVCyv77oY03Wonpr07NOyaRT6ez5VzX7TAl3gIXluvdZV3x9
	Coz75UH4KC+V93bSJ3d/7Z6A4/L0wbCSO0vYwX9qK2ZvyUsfG1z6R4nTRJZLcheFXZ9z
	IZktYY1nio/qoLPnFwKaHGSMentGkbCKiM3n11BitO9C+uTq9FEI9KzO/PcnQB+ueUh7
	kACAv/ku5ECZYx3PgzNse/AOoRKk6sgKhienT34arzSkQUMG8RDvdBfu0sFYF/qDapEX
	de0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=LnlP3oakmbv0taiwyfE5mk3r3tGwaOmUBg1tVQPg57Y=;
	b=X2T0hS/eN/VMh9LMOQF6pMJlJx5d9BIKEyWCC8S9Wx62XIOwMmOYot5tzuFAIw77w4
	4X/xAY+mfhMl3QL6/pvaMJivoFgCi+T2QRJhZ9Qow7AqtZFaUmIxn+ZQsZqENyWiq55v
	LoS/ehqpqpVowHibyX9Lpkr9CMOzL09ggiO4ensjgYbU4U4IkWhRmb9hRQ6PYxLZjXzT
	A8z79/XEPzD4ppQi+3fglEP9k2LpV8iEONdBHv8rj2uzXcOu35WtypBkU9q9y7g4sQ/m
	vVIuHNdzgmvMevrZJ+5m18Vf3BD2w7RX1uFaoFxs5R7Zvn0ZAGhA47W0NyG9swCWdsmO
	lMug==
X-Gm-Message-State: AKwxytcOsCe0/DDpjX7fAtOJiHp8aJSxIuclIFIAOxoDk0QeLkFkFB+A
	oYkBr9uQ3BfLQqRTcFmJ6Kxvwd5/axklPkYNM+s=
X-Google-Smtp-Source: AH8x225pA/N7DSOnEUqShu3Nes43rzIpZxHPopAHVKwzl3L+kK32og2820Zbw7Vb5wDoK9EndVMmSTCxos7hl5N3+Ig=
X-Received: by 10.223.177.148 with SMTP id q20mr3512704wra.228.1516737155314; 
	Tue, 23 Jan 2018 11:52:35 -0800 (PST)
MIME-Version: 1.0
Received: by 10.223.144.129 with HTTP; Tue, 23 Jan 2018 11:52:34 -0800 (PST)
In-Reply-To: <CAJ86T=UvJkhT6bnBdViyHoxhtoLRDL4Wbc+zGUHqNbjrdUiOMw@mail.gmail.com>
References: <1510293271-32407-1-git-send-email-armccurdy@gmail.com>
	<e03ac54c-11c9-2546-a622-c21169979cc5@windriver.com>
	<CAJ86T=UFGsp0-TDdS8WAEOwr1Xc8aUH0DYv3qh21LcV6TDKxaA@mail.gmail.com>
	<CAJ86T=UvJkhT6bnBdViyHoxhtoLRDL4Wbc+zGUHqNbjrdUiOMw@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Tue, 23 Jan 2018 11:52:34 -0800
Message-ID: <CAJ86T=XDtJvJu6-6UYCJP+cdwC1mC_i7jJjuEiDyvYQnWTyM3Q@mail.gmail.com>
To: Yi Zhao <yi.zhao@windriver.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] systemd: create wheel sysuser group offline
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
X-List-Received-Date: Tue, 23 Jan 2018 19:52:34 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 11, 2017 at 6:09 PM, Andre McCurdy <armccurdy@gmail.com> wrote:
> On Fri, Dec 8, 2017 at 11:36 AM, Andre McCurdy <armccurdy@gmail.com> wrot=
e:
>> On Thu, Dec 7, 2017 at 10:44 PM, Yi Zhao <yi.zhao@windriver.com> wrote:
>>> =E5=9C=A8 2017=E5=B9=B411=E6=9C=8810=E6=97=A5 13:54, Andre McCurdy =E5=
=86=99=E9=81=93:
>>>>
>>>> The default systemd-tmpfiles config file expects to be able to create
>>>> files etc belonging to the wheel system group. Currently the wheel
>>>> group is created at run time by systemd-sysusers, but that doesn't
>>>> happen if systemd-sysusers is disabled (as it currently is by default
>>>> when building with musl libc).
>>>
>>> For sysvinit, we follow the Debian rule which doesn't have wheel group =
in
>>> the system. Should we have to break this rule for systemd? Is this nece=
ssary
>>> to use this group in systemd?
>>
>> The default systemd-tmpfiles config file expects to be able to create
>> files etc belonging to the wheel system group. Unless we patch or
>> over-ride the default systemd-tmpfiles config file to change that then
>> yes, the wheel group appears to be necessary for systemd.
>
> Ping.
>
> This is needed for rocko (assuming systemd with musl is expected to
> work with rocko?) so unless there are still strong objections I
> recommend merging as-is.
>
> More significant re-work (e.g. preventing systemd-tmpfiles from being
> enabled without systemd-sysusers or patching systemd to remove any
> dependency on the wheel group) would not be suitable for rocko, so
> should be considered separately.

Ping again.

