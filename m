Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wi0-f176.google.com (mail-wi0-f176.google.com
	[209.85.212.176])
	by mail.openembedded.org (Postfix) with ESMTP id 5F8AB60557
	for <openembedded-core@lists.openembedded.org>;
	Sat,  8 Nov 2014 18:55:45 +0000 (UTC)
Received: by mail-wi0-f176.google.com with SMTP id h11so7264491wiw.3
	for <openembedded-core@lists.openembedded.org>;
	Sat, 08 Nov 2014 10:55:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:content-type:mime-version:subject:from
	:in-reply-to:date:cc:content-transfer-encoding:message-id:references
	:to; bh=4OD1tpkmyfLV7majfYfJM6op9E+6UqWWNJpFGh6/8MY=;
	b=AQStBfVAKVUNVZ3pTnMx5kQcac3rRvO9XBTSnaZ1fWYteZYt7Lzif3lgY4N0T67czQ
	GoJInLeH2tAKbPYvtLhGBz3P5WRgzvVglM202auMK5Ou+KJpYWP1c+XVQnuH6KOhOcpF
	JNkPxsFudK4SMx5G6SvRn958iZ97mc7v5NnwsUZhvNtjnNrkvliTRD2S2S4xlrPHX4o3
	FzAvv1WF7uiLQvF7i6PBEPaWum4hteyNPhSoiKG03TSrTtwjSErDmiW4FP1yxJ55TmSx
	43nGv7R+CVfLYZMNpjadoiAbZqVNsV8PKRT6wQjhBl5/DPzQiJ508MF1dQTaRaOcOwD/
	HM/g==
X-Gm-Message-State: ALoCoQmrqzZdVwOt/PKo7KqwqGUoDN1FaYzC+zxfASciDHOwGTEzyVXa5f+cAag6IoioqQYAJlyy
X-Received: by 10.180.9.106 with SMTP id y10mr15991832wia.30.1415472946187;
	Sat, 08 Nov 2014 10:55:46 -0800 (PST)
Received: from ?IPv6:2001:610:612::8d0e:2098:2373:fc5e?
	([2001:610:612:0:8d0e:2098:2373:fc5e])
	by mx.google.com with ESMTPSA id
	da3sm16400403wjb.12.2014.11.08.10.55.44 for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sat, 08 Nov 2014 10:55:45 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 8.0 \(1990.1\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <20141107121040.3488494c@tyr.amer.corp.natinst.com>
Date: Sat, 8 Nov 2014 19:55:43 +0100
Message-Id: <C5FE670A-7A85-44C1-8658-243252007B9A@dominion.thruhere.net>
References: <20141107121040.3488494c@tyr.amer.corp.natinst.com>
To: Joshua Hernstrom <joshua.hernstrom@ni.com>
X-Mailer: Apple Mail (2.1990.1)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] gptfdisk: add 0.8.10+git version
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
X-List-Received-Date: Sat, 08 Nov 2014 18:55:55 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


> Op 7 nov. 2014, om 19:10 heeft Joshua Hernstrom =
<joshua.hernstrom@ni.com> het volgende geschreven:
>=20
> Hi Koen,
>=20
>> Besides from being useful as fdisk replacement this gives us 'sgdisk'
>> which can be used to set the GUID for partitions, e.g.
>>=20
>> 	sgdisk -t 1:C12A7328-F81F-11D2-BA4B-00A0C93EC93B /dev/mmcblk0p1
>>=20
>> To mark it as ESP in scripts like mkefidisk.sh.
>>=20
>> Signed-off-by: Koen Kooi <koen@...>
>> ---
>> meta/recipes-devtools/fdisk/gptfdisk_git.bb | 22 =
++++++++++++++++++++++
>> 1 file changed, 22 insertions(+)
>> create mode 100644 meta/recipes-devtools/fdisk/gptfdisk_git.bb
>>=20
>> diff --git a/meta/recipes-devtools/fdisk/gptfdisk_git.bb
>> b/meta/recipes-devtools/fdisk/gptfdisk_git.bb new file mode 100644
>> index 0000000..62c32c3
>> --- /dev/null
>> +++ b/meta/recipes-devtools/fdisk/gptfdisk_git.bb
>> <at>  <at>  -0,0 +1,22  <at>  <at>=20
>> ...
>> +S =3D "${WORKDIR}/git"
>> +
>> +do_install() {
>> +    install -d ${D}${bindir}
>> +    install -m 0755 cgdisk ${D}${bindir}
>> +    install -m 0755 gdisk ${D}${bindir}
>> +    install -m 0755 sgdisk ${D}${bindir}
>> +    install -m 0755 fixparts ${D}${bindir}
>=20
> Have you considered splitting this package into separate sub-packages? =
The util-linux recipe does something similar for the fdisk family of =
utilities.

I can if you'd like that, the utils were few and small, so I put them =
all in ${PN}, let me know if you still want them seperate.

regards,

Koen

> I had a not-yet-submitted recipe along the same line as yours - the =
relevant snippets follow for reference:
>=20
> <snip>
> PACKAGES =3D+ "${PN}-gdisk ${PN}-cgdisk ${PN}-sgdisk ${PN}-fixparts"
> FILES_${PN}-gdisk =3D "${sbindir}/gdisk"
> FILES_${PN}-cgdisk =3D "${sbindir}/cgdisk"
> FILES_${PN}-sgdisk =3D "${sbindir}/sgdisk"
> FILES_${PN}-fixparts =3D "${sbindir}/fixparts"
>=20
> do_install() {
> 	install -m 0755 -d ${D}${sbindir}
> 	sbinprogs=3D"gdisk cgdisk sgdisk fixparts"
> 	for f in ${sbinprogs}; do
> 		install -m 0755 ${S}/${f} ${D}${sbindir}
> 	done
> }
> </snip>
>=20
> Cheers,
> Josh
> --
> Joshua Hernstrom
> National Instruments
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>=20


