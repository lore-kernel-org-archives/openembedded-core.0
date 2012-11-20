Received: from mail-vc0-f175.google.com ([209.85.220.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dromede@gmail.com>) id 1TauCW-0002ca-Jq
	for openembedded-core@lists.openembedded.org;
	Tue, 20 Nov 2012 21:13:44 +0100
Received: by mail-vc0-f175.google.com with SMTP id m8so2350664vcd.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Nov 2012 11:59:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	bh=KtMTaOGhHYSGhJhtqTKHaiSEFzcKqF7l1EsY7Je6HTA=;
	b=lI6wuoQ/SiG1JSfgnJdYuxsIy5CBMFN3cSMseIST9/OY84z/v4/SViOK6fNcUXsFae
	Hc0NdGzhqp/5+sDIDv3lkAjkmURifGBQUH7RzmdzItrzh5aVmFUKx8+djFnvdwZHyw/I
	7EmQuAXQKssjEIjmGUcwiDZBwdVlnQJsgF5MTySGPhNBQKjiZ89Od7StncirkU24DUfF
	J8CUa+LE/BANWzVUkDW6je0YDTfiWwB+Rcr81Wht38ZNXEDfAwOjuSzEqTtVyTopsZoD
	WnM3dsFfIexXewzlJIXjerd2njrhLxurZbbM5hxaZW8urHi2+YIebcLklQsfghZfxhIO
	Sapw==
MIME-Version: 1.0
Received: by 10.220.149.142 with SMTP id t14mr25398080vcv.46.1353441580206;
	Tue, 20 Nov 2012 11:59:40 -0800 (PST)
Received: by 10.58.127.225 with HTTP; Tue, 20 Nov 2012 11:59:40 -0800 (PST)
In-Reply-To: <CAP9ODKrzkB0qje_8zcXOfRGcf+T=4yMR2kJJ0Lb2eCa2e9FrJw@mail.gmail.com>
References: <1353096699-19130-1-git-send-email-dromede@gmail.com>
	<20121116213636.GC3411@jama.jama.net>
	<CAHod+GfAof60ycR5EXosair15O87dvZhnxWSouhdF49x8sZQqQ@mail.gmail.com>
	<20121116222855.GD3411@jama.jama.net>
	<CABcZANnSgJYUvwPFzcHaD-W7aBK+7Q=uh785-sQzbokSrq2UoQ@mail.gmail.com>
	<CAHod+GeYEUMW6z25i0xOEqGvRHfKrWV3TNHyEO8B9ZjFeDEBOA@mail.gmail.com>
	<CABcZANksE98pw4N6hGntTGtm4__gSO1cy4GSx6ULsqkg_yUAZQ@mail.gmail.com>
	<CAP9ODKrzkB0qje_8zcXOfRGcf+T=4yMR2kJJ0Lb2eCa2e9FrJw@mail.gmail.com>
Date: Tue, 20 Nov 2012 20:59:40 +0100
Message-ID: <CAHod+Gf2ayXp4Zubxh0yiEeOM7wGJ72EVVqY8uma0+y-oYFcdQ@mail.gmail.com>
From: =?UTF-8?B?TWFya28gS2F0acSH?= <dromede@gmail.com>
To: Otavio Salvador <otavio@ossystems.com.br>
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
X-List-Received-Date: Tue, 20 Nov 2012 20:13:45 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 17, 2012 at 7:54 PM, Otavio Salvador
<otavio@ossystems.com.br> wrote:
>
>
> On Sat, Nov 17, 2012 at 4:38 PM, Chris Larson <clarson@kergoth.com> wrote=
:
>>
>> On Sat, Nov 17, 2012 at 11:02 AM, Marko Kati=C4=87 <dromede@gmail.com> w=
rote:
>>>
>>> A proper solution might be to:
>>>
>>> a) Leave udevtest and udevinfo in udev-utils to properly support older
>>> versions of udev that have these packages.
>>> b) Move udevadm into the main udev package. This makes a lot of sense
>>> since udevadm is crucial for proper udev operation.
>>> c) Remove udev-utils from RRECOMMENDS.
>>
>>
>> This sounds like a clean, solid route to me. Hopefully someone else will
>> chime in with input on it as well.
>
>
> I see no value in having the others and deprecated tools available. Havin=
g
> udevadm available in udev-utils allows for it use with mdev for trigger t=
he
> events in kernel, for example. I like to have this possibility.
>
> --
> Otavio Salvador                             O.S. Systems
> E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
> Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br
>

Ok, so udevadm should stay in udev-utils. In that case i propose we:

a) Add ${bindir}/udevadm and ${base_sbindir}/udevadm to
FILES_udev-utils. This should
ensure that udevadm will always go in udev-utils regardless of the
udev version being built.
This should also ensure that udev-utils package will always be made.

b) Make udevadm available in both ${bindir} and ${base_sbindir} via
symlinks installed in
do_install_append. This should ensure proper support for all versions of ud=
ev.


