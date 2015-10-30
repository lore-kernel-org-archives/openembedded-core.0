Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f44.google.com (mail-pa0-f44.google.com
	[209.85.220.44])
	by mail.openembedded.org (Postfix) with ESMTP id 2FEC4759B4;
	Fri, 30 Oct 2015 00:26:15 +0000 (UTC)
Received: by pacfv9 with SMTP id fv9so57709090pac.3;
	Thu, 29 Oct 2015 17:26:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=B7NEQx0w28kE99eYlB8HsE+rB1fY+sUwZJ6Xi8LqebQ=;
	b=zfCh9IksZHdFqmEecjkcriiWWI/WUiLYvxvNIAcStiwSNoTMjUjwtHxVxRdPcRD0+J
	+7SLClbudY9FJGz7Gk7K+Zt8Aekx1PtetBHH7MerXtsGi/zWJ4Ic1GUK81edmr9MBiyd
	h1F8t8RNBNaN912wbWlPHgkDqFfG8rA3nfkmh0N5IKSmcz3GPuGq+eHvlY8eLbw5Cw/M
	DnCHAsDm4xL0/GwH7IoHvA+56jPYOL5F0RXS4pUTrsZhshgrBorfZlZlCIQyNi1NAkLG
	fHH3mr7ZytbnbSlzYdvEzzATQx+R0Ms83Px3cvet+XDRYXw6GLe+Y0FzaIc+IlRs9Xns
	Ip8A==
X-Received: by 10.68.236.229 with SMTP id ux5mr5253253pbc.1.1446164776085;
	Thu, 29 Oct 2015 17:26:16 -0700 (PDT)
Received: from ?IPv6:2601:647:4c02:370d:b5ec:9eea:4830:cc89?
	([2601:647:4c02:370d:b5ec:9eea:4830:cc89])
	by smtp.gmail.com with ESMTPSA id
	iy1sm4425042pbb.85.2015.10.29.17.26.14
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 29 Oct 2015 17:26:15 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 9.1 \(3096.5\))
X-Pgp-Agent: GPGMail 2.6b2
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <563280E0.2080809@windriver.com>
Date: Thu, 29 Oct 2015 17:26:05 -0700
Message-Id: <96CD693B-7FFA-47F9-8D9F-FC7E749B8C1C@gmail.com>
References: <9D79B6D4-2FE1-4C77-A359-C0F47DCC090D@gmail.com>
	<56327C86.60202@windriver.com>
	<CAMKF1soy5s8iwBBP21cVS=o2ynkKBmoijStH3MjEoYz8uu4yaA@mail.gmail.com>
	<563280E0.2080809@windriver.com>
To: Mark Hatle <mark.hatle@windriver.com>
X-Mailer: Apple Mail (2.3096.5)
Cc: Martin Jansa <openembedded-devel@lists.openembedded.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [oe] State of libcs in OE-Core glibc/uclibc/musl
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
X-List-Received-Date: Fri, 30 Oct 2015 00:26:16 -0000
X-Groupsio-MsgNum: 72765
Content-Type: multipart/signed;
	boundary="Apple-Mail=_168AF12E-AE7C-4167-B864-DA270821B269";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_168AF12E-AE7C-4167-B864-DA270821B269
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8


