Return-Path: <raj.khem@gmail.com>
Received: from mail-pd0-f174.google.com (mail-pd0-f174.google.com
	[209.85.192.174])
	by mail.openembedded.org (Postfix) with ESMTP id B12907182C;
	Thu, 19 Feb 2015 00:28:08 +0000 (UTC)
Received: by pdjy10 with SMTP id y10so4878376pdj.6;
	Wed, 18 Feb 2015 16:28:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=t7SWebZqT80Kbs7NqxzpFM4epRXTcV6vBAE3g/RGTKg=;
	b=YF8hbeJxzfbC10WT4YtQWzsH+jd4TtkjSS7N2uYerxy/Ikdz6dGVyw7WODe34UMSVH
	IQ//pF2kFTvzHr/rMdJjyg2TgnrvfarTrNl0tCfZpCx0NY45msSqriwdxpPDUmXniLCX
	P4kmlLjJPbsa//KyHF3U231lOc+8wRdPmTMKDzT98AkiGJJYkraAOupogNpx6FP328HD
	DdhvbEgRLgRvn4lS0l9xoMIQNVVVtmkVwBNCH6YfrSbFGMe6SNOuDWUAMbR4A8mLi7LJ
	nfpezRZyP1jkngwNqcKazMuKdNT9AQEfrViF3enoMfY/6gFJ5jsWMGtYVqXqIz1mYxIR
	akbg==
X-Received: by 10.68.245.196 with SMTP id xq4mr3139951pbc.124.1424305690046;
	Wed, 18 Feb 2015 16:28:10 -0800 (PST)
Received: from ?IPv6:2601:9:3580:84c:ac05:bc97:a5e3:53c?
	([2601:9:3580:84c:ac05:bc97:a5e3:53c])
	by mx.google.com with ESMTPSA id
	cz1sm21883462pdb.32.2015.02.18.16.28.08
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 18 Feb 2015 16:28:09 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2070.6\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <E5ADEF30-DBC9-4250-ACA4-F889D8CFDA89@gmail.com>
Date: Wed, 18 Feb 2015 16:28:08 -0800
Message-Id: <AA599D04-C5B2-49A8-96FB-F9074D59EB03@gmail.com>
References: <CAMKF1souj1-FLTjkQb0y8myTiKMJyNeAa7wiM5-pW1fz0EtheA@mail.gmail.com>
	<CAJTo0LaN3HMhjrpii2pPbJw5zWbywgr1keZe=iQmuKFMFFf=gQ@mail.gmail.com>
	<CAMKF1sq8NsuNYZDQRPtXruBeRndOP+0qwBuTO2ahb6q-fS8XGw@mail.gmail.com>
	<CAJTo0LYpKbwOHg-DBMJycy+KNayTCsnhToJR8K-REKZ2jxhnhw@mail.gmail.com>
	<EA0C9DE9-9E5F-4B74-8464-138895268F2F@gmail.com>
	<CAJTo0LbSFesauhA_H39Znd07SR5JCs45izy2us=cFWVGXtW8hg@mail.gmail.com>
	<80920FD0-CA08-45D7-9A41-3971FB2D58D7@gmail.com>
	<CAJTo0LbqTrQzk0KeHDxYnmtZrrFdZD12DWrjA=Y4RtbQzwM0ow@mail.gmail.com>
	<CAMKF1sr7bYpKqzTmvX5rCuYc-Rb2se7Vsrr4aYA43E_b1Z=vWA@mail.gmail.com>
	<CACS+7ZRNm2Y0SJn76imF6DNoEsL2+ppC1zG45iGspOmL0EN0BQ@mail.gmail.com>
	<CAMKF1sqjQm+n5xKfS0utm9B9h_S+RYWrgnGUCboRNCk5XSUmzg@mail.gmail.com>
	<1423908404.20217.100.camel@linuxfoundation.org>
	<CAMKF1sofS7MteZnPsTYRNAcMwrrh=T3FP+ASmAOGDMhcwyXB4g@mail.gmail.com>
	<1424245575.25541.19.camel@linuxfoundation.org>
	<BCB8524E-91CB-41F6-83C0-7B90E60BC82D@gmail.com>
	<1424260309.25541.23.camel@linuxfoundation.org>
	<1424264807.11836.1.camel@linuxfoundation.org>
	<3F6EFBD4-AC35-4CE0-B52C-0ABDA0D17838@gmail.com>
	<1424295668.11836.19.camel@linuxfoundation.org>
	<E5ADEF30-DBC9-4250-ACA4-F889D8CFDA89@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
