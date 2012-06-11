Received: from mail-ob0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1Se6Yl-0002US-C0
	for openembedded-core@lists.openembedded.org;
	Mon, 11 Jun 2012 17:29:39 +0200
Received: by obhx4 with SMTP id x4so6961722obh.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Jun 2012 08:19:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=nBv9dNlESeNiqOYvMR0q2itVe9mw9PBh73Lp98maQVU=;
	b=ADlvYCgBghYxMqOu0OEVUVK7fTNE75ts6OGoHGyAOaww91phmHyO/Bp4K6D3jweeRz
	iLrCZE1MMG0qkPvBxApFWAk0NlBrPbPjCV46UQg9h7D12Wmjo433EDx1PSBAy7pRGNfk
	TrPrXgY7HvS35dXy6KKHk92qdd0SyaS1ygVhSagEasKGvU5xFKC+NBePiq6RpInOg0jx
	aHTh00p9QQVIJi8jcl+IVNLEDi7vLm+z/lbw8eGnjE4/jOge1d4RzIsqdotUEyzjb8AK
	05NKUA8lmlyeSIvI5U07i1kCzo9YqBNz2UdnjfDoIJm7ymLhDjdd7+jBbeMlEX1A7fD2
	r2PA==
Received: by 10.182.86.130 with SMTP id p2mr16796429obz.52.1339427945183;
	Mon, 11 Jun 2012 08:19:05 -0700 (PDT)
Received: from [10.0.1.9] (adsl-68-88-77-36.dsl.rcsntx.swbell.net.
	[68.88.77.36])
	by mx.google.com with ESMTPS id xk19sm12327952obc.5.2012.06.11.08.19.03
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 11 Jun 2012 08:19:04 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1278)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <4FD605CE.6060203@linux.intel.com>
Date: Mon, 11 Jun 2012 10:19:05 -0500
Message-Id: <2405D501-576B-4710-9FE4-4CBED50F7FA8@dominion.thruhere.net>
References: <1339117150-15442-1-git-send-email-sgw@linux.intel.com>
	<0DCEDF44-AD19-4718-92F2-4801F8268190@dominion.thruhere.net>
	<4FD605CE.6060203@linux.intel.com>
To: Saul Wold <sgw@linux.intel.com>
X-Mailer: Apple Mail (2.1278)
X-Gm-Message-State: ALoCoQlT/la/muQUtcTTc9c7M3/IabTTp+OaLeLjxVxNWHE77Q2ldA2cUg3835IZnKUyazQOwgQU
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] curl: enable ssl support
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
X-List-Received-Date: Mon, 11 Jun 2012 15:29:39 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable


Op 11 jun. 2012, om 09:50 heeft Saul Wold het volgende geschreven:

> On 06/08/2012 12:39 AM, Koen Kooi wrote:
>>=20
>> Op 8 jun. 2012, om 02:59 heeft Saul Wold het volgende geschreven:
>>=20
>>> This patch enables ssl support for curl to allow git to clone from
>>> https / ssl sites.
>>>=20
>>> [YOCTO #2532]
>>>=20
>>> Signed-off-by: Saul Wold<sgw@linux.intel.com>
>>> ---
>>> meta/recipes-support/curl/curl_7.24.0.bb |    6 +++---
>>> 1 files changed, 3 insertions(+), 3 deletions(-)
>>>=20
>>> diff --git a/meta/recipes-support/curl/curl_7.24.0.bb =
b/meta/recipes-support/curl/curl_7.24.0.bb
>>> index 12e95c9..f0ae7f1 100644
>>> --- a/meta/recipes-support/curl/curl_7.24.0.bb
>>> +++ b/meta/recipes-support/curl/curl_7.24.0.bb
>>> @@ -5,10 +5,10 @@ SECTION =3D "console/network"
>>> LICENSE =3D "MIT"
>>> LIC_FILES_CHKSUM =3D =
"file://COPYING;beginline=3D7;md5=3D3a34942f4ae3fbf1a303160714e664ac"
>>>=20
>>> -DEPENDS =3D "zlib gnutls"
>>> +DEPENDS =3D "zlib gnutls openssl"
>>> DEPENDS_virtclass-native =3D "zlib-native"
>>> DEPENDS_virtclass-nativesdk =3D "zlib-nativesdk"
>>> -PR =3D "r0"
>>> +PR =3D "r1"
>>>=20
>>> SRC_URI =3D "http://curl.haxx.se/download/curl-${PV}.tar.bz2 \
>>>            file://noldlibpath.patch \
>>> @@ -20,7 +20,7 @@ SRC_URI[sha256sum] =3D =
"ebdb111088ff8b0e05b1d1b075e9f1608285e8105cc51e21caacf33d01
>>> inherit autotools pkgconfig binconfig
>>>=20
>>> EXTRA_OECONF =3D "--with-zlib=3D${STAGING_LIBDIR}/../ \
>>> -                --without-ssl \
>>> +		--with-ssl \
>>>                 --without-libssh2 \
>>> 		--with-random=3D/dev/urandom \
>>> 		--without-libidn \
>>=20
>> I haven't looked at the complete recipe, but what is the ssl =
behaviour for the -native and -nativesdk versions?
>>=20
> Actually it's the -native that needs the ssl behavior, and this adds =
it for all 3 correctly, tested on target as well as -native (I did not =
actually test the -nativesdk, but I will now).

In that case you need to change all the DEPENDS, including the virtclass =
ones.

regards,

Koen



