Received: from mail-qc0-f169.google.com ([209.85.216.169])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@gmail.com>) id 1SjrrW-0001uH-JI
	for openembedded-core@lists.openembedded.org;
	Wed, 27 Jun 2012 15:00:50 +0200
Received: by qcsd16 with SMTP id d16so675308qcs.28
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Jun 2012 05:49:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	bh=DbJK3DdmS6CxtkZdSamfDGGRwHyDwRpHGxMDb/3VQ/Q=;
	b=EZSB4xj+LkWf/rexrf7MinvdvweYbeDS/fGsD2iRiyniplEN69Kt3WnVJYnuediPpK
	8wv2m6hkhfjw5zaOA/s2/cjVKTS/EWRSTw6iWicHgmonT3H2OdxeYEiR3GxmB4l0e2tK
	xoQIZBJHOTW3t4ehdleTZqrG+sFwqb24KFnnvh/mINEvYkIKgENXx9+Lud6GTVAjzOPD
	FiBvjifC620vz7SnPEbx8+GwoczcdNeFpde8K/q4OcUbSHTo+/g7GiDzXtrVmLubu7js
	uUnE1VJj8MCKE3nq8iMyZk3PQPHN/J+5Vos8/pMSrqqQM9FgP94Y2VvsTCpWetXfaxtZ
	K6aw==
MIME-Version: 1.0
Received: by 10.224.45.8 with SMTP id c8mr10713638qaf.29.1340801396714; Wed,
	27 Jun 2012 05:49:56 -0700 (PDT)
Received: by 10.229.41.5 with HTTP; Wed, 27 Jun 2012 05:49:56 -0700 (PDT)
In-Reply-To: <CAMKF1srKXavMswBxM+E_-HHGXdDphYuPfNKbXHAZf4=w1nsMUw@mail.gmail.com>
References: <CAF1ZMEcMxTQUhyHdmMWV_PA6TY=RTz9rq-EahKU0p=DFFPw+Ew@mail.gmail.com>
	<CAMKF1srKXavMswBxM+E_-HHGXdDphYuPfNKbXHAZf4=w1nsMUw@mail.gmail.com>
Date: Wed, 27 Jun 2012 08:49:56 -0400
Message-ID: <CADkTA4P0LCRS7STDMr7uG6mg-85SGiixfzX_iso_i664Q9ftKQ@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: yocto@yoctoproject.org, Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [yocto] bring mipsel support (little endian mode)
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
X-List-Received-Date: Wed, 27 Jun 2012 13:00:50 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 27, 2012 at 2:40 AM, Khem Raj <raj.khem@gmail.com> wrote:
> On Tue, Jun 26, 2012 at 11:25 PM, Dennis.Yxun <dennis.yxun@gmail.com> wro=
te:
>> HI ALL:
>> =A0 Sorry for crossing post, but I'm quite new here, so if I did
>> something wrong, please point me the right direction. thanks
>> =A0 I'm using oe-core, and notice that mipsel support(o32, little
>> endian mode) is missing (current available choose is: qemumips,
>> qemumips64, qemumips64el).
>> =A0 So, here I'm trying to bring up qemumipsel support . My first
>> attempt would just make qemumipsel work,
>> further would make it running on real board, thus maybe mips4kec,
>> mips24k, mips74k chips.
>> =A0 What I achieved here current:
>> =A01) toolchain/basic libs, utilities should works ,only one changes,
>> see my patch [a]
>> =A0 for mipsel we also have to filter out -march=3Dmips32, previously we
>> only handle mips (the big endian?)
>> =A0 don't have the error message now, but if you request, I can provide.
>> =A02) attempt to =A0compile kernel to support qemumipsel, unfortunately =
it fail.
>> The point here is linux-yocto doesn't support qemumipsel, but merely
>> support those other three mips arches,
>> So here is my attempt patch [b], and the fail log [c], complied out
>> binary still big endian.
>>
>> =A0 Could my patch [a] be accepted? or should I send with another mail
>> for better review?
>> =A0 Is it better to request a ticket in yocto's bugzilla? or just
>> report here, I'm not quite sure.
>>
>> Dennis
>>
>> [a] 0001-eglibc-support-mipsel-little-endian-filter-out-march.patch
>
> This patch is appropriate for OE-Core, I will add it to my tree.
>
>> [b] 0002-qemu-attempt-to-add-mipsel-little-endian-support-but.patch
>
> This looks good to me but I will leave it to Bruce to decide.

I've always had latent support for mipsel in the kernel tree, since it is
just a minor switch to the configs for the mti.

We'd also sent the KMACHINE to mti-malta32-le to pickup the le
configuration switches from the kernel .. or alternatively, I'll just updat=
e
the description to match on qemumipsel.

I'd want to do some build and boot testing myself first though, Phil seemed
to indicate that patch a) wasn't required. I'll start my own build and see =
if
my results match.

So if there's a desire to get this into oe-core, I can take care of the ker=
nel
tweaks (and then carry it), but I'd expect Richard has an opinion on this, =
since
it really should be something that we then build and minimally test
on a regular basis.

Cheers,

Bruce

>
>> [c] build_log.txt
>> [d] log.do_package
>>
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>>
> _______________________________________________
> yocto mailing list
> yocto@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/yocto



--=20
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"


