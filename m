Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1REji5-0000GE-4a
	for openembedded-core@lists.openembedded.org;
	Fri, 14 Oct 2011 17:30:09 +0200
Received: by bkat8 with SMTP id t8so2111018bka.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Oct 2011 08:24:20 -0700 (PDT)
Received: by 10.204.140.6 with SMTP id g6mr7207147bku.90.1318605854703;
	Fri, 14 Oct 2011 08:24:14 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id x4sm794848fad.1.2011.10.14.08.24.12
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 14 Oct 2011 08:24:13 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1251.1)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1318602698-13435-1-git-send-email-philip@balister.org>
Date: Fri, 14 Oct 2011 17:24:06 +0200
Message-Id: <FBE8370B-98F4-404F-9382-6FA4BDB98A71@dominion.thruhere.net>
References: <1318602698-13435-1-git-send-email-philip@balister.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1251.1)
Subject: Re: [PATCH 1/1] cmake : Disable building ccmake.
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
X-List-Received-Date: Fri, 14 Oct 2011 15:30:09 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 14 okt. 2011, om 16:31 heeft Philip Balister het volgende geschreven:

> ccmake fails to build due to an as-needed type error with -ltinfo. =
Disable
> it for now since the build fails and cmake is what we need for target
> sdk.
>=20
> Signed-off-by: Philip Balister <philip@balister.org>
> ---
> meta/recipes-devtools/cmake/cmake_2.8.5.bb |    1 +
> 1 files changed, 1 insertions(+), 0 deletions(-)
>=20
> diff --git a/meta/recipes-devtools/cmake/cmake_2.8.5.bb =
b/meta/recipes-devtools/cmake/cmake_2.8.5.bb
> index 4fa9562..c0c5cad 100644
> --- a/meta/recipes-devtools/cmake/cmake_2.8.5.bb
> +++ b/meta/recipes-devtools/cmake/cmake_2.8.5.bb
> @@ -30,6 +30,7 @@ EXTRA_OECMAKE=3D" \
>     -DCMAKE_DOC_DIR=3D${docdir_stripped}/cmake-${CMAKE_MAJOR_VERSION} =
\
>     -DCMAKE_USE_SYSTEM_LIBRARIES=3D1 \
>     -DKWSYS_CHAR_IS_SIGNED=3D1 \
> +    -DBUILD_CursesDialog=3D0 \
>     ${@base_contains('DISTRO_FEATURES', 'largefile', =
'-DKWSYS_LFS_WORKS=3D1', '-DKWSYS_LFS_DISABLE=3D1', d)} \
> "

Missing PR bump :)=


