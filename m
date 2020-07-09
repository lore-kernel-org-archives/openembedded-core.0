Received: from mail-ed1-f66.google.com (mail-ed1-f66.google.com [209.85.208.66])
 by mx.groups.io with SMTP id smtpd.web11.1636.1594278865918100213
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Jul 2020 00:14:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ZDvTnHqU;
 spf=pass (domain: gmail.com, ip: 209.85.208.66, mailfrom: rehsack@gmail.com)
Received: by mail-ed1-f66.google.com with SMTP id b15so980526edy.7
        for <openembedded-core@lists.openembedded.org>; Thu, 09 Jul 2020 00:14:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:message-id:mime-version:subject:date:in-reply-to:cc:to
         :references;
        bh=jHHg/I9GeubVoljN36autc4L+8AIK4MzsTvSbirIZPA=;
        b=ZDvTnHqUPFW+PHLeHIeF6K+nXyQwhvDsgdwUOfN6zlUdk7Pt/6jS4l2yLcRG+UDSTU
         4ku+ZjEvp4WXgH/lA9GvqGnA/j4hHF2vAGeR9HImqud9007f/QRpIzC9zybU8Yl+fBMU
         Goc30WaPD4bVXgeBCyP/7alX7OAi0jv//H2IBeKvcXHDqMltbiT2XslW39yRh+Tr2xyd
         Yq3jGN81uoQS6CmNGH64PLKowYrl1dEcP09Bm89UCu29+hgGg/p4B/P4vMFT2sWnigb8
         VCLfzAb8cQgZO7YJGlgy65wFAPed4B3eN5YNXWfRdZdJ7X/8ENETsFUAsISRUU8aUJuM
         qCSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:message-id:mime-version:subject:date
         :in-reply-to:cc:to:references;
        bh=jHHg/I9GeubVoljN36autc4L+8AIK4MzsTvSbirIZPA=;
        b=DFJJn2LdotuuRPXRRGm6M50Z4TKeeoR2c0kEI8S70KEIUftYXVmNau+jXXHJ+V0pjU
         InEDuK2s1QPTGC71/5EFhcuUW83yDhHQrkjDMczEsG4uPz+1nMrMRH9ZLvN+eBZob0EV
         wM0cQPpUpQH5LptJXIHD36H4vW4XJp+MZyujXFg2WTPsRM6+JLDf2OCYO1xnRR+bPnVt
         N+mafeOY3MYVRaOkaSTK+C/NqBnTeF3ydwMILe+EZJixSDx+OugruHn+gZ6K0G6hqpMy
         xvjyDFCcSqFRCdLz45UahsWjfONYeKaL10JKz8ya200zx6C1//ugYWlPRl01O8buQ0/l
         c3bg==
X-Gm-Message-State: AOAM530BYPgJJztdFAAzr6VnHnvSv66FusYZG1a1nrWTd33TsmN09jdx
	e+vcl4NM9SeG37pwazC97Uo=
X-Google-Smtp-Source: ABdhPJzjlFmcZfdCM/qoB8z0gtE7GNTwJXozhIdv3T3yepqsEnB+OEFAMUvEFwduJicJ8sfnBygFag==
X-Received: by 2002:a05:6402:ca3:: with SMTP id cn3mr73172770edb.64.1594278864435;
        Thu, 09 Jul 2020 00:14:24 -0700 (PDT)
Return-Path: <rehsack@gmail.com>
Received: from [10.42.8.217] (p4fe931fc.dip0.t-ipconnect.de. [79.233.49.252])
        by smtp.gmail.com with ESMTPSA id v5sm1218235eje.88.2020.07.09.00.14.23
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 09 Jul 2020 00:14:23 -0700 (PDT)
From: "Jens Rehsack" <rehsack@gmail.com>
Message-Id: <F2463CC0-D95F-4D7C-AA44-D19FFBC3C382@gmail.com>
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.80.23.2.2\))
Subject: Re: [OE-core] [PATCH 1/2] rootfs-post: remove traling blanks from tasks
Date: Thu, 9 Jul 2020 09:14:20 +0200
In-Reply-To: <78623d14-1e14-0109-742b-1ba9366f6d85@gmail.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
To: Jacob Kroon <jacob.kroon@gmail.com>,
 Konrad Weihmann <kweihmann@outlook.com>
References: <AM7PR05MB68810192ED5AB6DB0BDFF67DA8670@AM7PR05MB6881.eurprd05.prod.outlook.com>
 <B35F64C3-D38E-4612-B68B-A359F79AE892@gmail.com>
 <78623d14-1e14-0109-742b-1ba9366f6d85@gmail.com>
X-Mailer: Apple Mail (2.3608.80.23.2.2)
X-Groupsio-MsgNum: 140466
Content-Type: multipart/signed;
	boundary="Apple-Mail=_ECE3355A-2128-46E7-9DD9-D9FBC01D144D";
	protocol="application/pgp-signature";
	micalg=pgp-sha512

--Apple-Mail=_ECE3355A-2128-46E7-9DD9-D9FBC01D144D
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii



