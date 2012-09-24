Received: from mail-lb0-f175.google.com ([209.85.217.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1TGGWS-0001YW-1a
	for openembedded-core@lists.openembedded.org;
	Mon, 24 Sep 2012 23:49:00 +0200
Received: by lbky2 with SMTP id y2so4148305lbk.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Sep 2012 14:36:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	bh=TTd+lrG7C88qBskB+KvRqlDOSnO8kq9jGf09j6Tv5Ys=;
	b=Cxi3MBlXxvN4UMCyTOwXM2cEAzRtkbiz7tHSrbtyfyJWXDvDTsIVRQiBhjDEb+XiiF
	SmujtNW8mJLfhOSgmZyvTvmL1pAJ/O+QkIwElPbmhd5ziJXAoKRWq2FfBGTep7AUeb3p
	FkYfKudBt2dv/IS+bg5E6WEDx+Zu6ypy1toPToXpzRkzCbQZoXsDAIoct/IjoI8m1YuL
	eMCIEXuQh/2CleDsAp8AGhYEH48KdpiCcR14hc5Q1Xy4eDQbUmb+u1DLBNelBq3A64Ku
	RRTQA8FZOvVcdERKOGcOoJ5XKz1cPd+zg/JAgfnbcYVYb07k1R1rHah9xgRu5TgZ/BfW
	lu7w==
Received: by 10.152.108.202 with SMTP id hm10mr11773994lab.3.1348522571615;
	Mon, 24 Sep 2012 14:36:11 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.114.19.2 with HTTP; Mon, 24 Sep 2012 14:35:51 -0700 (PDT)
In-Reply-To: <CAMKF1soO3O8gWeTeJxv7Jb83r753ZF7nRCxpmvBwop-20giHsg@mail.gmail.com>
References: <1348513241-18271-1-git-send-email-kergoth@gmail.com>
	<CAMKF1sqsvYcwKTG1wzAGKnWrRZ6K5yh0=D9ncGOAtOHSJ-i1cQ@mail.gmail.com>
	<CABcZAN=XVRRjH+57g+E24qr6vQ9Mf7Z9A7YHMcKgrFGkH6RbyA@mail.gmail.com>
	<CAMKF1soO3O8gWeTeJxv7Jb83r753ZF7nRCxpmvBwop-20giHsg@mail.gmail.com>
From: Chris Larson <kergoth@gmail.com>
Date: Mon, 24 Sep 2012 14:35:51 -0700
Message-ID: <CABcZANmiY_E2iQrjhmiGGaYkUC5aM9xsuspGxE2PD9XqhrEuGw@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] Add and use 'localedir' variable
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 24 Sep 2012 21:49:00 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 24, 2012 at 2:16 PM, Khem Raj <raj.khem@gmail.com> wrote:
> On Mon, Sep 24, 2012 at 2:04 PM, Chris Larson <kergoth@gmail.com> wrote:
>>
>> This is the case by default for all eglibc builds that set libdir to
>> the default. See https://gist.github.com/3756705 =E2=80=94 there's anoth=
er
>> block just like that for all the other 64 bit archs for eglibc. When
>> we pass =E2=80=94libdir=3D/usr/lib64, it skips this logic.
>>
>> So changing it would just bring us inline with the default eglibc
>> behavior. The binary locale files are, as far as I'm aware, a
>> relatively arch independent binary format. There's no point or benefit
>> to having lib32 vs lib64 copies, they'd just be duplicated content.
>>
>> If it wasn't for the forthcoming 1.3 release, I'd have included the
>> proposed change to the default localedir to ${exec_prefix}/lib/locale
>> with this patch.
>
> Mark explained the change here so it is OK for OE internal. I hope
> external toolchains
> are also fine with it.

That's actually why I need this. The Sourcery G++ toolchains were
built such that locales are in lib/ and libraries are in lib64/, but
the metadata didn't allow a way to control that behavior, resulting in
eglibc-locale failure.
--=20
Christopher Larson


