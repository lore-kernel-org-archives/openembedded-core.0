Return-Path: <raj.khem@gmail.com>
Received: from mail-pd0-f182.google.com (mail-pd0-f182.google.com
	[209.85.192.182])
	by mail.openembedded.org (Postfix) with ESMTP id 6A9D865C85;
	Wed, 18 Feb 2015 18:38:13 +0000 (UTC)
Received: by pdev10 with SMTP id v10so2924616pde.10;
	Wed, 18 Feb 2015 10:38:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=Kn0sMdFmzmVeNGT4OzyYRi+3yHSBvF1sm5JhZxYKviw=;
	b=0zEZ3y1NEWxeoQfdn+w8TEXhxHlYe+EvB6l/cF1Setor1wJPg3Zgph6seq06mdn8ZC
	Use8/OGBxtsMqMpLhYcvfzPgjLOcI4/gIcTRdETZGPo9b/EZaISb3U2FJg6ldWBsVlZH
	wAdmjG462GIEyNl/dn6RjFvEpFS/iSZ0X7x3BblmLP+Fv770qXNx4NGcM7yygHxjfHgU
	7DH7eVbrwDfHO++jEbDO5BLO+1m/ChN7xfggtKZDTG6DXPBq7N3vRwyNsami9CDITHyR
	EwdxQZbJVWweEIKNToiaUt3nxvxb6X1vjEQU8vfP8kSEYUBKHhZnCCniLfQXnZBP/6sg
	rmlw==
X-Received: by 10.70.134.163 with SMTP id pl3mr873143pdb.45.1424284694297;
	Wed, 18 Feb 2015 10:38:14 -0800 (PST)
Received: from ?IPv6:2601:9:3580:84c:ac05:bc97:a5e3:53c?
	([2601:9:3580:84c:ac05:bc97:a5e3:53c])
	by mx.google.com with ESMTPSA id g2sm17155147pbw.37.2015.02.18.10.38.13
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 18 Feb 2015 10:38:13 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2070.6\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1424264807.11836.1.camel@linuxfoundation.org>
Date: Wed, 18 Feb 2015 10:38:12 -0800
Message-Id: <3F6EFBD4-AC35-4CE0-B52C-0ABDA0D17838@gmail.com>
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
X-List-Received-Date: Wed, 18 Feb 2015 18:38:15 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable


> On Feb 18, 2015, at 5:06 AM, Richard Purdie =
<richard.purdie@linuxfoundation.org> wrote:
>=20
> On Wed, 2015-02-18 at 11:51 +0000, Richard Purdie wrote:
>> On Wed, 2015-02-18 at 01:01 -0800, Khem Raj wrote:
>>> OK thats why I am not seeing it on my qemux86 build.=20
>>>=20
>>> this leaves us with only one problem - glibc/qemuarm issue
>>>=20
>>> http://errors.yoctoproject.org/Errors/Details/8679/
>>>=20
>>> I have seen this error with eglibc-2.19 and glibc 2.20 as well on =
x86 and arm as well in cases when using
>>> toolchain from sstate and rebuilding glibc with that. I assume this =
could be  unrelated to glibc upgrade
>>> and may be a latent problem. Could be missing dependency on a native =
tool or some such. I have been attributing it to gold
>>> but that just might have been a red herring.
>>>=20
>>> I will see if I can get to reproduce it.
>>=20
>> I tried another build with the three patches from your oe-core =
contrib
>> branch applied. Error report out is:
>>=20
>> =
http://errors.yoctoproject.org/Errors/Search/?items=3D10&query=3Db75fed99f=
2aa86b49844dd0cf06991767f6f26d3
>>=20
>> i.e. we're still seeing SSE errors in glibc builds. Am I missing some
>> patches or something?
>=20
> The series needs:
>=20
> TUNE_CCARGS_x86 :=3D "${@oe_filter_out('-mfpmath=3Dsse', =
'${TUNE_CCARGS}', d)}"
> +TUNE_CCARGS_x86-64 :=3D "${@oe_filter_out('-mfpmath=3Dsse', =
'${TUNE_CCARGS}', d)}=E2=80=9D
>=20

hmmm I assumed x86 was common across 32bit and 64bit x86 but seems not =
so I replaced the old patch instead of appending it=20


> since the x86 override doesn't cover x86_64. I'll queue that and run =
yet
> another build. We do have another poky-tiny issue too:
>=20
> =
https://autobuilder.yoctoproject.org/main/builders/poky-tiny/builds/204
>=20

OK. I am creating a local config to use tiny config for libc and weed =
out remaining build issues for tiny config=20

> Cheers,
>=20
> RIchard


