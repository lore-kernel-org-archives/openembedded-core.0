Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web11.4834.1588855094964678752
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 May 2020 05:38:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=KxCNPQbi;
 spf=pass (domain: gmail.com, ip: 209.85.221.43, mailfrom: rehsack@gmail.com)
Received: by mail-wr1-f43.google.com with SMTP id z8so6216473wrw.3;
        Thu, 07 May 2020 05:38:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:message-id:mime-version:subject:date:in-reply-to:cc:to
         :references;
        bh=vN6xVRJsKghzNOV8Bz5zXPZpoGxR/OnyW7dP287XpuY=;
        b=KxCNPQbiodbXRMdpM3UPhPJkOf/ZilxWH0ZoKBfmos2mwR+WB+fBD2FY8kQ3k0MsVf
         iJ3mdCZX8KDJB1joi/fdVtK68QZDHBhW0jvnJ0CwXM31tPVuCLHm3auFPosG0rvy4W+z
         3rMxomtBlepNT2gK/70qC5m4/KjsFUuiZJ3fy3IgtaCqOd5A2CDx1HoK/QpqJffQCbj5
         Is4eDyBOT41a0wPElwEIDBVAiKSU+VKsdcp4BSPO0wvjUVUVnJIcGCYjzQqaE2GJ9/IS
         k9+AnPgHF/Qidg9v2626iWWxujFi4j8RrWeS5Y5/Nxl4Eee/bqq0uameguY5JmiK3olR
         EI0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:message-id:mime-version:subject:date
         :in-reply-to:cc:to:references;
        bh=vN6xVRJsKghzNOV8Bz5zXPZpoGxR/OnyW7dP287XpuY=;
        b=Ib/szvTKEAjvADMAsprLRGQihu09qePo6h03Dq139rCyxIvKAp2LCaFr16GtA79XbU
         rEHyCanqiIIymdgNmmh/UDN7XnpHPXZl1eg/kd1FiSqC8HZFzmrpwMJM/gNDkokfk4F2
         Z9lxDPUgi/x5XgPWgpliU1u7auxbW9je5p1uW/I01oDlzzTP6dRYFQeDeZn2z68sGbd3
         mg6cOo3HQ5b+ClXpJBCDHZFcwyd22M8ldldAlBh84+lA58UBKEROSpYTKsIBDRC80S71
         7diUFnSq3Cag8E0eWzwstgWSNbovNqnMLvfXSdOZLGstXiwZxBOThAE4QxnPNvB176PF
         2nzA==
X-Gm-Message-State: AGi0Pua0+VtkOCt7Br0zGMCPWUgOP/Jw6rTnfJ76TER/HJH8VcYHG6p7
	NfF1wMD3NEjNvGzwtEk2oUM=
X-Google-Smtp-Source: APiQypKNhBt8gURfepDS/G6P331hMGj7tpzvpxkWR+yAD9vXg+glTn7dMfsTOkOIOJqb7ilvhcRpGQ==
X-Received: by 2002:adf:e64c:: with SMTP id b12mr5113470wrn.131.1588855093446;
        Thu, 07 May 2020 05:38:13 -0700 (PDT)
Return-Path: <rehsack@gmail.com>
Received: from [10.42.8.217] (p4FE931FC.dip0.t-ipconnect.de. [79.233.49.252])
        by smtp.gmail.com with ESMTPSA id x7sm7301289wmi.17.2020.05.07.05.38.12
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 07 May 2020 05:38:12 -0700 (PDT)
From: "Jens Rehsack" <rehsack@gmail.com>
Message-Id: <1AEA4CE9-1C08-4336-9634-B546476F92C4@gmail.com>
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.80.23.2.2\))
Subject: Re: [OE-core] [Openembedded-architecture] Proposal: community maintained recipes in oe-core
Date: Thu, 7 May 2020 14:38:11 +0200
In-Reply-To: <CANNYZj90z3JYhajCF9fEDeUXgsYJary9PKk0GbihAHp_FH3_cQ@mail.gmail.com>
Cc: openembedded-architecture <openembedded-architecture@lists.openembedded.org>,
 OE-core <openembedded-core@lists.openembedded.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>
References: <CANNYZj_R3LO5nZs77j_2HBYQx44rf=9pMz=oABvXzDAxSvzBWQ@mail.gmail.com>
 <53530eac-ce1c-db1a-f489-1d5a4a910870@gmail.com>
 <CANNYZj90z3JYhajCF9fEDeUXgsYJary9PKk0GbihAHp_FH3_cQ@mail.gmail.com>
