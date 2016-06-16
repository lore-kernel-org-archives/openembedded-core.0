Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f193.google.com (mail-pf0-f193.google.com
	[209.85.192.193])
	by mail.openembedded.org (Postfix) with ESMTP id 11B7D60589
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Jun 2016 14:34:23 +0000 (UTC)
Received: by mail-pf0-f193.google.com with SMTP id 66so4191540pfy.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Jun 2016 07:34:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:from:in-reply-to:date:cc:message-id:references
	:to; bh=rWow+pHaBfz0CiIHgBSyk4ggIXnFrrf3AIfMqFLroi0=;
	b=qmj1OCf/SqnIrQN5DsbO7ieaHkmFLKogZ65345UeTwmrCGZW1DTymLTSHEeJ0Mbw5G
	kOvJVlAMzRZztdPBSy0Bct4Ksg8VnyyIu23g2+RmTAIEz6mt/rFynep3MW506AbDjKdX
	AuCnNBQe710Aj5Mx9Hv9jcOhKKjd+GRhZWMH2pMbiYw9AMLWU9G/wcIQy4s0B0HZmVEr
	d0cCPRkDStL1T+tSqPF+x6rFSNcb+707pJkhbAQLezqrRXOIWguoh5tMvbrmdvyrEvNo
	neWXW9uav4fC0YkqiTT5i5/9SAS6kvgB3ScTF+lWjzTueOJjqQmpShIMCdBakkaK0ksh
	Ix0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:mime-version:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=rWow+pHaBfz0CiIHgBSyk4ggIXnFrrf3AIfMqFLroi0=;
	b=YSxHf0RjRHlO0GOWUmhCEqzV4iyvrY2Q2mp1TQuO3P5+axwuqaGXAofLFhuwgurCTY
	I0TFvs+Wvbpf+dO/RQ5mPq/1rmpphRNajZYQMWy923Gck9eVPQoGWWXD8YSNAVnpXEAU
	1LM8v4k+aNI0V5hShvwLrPxn0IqVsuWkdv0FMbDLcKIIdgoXtJZ8wYuVK5snjWBLmmDD
	FRLKRQoE6wKqRkuGJN1BjY34s3Xew/9VQThtdRwuuoew4jV9+x6Na+A7gGIF5TxFZihc
	ixT6NMqxxxMkwth1l6eLAAqSltoRRsijzL37LLh5l35649Qlw6Ftz2+/13MiGPtvL7Pd
	pWvQ==
X-Gm-Message-State: ALyK8tKdVbCfbcuVutwe29NcyYsqq2Wlh9DzhZXotPyphb6CSjGez37pWpb3JKitqDXfbA==
X-Received: by 10.98.93.216 with SMTP id n85mr5431043pfj.36.1466087664128;
	Thu, 16 Jun 2016 07:34:24 -0700 (PDT)
Received: from [192.168.0.6] (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192])
	by smtp.gmail.com with ESMTPSA id 7sm31988800pfa.28.2016.06.16.07.34.23
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 16 Jun 2016 07:34:23 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
X-Pgp-Agent: GPGMail 2.6b2
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <DFCB2C9E62139C41B3FDE8F2B4659331D2E8D4@PGSMSX101.gar.corp.intel.com>
Date: Thu, 16 Jun 2016 07:34:18 -0700
Message-Id: <E3B92B40-D865-4C90-9CF2-D6AE61F569F5@gmail.com>
References: <1465895420-1660-1-git-send-email-anujx.mittal@intel.com>
	<2CA6588C-87EE-4A88-9669-024C67DB9B8C@gmail.com>
	<DFCB2C9E62139C41B3FDE8F2B4659331D2E8D4@PGSMSX101.gar.corp.intel.com>
To: "Mittal, AnujX" <anujx.mittal@intel.com>
X-Mailer: Apple Mail (2.3124)
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gcc: make sure header path is set correctly
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
X-List-Received-Date: Thu, 16 Jun 2016 14:34:24 -0000
X-Groupsio-MsgNum: 83515
Content-Type: multipart/signed;
	boundary="Apple-Mail=_C46DD7E9-3724-4AC2-ABEE-ACD4CC73203B";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_C46DD7E9-3724-4AC2-ABEE-ACD4CC73203B
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


