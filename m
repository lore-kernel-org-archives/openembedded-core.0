Return-Path: <rehsack@gmail.com>
Received: from mail-wm0-f45.google.com (mail-wm0-f45.google.com [74.125.82.45])
	by mail.openembedded.org (Postfix) with ESMTP id C674D772D4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Nov 2015 12:18:34 +0000 (UTC)
Received: by wmww144 with SMTP id w144so28123824wmw.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Nov 2015 04:18:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=Y53+wBnJZNct3hztySktn1qKwd2lRMmThPUNu78KP78=;
	b=geUbSqDlahKSloAGCxOhfxLSVt7F9QVkXzU6o//l0K4Efmg4VFyJImwl21zs+PFRRV
	PLwitZpcp5J/qdPk1UrTRQLmyHkkqSBsbbtsZv4zu2nh129DMu9ncd68iLQm0SdEweuG
	8on27Bf+UPZIAf0GNRXfSS4P5VX9crQXf1qaqgLicpRSFuIWneWAbolM7jpjAbQP3ArU
	NNzvrGnsu3t85WFOoN438LIpSVm8avS1GXjTsaHKFsvxaLM/q4BRKX7f4fpGb9JPk+qv
	S2wW04ExfMNBQJwYF5eiQtRuL8xgtcidr/2RJU6equkJjX2XlFS/sSJXHGg2fdlNzT7N
	Yq/A==
X-Received: by 10.28.14.199 with SMTP id 190mr3629842wmo.42.1447417114428;
	Fri, 13 Nov 2015 04:18:34 -0800 (PST)
Received: from walter.muppets.liwing.de (p578b540c.dip0.t-ipconnect.de.
	[87.139.84.12])
	by smtp.gmail.com with ESMTPSA id j4sm3704240wmg.18.2015.11.13.04.18.33
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 13 Nov 2015 04:18:33 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2104\))
From: Jens Rehsack <rehsack@gmail.com>
In-Reply-To: <CAJTo0LYa6-gOECqfbfDZeDXcJKwMNesiUR9Z-N7j0bxKK-pjhw@mail.gmail.com>
Date: Fri, 13 Nov 2015 13:18:32 +0100
Message-Id: <E6C2BE5A-51EC-4D69-A685-6C00173B022C@gmail.com>
References: <6A0E85DF-31B7-4955-B4A2-0F3E099FCF99@gmail.com>
	<CAJTo0Lb7w0XAJ-H-T2Uz-mdmjUZGFX9wQyzCUJ_4bU8re9rswQ@mail.gmail.com>
	<A2AEDEA2-FB1D-4D6F-8B2F-F420AC123C9B@gmail.com>
	<CAJTo0LYOMeiaie9=3i908aAj3H4U0_qSdf7RmXSofosBMzcW9w@mail.gmail.com>
	<E909DBB3-5F90-4E81-949D-93E7D3960988@gmail.com>
	<CAJTo0LYqWk_2oqjFxZ44b+yAfAq8c_a1QiCH5erFKTmFvxg-Kw@mail.gmail.com>
	<CAJTo0LYa6-gOECqfbfDZeDXcJKwMNesiUR9Z-N7j0bxKK-pjhw@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
X-Mailer: Apple Mail (2.2104)
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] Update libusb1 from 1.0.19 to 1.0.20
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
X-List-Received-Date: Fri, 13 Nov 2015 12:18:35 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


> Am 13.11.2015 um 10:53 schrieb Burton, Ross <ross.burton@intel.com>:
>=20
>=20
> On 10 November 2015 at 13:14, Burton, Ross <ross.burton@intel.com> =
wrote:
> I can't see anything obviously wrong with the makefile.  I'll merge it =
and give it another run on the AB.
>=20
> =
http://errors.yoctoproject.org/Errors/Latest/Autobuilder/?filter=3Dlibusb1=
&type=3Drecipe
>=20
> Failed twice last night.  There's definitely a race in there.

Since we both didn't see something, I send a v2 with PARALLEL_MAKE =3D =
""

Cheers
--=20
Jens Rehsack - rehsack@gmail.com


