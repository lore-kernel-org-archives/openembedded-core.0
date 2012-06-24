Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SismL-0007IU-6F
	for openembedded-core@lists.openembedded.org;
	Sun, 24 Jun 2012 21:47:25 +0200
Received: by eaal1 with SMTP id l1so1048280eaa.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 24 Jun 2012 12:36:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	bh=K8tCjp988VUb0zPrVNVC9N0m8evxmlbjUWTQfWRwxAE=;
	b=h/RFdyKOIquGIN55UoXXI3mz7h9Zi0z/nF3DvGBOpMWdJfv7zLiIaDL36kPaaTBbn5
	8oj62zqPXMB/eKUIJExp2dIGQsqmMIoaYidO3SGSvdetO7RWpGHxZ83u06F30sT0INeP
	YoqcIeOLhAPsL/QbQChlMH2OuGpwff38wnV45KEAl/f0kDJcT5KID+1ctNZnLWwIXeSz
	3ZTk3tF5D0oldxzMGO0eOCA4c/f+wxdVHjyrXFrDN/Ixt0SJqlNm6rAS+kGJiPcK0UHz
	iXj7FFU6ME1/93Z6QyzPEQOxne3rY0GIVbl4uG2Ky5d5h+U+KtJCVbr56KtLxonDmIgG
	eQzQ==
Received: by 10.14.97.16 with SMTP id s16mr1715082eef.117.1340566595266; Sun,
	24 Jun 2012 12:36:35 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.219.71 with HTTP; Sun, 24 Jun 2012 12:36:05 -0700 (PDT)
In-Reply-To: <4FE7597D.7020301@linux.intel.com>
References: <cover.1340319020.git.raj.khem@gmail.com>
	<34661d7f2383341236e842d75197263faf23ced1.1340319020.git.raj.khem@gmail.com>
	<4FE7597D.7020301@linux.intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 24 Jun 2012 12:36:05 -0700
Message-ID: <CAMKF1soHLiBfWg736yw=U5mrcvNmnrU4BYq+4E6xtkg_GzMS3A@mail.gmail.com>
To: Saul Wold <sgw@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/5] kconfig-frontends: New recipe
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
X-List-Received-Date: Sun, 24 Jun 2012 19:47:25 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Sun, Jun 24, 2012 at 11:16 AM, Saul Wold <sgw@linux.intel.com> wrote:
> On 06/21/2012 03:54 PM, Khem Raj wrote:
>>
>> kconfig-frontends provides the kconfig infrastructure
>> thats used for linux kernel as a standalone package. Its
>> not intended to be used for kernel itself but can be
>> used by packages who are based on kconfig e.g. busybox
>> uclibc or new packages who wants to use kconfig infra
>> for the package build
>>
> Khem:
>
> Did you build for nativesdk? Also did you check a multi-lib build, we hav=
e
> seen issues with new recipes and multi-lib.

I did not try multilib but nativesdk did build but if I build now it
fails for me. Probably something changed in dev packaging. We can drop
nativesdk for now
until I rework it.

