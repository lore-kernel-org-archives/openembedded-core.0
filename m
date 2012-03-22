Received: from mail-wi0-f171.google.com ([209.85.212.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1SAdt7-0006CB-KX
	for openembedded-core@lists.openembedded.org;
	Thu, 22 Mar 2012 10:00:53 +0100
Received: by wibhj13 with SMTP id hj13so379086wib.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Mar 2012 01:51:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=HMlbdgfoWpdglCcY9crp5NeTpiY8P7eOGiXumBN3i5U=;
	b=Y4TSzv2dZDDFrPh/BQaWiKHxrPN3zZdTM2reH3yoeBmwHw/BEXKoV4uUvA5dREFW0V
	rBunqtWvrGHyGEC+llgj1F65bWt1TJ6EFfrUn2tSmMhSRIUM64UgLO+el8ZgyLl9120l
	AaQQ0LukIIhfFnGHPLwFeauXuYUnI6LM04mtwc/pX1hnKAKE2VwVyRN/6WPUMWRK4KUd
	AGLKZRJABzonHj5ylG3/1XcOOaona6MJ3QXzmZLP88PaUbto7t5s19+mC5mUUBT4vZ+T
	8YQLnGhPPUo679mHFA9GZBFe707ZugY9R2qAJDwgvpbyQtdnubG0l8RMee30e85mOPye
	H7yQ==
Received: by 10.180.80.104 with SMTP id q8mr3129847wix.14.1332406319192;
	Thu, 22 Mar 2012 01:51:59 -0700 (PDT)
Received: from [172.20.1.36] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id o2sm6178326wiv.11.2012.03.22.01.51.57
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 22 Mar 2012 01:51:58 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1257)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <CAGiJk9cw9KxmoPcmad1aR64vXaqKujUY7nH_pVePnfVPY-uedw@mail.gmail.com>
Date: Thu, 22 Mar 2012 09:51:58 +0100
Message-Id: <CDC69864-7475-4B3C-B966-C3B6CC67B8E7@dominion.thruhere.net>
References: <1332339926-27043-1-git-send-email-s.stirtzel@googlemail.com>
	<4F6A2F2F.2090607@linux.intel.com>
	<FC6FAFAF-2C6E-4EF7-8AD9-D2C30D2114DD@dominion.thruhere.net>
	<CAGiJk9cw9KxmoPcmad1aR64vXaqKujUY7nH_pVePnfVPY-uedw@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1257)
X-Gm-Message-State: ALoCoQl3G06l86FUsdLZx3bDzVJVpcsjcaQefAsCVZa0szm8AAVi/c4Q33aoQHDf1CWlp4op80Cf
Subject: Re: [PATCH] giflib: Move to OE-Core
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
X-List-Received-Date: Thu, 22 Mar 2012 09:00:53 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 22 mrt. 2012, om 09:48 heeft Samuel Stirtzel het volgende geschreven:

> 2012/3/21 Koen Kooi <koen@dominion.thruhere.net>:
>>=20
>> Op 21 mrt. 2012, om 20:42 heeft Saul Wold het volgende geschreven:
>>=20
>>> On 03/21/2012 07:25 AM, Samuel Stirtzel wrote:
>>>> * This move will allow the testing of meta-kde for users without =
meta-openembedded.
>>>>=20
>>> So what other layers are using giflib?
>>>=20
>>> Your suggesting that we need to have it in oe-core so people don't =
need to add the meta-openembedded layer when using meta-kde?
>>>=20
>>> I am just trying to get more data before making a decision.
>>=20
>> Let's put everything in oe-core!
>=20
> Otherwise it would require to maintain a redundant copy of giflib in =
meta-kde.

I don't think you get the concept of layers and keeping non-core stuff =
out of oe-core.

> Alternative suggestions are welcome.
>=20
>=20
> A grep shows that not many recipes depend on giflib:
> -
> samuel@s-stirtzel-linux:/work/oe-core/setup-scripts/sources$ grep -r =
'giflib' *
> meta-java/recipes-core/openjdk/openjdk-6-common.inc:DEPENDS =3D =
"giflib
> libpng jpeg cups \
> meta-java/recipes-core/icedtea/icedtea6-native.inc:
> freetype-native zlib-native giflib-native jpeg-native \
> meta-kde/recipes-kde-base/kdelibs4_git.bb:DEPENDS =3D "automoc4-native
> strigi libdbusmenu-qt soprano shared-desktop-ontologies dbus giflib
> attica jpeg libpng bzip2 libpcre perl-native"
> meta-openembedded/meta-efl/recipes-efl/efl/evas.inc:DEPENDS =3D =
"librsvg
> eina eet freetype jpeg libpng virtual/libx11 libxext libxrender
> fontconfig libfribidi giflib"
> -
>=20
> Any reason against the move?

The whole layering concept=


