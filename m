Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f41.google.com (mail-pa0-f41.google.com
	[209.85.220.41])
	by mail.openembedded.org (Postfix) with ESMTP id AA3B66AC37
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Mar 2015 15:32:45 +0000 (UTC)
Received: by paceu11 with SMTP id eu11so59538713pac.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 09 Mar 2015 08:32:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=aPiYi/5M3nYI55Orh/WAeaLHsdttyRNCa+IukzOZ1Rc=;
	b=oIX0KU/kG6PETCO9UKXmCAQcTulrUBYUqdY1C3lUo9vImBVhnatTt7sUckMM5/DK+u
	g+7Hp1JjxASzNUKzXQi4NW9vXJ5rDUbTf24YnREGLyclBSjeFktorhzR3aGYyYoKbyv3
	satDYssE3t2fTP8+BZHSCdghdmyz9pEABed9vNrYsUBI89RNgrL2SM4PKtOKuVlePEbp
	zIXPEoDFTgNrAU8Oq8K1IsTni3grGMULiDJu8oSlsNualXdpprvIQOqAOiNm0xZrP32u
	m3zKp/gF0BlbDNAnhC8rFpk8HBYT9O6K41bhNdZt9aMmiqPQi5vrdmHMO9ZQmOduDxV0
	kHnw==
X-Received: by 10.70.26.129 with SMTP id l1mr53936141pdg.163.1425915166733;
	Mon, 09 Mar 2015 08:32:46 -0700 (PDT)
Received: from ?IPv6:2601:9:3580:84c:5dec:324d:fc8d:ab4d?
	([2601:9:3580:84c:5dec:324d:fc8d:ab4d])
	by mx.google.com with ESMTPSA id g3sm19805213pdg.39.2015.03.09.08.32.45
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 09 Mar 2015 08:32:46 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2070.6\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1425908226.2831.22.camel@bottazzini-ThinkPad-T430>
Date: Mon, 9 Mar 2015 08:32:45 -0700
Message-Id: <2E350014-ECBF-4D57-AA63-76D63219611C@gmail.com>
References: <bruno.bottazzini@intel.com>
	<1425504462-6979-1-git-send-email-bruno.bottazzini@intel.com>
	<1425504462-6979-4-git-send-email-bruno.bottazzini@intel.com>
	<20150305142802.GA6833@ad.chargestorm.se>
	<1425572096.2831.16.camel@bottazzini-ThinkPad-T430>
	<20150306082330.GA14309@ad.chargestorm.se>
	<1425650611.2831.20.camel@bottazzini-ThinkPad-T430>
	<CAMKF1sp4pDdt_rS223_YqmeyB0yAVFkafR7tnuq3uztm9vV56Q@mail.gmail.com>
	<1425908226.2831.22.camel@bottazzini-ThinkPad-T430>
To: "Bottazzini, Bruno" <bruno.bottazzini@intel.com>
X-Mailer: Apple Mail (2.2070.6)
Cc: Anders Darander <anders@chargestorm.se>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/3] systemd: split modules into packages
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
X-List-Received-Date: Mon, 09 Mar 2015 15:32:46 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable


> On Mar 9, 2015, at 6:37 AM, Bottazzini, Bruno =
<bruno.bottazzini@intel.com> wrote:
>=20
> On Sex, 2015-03-06 at 14:51 -0800, Khem Raj wrote:
>> On Fri, Mar 6, 2015 at 6:03 AM, Bottazzini, Bruno
>> <bruno.bottazzini@intel.com> wrote:
>>> On Sex, 2015-03-06 at 09:23 +0100, Anders Darander wrote:
>>>> * Bottazzini, Bruno <bruno.bottazzini@intel.com> [150305 17:15]:
>>>>=20
>>>>> On Qui, 2015-03-05 at 15:28 +0100, Anders Darander wrote:
>>>>=20
>>>>>> Just a quick question before I look into the patch in more =
detail.
>>>>=20
>>>>>> Is the new setting of PACKAGECONFIG consistent with how systemd =
was
>>>>>> built previously? I guess it is.
>>>>=20
>>>>> Hi Anders,
>>>>=20
>>>>> it is consistent with how systemd was built previously. If you =
apply the
>>>>> patch and bitbake it. Systemd will be built and shipped normally.
>>>>=20
>>>>> But now it will give some options on how to customize it by =
excluding
>>>>> packages you don't want to be with systemd.
>>>>=20
>>>> Nice, I'm really liking this! That's something I've planned on =
doing
>>>> myself for a while.
>>>>=20
>>>>>> Another comment, you should remove the dependcies that gets added =
using
>>>>>> PACKAGECONFIG from DEPENDS, e.g. acl etc. (Or are they required
>>>>>> nevertheless?)
>>>>=20
>>>>> You mean I should do the following ?
>>>>> - PACKAGECONFIG[acl] =3D "--enable-acl,--disable-acl,acl"
>>>>> + PACKAGECONFIG[acl] =3D "--enable-acl,--disable-acl"
>>>>=20
>>>> No, I  meant to remove them from the long
>>>> DEPENDS =3D "kmod docbook-sgml-dtd-4.1-native intltool-native =
gperf-native acl readline dbus libcap libcgroup glib-2.0 qemu-native =
util-linux"
>>>> line. (Unless I overlooked that part in your patch?)
>>>>=20
>>>>> If I get what you said correctly, yes they are required.
>>>>=20
>>>> What I meant, was thas unless e.g. acl is required even when =
building
>>>> with --disable-acl, it's better to add the acl dependency in the
>>>> PACKAGECONFIG like you to. Though, at the same time, remove acl =
from the
>>>> long DEPENDS-line. (As otherwise we'll build acl anyway).
>>>=20
>>> Anders,
>>>=20
>>> You are right.
>>>=20
>>> It is not needed to specify the libs on depends.
>>>=20
>>> I have removed it and as soon as we review the whole patch I will =
send a
>>> new version with this corrected
>>>=20
>>=20
>> On top of all this 'acl' is a distro feature so that should be
>> accounted for too.
>=20
> Hello Khem,
>=20
> It will be accounted when acl flag is enabled on systemd.
>=20


I am saying enabling this packagconfig should depend upon distro =
features something like
PACKAGECONFIG ??=3D "${@bb.utils.contains('DISTRO_FEATURES', =E2=80=98acl'=
, =E2=80=98acl', '', d)}

> Best Regards,
>=20
>=20
>=20
>=20
>=20