>
> Sau!
>
> ERROR: Nothing PROVIDES 'flex-nativesdk' (but
> virtual:nativesdk:/srv/home/pokybuild/yocto-autobuilder/yocto-slave/night=
ly/build/meta/recipes-devtools/kconfig-frontends/kconfig-frontends_3.4.bb
> DEPENDS on or otherwise requires it)
> ERROR: Nothing PROVIDES 'bison-nativesdk' (but
> virtual:nativesdk:/srv/home/pokybuild/yocto-autobuilder/yocto-slave/night=
ly/build/meta/recipes-devtools/kconfig-frontends/kconfig-frontends_3.4.bb
> DEPENDS on or otherwise requires it)
> ERROR: Nothing PROVIDES 'gperf-nativesdk' (but
> virtual:nativesdk:/srv/home/pokybuild/yocto-autobuilder/yocto-slave/night=
ly/build/meta/recipes-devtools/kconfig-frontends/kconfig-frontends_3.4.bb
> DEPENDS on or otherwise requires it)
> ERROR: Nothing RPROVIDES 'kconfig-frontends-nativesdk-dev' (but
> virtual:nativesdk:/srv/home/pokybuild/yocto-autobuilder/yocto-slave/night=
ly/build/meta/recipes-devtools/kconfig-frontends/kconfig-frontends_3.4.bb
> RDEPENDS on or otherwise requires it)
> ERROR: No eligible RPROVIDERs exist for 'kconfig-frontends-nativesdk-dev'
> NOTE: Runtime target 'kconfig-frontends-nativesdk-dev' is unbuildable,
> removing...
> Missing or unbuildable dependency chain was:
> ['kconfig-frontends-nativesdk-dev']
> ERROR: Nothing RPROVIDES 'kconfig-frontends-nativesdk' (but
> virtual:nativesdk:/srv/home/pokybuild/yocto-autobuilder/yocto-slave/night=
ly/build/meta/recipes-devtools/kconfig-frontends/kconfig-frontends_3.4.bb
> RDEPENDS on or otherwise requires it)
> ERROR: No eligible RPROVIDERs exist for 'kconfig-frontends-nativesdk'
> NOTE: Runtime target 'kconfig-frontends-nativesdk' is unbuildable,
> removing...
> Missing or unbuildable dependency chain was: ['kconfig-frontends-nativesd=
k']
>
>
>> Signed-off-by: Khem Raj<raj.khem@gmail.com>
>> ---
>> =C2=A0.../kconfig-frontends/kconfig-frontends_3.4.bb =C2=A0 =C2=A0 | =C2=
=A0 28
>> ++++++++++++++++++++
>> =C2=A01 files changed, 28 insertions(+), 0 deletions(-)
>> =C2=A0create mode 100644
>> meta/recipes-devtools/kconfig-frontends/kconfig-frontends_3.4.bb
>>
>> diff --git
>> a/meta/recipes-devtools/kconfig-frontends/kconfig-frontends_3.4.bb
>> b/meta/recipes-devtools/kconfig-frontends/kconfig-frontends_3.4.bb
>> new file mode 100644
>> index 0000000..d95d3e8
>> --- /dev/null
>> +++ b/meta/recipes-devtools/kconfig-frontends/kconfig-frontends_3.4.bb
>> @@ -0,0 +1,28 @@
>> +# Copyright (C) 2012 Khem Raj<raj.khem@gmail.com>
>> +# Released under the MIT license (see COPYING.MIT for the terms)
>> +
>> +DESCRIPTION =3D "The kconfig-frontends project aims at centralising \
>> +the effort of keeping an up-to-date, out-of-tree, packaging of the \
>> +kconfig infrastructure, ready for use by third-party projects. \
>> +The kconfig-frontends package provides the kconfig parser, as well as a=
ll
>> \
>> +the frontends"
>> +HOMEPAGE =3D "http://ymorin.is-a-geek.org/projects/kconfig-frontends"
>> +LICENSE =3D "GPL-2.0"
>> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D9b8cf60ff39767ff04b671fca830=
2408"
>> +SECTION =3D "devel"
>> +DEPENDS +=3D "ncurses flex bison gperf"
>> +PR =3D "r0"
>> +PV =3D "3.4.0"
>> +SPIN =3D "0"
>> +SRC_URI =3D
>> "http://ymorin.is-a-geek.org/download/${BPN}/${BPN}-${PV}-${SPIN}.tar.xz=
"
>> +SRC_URI[md5sum] =3D "7eed0faf5a41d6dd0b2a886a440a972d"
>> +SRC_URI[sha256sum] =3D
>> "638006f3d1aefefdc1db3030a15b562cf3c89f2028b1cea0bf0f0629708802f2"
>> +
>> +S =3D "${WORKDIR}/${BPN}-${PV}-${SPIN}"
>> +
>> +inherit autotools
>> +do_configure_prepend () {
>> + =C2=A0 =C2=A0 =C2=A0 mkdir -p scripts/.autostuff/m4
>> +}
>> +EXTRA_OECONF +=3D "--disable-gconf --disable-qconf"
>> +BBCLASSEXTEND =3D "native nativesdk"


