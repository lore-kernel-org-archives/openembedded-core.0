Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com [209.85.221.66])
 by mx.groups.io with SMTP id smtpd.web10.1983.1588699260633655194
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 May 2020 10:21:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=M+eRKyqd;
 spf=pass (domain: gmail.com, ip: 209.85.221.66, mailfrom: rehsack@gmail.com)
Received: by mail-wr1-f66.google.com with SMTP id l18so3671214wrn.6
        for <openembedded-core@lists.openembedded.org>; Tue, 05 May 2020 10:21:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:message-id:mime-version:subject:date:in-reply-to:cc:to
         :references;
        bh=05AXUgG8B6yGrFrHdMUeszbrGnDtH7byi+aigpjwUfw=;
        b=M+eRKyqd2+93VRkIlMjWd/q0l0koUGCj5mZc6cNZ3NSfPd70HGX6VqDg5O9uofwqh9
         xCm3kHGyM908B4nJCDOkFsCtwlEMTYKJBOmgC5ihlpSEjdYaXTICqVYA2zKes4COi8De
         v4hhrh/7c7ayMC1nO3kjvg2Ioy0CUdMAAW4LEXbjlmx14DXc0obUbklA6Cz/cTVI9sfS
         zMSk+gLxqB3+Fi8Yq/oOE3LrMXBtryG82Ns9xgBLqjOLgSlzXwD9rC8pZKFGO05rbNG4
         BDWioOBIIjf4tabUtusfPPwKS6jQJFEGoQMHkAUhFIYducMl36g214jhc6rwaCPtVedU
         gHvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:message-id:mime-version:subject:date
         :in-reply-to:cc:to:references;
        bh=05AXUgG8B6yGrFrHdMUeszbrGnDtH7byi+aigpjwUfw=;
        b=Atr3OLJANQ1MK2DFMeCwNmuheIQys71bYMZlMRKFMUfBET6BY7hVu6NhUCAb7jnuHf
         D7QYANM+6Hmc5oJwDQ39C1aY6zmBc8fytLOFRDIDciYBNvRKI2vKqrJyXlIhHNqpvtr4
         sSE70LOj9iKroroZcW+GeQYMaTBbas/G6FLigK+RqyezisVf97xUICzyqm8LPm4n2Yu6
         9swSXKopgYF6GHSmPSS3d4MA2R7idcg0ROzbE3kenlmUDnNYRpIe6Oxc0NBdp3UnpooU
         KsPQllnIZUT7Mvx6HfGhU7co8JuUD8n8nH7CgUi6JwdVbrVDu2qi0tCsBlI4H+lh9G/Y
         NFfQ==
X-Gm-Message-State: AGi0PuaOrgSW+Q65Zfp/1ddhvsoeWKTPUXo/StkvH+c076hJTTdDeN20
	RUGBYyX9tV7Ea3A1L1gxrX4=
X-Google-Smtp-Source: APiQypKtQCEcgZPUh8HcWsWxVGoydpcMP+OAkvneOsJvqtw5hS0J0OGalB/xOLm4yYRG5S3bY/EFbQ==
X-Received: by 2002:a5d:6305:: with SMTP id i5mr5407764wru.60.1588699259153;
        Tue, 05 May 2020 10:20:59 -0700 (PDT)
Return-Path: <rehsack@gmail.com>
Received: from [10.42.8.217] (p4FE931FC.dip0.t-ipconnect.de. [79.233.49.252])
        by smtp.gmail.com with ESMTPSA id d9sm4268861wrg.60.2020.05.05.10.20.57
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 05 May 2020 10:20:58 -0700 (PDT)
From: "Jens Rehsack" <rehsack@gmail.com>
Message-Id: <0D58E413-393E-4696-903D-991F32FBFFC7@gmail.com>
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.80.23.2.2\))
Subject: Re: [OE-core][PATCH v3] initscripts/init-system-helpers: fix mountnfs.sh dependency
Date: Tue, 5 May 2020 19:20:57 +0200
In-Reply-To: <CAP9ODKqkU3YNumNOLbknsFKucMbf1Xsc=niR4MFFk1dQt23-PA@mail.gmail.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>,
 Anuj Mittal <anuj.mittal@intel.com>,
 Khem Raj <raj.khem@gmail.com>
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
References: <20200504141004.9988-1-sno@netbsd.org>
 <CAP9ODKqjipD3ogk7SadJP9n=sJcwE3vPZKQuqqx9AE9ktnKhPQ@mail.gmail.com>
 <F3B50FBD-30B5-4A2E-8EB0-624B5BF304B6@netbsd.org>
 <CAP9ODKqkU3YNumNOLbknsFKucMbf1Xsc=niR4MFFk1dQt23-PA@mail.gmail.com>
X-Mailer: Apple Mail (2.3608.80.23.2.2)
X-Groupsio-MsgNum: 137947
Content-Type: multipart/signed;
	boundary="Apple-Mail=_E21BDB3B-539D-4BE6-86DA-53E59EC9B94E";
	protocol="application/pgp-signature";
	micalg=pgp-sha512

