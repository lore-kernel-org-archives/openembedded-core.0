Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QlKIC-0005bx-Eh
	for openembedded-core@lists.openembedded.org;
	Mon, 25 Jul 2011 14:29:52 +0200
Received: by wyg30 with SMTP id 30so3016481wyg.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Jul 2011 05:25:40 -0700 (PDT)
Received: by 10.216.184.137 with SMTP id s9mr3591805wem.96.1311596740364;
	Mon, 25 Jul 2011 05:25:40 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id p49sm1678912weq.31.2011.07.25.05.25.38
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 25 Jul 2011 05:25:39 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1244.3)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1311343068-942-1-git-send-email-galak@kernel.crashing.org>
Date: Mon, 25 Jul 2011 14:25:36 +0200
Message-Id: <C1FA9199-EF24-48DF-BCCD-7A3D084A5F0F@dominion.thruhere.net>
References: <1311343068-942-1-git-send-email-galak@kernel.crashing.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1244.3)
Subject: Re: [PATCH] gcc-4.6: Fix packaging of native toolchains
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
X-List-Received-Date: Mon, 25 Jul 2011 12:29:52 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 22 jul. 2011, om 15:57 heeft Kumar Gala het volgende geschreven:

> The base gcc package is missing liblto_plugin.so.  If we try a simple
> hello world compile we get something like:
>=20
> root@p5020-ds:~# gcc hello.c
> gcc: fatal error: -fuse-linker-plugin, but liblto_plugin.so not found
> compilation terminated.
>=20
> We need to include liblto_plugin.so in the base gcc package and not
> gcc-dev.
>=20
> Signed-off-by: Kumar Gala <galak@kernel.crashing.org>
> ---
> meta/recipes-devtools/gcc/gcc-4.6.inc            |    2 +-
> meta/recipes-devtools/gcc/gcc-package-target.inc |    1 +
> 2 files changed, 2 insertions(+), 1 deletions(-)
>=20
> diff --git a/meta/recipes-devtools/gcc/gcc-4.6.inc =
b/meta/recipes-devtools/gcc/gcc-4.6.inc
> index a724594..4c1e1e1 100644
> --- a/meta/recipes-devtools/gcc/gcc-4.6.inc
> +++ b/meta/recipes-devtools/gcc/gcc-4.6.inc
> @@ -1,6 +1,6 @@
> require gcc-common.inc
>=20
> -PR =3D "r1"
> +PR =3D "r2"

Doesn't this need a PR bump in gcc-4.5 as well?=


