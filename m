Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f171.google.com (mail-pf0-f171.google.com
	[209.85.192.171])
	by mail.openembedded.org (Postfix) with ESMTP id 28E7A77382
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Feb 2016 20:21:06 +0000 (UTC)
Received: by mail-pf0-f171.google.com with SMTP id o185so19362153pfb.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 03 Feb 2016 12:21:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=YOTSG81+xIJ67coUAawJwWqwcMihzMm8VpxC/WPRNo8=;
	b=whVETCtDB4oV/3wUz8pfZqDih3sLdNf+PnKHr6amfP/l8QjFsOrfWESmkScB/MGbea
	MAovBpIHE3aHFAUNBijHsLF7SdGwaRzOB7BNGdDbeQPpJRCSyVK27iBEiJKlNWhwbopu
	QVPMUqhKQbkoJiqtrfU7k+q3bvjvIPKf9+RC9YHyyVNJKo1WTFIq6eqHp5dXS5wd4fuD
	DO/psz48eYhO1lmsasPn6mm/Z/N6MaYFwkIRx503Ux7FYFm6h3Vz73R2++OzQZ1S/gEL
	/ixSNX4hpJ8CzYpw6K2aBs+MmHwsF2hPVOCuxeaa5JFlPbkJHAlrhzGtnVB4stQlDEYW
	uOxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:mime-version:content-type:from
	:in-reply-to:date:cc:message-id:references:to;
	bh=YOTSG81+xIJ67coUAawJwWqwcMihzMm8VpxC/WPRNo8=;
	b=IJDToL/yaTacX92bN05YjE0Enuxhnsbv6tROf3YFZbzaK2My1aW9y99OhrpR65x414
	sR80x6oR2pcz0Y7FcbWr3R991/n8avwux2G3J02SqUWenOmBQzwjdKZH0i9EaZyVmyMx
	KfZQba2ifYD8+sTYnl1mKvtAl8iahCi7utPRJyvocmR01K4SZlsjdRJ/rHimV771ZFmW
	ROXhY2ziZvvtfxUpAU7vPcLtk8f1syvxOzKtIKUMym3MBbq7u8uz7FG02EkcS+LJZu//
	p98YEQN+QnvkEnXX4DU5p1tnA9esmeMkRDeKfovT0zxeZjDj0tOsJKgW8ThTdXbiLRrB
	wieQ==
X-Gm-Message-State: AG10YOQtROvgK1Ots1E5ayAttLn/MRzoEkJyGJvxOy54890zVHxbUuuCHabwYmE+tY3BXw==
X-Received: by 10.98.86.8 with SMTP id k8mr5303866pfb.28.1454530867053;
	Wed, 03 Feb 2016 12:21:07 -0800 (PST)
Received: from ?IPv6:2601:647:4c01:b37d:95b4:fa84:8c74:446f?
	([2601:647:4c01:b37d:95b4:fa84:8c74:446f])
	by smtp.gmail.com with ESMTPSA id
	l21sm11757515pfi.63.2016.02.03.12.21.06
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 03 Feb 2016 12:21:06 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 9.2 \(3112\))
X-Pgp-Agent: GPGMail 2.6b2
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1478930.Uaq5cohNMu@peggleto-mobl.ger.corp.intel.com>
Date: Wed, 3 Feb 2016 12:21:05 -0800
Message-Id: <56E071BC-9E02-44DD-8236-9697A647F8F7@gmail.com>
References: <56B25500.7030402@gmail.com>
	<34309FCD-61ED-4DC8-BD3C-219DE8924BDA@gmail.com>
	<1478930.Uaq5cohNMu@peggleto-mobl.ger.corp.intel.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
X-Mailer: Apple Mail (2.3112)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: binutils upgrade to 2.26 failure - unsupported reloc 42 against global symbol __gmon_start__
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
X-List-Received-Date: Wed, 03 Feb 2016 20:21:09 -0000
X-Groupsio-MsgNum: 77480
Content-Type: multipart/signed;
	boundary="Apple-Mail=_31D4BF77-FD0B-47D9-B3D1-35879FB75622";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_31D4BF77-FD0B-47D9-B3D1-35879FB75622
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8


> On Feb 3, 2016, at 12:09 PM, Paul Eggleton =
<paul.eggleton@linux.intel.com> wrote:
>=20
> On Wed, 03 Feb 2016 11:56:45 Khem Raj wrote:
>>> On Feb 3, 2016, at 11:29 AM, Trevor Woerner <twoerner@gmail.com> =
wrote:
>>>=20
>>> My chromium build is now failing due to:
>>>   commit 86ade2cc2553c942d9526c5323a11ae151653505
>>>=20
>>>       binutils: Upgrade to 2.26
>>> |
>>> | FAILED: x86_64-oe-linux-gcc  -m64 -march=3Dcorei7 -mtune=3Dcorei7
>>> | -mfpmath=3Dsse -msse4.2
>>> | --sysroot=3D/z/chromium-49/build/tmp-glibc/sysroots/intel-corei7-64
>>> | -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -Wl,-z,now =
-Wl,-z,relro
>>> | -Wl,-z,defs -pthread -Wl,-z,noexecstack -fPIC
>>> | =
-B/z/chromium-49/build/tmp-glibc/work/corei7-64-oe-linux/chromium/49.0.
>>> | =
2612.0-r0/chromium-49.0.2612.0/third_party/binutils/Linux_x64/Release/bi
>>> | n -Wl,--disable-new-dtags -m64 -Wl,-O1 -Wl,--as-needed =
-Wl,--gc-sections
>>> | -o chrome_sandbox -Wl,--start-group
>>> | obj/sandbox/linux/suid/chrome_sandbox.process_util_linux.o
>>> | obj/sandbox/linux/suid/chrome_sandbox.sandbox.o -Wl,--end-group
>>> | =
/z/chromium-49/build/tmp-glibc/work/corei7-64-oe-linux/chromium/49.0.26
>>> | =
12.0-r0/chromium-49.0.2612.0/third_party/binutils/Linux_x64/Release/bin/
>>> | ld: error:
>>> | =
/z/chromium-49/build/tmp-glibc/sysroots/intel-corei7-64/usr/lib/../lib/
>>> | crti.o: unsupported reloc 42 against global symbol __gmon_start__
>>> | ../sysdeps/x86_64/crti.S:66: error: unsupported reloc 42
>>>=20
>>> Any suggestions on how to approach this?
>>=20
>> do a clean build. Its mixing objects
>=20
> Should we have bumped PR somewhere to avoid this?

Don=E2=80=99t think so. this could happen due to new relocs appearing in =
glibc due to the fact
thats its now compiled with newer binutils but we are still using old =
linker
to link the app which does not understand these relocations. Why would =
that happen
don=E2=80=99t know.

>=20
> Cheers,
> Paul
>=20
> --
>=20
> Paul Eggleton
> Intel Open Source Technology Centre


--Apple-Mail=_31D4BF77-FD0B-47D9-B3D1-35879FB75622
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlayYTYACgkQuwUzVZGdMxRpwgCfevYnckKmKCmELw3K4hrePhsh
5L8AniiqeRT4e9JcDTfY00sP7WZRLe5i
=Z2XP
-----END PGP SIGNATURE-----

--Apple-Mail=_31D4BF77-FD0B-47D9-B3D1-35879FB75622--
