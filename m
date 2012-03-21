Received: from mail-wi0-f177.google.com ([209.85.212.177])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1SAJCJ-0000EK-6I
	for openembedded-core@lists.openembedded.org;
	Wed, 21 Mar 2012 11:55:19 +0100
Received: by wibhj13 with SMTP id hj13so1131196wib.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Mar 2012 03:46:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=+UWGnNXNctjihkbG7vgwMYKVHIFoP7/4H8wQTCCcHzM=;
	b=ZQLvKx0xs7bEtAF7lezhMO1AdBs5LzpRrcc63ynZ/ONjoIhvSVzJrco1Ucr0Egc088
	23nZp5XCP+dfZaYCXEaNs6fi73pKBwRVuxDl/UKcw0QeV0cg+bQ9TV87/Oe68IphkPz1
	qXsj+MTdqV/NWTpI9Yrwy4hqMBFpbJbZhyyt8RSLlRxk+tGo0af76uvkO9KzKIqCSMVx
	7GBlCix9Q2o8AgkgM6n/Y6Uk+1TNpj0Wp80Op3n93cdLS1jsTC+auBX2riHQAov96OS1
	rL+7qwMyXyVBl1oK42CZYAkbZzidxPsiaFLJVg1ynu69l/vcFkZ/R+Kl3ZFAqLyI5dzo
	uGuA==
Received: by 10.180.78.225 with SMTP id e1mr7929524wix.0.1332326785801;
	Wed, 21 Mar 2012 03:46:25 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id fl2sm6004711wib.4.2012.03.21.03.46.24
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 21 Mar 2012 03:46:25 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1257)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <alpine.DEB.2.02.1203210625530.16813@oneiric>
Date: Wed, 21 Mar 2012 11:46:23 +0100
Message-Id: <101A2F63-917B-40EA-809F-E42FF0C1DE14@dominion.thruhere.net>
References: <alpine.DEB.2.02.1203210615100.21394@oneiric>
	<alpine.DEB.2.02.1203210625530.16813@oneiric>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1257)
X-Gm-Message-State: ALoCoQmamHAloa8XkNpAWnnp6rHfVkVPlnkJnHnOQNV7pH+o/YYL4RQRv7GrB2lzbAN3HxfbRwHM
Subject: Re: what is meaning of "SRC_URI_append_whatever +=" ??
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 21 Mar 2012 10:55:19 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 21 mrt. 2012, om 11:28 heeft Robert P. J. Day het volgende =
geschreven:

> On Wed, 21 Mar 2012, Robert P. J. Day wrote:
>=20
>>=20
>>  still perusing the very basics of oe-core and grepping madly, came
>> across the following oddity:
>>=20
>> $ grep -r SRC_URI_append *
>> ... snip ...
>> bitbake/doc/manual/usermanual.xml:SRC_URI_append_1.0.7+ =3D =
"file://some_patch_which_the_new_versions_need.patch;patch=3D1"</screen></=
para>
>> meta/recipes-support/gmp/gmp_5.0.4.bb:SRC_URI_append +=3D =
"file://use-includedir.patch \
>> meta/recipes-support/libcroco/libcroco_0.6.3.bb:SRC_URI_append =3D " =
file://croco.patch;apply=3Dyes "
>> ... snip ...
>>=20
>>  AIUI, there are two (common) variations for extending SRC_URI.  the
>> straightforward unconditional way:
>>=20
>>  SRC_URI +=3D ... blah blah ...
>>=20
>> or if you need to make it conditional, then there's
>>=20
>>  SRC_URI_append_thingy =3D "whatever"
>>=20
>> so what's with the latter two entries above?
>>=20
>> meta/recipes-support/gmp/gmp_5.0.4.bb:SRC_URI_append +=3D =
"file://use-includedir.patch \
>> meta/recipes-support/libcroco/libcroco_0.6.3.bb:SRC_URI_append =3D " =
file://croco.patch;apply=3Dyes "
>>=20
>>  is there some subtlety i'm missing here?  why would one ever use
>> either of:
>>=20
>>  SRC_URI_append +=3D "..."               (looks redundant)
>>  SRC_URI_append =3D "..."                (why not just SRC_URI +=3D?)
>>=20
>> can i just assume those are typoes?
>=20
>  following up on my own post, i decided to scan the entire oe-core
> tree:
>=20
> $ grep -r "_append +=3D" *
> meta/recipes-support/gmp/gmp_5.0.4.bb:SRC_URI_append +=3D =
"file://use-includedir.patch \
> meta/recipes-core/eglibc/eglibc-package.inc:FILES_${PN}-dev_append +=3D =
"${bindir}/rpcgen ${libdir}/*_nonshared.a \
> =
meta/recipes-core/eglibc/eglibc-package.inc:FILES_${PN}-staticdev_append =
+=3D "${libdir}/*.a ${base_libdir}/*.a"
> meta/recipes-graphics/xorg-lib/libxp_1.0.1.bb:CFLAGS_append +=3D " -I =
${S}/include/X11/XprintUtil -I ${S}/include/X11/extensions"
> $
>=20
>  and i thought i'd look for another pattern as well:
>=20
> $ grep -r "_append_.*+=3D" *
> meta/recipes-graphics/tslib/tslib_1.0.bb:SRC_URI_append_qemumips +=3D =
" file://32bitBE-support.patch"
> meta/recipes-graphics/tslib/tslib_1.0.bb:SRC_URI_append_qemuppc +=3D " =
file://32bitBE-support.patch"
> meta/recipes-sato/leafpad/leafpad_0.8.18.1.bb:SRC_URI_append_poky +=3D =
" file://owl-menu.patch;apply=3Dyes "
> $
>=20
>  of course, if all of the above is perfectly valid, i'm going to be
> embarrassed.


AFAICT '_append +=3D' is completely bogus.

regards,

Koen=


