Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QM5p0-0003sQ-Sq
	for openembedded-core@lists.openembedded.org;
	Mon, 16 May 2011 23:59:26 +0200
Received: by wwb17 with SMTP id 17so4676638wwb.24
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 May 2011 14:56:34 -0700 (PDT)
Received: by 10.216.68.140 with SMTP id l12mr4533819wed.79.1305582994053;
	Mon, 16 May 2011 14:56:34 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id r29sm2788215weq.45.2011.05.16.14.56.32
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 16 May 2011 14:56:33 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1084)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <f66be43ad9cccce4d8c910e10b39125a9551c5e2.1305582528.git.nitin.a.kamble@intel.com>
Date: Mon, 16 May 2011 23:56:31 +0200
Message-Id: <04B2419B-1A05-4879-AFA9-2715E3E7D8FB@dominion.thruhere.net>
References: <cover.1305582528.git.nitin.a.kamble@intel.com>
	<f66be43ad9cccce4d8c910e10b39125a9551c5e2.1305582528.git.nitin.a.kamble@intel.com>
To: Nitin A Kamble <nitin.a.kamble@intel.com>
X-Mailer: Apple Mail (2.1084)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [poky] [PATCH 1/1] task-core-nfs: fix a bitbake error
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
X-List-Received-Date: Mon, 16 May 2011 21:59:27 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 16 mei 2011, om 23:50 heeft Nitin A Kamble het volgende geschreven:

> From: Nitin A Kamble <nitin.a.kamble@intel.com>
>=20
> THis fixes following issue:
>=20
> NOTE: Runtime target 'glibc-utilsglibc-utils' is unbuildable, =
removing...
> Missing or unbuildable dependency chain was: =
['glibc-utilsglibc-utils']
> NOTE: Runtime target 'task-core-nfs-server' is unbuildable, =
removing...
> Missing or unbuildable dependency chain was: ['task-core-nfs-server', =
'glibc-utilsglibc-utils']
>=20
> Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
> ---
> meta/recipes-core/tasks/task-core-nfs.bb |    4 ++--
> 1 files changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/meta/recipes-core/tasks/task-core-nfs.bb =
b/meta/recipes-core/tasks/task-core-nfs.bb
> index d5d8291..20e042b 100644
> --- a/meta/recipes-core/tasks/task-core-nfs.bb
> +++ b/meta/recipes-core/tasks/task-core-nfs.bb
> @@ -22,5 +22,5 @@ RDEPENDS_task-core-nfs-server =3D "\
> # rpcinfo can be useful but only with glibc images
> GLIBC_DEPENDENCIES =3D "glibc-utils"
>=20
> -RRECOMMENDS_task-core-nfs-server_append_linux =3D =
"${GLIBC_DEPENDENCIES}"
> -RRECOMMENDS_task-core-nfs-server_append_linux-gnueabi =3D =
"${GLIBC_DEPENDENCIES}"
> +RRECOMMENDS_task-core-nfs-server_append_linux =3D " =
${GLIBC_DEPENDENCIES}"
> +RRECOMMENDS_task-core-nfs-server_append_linux-gnueabi =3D " =
${GLIBC_DEPENDENCIES}"

Those should use the libc-glibc overrides, otherwise you'll break on =
ppc+spe builds=