> On Jun 15, 2016, at 10:49 PM, Mittal, AnujX <anujx.mittal@intel.com> =
wrote:
>=20
>=20
>=20
>> -----Original Message-----
>> From: Khem Raj [mailto:raj.khem@gmail.com]
>> Sent: Thursday, June 16, 2016 10:47 AM
>> To: Mittal, AnujX <anujx.mittal@intel.com>
>> Cc: openembedded-core@lists.openembedded.org
>> Subject: Re: [OE-core] [PATCH] gcc: make sure header path is set =
correctly
>>=20
>>=20
>>> On Jun 14, 2016, at 2:10 AM, Anuj Mittal <anujx.mittal@intel.com> =
wrote:
>>>=20
>>> We're setting the native header paths in do_configure_prepend,
>>> and don't need to set them again here.
>>>=20
>>> This results in gcc-target not being able to locate the headers
>>> and not being able to detect glibc version, which in turn
>>> results in SSP support not getting detected even though it's =
available
>>> in libc.
>>>=20
>>=20
>> what is this being set to in do_conigure_prepend ?
>> that value may not be right for target recipe. For target we are =
setting sysroot to /
>> and if we do not have this option set then it will set =
native-system-headers dir to
>> be
>> / relative and not cross sysroot relative. So it will use your build =
hosts installation
>> for these headers which is not correct either. Have you looked deeper =
into why its
>> not
>> finding ssp support inside the cross sysroot?
>=20
> It's being set to /usr/include:
>=20
> 	# teach gcc to find correct target includedir when checking libc =
ssp support
> 	mkdir -p ${B}/gcc
> 	echo "NATIVE_SYSTEM_HEADER_DIR =3D ${SYSTEMHEADERS}" > =
${B}/gcc/t-oe
> 	cat ${S}/gcc/defaults.h | grep -v "\#endif.*GCC_DEFAULTS_H" > =
${B}/gcc/defaults.h.new
> 	cat >>${B}/gcc/defaults.h.new <<_EOF
> #define NATIVE_SYSTEM_HEADER_DIR "${SYSTEMHEADERS}"
> #define STANDARD_STARTFILE_PREFIX_1 "${SYSTEMLIBS}"
> #define STANDARD_STARTFILE_PREFIX_2 "${SYSTEMLIBS1}"
> #define SYSTEMLIBS_DIR "${SYSTEMLIBS}"
> #endif /* ! GCC_DEFAULTS_H */
> _EOF
> 	mv ${B}/gcc/defaults.h.new ${B}/gcc/defaults.h

ah yes thats the caveat which invalidates the definition of this =
configure option for OE. In this case the patch
is ok. Although, I would like to know what would be downside of not =
forcing NATIVE_SYSTEM_HEADER_DIR via t-oe

>=20
> Having set NATIVE_SYSTEM_HEADER_DIR again in gcc-target just results =
in gcc not being able to find features.h at all, which is present in the =
target sysroot.
>=20
> Because it's not able to find features.h, it just assumes that glibc =
version available is 0 and hence disables ssp support. Setting =
NATIVE_SYSTEM_HEADER_DIR to /usr/include just makes sure that =
target_system_dir in configure script is set to right header path within =
target sysroot & it can pick up the right header relative to the =
sysroot.
>=20
> When configure option is passed, gcc detects target_system_dir (where =
features.h is present) to be <build_sysroot>/<build_sysroot>/usr/include =
instead of <build_sysroot>/usr/include.
>=20
> I've made sure that its picking up the header from target sysroot =
rather than my host. My host machine has glibc 2.19 whereas the target =
sysroot has 2.22
>=20
> Thanks,
> Anuj


--Apple-Mail=_C46DD7E9-3724-4AC2-ABEE-ACD4CC73203B
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAldiuO4ACgkQuwUzVZGdMxQMZgCeOdp9TN7L1B3L7u11dFcHfUtp
J9sAn3PAbSl7LR1Au0rSBeWg3audryxI
=5ywS
-----END PGP SIGNATURE-----

--Apple-Mail=_C46DD7E9-3724-4AC2-ABEE-ACD4CC73203B--
