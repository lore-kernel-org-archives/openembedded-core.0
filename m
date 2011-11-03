Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jkridner@beagleboard.org>) id 1RLwP9-000072-B0
	for openembedded-core@lists.openembedded.org;
	Thu, 03 Nov 2011 13:28:24 +0100
Received: by ywf9 with SMTP id 9so1171240ywf.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 03 Nov 2011 05:22:14 -0700 (PDT)
Received: by 10.150.163.14 with SMTP id l14mr9674783ybe.15.1320322933287;
	Thu, 03 Nov 2011 05:22:13 -0700 (PDT)
Received: from mail-yw0-f47.google.com (mail-yw0-f47.google.com
	[209.85.213.47])
	by mx.google.com with ESMTPS id r4sm16737780anl.5.2011.11.03.05.22.11
	(version=SSLv3 cipher=OTHER); Thu, 03 Nov 2011 05:22:11 -0700 (PDT)
Received: by ywf9 with SMTP id 9so1171216ywf.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 03 Nov 2011 05:22:11 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.236.136.1 with SMTP id v1mr12821771yhi.28.1320322930983; Thu,
	03 Nov 2011 05:22:10 -0700 (PDT)
Received: by 10.147.38.17 with HTTP; Thu, 3 Nov 2011 05:22:10 -0700 (PDT)
In-Reply-To: <1320312113-2492-1-git-send-email-koen@dominion.thruhere.net>
References: <1320312113-2492-1-git-send-email-koen@dominion.thruhere.net>
Date: Thu, 3 Nov 2011 08:22:10 -0400
Message-ID: <CA+T6QPkZ5NNbtVES40=AuJ=X-Wc17ZNhhtQRzMS8=FGYtT3rTw@mail.gmail.com>
From: Jason Kridner <jkridner@beagleboard.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: Re: [PATCH] rt-tests: update to 0.83
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
X-List-Received-Date: Thu, 03 Nov 2011 12:28:24 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 3, 2011 at 5:21 AM, Koen Kooi <koen@dominion.thruhere.net> wrot=
e:
> Fetch from github, kernel.org uri is gone
>
> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>

Acked-by: Jason Kridner <jdk@ti.com>

> ---
> =A0.../{rt-tests_0.73.bb =3D> rt-tests_0.83.bb} =A0 =A0 =A0 =A0 | =A0 16 =
++++++++++------
> =A01 files changed, 10 insertions(+), 6 deletions(-)
> =A0rename meta/recipes-rt/rt-tests/{rt-tests_0.73.bb =3D> rt-tests_0.83.b=
b} (68%)
>
> diff --git a/meta/recipes-rt/rt-tests/rt-tests_0.73.bb b/meta/recipes-rt/=
rt-tests/rt-tests_0.83.bb
> similarity index 68%
> rename from meta/recipes-rt/rt-tests/rt-tests_0.73.bb
> rename to meta/recipes-rt/rt-tests/rt-tests_0.83.bb
> index a2cf6be..78d51b3 100644
> --- a/meta/recipes-rt/rt-tests/rt-tests_0.73.bb
> +++ b/meta/recipes-rt/rt-tests/rt-tests_0.83.bb
> @@ -6,16 +6,20 @@ LICENSE =3D "GPLv2 & GPLv2+"
> =A0LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D751419260aa954499f7abaabaa8=
82bbe \
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 file://src/cyclictest/cyclictest.=
c;beginline=3D7;endline=3D9;md5=3Dce162fe491d19d2ec67dff6dbc938d50 \
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 file://src/pi_tests/pi_stress.c;b=
eginline=3D6;endline=3D19;md5=3Dbd426a634a43ec612e9fbf125dfcc949"
> -# Version v0.73
> -SRCREV =3D "81da016fb0f6ab0511fbec81fc8ba1a50398a20d"
> -PV =3D "git${SRCPV}"
> -PR =3D "r0"
> +# Version v0.83
> +SRCREV =3D "5f1e84f8b015df3ff950056494134eca3f640d70"
>
> -SRC_URI =3D "git://git.kernel.org/pub/scm/linux/kernel/git/clrkwllms/rt-=
tests.git;protocol=3Dgit"
> +# git -> 0.83 needs a PE bump
> +PE =3D "1"
> +
> +SRC_URI =3D "git://github.com/clrkwllms/rt-tests.git"
>
> =A0S =3D "${WORKDIR}/git"
>
> -CFLAGS +=3D "-I${S}/src/include -D_GNU_SOURCE -Wall -Wno-nonnull"
> +CFLAGS +=3D "-I${S}/src/include -D_GNU_SOURCE -Wall -Wno-nonnulli ${LDFL=
AGS}"
> +
> +# calling 'uname -m' is broken on crossbuilds
> +EXTRA_OEMAKE =3D "NUMA=3D0"
>
> =A0do_install() {
> =A0 =A0 =A0 =A0 oe_runmake install DESTDIR=3D${D} SBINDIR=3D${sbindir} MA=
NDIR=3D${mandir} \
> --
> 1.7.2.5
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>