X-Mailer: Apple Mail (2.3608.80.23.2.2)
X-Groupsio-MsgNum: 138015
Content-Type: multipart/signed;
	boundary="Apple-Mail=_0ACF78F6-AF82-4127-B7C1-C284CAF3D05E";
	protocol="application/pgp-signature";
	micalg=pgp-sha512

--Apple-Mail=_0ACF78F6-AF82-4127-B7C1-C284CAF3D05E
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii



> Am 05.05.2020 um 13:48 schrieb Alexander Kanavin =
<alex.kanavin@gmail.com>:
>=20
> On Mon, 4 May 2020 at 00:16, akuster <akuster808@gmail.com> wrote:
> the current maintenance model in openembedded-core is problematic due =
to lack of well-working process of finding maintainers, and replacing =
them when they're no longer able to contribute. This becomes especially =
frustrating when maintainers silently disappear, and perfectly fine =
patches produced by Auto Upgrade Helper and sent to them via private =
mail go wasted.
>=20
> Can you clarify what you mean by silently disappear.  By the time I =
have time to process an update, someone else has sent the patches.
>=20
> That means: a) not sending any patches, despite AUH reminders, for =
months; b) not otherwise active or visible on the lists. You wouldn't =
qualify, so no worries.

Jepp - happens often: people switch responsibilities / projects and even =
with best intensions to spend effort in spare time more and more things =
fall down.

>>=20
>> I'm proposing that some of the recipes in oe-core - those that are =
known to lack an active maintainer - would be transitioned to 'community =
maintenance'.
> Define active
>=20
> The reverse of the above: sending patches OR otherwise active on the =
lists.
>=20
>=20
> Well that is one of the problems of putting tooling into the =
community's hands. It is made it easy to send updates to the list. Is =
not uncommon to accept "Update" as the only  information, do you expect =
the submmiter to deal with stable or the Package Maintainer?
>=20
> We can certainly ask anyone who sends a patch to try and provide more =
information about the update. The reason I'm not doing it is that I have =
too many updates to handle; but someone with only a few recipes should =
be better able to find time for it.

The process should be better described and developed than "sending the =
patch again" ...

> I agree there should be a way to update maintainers e-main once we =
determine they are not longer willing to take part in that program or =
absent. I believe this an issue in general for OpenSource has had to =
address over the years.
>=20
> My plan is to experiment with this for the python3* recipes in oe-core =
for a start: they've been bouncing between various people over the past =
couple of years, but no active maintainer has emerged.

I'd like to see 'non-systemd init' in, either :)

Cheers
--
Jens Rehsack - rehsack@gmail.com


--Apple-Mail=_0ACF78F6-AF82-4127-B7C1-C284CAF3D05E
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEGutaqWUYV+tvC/mCRJmWrtzlCp0FAl60ATMACgkQRJmWrtzl
Cp2L1g/6AsEwfJfgpo/Nm2nKQXUaQh804dOExvabPeXcHK9bHgZ0r7+x/HN7HnUj
0kl8o8ieSkJ02zEtngAtiBr/IbawX/ZimrmaUASAJvVB4g8zE8tv8g0Qpup/464C
ZbkwbGkbp41RV5YdLcY7nNDZ1ASKuyuLNEoDZX1qcqamsDOmj/ILiO+EYqplova1
yjk4pcF6BtJBFg+22TC2xECAlmKSKbbdjg11cO9TVq7gZ5VD7oKv96qHUU4vwVOH
N++FJsfNk6wF5LXzeMLD41YerU58QWub0Cr+HOzb88meOEOJywHKj0ZIQtF4UTgX
0eb8nXYPguC0HH2FFVWL1WR5Dw2yFmF/F5SjZj5xCY3YWe49SQhMQlVT+5Ondzmh
gDTEGTOJkUAw5LWX/02LYgJVect+AYrWe5hRGYFmMd6p9/LiPvKPU7nXsxzKJk0R
9tEAC+j7g2QZwOmKq859ZRTgKsfjMv6PSw6dfox3DbdRpoRkvaoNKkoQH/DodQUN
xgXZzpz4cC3mZMPhibYEc9sAQeLYRJ9OKdHxJJz5ARWcBGUlqNi8zrT2cuiRh3vt
IuSwsBnOMTD5pVLpGuwGQWYbbMdu2su5rNSzcqCmvJyRAwPVbFM5+MnZW8A0JBB/
n/BaOaq2BeJWXiiSWZqDqoh3wfe2AWLizZz+fi+8xkPl9fMBv3U=
=8kQ5
-----END PGP SIGNATURE-----

--Apple-Mail=_0ACF78F6-AF82-4127-B7C1-C284CAF3D05E--
