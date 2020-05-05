Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com [209.85.128.66])
 by mx.groups.io with SMTP id smtpd.web11.7923.1588686189027279850
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 May 2020 06:43:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=aXGiDA8h;
 spf=pass (domain: gmail.com, ip: 209.85.128.66, mailfrom: rehsack@gmail.com)
Received: by mail-wm1-f66.google.com with SMTP id v4so2530132wme.1
        for <openembedded-core@lists.openembedded.org>; Tue, 05 May 2020 06:43:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:message-id:mime-version:subject:date:in-reply-to:cc:to
         :references;
        bh=v/X6hi5HdUynyzpTHwCa/koIEShjYMn+zxY7sRR2H00=;
        b=aXGiDA8h4OmNNXSq0EGkYetoZfiwNyfob8gabg8fzWhbw8u2PdZgeaxxzsALd2boh/
         WO8uUedy29LZXTjUrLp+IP1npD4yB/k4oOI9NqIc7Vxmydm00VzoQTP0NctV6TaIVryN
         omL0Xw0c3ai2P9y6jNlwVZhACQeWqW4Oy7vphyfRiD14ApPmb5znUViAuP9sOlrOc4m+
         ghKDCF6VCf3lBQmHa+9DZ0qJLKNqLVlXkAe2vqj8VEuU8yS9BldvYjchjf52idgYgAYe
         5nZGvA66YVXXAecPxRtFdaL9A7jc4CAB1Ub7xCKOyFiSd7AKip1aRlLC9o7x3rPSaZRh
         xwqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:message-id:mime-version:subject:date
         :in-reply-to:cc:to:references;
        bh=v/X6hi5HdUynyzpTHwCa/koIEShjYMn+zxY7sRR2H00=;
        b=o7JPs0F8JXTc1SHi/Hj3AWmOR5cjmJv3cBZ6KIe5QB3AxtY+Hzaf78+LB99wTzDI4e
         PMiRmMBqHhnOmQqtz/gJAa1KxMe0AA7XWSqlLej0jxDKkZTfCBOT1lfYzhknzzNSgLuy
         XmjTBIHkq62Zal1zlUGVxoX8nLG3nx6/O+yGykzE5p3fhRDS/nUSAvJ+SVJnNgczGVYK
         imbecryZfoOdF1gAZMkx0MlAdG8Wqn/xDbN/yP3t6buYRGMMQjBXlGRGXh8vgL6gg3kQ
         FIb1qY7c065fIiAgi+55IbFmXO8RuO3Kxkn1ZYpw9mmWD3jf+DjFjWc0I7HL2UrJ/PNV
         JP5g==
X-Gm-Message-State: AGi0PuZFggDUK497efOG3k5cP09Y9afwvFCvVQHzVWU+/KAzd7+zzXXk
	cTIsGB6596DJWlU46j3urDY=
X-Google-Smtp-Source: APiQypJzcHMxDWkwe8pnc6XRHSDbckfeqgohDZPFQM9y4lPH7l4997vNmFGjyIuLBj2Ow8obfWnjkQ==
X-Received: by 2002:a05:600c:214b:: with SMTP id v11mr3819923wml.151.1588686187409;
        Tue, 05 May 2020 06:43:07 -0700 (PDT)
Return-Path: <rehsack@gmail.com>
Received: from [10.42.8.217] (p4FE931FC.dip0.t-ipconnect.de. [79.233.49.252])
        by smtp.gmail.com with ESMTPSA id n18sm3265563wrw.90.2020.05.05.06.43.05
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 05 May 2020 06:43:06 -0700 (PDT)
Sender: Jens Rehsack <rehsack@gmail.com>
From: "Jens Rehsack" <rehsack@gmail.com>
Message-Id: <F3B50FBD-30B5-4A2E-8EB0-624B5BF304B6@netbsd.org>
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.80.23.2.2\))
Subject: Re: [OE-core][PATCH v3] initscripts/init-system-helpers: fix mountnfs.sh dependency
Date: Tue, 5 May 2020 15:43:05 +0200
In-Reply-To: <CAP9ODKqjipD3ogk7SadJP9n=sJcwE3vPZKQuqqx9AE9ktnKhPQ@mail.gmail.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>,
 Anuj Mittal <anuj.mittal@intel.com>,
 Khem Raj <raj.khem@gmail.com>
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
References: <20200504141004.9988-1-sno@netbsd.org>
 <CAP9ODKqjipD3ogk7SadJP9n=sJcwE3vPZKQuqqx9AE9ktnKhPQ@mail.gmail.com>