--Apple-Mail=_E21BDB3B-539D-4BE6-86DA-53E59EC9B94E
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii



> Am 05.05.2020 um 16:56 schrieb Otavio Salvador =
<otavio.salvador@ossystems.com.br>:
>=20
> On Tue, May 5, 2020 at 10:43 AM Jens Rehsack <rehsack@gmail.com> =
wrote:
>>> Am 04.05.2020 um 16:21 schrieb Otavio Salvador =
<otavio.salvador@ossystems.com.br>:
>>>=20
>>> On Mon, May 4, 2020 at 11:10 AM Jens Rehsack <rehsack@gmail.com> =
wrote:
>>>>=20
>>>> With commit c9fc9110be33fe0f24bc3a7c242b584a4ca33e04
>>>>   Author: Yue Tao <Yue.Tao@windriver.com>
>>>>   Date:   Fri May 25 10:48:08 2018 +0800
>>>>=20
>>>>       initscripts: Avoid starting rpcbind daemon twice
>>>>=20
>>>>       Check the status before start it to avoid duplicates.
>>>>=20
>>>> the use of a script {/usr/sbin/}service is introduced - maybe =
earlier
>>>> provided by systemd, nowadays mostly by init-system-helpers from
>>>> debian project.
>>>>=20
>>>> For the very first shot, maybe discussions and improvements based
>>>> on that script collection, use just the init-system-helpers-service
>>>> in initscripts/mountnfs.sh to avoid problems mounting NFS in later
>>>> boot stage.
>>>>=20
>>>> Signed-off-by: Jens Rehsack <sno@netbsd.org>
>>> ...
>>>> +RDEPENDS_${PN}-update-rc.d =3D "perl"
>>>=20
>>> Can't it be replaced? using perl here is not nice.
>>=20
>> Be careful :P
>=20
> Everyone has the right to do bad choices in life ;-P

/me nods
But comparing to up-river alternatives, there isn't much better :)

>> Seriously - it uses perl only for it's update-rc.d (which I didn't =
ripped off
>> to give community a chance to discuss it). Generally - especially =
with the
>> runit, s6, openrc ... in mind - we have to grow from there anyway and =
I like
>> our current update-rc.d implementation anyway.
>>=20
>> But I would like then to have a 2nd commit (for documentation =
purposes) to
>> kill it or we just provide it and let people choose to use this one =
over
>> meta/recipes-core/update-rc.d
>=20
> Generally, I'd prefer to not give the option as it causes more
> troubles for supporting it in future. I am totally fine with it being
> dropped on a second commit for sure.

What do others (Richard, Anuj, Khem) say?
And - making a patch series from that or let someone else kicking it?

Cheers
--
Jens Rehsack - rehsack@gmail.com


--Apple-Mail=_E21BDB3B-539D-4BE6-86DA-53E59EC9B94E
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEGutaqWUYV+tvC/mCRJmWrtzlCp0FAl6xoHkACgkQRJmWrtzl
Cp2T5A//e4aP720aj9U5BDeGtRyrrkP48HMuXzGCnFpTA511+1UNpXwyMitUuMq0
JHWWxr3KI9G6uUvVvBu7oToerjQ2RT/it9uGo/TZK9weTgtwOEKfOz5urzouQMRU
CDqGo93ccybpKtf+s8vQPlga+EpZTxvEqp1IVujDQXXr90cpzOyzUqASH2DJdelv
rGN8rt7MSJPJdAq7/e8Z0h3AH2MfYH9NPb58N3tNYolpl24ibE7UtYG95fgY0IZQ
zo+02nCVO3oI5BXWUz1L3cvYwcCuE/6noHkZjpcdSpzSjYWThNFf+nbeK8Vx8MXw
SHtDd+4186rrgNz4QHDAenFs5/Ly3AZMwEuILimYXOsF1ai1LV2qTY1WWr52iy1/
Zx20T6hHpj7zoIIEGAL+R/y9RMJ9SLdoSbqWnp+39FTVFovEUeP0e8MPXmWpbKEw
705WlRpbPS7QNvmX4fTB3HspPSJsKQHRRGgPDU4fme9sePkdQ8g3xecSQ619ZncU
W9rAKfOkY0lfF6tlSljCky9oX3SqZ1s0L8t1XmsaYuxaF65CRgmLil5QxLtKzoEu
eqe7zrAyBpT5/oSsnqQeCtwEAnaZ5vfZgFb6cTE4OuLgblxFXWo3Om/PkDWhvoam
OUNcO1s/Ke7gmDIfywLGmTzk1+tr4swHXSUaU6piCMYDGMKECTQ=
=XaIY
-----END PGP SIGNATURE-----

--Apple-Mail=_E21BDB3B-539D-4BE6-86DA-53E59EC9B94E--
