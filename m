Received: from mail-lb0-f175.google.com ([209.85.217.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1TGGBf-0001IX-1x
	for openembedded-core@lists.openembedded.org;
	Mon, 24 Sep 2012 23:27:31 +0200
Received: by lbky2 with SMTP id y2so4125508lbk.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Sep 2012 14:14:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:cc:content-type
	:content-transfer-encoding;
	bh=XQ6fHM1ckyGJzt28hMRRGi+w/seJInjeDuOcIn9GZ6s=;
	b=uOtCeF/nxMuldFkktY6R2wRDKIQYVg6xQrr/Sa6cs2giFtCF0/yDFfJYFd5mZE3pOS
	n3EmStlNHKYTfWlJJjPMXa7EUejXiJhyKRO0i59bPybp4MUrfmD87KlLDIPrPfc91+nD
	xA7wYBktWFu/wBR/aIahARgiStRA8eNoQuymZzjSMNqVp3l/xp14UD4HryAHD7gR2yRm
	axSdlZEcW/jUr6bp/69cxC3NivbaDpz+ShAR3E8w5KKIvS6XItfgnhX1saFekEolhvlO
	MS4WwsZx5tq+YCby9lERZ+iGHnnaJtrk0KGCqvFQzooGyFQy3hQ7fFSkxNwBYCJ07HZG
	d04g==
Received: by 10.112.82.168 with SMTP id j8mr4872753lby.22.1348521282754; Mon,
	24 Sep 2012 14:14:42 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.114.19.2 with HTTP; Mon, 24 Sep 2012 14:14:22 -0700 (PDT)
In-Reply-To: <5060CC7F.6080700@windriver.com>
References: <1348513241-18271-1-git-send-email-kergoth@gmail.com>
	<CAMKF1sqsvYcwKTG1wzAGKnWrRZ6K5yh0=D9ncGOAtOHSJ-i1cQ@mail.gmail.com>
	<CABcZAN=XVRRjH+57g+E24qr6vQ9Mf7Z9A7YHMcKgrFGkH6RbyA@mail.gmail.com>
	<5060CC7F.6080700@windriver.com>
From: Chris Larson <clarson@kergoth.com>
Date: Mon, 24 Sep 2012 14:14:22 -0700
X-Google-Sender-Auth: _Fhlz2NSXp9tqTlNF3Fi5OwYp84
Message-ID: <CABcZANnGc7-g+TRPupSK-JqoJ=VcHvTF81QUpWmzdZQNekhKpw@mail.gmail.com>
To: Mark Hatle <mark.hatle@windriver.com>
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
X-List-Received-Date: Mon, 24 Sep 2012 21:27:31 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 24, 2012 at 2:11 PM, Mark Hatle <mark.hatle@windriver.com> wrot=
e:
> On 9/24/12 4:04 PM, Chris Larson wrote:
>>
>> On Mon, Sep 24, 2012 at 2:00 PM, Khem Raj <raj.khem@gmail.com> wrote:
>>>
>>> On Mon, Sep 24, 2012 at 12:00 PM, Christopher Larson <kergoth@gmail.com=
>
>>> wrote:
>>>>
>>>> From: Christopher Larson <chris_larson@mentor.com>
>>>>
>>>> This avoids the hardcoding of ${libdir}/locale which is all over the
>>>> place,
>>>> and will facilitate use of ${exec_prefix}/lib/locale instead of
>>>> ${libdir}/locale.
>>>
>>>
>>> what is adavantage of letting use ${exec_prefix}/lib/locale ? Do you ha=
ve
>>> a case
>>> where you share locale between multilibs ?
>>
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
>
>
> They are endian and locale word size dependent.  (It just happens to be t=
hat
> all of our architectures use the unit32-aligned=3D4 structures.)  :)
>
> So they are sharable between ABIs on the same arch for sure.

Ah, thanks for the clarification.
--=20
Christopher Larson


