Return-Path: <koen@dominion.thruhere.net>
Received: from mail-we0-f177.google.com (mail-we0-f177.google.com
	[74.125.82.177])
	by mail.openembedded.org (Postfix) with ESMTP id 7E6A46AF56
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Jul 2013 12:55:07 +0000 (UTC)
Received: by mail-we0-f177.google.com with SMTP id m46so616911wev.22
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Jul 2013 05:55:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=Fm9GaAR8vWRbgzWy3Oa3nIb9XXXnwyQlClrFZjvnenA=;
	b=pLsMKtvSX890q8i8nT5lzAarQ8SxQbEe1WNkkJzxvmGeMwBbIexKO6Eghm+LgxC49g
	Y9Hg7EtFRCd1T47ruRdjDe2F0BoE69CpmygQ48A5n0Ud7UX0h4nRYT7I8oj9wwl901iE
	xLUl4i0yaNp9R3RKU0pDiHcs1Ky+w6Ex3Zi/nNhDgeNWQhVmS4WTPeY/kHMz0Wh4O35R
	Yz1Rs/b9mFavFKde+z3HHKLAMzheY/AUvLWprAlbqHvBCWAnnnJhUmqFQeCF+/mE3qEo
	mYUK2B5fJ3hP7hvCqTBtoBwh83zf9TU5OkstikSlyWPL6TAGBs/gYIrO/RfgN5SQzR18
	F7PA==
X-Received: by 10.180.80.198 with SMTP id t6mr1973239wix.61.1374756907688;
	Thu, 25 Jul 2013 05:55:07 -0700 (PDT)
Received: from [172.20.0.132] (ip4da2a5ae.direct-adsl.nl. [77.162.165.174])
	by mx.google.com with ESMTPSA id u9sm3544266wif.6.2013.07.25.05.55.05
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 25 Jul 2013 05:55:06 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.5 \(1508\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <51ECAB78.5070002@linux.intel.com>
Date: Thu, 25 Jul 2013 14:55:06 +0200
Message-Id: <5A29E957-205C-4040-A091-ED733D27F223@dominion.thruhere.net>
References: <1374112474-13597-1-git-send-email-ming.liu@windriver.com>
	<51ECAB78.5070002@linux.intel.com>
To: Saul Wold <sgw@linux.intel.com>
X-Mailer: Apple Mail (2.1508)
X-Gm-Message-State: ALoCoQkoFKJE1vpjLZCtTX1oOqwPmMfVXRfgYxNsn/yc/PtJgtC6S8/UugnWfe0ef2QE3ErOhjfb
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH V3] util-linux: replace += with _append to EXTRA_OECONF_class-native
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
X-List-Received-Date: Thu, 25 Jul 2013 12:55:07 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 22 jul. 2013, om 05:48 heeft Saul Wold <sgw@linux.intel.com> het =
volgende geschreven:

> On 07/17/2013 06:54 PM, Ming Liu wrote:
>> The native/nativesdk overrides of EXTRA_OECONF should take effect =
before
>> append operator, otherwise, it will cause EXTRA_OECONF be overridden =
instead
>> of be appended at native/nativesdk build time.
>>=20
>> Signed-off-by: Ming Liu <ming.liu@windriver.com>
>> ---
>>  meta/recipes-core/util-linux/util-linux_2.23.1.bb |    4 ++--
>>  1 files changed, 2 insertions(+), 2 deletions(-)
>>=20
>> diff --git a/meta/recipes-core/util-linux/util-linux_2.23.1.bb =
b/meta/recipes-core/util-linux/util-linux_2.23.1.bb
>> index 12f5021..3040476 100644
>> --- a/meta/recipes-core/util-linux/util-linux_2.23.1.bb
>> +++ b/meta/recipes-core/util-linux/util-linux_2.23.1.bb
>> @@ -18,5 +18,5 @@ SRC_URI[md5sum] =3D =
"6741eeaff93ff5a6bacdd3816bdd87c4"
>>  SRC_URI[sha256sum] =3D =
"ad4a7831d7b27d0172996fd343e809716c2403b32a94e15194d8ea797223c4af"
>>=20
>>  CACHED_CONFIGUREVARS +=3D "scanf_cv_alloc_modifier=3Das"
>> -EXTRA_OECONF_class-native +=3D "--disable-fallocate =
--disable-use-tty-group"
>> -EXTRA_OECONF_class-nativesdk +=3D "--disable-fallocate =
--disable-use-tty-group"
>> +EXTRA_OECONF_append_class-native =3D " --disable-fallocate =
--disable-use-tty-group"
>> +EXTRA_OECONF_append_class-nativesdk =3D " --disable-fallocate =
--disable-use-tty-group"
>>=20
>=20
> While this seems correct, it is causing some down stream issues with =
e2fsprogs-native and not finding the uuid library

I ran into this when backporting fixes for texinfoand gcc 4.8 hosts from =
master to danny and I used this hack:

	=
https://github.com/Angstrom-distribution/oe-core/commit/9cd55347769555e893=
74e83d011196ae5450204a

Not pretty, but it only affects the -native builds.

regards,

Koen=

