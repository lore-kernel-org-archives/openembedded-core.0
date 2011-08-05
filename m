Received: from gate.crashing.org ([63.228.1.57]
	ident=[U2FsdGVkX19EpSOR20qpU+sY9iCfyFEiR8m+UE47cJo=])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <galak@kernel.crashing.org>) id 1QpNiY-0006LF-Gx
	for openembedded-core@lists.openembedded.org;
	Fri, 05 Aug 2011 18:57:50 +0200
Received: from [IPv6:::1] (localhost.localdomain [127.0.0.1])
	by gate.crashing.org (8.14.1/8.13.8) with ESMTP id p75GrP7Q023811
	for <openembedded-core@lists.openembedded.org>;
	Fri, 5 Aug 2011 11:53:26 -0500
Mime-Version: 1.0 (Apple Message framework v1084)
From: Kumar Gala <galak@kernel.crashing.org>
In-Reply-To: <1312484099-29314-1-git-send-email-galak@kernel.crashing.org>
Date: Fri, 5 Aug 2011 11:53:28 -0500
Message-Id: <6E357E06-687D-4B2C-B82E-973ABC9973F9@kernel.crashing.org>
References: <1312484099-29314-1-git-send-email-galak@kernel.crashing.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1084)
Subject: Re: [PATCH] gcc: use ${base_lib} to match gcc default configuration
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
X-List-Received-Date: Fri, 05 Aug 2011 16:57:50 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


On Aug 4, 2011, at 1:54 PM, Kumar Gala wrote:

> Rather than tweaking MULTILIB_DIRNAMES & MULTILIB_OSDIRNAMES like is
> done for x86-64 via 64bithack.patch.  We can just go with gcc defaults
> and utilize ${base_lib} for where to find gcc libs.
>=20
> Signed-off-by: Kumar Gala <galak@kernel.crashing.org>
> ---
> .../gcc/gcc-cross-intermediate.inc                 |    2 +-
> 1 files changed, 1 insertions(+), 1 deletions(-)
>=20
> diff --git a/meta/recipes-devtools/gcc/gcc-cross-intermediate.inc =
b/meta/recipes-devtools/gcc/gcc-cross-intermediate.inc
> index df5958a..7b1bb38 100644
> --- a/meta/recipes-devtools/gcc/gcc-cross-intermediate.inc
> +++ b/meta/recipes-devtools/gcc/gcc-cross-intermediate.inc
> @@ -34,7 +34,7 @@ do_compile () {
> do_install () {
> 	oe_runmake 'DESTDIR=3D${D}' install
> 	install -d ${D}${target_base_libdir}/
> -	mv ${D}${exec_prefix}/${TARGET_SYS}/lib/* =
${D}${target_base_libdir}/
> +	mv ${D}${exec_prefix}/${TARGET_SYS}/${baselib}/* =
${D}${target_base_libdir}/
>=20
> 	# We don't really need this (here shares/ contains man/, info/, =
locale/).
> 	rm -rf ${D}${datadir}/
> --=20
> 1.7.3.4

ping

- k=


