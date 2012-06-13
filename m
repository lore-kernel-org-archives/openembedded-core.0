Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SepUL-00051n-2X
	for openembedded-core@lists.openembedded.org;
	Wed, 13 Jun 2012 17:28:05 +0200
Received: by eekd49 with SMTP id d49so260991eek.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Jun 2012 08:17:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	bh=8HdiKkzlE5pajKzkuQbqz1wfafn+Cxk2Z3JzrSXdMwk=;
	b=C1AmGKrUDWhHs05eoi0WsrN8jWg3zHgrI3WK7nkEM2kpBycgt46F7cGibPATqQIHux
	DKf6BFLpCwcZswT1q76traq28WFqjjjMczb4v2kvRoQMbDPYQJDk/wb69FdJuyIf0xA0
	SEuuYhqgkokW/M8gd2X9zn3BUkBFR5TtaHIpqUkyfULexNcqX9jFzDEefabyN6e+z7B6
	CnnYjNW6qIS9VKdZ6PJvRCI8/aAayZT9B/+0IursR20tTivOyR6GM6327R+TC7tYria/
	LyjaRtaS1sEWMMFf0wNl955rvM9JH/lgjN/jC4uZyK0LtUQOg7ecMSR9ebTsjyS1rX7H
	9AYg==
Received: by 10.14.119.197 with SMTP id n45mr7565658eeh.180.1339600649009;
	Wed, 13 Jun 2012 08:17:29 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.188.11 with HTTP; Wed, 13 Jun 2012 08:16:58 -0700 (PDT)
In-Reply-To: <CAOHjBZs9DQP=uHuh7BE=gA9rHRQ=T7Lh+EV86VASBDGq_oScbA@mail.gmail.com>
References: <CAOHjBZuZrjs+Uza6yF+WxVmfFoQ1GZfkry0U4UOr1g+0xzdNqA@mail.gmail.com>
	<CAMKF1srAO=qZzCkxiSo=Az+sdS+YCzaQnU-=u1KeThZO42Faig@mail.gmail.com>
	<4FD78DDA.5010907@windriver.com>
	<CAOHjBZtg70_OdMNC9UGf30=t5+5tisBfyLnV0y7c9p+2qVYnVA@mail.gmail.com>
	<CAMKF1so9J5noXwZuyVMbTQHrcvbFtmPFg83e6=OHzyS_7BF-dQ@mail.gmail.com>
	<CAOHjBZs9DQP=uHuh7BE=gA9rHRQ=T7Lh+EV86VASBDGq_oScbA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 13 Jun 2012 08:16:58 -0700
Message-ID: <CAMKF1spLk2Tc3F_SQMxci8YubBBij1_pYmX0pEBYBtjqEwBrYw@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: fixup_perms failure on linux-libc-headers
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 13 Jun 2012 15:28:05 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 13, 2012 at 7:48 AM, Giuseppe Condorelli
<giuseppe.condorelli@gmail.com> wrote:
> Solved right now!
> I was forced to re-run the oe-init-build-dev script, maybe something was
> broken and
> restarting by scratch solved the issue.
>
> Just another question. I have appended to core-image-minimal the
> IMAGE_DEVICE_TABLES
> to point to an own .txt file containing the devices to create for the ima=
ge
> (as well as I did in old oe-classic).
> After the build, looking at the rootfs of the core-image-minimal director=
y I
> see the /dev empyt and also the
> log.do_rootfs reports that "min. I/O units was not specified".
> Any differencies against the old implementation?


Dont think so. Do you use USE_DEVFS set to 1 ? if not then it should
have worked.

>
> Many thanks Khem,
> Giuseppe
>
> 2012/6/13 Khem Raj <raj.khem@gmail.com>
>>
>> On Wed, Jun 13, 2012 at 1:02 AM, Giuseppe Condorelli
>> <giuseppe.condorelli@gmail.com> wrote:
>> > Hi Khem, Mark,
>> >
>> > I've not changed the location of the local repository since it was
>> > created
>> > months ago.
>> > This problem appeared yesterday and I cannot find a why.
>>
>> can you bisect and see if its some patch in OE or bitbake ?
>>
>> > For information, I'm on a FC14 host machine and the repository is on a
>> > physical hdd and not
>> > mounted from NFS for example.
>> >
>> > Cheers,
>> > Giuseppe
>> >
>> >
>> >
>> > 2012/6/12 Mark Hatle <mark.hatle@windriver.com>
>> >>
>> >> On 6/12/12 8:57 AM, Khem Raj wrote:
>> >>>
>> >>> On Tue, Jun 12, 2012 at 2:07 AM, Giuseppe Condorelli
>> >>> <giuseppe.condorelli@gmail.com> =C2=A0wrote:
>> >>>>
>> >>>> OSError: [Errno 1] Operation not permitted:
>> >>>>
>> >>>>
>> >>>> '/oelinux/condorg/openembedded-core/stlinux-3.0-build/tmp-uclibc/wo=
rk/sh4-oe-linux-uclibc/linux-libc-headers-2.6.32-r1/package/usr'
>> >>>
>> >>>
>> >>> what is your host machine ? did you also update bitbake ?
>> >>
>> >>
>> >> It also could be the filesystem. =C2=A0What filesystem type are you u=
sing?
>> >> =C2=A0(on
>> >> the host system...) =C2=A0If you are using something like fat32, you =
may run
>> >> into
>> >> problems like this because it does not have the ability to change
>> >> permissions and modes.. since the underlying filesystem does not
>> >> support
>> >> them.
>> >>
>> >> --Mark
>> >>
>> >>
>> >> _______________________________________________
>> >> Openembedded-core mailing list
>> >> Openembedded-core@lists.openembedded.org
>> >> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>> >
>> >
>> >
>> > _______________________________________________
>> > Openembedded-core mailing list
>> > Openembedded-core@lists.openembedded.org
>> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>> >
>>
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>