> On Oct 29, 2015, at 1:26 PM, Mark Hatle <mark.hatle@windriver.com> =
wrote:
>=20
> On 10/29/15 3:14 PM, Khem Raj wrote:
>> On Thu, Oct 29, 2015 at 1:07 PM, Mark Hatle =
<mark.hatle@windriver.com> wrote:
>>> On 10/29/15 10:42 AM, Khem Raj wrote:
>>>> Hi All,
>>>>=20
>>>> I would like to get everyone=E2=80=99s opinion on the libcs we =
maintain in OE-Core, as of now, we have
>>>>=20
>>>> glibc + cross localedef + kconfig patches which are left overs from =
eglibc days
>>>=20
>>> I do find the above useful -- include the kconfig part.
>>>=20
>>>> uclibc - which is more of less unmaintained
>>>=20
>>> I've never used uclibc with the Yocto Project framework.  I think =
musl is a lot
>>> more compelling moving forward.
>>>=20
>>>> Its a significant effort to keep forward porting the kconfig =
changes since it touches everywhere in glibc, (I do it in my local glibc =
tree)
>>>> almost every week there is a commit in upstream glibc which breaks =
the kconfig patches, I know there are distribution profiles
>>>> like poky-tiny which uses glibc in this capacity, and may be then =
their are other custom one=E2=80=99s made on top, I would like us to not =
carry major
>>>> patches which almost makes our component a fork due to obvious =
maintenance cost. I think there is viable alternatives to tiny libcs in =
musl now.
>>>>=20
>>>> I would like to make a proposal for 2.1 release where
>>>>=20
>>>> 1. Drop kconfig support in glibc and we become inline with upstream
>>>=20
>>> I really would like to keep kconfig support still.  It's definitely =
useful, but
>>> it's of course not the main workflow.
>>=20
>> its a lot of work and upstream is not so keen on supporting it =
either,
>> so even if we spend time to clean it up
>> and send upstream it might need dedicated maintenance which is going
>> to be quite frequent breakages
>> since no one will test all kconfig combos. At this point this is the
>> biggest drag to take glibc forward I spend lot of time on keeping
>> these
>> patches moving forward. so we want
>> to avoid needless effort if there is so little userbase for it. Cross
>> localedef and others we still will keep.
>=20
> I definitely understand this.... I wonder if the right answer is to =
create a
> project for this either under the Yocto Project umbrella or just as a =
separate
> project.. everything remains 'glibc' except for the kconfig chunk.
>=20

that sounds a good idea. May be the patch can be picked from 2.0 release =
and maintained there separately
and applied but not via OE-Core that way it will get maintained as well =
as used by interested parties.

> That -might- be able to relieve the burden from your shoulders.. but =
it wouldn't
> be an overnight process.  (And if nobody actually cares, it might =
prove that
> point and make it easier to justify removing.)

I think this is more likely the practical case

>=20
>>>=20
>>>> 2. Move musl support to OE-Core from meta-musl
>>>=20
>>> I wouldn't object to his.
>>>=20
>>>> 3. Drop uclibc or leave it in current broken state, I would like to =
pull it out into a layer in meta-openembedded and we can leave the core =
plumbing as it is in OE-Core
>>>=20
>>> I definitely wouldn't object to this.  I do think keeping the uclibc =
hooks and
>>> such in oe-core for the time being does make sense.  It would be =
interesting to
>>> know how often it is still being used... (and I do think musl is a =
better
>>> replacement for this use-case.)
>>>=20
>>>> 4. Poky-tiny switches to use musl
>>>=20
>>> I think there are two usages here.. one is a small 'glibc' interface =
where the
>>> API is glibc compatible, but restricted..
>>>=20
>>> And a "don't care about the libc, as long as it works and is small" =
use case
>>> which was traditionally uclibc, but now can be fulfilled by musl.
>>>=20
>>> I do still think a 'tiny' glibc is useful -- however with musl being =
a lot more
>>> capable of working then uclibc was, the usefulness may be =
diminishing.
>>>=20
>>>> may other disto=E2=80=99s have moved to using musl as system C =
library e.g. alpine linux, openwrt, and I am also deploying it in  real =
products
>>>> its pretty mature and well maintained with very healthy community =
around it. Right now meta-musl is capable of building and running
>>>> core-image-sato/core-image-weston for all supported Qemu arches in =
OE-Core, the amount of software it can build is no less than uclibc
>>>> support in OE-Core.
>>>=20
>>> This certainly makes it worthwhile to consider putting into oe-core =
proper.
>>> Again, I have no objections to introducing musl.
>>>=20
>>> --Mark
>>>=20
>>>> if collectively we think, this is a good move then I can work on =
all of above items in early phases of 2.1 so we can settle any
>>>> outstanding issues, due to the shuffle especially in poky-tiny
>>>>=20
>>>> Thoughts ?
>>>>=20
>>>> -Khem
>>>>=20
>>>>=20
>>>>=20
>>>=20
>>> --
>>> _______________________________________________
>>> Openembedded-core mailing list
>>> Openembedded-core@lists.openembedded.org
>>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>=20


--Apple-Mail=_168AF12E-AE7C-4167-B864-DA270821B269
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlYyuSYACgkQuwUzVZGdMxS5TgCeLoBTtX7QvVtpIVinVnr5ZI6D
uYoAnA+C2TsctDnrT1A9mjMQ8x3As+1x
=0y6E
-----END PGP SIGNATURE-----

--Apple-Mail=_168AF12E-AE7C-4167-B864-DA270821B269--