> Am 09.07.2020 um 07:37 schrieb Jacob Kroon <jacob.kroon@gmail.com>:
>=20
> On 7/9/20 7:30 AM, Jens Rehsack wrote:
>>> Am 08.07.2020 um 13:09 schrieb Konrad Weihmann =
<kweihmann@outlook.com>:
>>>=20
>>> remove the traling blanks before the ;-delimiter, so one could use
>>                ^
>>                here & subject: do you mean "trailing"?
>>> "_remove" to avoid running tasks like 'rootfs_update_timestamp',
>>> which are currently hardcoded and not bound to any
>>> configurable feature flag
>>>=20
>>> Signed-off-by: Konrad Weihmann <kweihmann@outlook.com>
>>> ---
>>> meta/classes/rootfs-postcommands.bbclass | 6 +++---
>>> meta/classes/rootfsdebugfiles.bbclass    | 2 +-
>>> 2 files changed, 4 insertions(+), 4 deletions(-)
>>>=20
>>> diff --git a/meta/classes/rootfs-postcommands.bbclass =
b/meta/classes/rootfs-postcommands.bbclass
>>> index c43b9a9823..984730ebe8 100644
>>> --- a/meta/classes/rootfs-postcommands.bbclass
>>> +++ b/meta/classes/rootfs-postcommands.bbclass
>>> @@ -1,6 +1,6 @@
>>>=20
>>> # Zap the root password if debug-tweaks feature is not enabled
>>> -ROOTFS_POSTPROCESS_COMMAND +=3D =
'${@bb.utils.contains_any("IMAGE_FEATURES", [ 'debug-tweaks', =
'empty-root-password' ], "", "zap_empty_root_password ; ",d)}'
>>> +ROOTFS_POSTPROCESS_COMMAND +=3D =
'${@bb.utils.contains_any("IMAGE_FEATURES", [ 'debug-tweaks', =
'empty-root-password' ], "", "zap_empty_root_password; ",d)}'
>>>=20
>>> # Allow dropbear/openssh to accept logins from accounts with an =
empty password string if debug-tweaks or allow-empty-password is enabled
>>> ROOTFS_POSTPROCESS_COMMAND +=3D =
'${@bb.utils.contains_any("IMAGE_FEATURES", [ 'debug-tweaks', =
'allow-empty-password' ], "ssh_allow_empty_password; ", "",d)}'
>>> @@ -12,7 +12,7 @@ ROOTFS_POSTPROCESS_COMMAND +=3D =
'${@bb.utils.contains_any("IMAGE_FEATURES", [ 'deb
>>> ROOTFS_POSTPROCESS_COMMAND +=3D =
'${@bb.utils.contains_any("IMAGE_FEATURES", [ 'debug-tweaks', =
'post-install-logging' ], "postinst_enable_logging; ", "",d)}'
>>>=20
>>> # Create /etc/timestamp during image construction to give a =
reasonably sane default time setting
>>> -ROOTFS_POSTPROCESS_COMMAND +=3D "rootfs_update_timestamp ; "
>>> +ROOTFS_POSTPROCESS_COMMAND +=3D "rootfs_update_timestamp; "
>> How about
>> +ROOTFS_POSTPROCESS_COMMAND +=3D " rootfs_update_timestamp;"
>> Reading a list is much easier when words are separated by =
whitespaces.
>=20
> The +=3D and =3D+ operators already insert a space between the =
concatenations.
>=20
> =
https://www.yoctoproject.org/docs/latest/bitbake-user-manual/bitbake-user-=
manual.html#appending-and-prepending
>=20
> Jacob

I always become confused since often I have to use _append etc. (to =
avoid hitting ?=3D) - thanks for pointing that out.

Cheers
--
Jens Rehsack - rehsack@gmail.com


--Apple-Mail=_ECE3355A-2128-46E7-9DD9-D9FBC01D144D
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEGutaqWUYV+tvC/mCRJmWrtzlCp0FAl8Gw8wACgkQRJmWrtzl
Cp3nhA//Wa5wXRVgR57z1Wltpp9AhA1gtdoLz3kNFeBVJIJ53eDz5s5kMKtYv/ON
TaGXPKxY2bWwOuUZRW7T6vmlv5hoxFBEUPN3U4nNcn1WLzYX0seG4K0wMiVIF4Yc
KUYYLnb0WOYs4jD6/Z0BMzhj61eZLZRz9OgSTj//VWKbx4cP/3p+bhpvqEHSJPrB
aGO1MfgSxjB1aamCCrcgojS1d6CLQeGKdMyEx3E2JxxK+JtZZT/JW9fs7Sx/IlMf
t2r1ngRYsQlqX/YORr/ndHi2Ox3n4V1gvSQ2xVoELHvuysr3CKq6aJHzoCIzqZeH
GeA4KxnxK3oD1TkoSuC/4JjNM4v+aW+EJVPDA54cz+a2zsH1dbG063u79icZq6gV
Y476weIwRGTnr+BGsyf0zta5rgZnQG9QKTkOSv5AJyVJvjWLdiBE3nhEaGBAWtij
t0a2Qj3ziPROUMjh4x5G9QYq9EJ8L7n5EqgMflkprZEaK72rtdb+Kj46tth1LiZm
AQKPDw51VOgK4G0H/6OzZU7r2FZhSkTtj6KWZS+5wfTWJ/9WSHUwNOc2P7+DiliI
tPPLUCqnFD7CUSLALw7vERUPtDLFnPEFPtVf+fFS7Jtl/gFA11FkSSs73zipfQef
25osRZXwJ+tB4fEHXDNEd341U6kwS2FDh8BDlQ50oOWqWCNczYQ=
=C2+H
-----END PGP SIGNATURE-----

--Apple-Mail=_ECE3355A-2128-46E7-9DD9-D9FBC01D144D--