X-Mailer: Apple Mail (2.3608.80.23.2.2)
X-Groupsio-MsgNum: 137942
Content-Type: multipart/signed;
	boundary="Apple-Mail=_F1B32166-96D0-4E2F-8963-36BE45E2721C";
	protocol="application/pgp-signature";
	micalg=pgp-sha512

--Apple-Mail=_F1B32166-96D0-4E2F-8963-36BE45E2721C
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii



> Am 04.05.2020 um 16:21 schrieb Otavio Salvador =
<otavio.salvador@ossystems.com.br>:
>=20
> On Mon, May 4, 2020 at 11:10 AM Jens Rehsack <rehsack@gmail.com> =
wrote:
>>=20
>> With commit c9fc9110be33fe0f24bc3a7c242b584a4ca33e04
>>    Author: Yue Tao <Yue.Tao@windriver.com>
>>    Date:   Fri May 25 10:48:08 2018 +0800
>>=20
>>        initscripts: Avoid starting rpcbind daemon twice
>>=20
>>        Check the status before start it to avoid duplicates.
>>=20
>> the use of a script {/usr/sbin/}service is introduced - maybe earlier
>> provided by systemd, nowadays mostly by init-system-helpers from
>> debian project.
>>=20
>> For the very first shot, maybe discussions and improvements based
>> on that script collection, use just the init-system-helpers-service
>> in initscripts/mountnfs.sh to avoid problems mounting NFS in later
>> boot stage.
>>=20
>> Signed-off-by: Jens Rehsack <sno@netbsd.org>
> ...
>> +RDEPENDS_${PN}-update-rc.d =3D "perl"
>=20
> Can't it be replaced? using perl here is not nice.

Be careful :P

Seriously - it uses perl only for it's update-rc.d (which I didn't =
ripped off
to give community a chance to discuss it). Generally - especially with =
the
runit, s6, openrc ... in mind - we have to grow from there anyway and I =
like
our current update-rc.d implementation anyway.

But I would like then to have a 2nd commit (for documentation purposes) =
to
kill it or we just provide it and let people choose to use this one over
meta/recipes-core/update-rc.d

Cheers
--
Jens Rehsack - rehsack@gmail.com


--Apple-Mail=_F1B32166-96D0-4E2F-8963-36BE45E2721C
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEGutaqWUYV+tvC/mCRJmWrtzlCp0FAl6xbWkACgkQRJmWrtzl
Cp14GQ/+NeTmPPXel1Jwe7IV1Z9s+XxWFshRBdGvGO0iBYABnqt+jCF6hrenykAC
m/sG73kVWdmZiL1DHv27qUbAyKcpkPADkzpPu5EeoSE6ea70Kjdl1KTjxlQaTBEl
nyFjPAtK/jE6Hmugl5WKKDial+M7Aj7dQfIldxnjjAP13Q1kiGZeHRhiRwKqS0fu
n6DEMMT8skItdxoL1oIffH6nnMSu7yFjAegFYzT3nEa/MJrmQPU+o7y4ZA9+LKB8
opJuBsMekAwO/ff+URTsGiFFV1H8D2wDLRImclgA9i6vt1fLVV+DUgmrilamefYe
jAGfhqrhOfi0c/36jaF8QM6E1cLMNgUZngnIdJxHjBY4pKPltX+1n/MubliLN8BE
UGlt/JjR7+lZDMaOOCx7k2W9RTF6nuuaDXo6DMUGRBV/Cl3WbLSC5s5f4WfkvTW/
qZtmwe4lN5q4Cewry2Jee2QJEx9QxpOTBUn6xg/TLo1XiJxrFAMW+aAGJRT2/auR
A1UPY3vRgfkd94wU2qgzVAOJsix7LyVjRxlHg0FbmELOyMQDTQllke7Y7j+4b0/k
6AXeUXZ/Lx5424OnPMab9sB38NjZN9CXcIL6biCveBGZ56q8NEtC3rgx7zv6JEuC
uFT6dicRVbTpUMz/W8myCaeptJ6+px72kqZUoOnV/X0CeZigFds=
=dCq4
-----END PGP SIGNATURE-----

--Apple-Mail=_F1B32166-96D0-4E2F-8963-36BE45E2721C--
