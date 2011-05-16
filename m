Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QM5pP-0003te-Vs
	for openembedded-core@lists.openembedded.org;
	Mon, 16 May 2011 23:59:52 +0200
Received: by wye20 with SMTP id 20so4237577wye.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 May 2011 14:56:59 -0700 (PDT)
Received: by 10.216.136.89 with SMTP id v67mr412088wei.47.1305583018800;
	Mon, 16 May 2011 14:56:58 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id r29sm2788215weq.45.2011.05.16.14.56.57
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 16 May 2011 14:56:57 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1084)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <92ed336082db3134051e8a3a4393159e1e48a8b8.1305580484.git.sgw@linux.intel.com>
Date: Mon, 16 May 2011 23:56:57 +0200
Message-Id: <25AAFA69-EED1-4CD5-A812-3A5330B12BE0@dominion.thruhere.net>
References: <cover.1305580484.git.sgw@linux.intel.com>
	<92ed336082db3134051e8a3a4393159e1e48a8b8.1305580484.git.sgw@linux.intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1084)
Subject: Re: [PATCH 01/14] task-core-nfs: fix a bitbake error
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
X-List-Received-Date: Mon, 16 May 2011 21:59:52 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 16 mei 2011, om 23:44 heeft Saul Wold het volgende geschreven:

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
> [sgw: moved space to _append line]
> Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
> Signed-off-by: Saul Wold <sgw@linux.intel.com>
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

As said in my other mail, those should use the libc-glibc overrides=


