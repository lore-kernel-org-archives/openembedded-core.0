Return-Path: <raj.khem@gmail.com>
Received: from mail-pb0-f48.google.com (mail-pb0-f48.google.com
	[209.85.160.48])
	by mail.openembedded.org (Postfix) with ESMTP id DB46E61F47
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Aug 2013 21:22:03 +0000 (UTC)
Received: by mail-pb0-f48.google.com with SMTP id ma3so3933935pbc.35
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Aug 2013 14:22:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=X3/98QRXbTG8O2PK17xK8YYbvmAAtARsnW1CW6WbPi8=;
	b=FtromUQdeAwTxKCwrJBEc2b7iz6haYZqgnz8XxbTEhkzeh0lHklcgvIbEWK8ZtEdaA
	kgFpjly8ui7n1erwC3kzfvqK6y6XLae/jQQAvG2z93ul282Dr8Fz53uevliBOUcByK/g
	xabY3myk6EfKEG11XTFLvCrhP/0W8pyJ1ie15tER/r8U+nfhONW4vayqil+Pz4FS2pBV
	6Gp2lC8+GTvr+m6EnVHp+Ee1QDCanmy44/oFmLa2kg4XTuT3uERZ+eV8D/IKGHkkmxIt
	hNGDpWiJhe9l/81jpLYTtiMxEPVHAhhSDQnQSVNT7YDh+7qhwljmmm/YHklqoF1+Wy8g
	0YPw==
X-Received: by 10.68.212.199 with SMTP id nm7mr4979907pbc.177.1377552124506;
	Mon, 26 Aug 2013 14:22:04 -0700 (PDT)
Received: from edchang-sslvpn-nc.jnpr.net (natint3.juniper.net.
	[66.129.224.36]) by mx.google.com with ESMTPSA id
	ts6sm20073051pbc.12.1969.12.31.16.00.00
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 26 Aug 2013 14:22:03 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.5 \(1508\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <5217C7FA.7090703@linux.intel.com>
Date: Mon, 26 Aug 2013 14:22:17 -0700
Message-Id: <F8679751-F1B9-4AAD-A1EB-BDD909C90B3F@gmail.com>
References: <cover.1377145501.git.raj.khem@gmail.com>
	<39306cf37bfb1b6ccf99c049498d6b4cf6c60976.1377145501.git.raj.khem@gmail.com>
	<5216888A.6050200@linux.intel.com>
	<DBCC9871-A9D3-438D-95B2-7F6797313633@gmail.com>
	<5217C7FA.7090703@linux.intel.com>
To: Saul Wold <sgw@linux.intel.com>
X-Mailer: Apple Mail (2.1508)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/3] kmod: Upgrade to version 14
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
X-List-Received-Date: Mon, 26 Aug 2013 21:22:04 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable


On Aug 23, 2013, at 1:37 PM, Saul Wold <sgw@linux.intel.com> wrote:

> On 08/22/2013 09:09 PM, Khem Raj wrote:
>>=20
>> On Aug 22, 2013, at 2:54 PM, Saul Wold <sgw@linux.intel.com> wrote:
>>=20
>>> On 08/21/2013 09:31 PM, Khem Raj wrote:
>>>> The update is a requirement for systemd-206
>>>>=20
>>>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>>>> ---
>>>>  meta/recipes-kernel/kmod/kmod-native_git.bb        |  1 -
>>>>  meta/recipes-kernel/kmod/kmod.inc                  |  9 ++++----
>>>>  ...-man-page-generation-because-we-don-t-hav.patch | 26 =
----------------------
>>>>  .../kmod/kmod/fix-undefined-O_CLOEXEC.patch        | 16 =
++++++-------
>>>>  meta/recipes-kernel/kmod/kmod_git.bb               |  3 +--
>>>>  5 files changed, 13 insertions(+), 42 deletions(-)
>>>>  delete mode 100644 =
meta/recipes-kernel/kmod/kmod/0001-man-disable-man-page-generation-because=
-we-don-t-hav.patch
>>>>=20
>>>=20
>>> Did you build the native version?  I am seeing failures in MUT on =
the autobuilder. It did pass my "sniff" test on my 2 local world builds.
>>=20
>>=20
>> yes and multiple times. what distro do you run on your build boxes ? =
I wonder if its some sort of race condition
>> I use -j20 and -j16
>>=20
> It's not a race condition, I built it stand alone with no parallel =
make.  I am not sure if a host contamination issue or something else, =
because like you I was able to built it on two machine locally, but not =
on the AB.
>=20
> Machine are CentOS 6.4, Debian 6.0.7, but it worked on my F19 and =
Ubuntu 12.04 machines!


I do not have access to Centos or debian to be able to reproduce this. =
If anyone has it please help in debugging it further. will try to =
offline try to poke around and see if I can get at something.