X-Mailer: Apple Mail (2.2070.6)
Cc: "yocto@yoctoproject.org" <yocto@yoctoproject.org>,
	openembeded-devel <Openembedded-devel@lists.openembedded.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [yocto] [RFT] upcoming glibc 2.21 and gcc 4.9 upgrade
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
X-List-Received-Date: Thu, 19 Feb 2015 00:28:09 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable


> On Feb 18, 2015, at 4:23 PM, Khem Raj <raj.khem@gmail.com> wrote:
>=20
>=20
>> On Feb 18, 2015, at 1:41 PM, Richard Purdie =
<richard.purdie@linuxfoundation.org> wrote:
>>=20
>> On Wed, 2015-02-18 at 10:38 -0800, Khem Raj wrote:
>>>> On Feb 18, 2015, at 5:06 AM, Richard Purdie =
<richard.purdie@linuxfoundation.org> wrote:
>>>> On Wed, 2015-02-18 at 11:51 +0000, Richard Purdie wrote:
>>>>> On Wed, 2015-02-18 at 01:01 -0800, Khem Raj wrote:
>>>> The series needs:
>>>>=20
>>>> TUNE_CCARGS_x86 :=3D "${@oe_filter_out('-mfpmath=3Dsse', =
'${TUNE_CCARGS}', d)}"
>>>> +TUNE_CCARGS_x86-64 :=3D "${@oe_filter_out('-mfpmath=3Dsse', =
'${TUNE_CCARGS}', d)}=E2=80=9D
>>>>=20
>>>=20
>>> hmmm I assumed x86 was common across 32bit and 64bit x86 but seems =
not so I replaced the old patch instead of appending it=20
>>=20
>> Thanks, I'll update the patch for the next round.
>>=20
>>>=20
>>>> since the x86 override doesn't cover x86_64. I'll queue that and =
run yet
>>>> another build. We do have another poky-tiny issue too:
>>>>=20
>>>> =
https://autobuilder.yoctoproject.org/main/builders/poky-tiny/builds/204
>>>>=20
>>>=20
>>> OK. I am creating a local config to use tiny config for libc and =
weed out remaining build issues for tiny config=20
>>=20
>> Cool, thanks.
>>=20
>> The next build is in progress and looking greener than the last. Next =
up
>> it appears we still have multilib issues:
>=20
> I have pushed a new patchset to same branch. That should fix the tiny =
build issues.
>=20
>>=20
>> =
https://autobuilder.yoctoproject.org/main/builders/nightly-multilib/builds=
/201
>=20
>=20
> | dcigettext.c: In function '__dcigettext':
> | dcigettext.c:856:30: error: '__libc_setlocale_lock' undeclared =
(first use in this function)
> |         __libc_rwlock_unlock (__libc_setlocale_lock);
>=20
> is what I see.
>=20
> I have fixed this in the latest patchset. So lets start with the new =
patchset.
>=20

in =
https://autobuilder.yoctoproject.org/main/builders/nightly-multilib/builds=
/201/steps/BuildImages/logs/stdio

| make: *** =
[/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-multilib/build/bui=
ld/tmp/work/core2-64-poky-linux/glibc-locale/2.21-r0/locale-tree/usr/lib64=
/locale/es_HN] Aborted (core dumped)

thats new its probably a crash in localedef.


>=20
>> There is a possibility this "from sstate" build may have run into a
>> problem with sstate but something looks to be wrong with glibc in =
some
>> regard.
>>=20
>> Cheers,
>>=20
>> Richard
>>=20
>=20


