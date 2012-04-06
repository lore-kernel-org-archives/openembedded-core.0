Received: from mail-pz0-f51.google.com ([209.85.210.51])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1SG9Mo-0003sm-UY
	for openembedded-core@lists.openembedded.org;
	Fri, 06 Apr 2012 15:38:19 +0200
Received: by dadz8 with SMTP id z8so2842752dad.10
	for <openembedded-core@lists.openembedded.org>;
	Fri, 06 Apr 2012 06:29:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=references:in-reply-to:mime-version:content-transfer-encoding
	:content-type:message-id:cc:x-mailer:from:subject:date:to
	:x-gm-message-state;
	bh=Kbj/lJhrcp9PfQ4gcd9Tv+QQwTWze8INBB6u9alj/48=;
	b=Fvm17/1FmcXrcHgYxlYDbNazyIkTYLUlJrBOqtxSM2orF3m1gfPEIFWYneDblOu3/B
	TdkoR9ucCRuGe0RCRIhgMaz1lKQPLTIr9gljAhxymMctBXLZ0oYzN/LTGX6KD7LwtXNU
	ZxDFW2vIjRS0I/2G3QqaE3Fqvw0TrfndU6Y1k48yBnZ0x46NJ8DVj4rKJifRhVrvhvtj
	eKGcye0exGEo0zUTr7yK/bEK2/zakalm92G7uKCo7s62w0guikD3FLxyyVZjcnqLoU+I
	SppobqBXzs2E/2HeMWPQBWi1sI3qfGAzPgQ98YvEsf5AVhHlf8Vga8Gh5FzNN1rK3ds3
	ykOw==
Received: by 10.68.218.72 with SMTP id pe8mr15795921pbc.45.1333718944974;
	Fri, 06 Apr 2012 06:29:04 -0700 (PDT)
Received: from [192.168.68.136] ([207.239.114.206])
	by mx.google.com with ESMTPS id r10sm6307531pbf.22.2012.04.06.06.29.03
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 06 Apr 2012 06:29:03 -0700 (PDT)
References: <1333626507-32182-1-git-send-email-stefan@herbrechtsmeier.net>
	<4F7E607E.9050101@linux.intel.com>
In-Reply-To: <4F7E607E.9050101@linux.intel.com>
Mime-Version: 1.0 (1.0)
Message-Id: <1967D97F-63A7-49DA-930F-A0C6F1F4112F@dominion.thruhere.net>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: iPhone Mail (9B179)
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Fri, 6 Apr 2012 06:29:02 -0700
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Gm-Message-State: ALoCoQn6rt+yKZr3eHQTAdCxXfOv3REhyjOQDRYo+RS/t8MM+pfRopap9edZ2XQ8np/ztY6PELrn
Subject: Re: [PATCH] u-boot: add machine name to spl image name
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
X-List-Received-Date: Fri, 06 Apr 2012 13:38:19 -0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii



Op 5 apr. 2012 om 20:18 heeft Saul Wold <sgw@linux.intel.com> het volgende g=
eschreven:

> On 04/05/2012 04:48 AM, Stefan Herbrechtsmeier wrote:
>> Signed-off-by: Stefan Herbrechtsmeier<stefan@herbrechtsmeier.net>
>> ---
>>  meta/recipes-bsp/u-boot/u-boot.inc        |    2 +-
>>  meta/recipes-bsp/u-boot/u-boot_2011.03.bb |    2 +-
>>  meta/recipes-bsp/u-boot/u-boot_2011.06.bb |    2 +-
>>  3 files changed, 3 insertions(+), 3 deletions(-)
>>=20
>> diff --git a/meta/recipes-bsp/u-boot/u-boot.inc b/meta/recipes-bsp/u-boot=
/u-boot.inc
>> index 700d5d3..0445c34 100644
>> --- a/meta/recipes-bsp/u-boot/u-boot.inc
>> +++ b/meta/recipes-bsp/u-boot/u-boot.inc
>> @@ -32,7 +32,7 @@ UBOOT_MAKE_TARGET ?=3D "all"
>>  # deploy directory.  For those versions they can set the following varia=
bles
>>  # to allow packaging the SPL.
>>  SPL_BINARY ?=3D ""
>> -SPL_IMAGE ?=3D "${SPL_BINARY}-${PV}-${PR}"
>> +SPL_IMAGE ?=3D "${SPL_BINARY}-${MACHINE}-${PV}-${PR}"
>>  SPL_SYMLINK ?=3D "${SPL_BINARY}-${MACHINE}"
>>=20
>>  do_compile () {
>> diff --git a/meta/recipes-bsp/u-boot/u-boot_2011.03.bb b/meta/recipes-bsp=
/u-boot/u-boot_2011.03.bb
>> index 1ebdbea..e99bc2c 100644
>> --- a/meta/recipes-bsp/u-boot/u-boot_2011.03.bb
>> +++ b/meta/recipes-bsp/u-boot/u-boot_2011.03.bb
>> @@ -17,7 +17,7 @@ FILESDIR =3D "${@os.path.dirname(d.getVar('FILE',1))}/u=
-boot-git/${MACHINE}"
>>  SRCREV =3D "19b54a701811220221fc4d5089a2bb18892018ca"
>>=20
>>  PV =3D "v2011.03+git${SRCPV}"
>> -PR =3D "r5"
>> +PR =3D "r6"
>>=20
>>  SRC_URI =3D "git://git.denx.de/u-boot.git;branch=3Dmaster;protocol=3Dgit=
"
>>=20
>> diff --git a/meta/recipes-bsp/u-boot/u-boot_2011.06.bb b/meta/recipes-bsp=
/u-boot/u-boot_2011.06.bb
>> index 8ebdbff..680401f 100644
>> --- a/meta/recipes-bsp/u-boot/u-boot_2011.06.bb
>> +++ b/meta/recipes-bsp/u-boot/u-boot_2011.06.bb
>> @@ -17,7 +17,7 @@ FILESDIR =3D "${@os.path.dirname(d.getVar('FILE',1))}/u=
-boot-git/${MACHINE}"
>>  SRCREV =3D "b1af6f532e0d348b153d5c148369229d24af361a"
>>=20
>>  PV =3D "v2011.06+git${SRCPV}"
>> -PR =3D "r0"
>> +PR =3D "r1"
>>=20
>>  SRC_URI =3D "git://git.denx.de/u-boot.git;branch=3Dmaster;protocol=3Dgit=
"
>>=20
>=20
> Merged into OE-Core

wait a minute, why was this merged?



>=20
> Thanks
>    Sau!
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


