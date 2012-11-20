Received: from mail-da0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1TauZD-0002sx-Bg
	for openembedded-core@lists.openembedded.org;
	Tue, 20 Nov 2012 21:37:18 +0100
Received: by mail-da0-f47.google.com with SMTP id s35so2559390dak.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Nov 2012 12:23:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	bh=vyt0C9+uN7Ur366UM3tPrINFdaOc8Illpi9itTUr2U8=;
	b=jODn00SG6kLa6j5Mrq+STxVNH7GA+bw5bKR1HclORDQmdhhkPzf/LnsF3lO3awgd0Y
	MA2G6tKwGnY9hugD/6FhsVu/SYw9WzmrM8EcK7SLlZ8x2KII6oyLIedvTEPHYJS/lSzI
	Cn0FyCQ1Hmbv0Wmsn8ClkZ/eS7tG0bsEkNZoWsEnmh/ThR6vA6FageD2drcKA7COupe8
	t/h3MBhrEPbYO3oP9lw358lkv54qZpgJYFNLSaQ/NAvCuH1eC1zcS7GUsigJxnt3h0pV
	KslSH70vixLSgOVDnmrA/TsZHj9gYqanhoFUL0wc7EbxAXPicnut29EkRPnb3fiG83WD
	+tbA==
MIME-Version: 1.0
Received: by 10.66.76.39 with SMTP id h7mr10990771paw.61.1353442986574; Tue,
	20 Nov 2012 12:23:06 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.68.16.225 with HTTP; Tue, 20 Nov 2012 12:23:06 -0800 (PST)
In-Reply-To: <CAHod+Gf2ayXp4Zubxh0yiEeOM7wGJ72EVVqY8uma0+y-oYFcdQ@mail.gmail.com>
References: <1353096699-19130-1-git-send-email-dromede@gmail.com>
	<20121116213636.GC3411@jama.jama.net>
	<CAHod+GfAof60ycR5EXosair15O87dvZhnxWSouhdF49x8sZQqQ@mail.gmail.com>
	<20121116222855.GD3411@jama.jama.net>
	<CABcZANnSgJYUvwPFzcHaD-W7aBK+7Q=uh785-sQzbokSrq2UoQ@mail.gmail.com>
	<CAHod+GeYEUMW6z25i0xOEqGvRHfKrWV3TNHyEO8B9ZjFeDEBOA@mail.gmail.com>
	<CABcZANksE98pw4N6hGntTGtm4__gSO1cy4GSx6ULsqkg_yUAZQ@mail.gmail.com>
	<CAP9ODKrzkB0qje_8zcXOfRGcf+T=4yMR2kJJ0Lb2eCa2e9FrJw@mail.gmail.com>
	<CAHod+Gf2ayXp4Zubxh0yiEeOM7wGJ72EVVqY8uma0+y-oYFcdQ@mail.gmail.com>
Date: Tue, 20 Nov 2012 18:23:06 -0200
X-Google-Sender-Auth: 75PkLCI7w9EKYQbA-plrAfnsjk8
Message-ID: <CAP9ODKrQ1XQNwGz2D7HVcDeP1n7ndxCHTkiXD6tZotYLTMfKNA@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: =?UTF-8?B?TWFya28gS2F0acSH?= <dromede@gmail.com>
Cc: Chris Larson <clarson@kergoth.com>, Martin Jansa <martin.jansa@gmail.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] [PATCH] udev: Remove deprecated binaries from packaging
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
X-List-Received-Date: Tue, 20 Nov 2012 20:37:18 -0000
Content-Type: text/plain; charset=ISO-8859-13
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 20, 2012 at 5:59 PM, Marko Kati=E3 <dromede@gmail.com> wrote:
> On Sat, Nov 17, 2012 at 7:54 PM, Otavio Salvador
> <otavio@ossystems.com.br> wrote:
>>
>>
>> On Sat, Nov 17, 2012 at 4:38 PM, Chris Larson <clarson@kergoth.com> wrot=
e:
>>>
>>> On Sat, Nov 17, 2012 at 11:02 AM, Marko Kati=E3 <dromede@gmail.com> wro=
te:
>>>>
>>>> A proper solution might be to:
>>>>
>>>> a) Leave udevtest and udevinfo in udev-utils to properly support older
>>>> versions of udev that have these packages.
>>>> b) Move udevadm into the main udev package. This makes a lot of sense
>>>> since udevadm is crucial for proper udev operation.
>>>> c) Remove udev-utils from RRECOMMENDS.
>>>
>>>
>>> This sounds like a clean, solid route to me. Hopefully someone else wil=
l
>>> chime in with input on it as well.
>>
>>
>> I see no value in having the others and deprecated tools available. Havi=
ng
>> udevadm available in udev-utils allows for it use with mdev for trigger =
the
>> events in kernel, for example. I like to have this possibility.
>>
>> --
>> Otavio Salvador                             O.S. Systems
>> E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
>> Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br
>>
>
> Ok, so udevadm should stay in udev-utils. In that case i propose we:
>
> a) Add ${bindir}/udevadm and ${base_sbindir}/udevadm to
> FILES_udev-utils. This should
> ensure that udevadm will always go in udev-utils regardless of the
> udev version being built.
> This should also ensure that udev-utils package will always be made.
>
> b) Make udevadm available in both ${bindir} and ${base_sbindir} via
> symlinks installed in
> do_install_append. This should ensure proper support for all versions of =
udev.

I like your plan.

+1

--=20
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br


