Return-Path: <raj.khem@gmail.com>
Received: from mail-pl0-f65.google.com (mail-pl0-f65.google.com
	[209.85.160.65])
	by mail.openembedded.org (Postfix) with ESMTP id E9DE27910D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Aug 2018 00:35:38 +0000 (UTC)
Received: by mail-pl0-f65.google.com with SMTP id ba4-v6so2870423plb.11
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Aug 2018 17:35:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:openpgp:autocrypt:organization
	:message-id:date:user-agent:mime-version:in-reply-to;
	bh=kSQLl0f5wmN+qxohZ1+pgJ9ozDaVfg03Z0wV3COSYso=;
	b=MF+bcUMhkFAZFhYEc2x0gvWBi9lvlgzIfpQvh5BgUPgw1DcRB9RCDMFBjKDjmQFhN+
	GnMdIYDDCh828qZWa5oNoPYdo+ffJ00HXNUhucYHZEIEB7OjeS2To9lq4FprS5DY03Lq
	puqOY4u9PDwa/aoC/kHlsSoc3tNwSheK9EgqMHFj289oHb0EseHh8x7LrqoYvTWhyOen
	FTGTpFnOSga8Fzszde578JhhuWEUmTOj6R5zTcNnmPJq3IBLYH9RC4HlJ+dVOXkBofQd
	+/XaPCM3oX68eGj2vibdmio/cOMU9k5yTkj94/hZBPnosVL97wibGRxIDN19kBbG2CHD
	AOhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:openpgp:autocrypt
	:organization:message-id:date:user-agent:mime-version:in-reply-to;
	bh=kSQLl0f5wmN+qxohZ1+pgJ9ozDaVfg03Z0wV3COSYso=;
	b=YEtuZMqoboM3BLxzZw1Z7jcxa34gnG0T7Hfwem7PPtYSlOOkMl8rCdALiIeKG5jRBb
	ltgT+2Mddd1/pIauVR4Qoccjms96A8b21Zzjo3yn65WWgXP5GZCuyfTx0RbUZZsmxxp/
	Z3E8MSdN/j3ERlxjHSTFNYW0m6UTDC57nXNJ1duw2jYx3RjoxILZcCJ7A8cFTibBLwG/
	0pD8dG2qw8IB4jY5QtfJQT3mvxmx1YllavnhcFWmVqazzztzHmzSt8uQzDGrn0i0tIg7
	LPSSCUGQ2GxCEjO4RC4ZQ663cqfY7y3xWRUCHCRk0uVtT4FAreJd9GKKppeM1VtG1BPS
	rndA==
X-Gm-Message-State: AOUpUlEA4zDKaYKSeAF1fsxLAPUg7POVGniflHpLGSe1Biv6lrSUgIqj
	PsL6YhxjmamSp2Ta0llmK/Fzz6D5
X-Google-Smtp-Source: AA+uWPxL0vI/6TQ8uS9T7cZGv2SckI0k6VJICMMAG9qurLA33MI+2+e0FwJwgIa2/IPFLawWTzsaaQ==
X-Received: by 2002:a17:902:2d24:: with SMTP id
	o33-v6mr31378705plb.38.1534466139649; 
	Thu, 16 Aug 2018 17:35:39 -0700 (PDT)
Received: from hermes.local ([2601:646:877f:9499:2490:104c:b925:26c4])
	by smtp.gmail.com with ESMTPSA id
	16-v6sm663665pfo.164.2018.08.16.17.35.38
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 16 Aug 2018 17:35:39 -0700 (PDT)
To: openembedded-core@lists.openembedded.org
References: <cover.1534415298.git.Qi.Chen@windriver.com>
	<ff26a8565e39359ed0247b3c12bfd80eb6021223.1534415298.git.Qi.Chen@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=raj.khem@gmail.com; prefer-encrypt=mutual; keydata=
	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
Organization: HIMVIS LLC
Message-ID: <b0654a3c-4456-73d8-3019-b500cc50742b@gmail.com>
Date: Thu, 16 Aug 2018 17:35:33 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:60.0)
	Gecko/20100101 Thunderbird/60.0
MIME-Version: 1.0
In-Reply-To: <ff26a8565e39359ed0247b3c12bfd80eb6021223.1534415298.git.Qi.Chen@windriver.com>
Subject: Re: [PATCH 1/1] glibc: re-package for libnss-db
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
X-List-Received-Date: Fri, 17 Aug 2018 00:35:39 -0000
X-Groupsio-MsgNum: 114841
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="0nnZ6BwctFPf5WQvLROWyHGfp7UKxQX2d"

--0nnZ6BwctFPf5WQvLROWyHGfp7UKxQX2d
Content-Type: multipart/mixed; boundary="5VHiuwjezfZZfcTtegTdTJ5hkEO0Q4UMF";
 protected-headers="v1"
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Message-ID: <b0654a3c-4456-73d8-3019-b500cc50742b@gmail.com>
Subject: Re: [OE-core] [PATCH 1/1] glibc: re-package for libnss-db
References: <cover.1534415298.git.Qi.Chen@windriver.com>
 <ff26a8565e39359ed0247b3c12bfd80eb6021223.1534415298.git.Qi.Chen@windriver.com>
In-Reply-To: <ff26a8565e39359ed0247b3c12bfd80eb6021223.1534415298.git.Qi.Chen@windriver.com>

--5VHiuwjezfZZfcTtegTdTJ5hkEO0Q4UMF
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable



On 8/16/18 3:37 AM, Chen Qi wrote:
> On other distros like ubuntu/centos, libnss-db usually provides:
> - The libraries
> - The Makefile to create database
>   (in /var/db for centos, /var/lib/misc/ for ubuntu)
> - The makedb command (it's in glibc-common for centos7)
>=20
> What we had is:
> - The libraries are in glibc-extra-nss
> - The Makefile is removed
> - The makedb command is in glibc-utils (lack of dependency)
>=20
> So when glibc-extra-nss is installed but glibc-utils is not,
> we see error like:
> nscd[165]: 165 checking for monitored file `/var/db/group.db': No such =
file or directory
> nscd[165]: 165 checking for monitored file `/var/db/passwd.db': No such=
 file or directory
>=20
> And there is not an easy way to create these databases.
>=20
> To fix the issue:
> - Re-package the libraries into libnss-db
> - Don't remove the Makefile and add it in libnss-db
> - Add RDEPENDS for libnss-db on glibc-utils
> - Provide a shell script, makedbs.sh, to generate the db files.
>   This is to avoid dependency on 'make'.
>=20
> Notes:
> 1. For external toolchain, an extra package 'libnss-db' need to be prov=
ided
>    If replacing glibc from core.
> 2. I've check the git history of nss/db-Makefile, the last two function=
ality
>    fix is as below.
>    - fix non-portable `echo -n` usage   --  Date:   Thu Aug 6 04:14:20 =
2015 -0400
>    - Fix db makefile rule for group.db  --  Date:   Fri Nov 11 14:43:36=
 2011 +0100
>    So I think this file is stable enough. And using makedbs.sh which is=
 crafted according
>    to that file is not likely to cause maintanence problem.


using a shell script instead of Makefile is worthwhile change to submit
upstream. Please go ahead and submit it to glibc mailing lists.

Overall the changes look ok to me.
>=20
> Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>  meta/recipes-core/glibc/glibc-package.inc |   6 +-
>  meta/recipes-core/glibc/glibc/makedbs.sh  | 177 ++++++++++++++++++++++=
++++++++
>  meta/recipes-core/glibc/glibc_2.28.bb     |   1 +
>  3 files changed, 182 insertions(+), 2 deletions(-)
>  create mode 100755 meta/recipes-core/glibc/glibc/makedbs.sh
>=20
> diff --git a/meta/recipes-core/glibc/glibc-package.inc b/meta/recipes-c=
ore/glibc/glibc-package.inc
> index 07ce75d..9ea41b7 100644
> --- a/meta/recipes-core/glibc/glibc-package.inc
> +++ b/meta/recipes-core/glibc/glibc-package.inc
> @@ -1,6 +1,6 @@
>  INHIBIT_SYSROOT_STRIP =3D "1"
> =20
> -PACKAGES =3D "${PN}-dbg catchsegv sln nscd ldd tzcode glibc-thread-db =
${PN}-pic libcidn libmemusage libsegfault ${PN}-pcprofile libsotruss ${PN=
} ${PN}-utils glibc-extra-nss ${PN}-dev ${PN}-staticdev ${PN}-doc"
> +PACKAGES =3D "${PN}-dbg catchsegv sln nscd ldd tzcode glibc-thread-db =
${PN}-pic libcidn libmemusage libnss-db libsegfault ${PN}-pcprofile libso=
truss ${PN} ${PN}-utils glibc-extra-nss ${PN}-dev ${PN}-staticdev ${PN}-d=
oc"
> =20
>  # The ld.so in this glibc supports the GNU_HASH
>  RPROVIDES_${PN} =3D "eglibc rtld(GNU_HASH)"
> @@ -23,6 +23,8 @@ FILES_ldd =3D "${bindir}/ldd"
>  FILES_libsegfault =3D "${base_libdir}/libSegFault*"
>  FILES_libcidn =3D "${base_libdir}/libcidn-*.so ${base_libdir}/libcidn.=
so.*"
>  FILES_libmemusage =3D "${base_libdir}/libmemusage.so"
> +FILES_libnss-db =3D "${base_libdir}/libnss_db.so.* ${base_libdir}/libn=
ss_db-*.so ${localstatedir}/db/Makefile ${localstatedir}/db/makedbs.sh"
> +RDEPENDS_libnss-db =3D "${PN}-utils"
>  FILES_glibc-extra-nss =3D "${base_libdir}/libnss_*-*.so ${base_libdir}=
/libnss_*.so.*"
>  FILES_sln =3D "${base_sbindir}/sln"
>  FILES_${PN}-pic =3D "${libdir}/*_pic.a ${libdir}/*_pic.map ${libdir}/l=
ibc_pic/*.o"
> @@ -59,7 +61,6 @@ inherit libc-common multilib_header
> =20
>  do_install_append () {
>  	rm -f ${D}${sysconfdir}/localtime
> -	rm -rf ${D}${localstatedir}
> =20
>  	# remove empty glibc dir
>  	if [ -d ${D}${libexecdir} ]; then
> @@ -95,6 +96,7 @@ do_install_append () {
>  	install -d ${D}${localstatedir}/db/nscd
>  	install -m 0755 ${S}/nscd/nscd.init ${D}${sysconfdir}/init.d/nscd
>  	install -m 0755 ${S}/nscd/nscd.conf ${D}${sysconfdir}/nscd.conf
> +	install -m 0755 ${WORKDIR}/makedbs.sh ${D}${localstatedir}/db
>  	sed -i "s%daemon%start-stop-daemon --start --exec%g" ${D}${sysconfdir=
}/init.d/nscd
>  	sed -i "s|\(enable-cache\t\+netgroup\t\+\)yes|\1no|" ${D}${sysconfdir=
}/nscd.conf
> =20
> diff --git a/meta/recipes-core/glibc/glibc/makedbs.sh b/meta/recipes-co=
re/glibc/glibc/makedbs.sh
> new file mode 100755
> index 0000000..7d51a67
> --- /dev/null
> +++ b/meta/recipes-core/glibc/glibc/makedbs.sh
> @@ -0,0 +1,177 @@
> +#!/bin/sh
> +
> +#
> +# Make passwd.db, group.db, etc.
> +#
> +
> +VAR_DB=3D/var/db
> +
> +# Use make if available
> +if [ -x /usr/bin/make -o -x /bin/make ]; then
> +	make -C $VAR_DB
> +	exit 0
> +fi
> +
> +# No make available, do it in hard way
> +
> +# passwd.db
> +if [ -e /etc/passwd ]; then
> +target=3D$VAR_DB/passwd.db
> +echo -n "passwd... "
> +awk 'BEGIN { FS=3D":"; OFS=3D":" } \
> + /^[ \t]*$$/ { next } \
> + /^[ \t]*#/ { next } \
> + /^[^#]/ { printf ".%s ", $$1; print; \
> +	   printf "=3D%s ", $$3; print }' /etc/passwd | \
> +makedb --quiet -o $target -
> +echo "done."
> +fi
> +
> +# group.db
> +if [ -e /etc/group ]; then
> +target=3D$VAR_DB/group.db
> +echo -n "group... "
> +awk 'BEGIN { FS=3D":"; OFS=3D":" } \
> + /^[ \t]*$$/ { next } \
> + /^[ \t]*#/ { next } \
> + /^[^#]/ { printf ".%s ", $$1; print; \
> +	   printf "=3D%s ", $$3; print; \
> +	   if ($$4 !=3D "") { \
> +	     split($$4, grmems, ","); \
> +	     for (memidx in grmems) { \
> +	       mem=3Dgrmems[memidx]; \
> +	       if (members[mem] =3D=3D "") \
> +		 members[mem]=3D$$3; \
> +	       else \
> +		 members[mem]=3Dmembers[mem] "," $$3; \
> +	     } \
> +	     delete grmems; } } \
> + END { for (mem in members) \
> +	 printf ":%s %s %s\n", mem, mem, members[mem]; }' /etc/group | \
> +makedb --quiet -o $target -
> +echo "done."
> +fi
> +
> +# ethers.db
> +if [ -e /etc/ethers ]; then
> +target=3D$VAR_DB/ethers.db
> +echo -n "ethers... "
> +awk '/^[ \t]*$$/ { next } \
> + /^[ \t]*#/ { next } \
> + /^[^#]/ { printf ".%s ", $$1; print; \
> +	   printf "=3D%s ", $$2; print }' /etc/ethers | \
> +makedb --quiet -o $target -
> +echo "done."
> +fi
> +
> +# protocols.db
> +if [ -e /etc/protocols ]; then
> +target=3D$VAR_DB/protocols.db
> +echo -n "protocols... "
> +awk '/^[ \t]*$$/ { next } \
> + /^[ \t]*#/ { next } \
> + /^[^#]/ { printf ".%s ", $$1; print; \
> +	   printf "=3D%s ", $$2; print; \
> +	   for (i =3D 3; i <=3D NF && !($$i ~ /^#/); ++i) \
> +	     { printf ".%s ", $$i; print } }' /etc/protocols | \
> +makedb --quiet -o $target -
> +echo "done."
> +fi
> +
> +# rpc.db
> +if [ -e /etc/rpc ]; then
> +target=3D$VAR_DB/rpc.db
> +echo -n "rpc... "
> +awk '/^[ \t]*$$/ { next } \
> + /^[ \t]*#/ { next } \
> + /^[^#]/ { printf ".%s ", $$1; print; \
> +	   printf "=3D%s ", $$2; print; \
> +	   for (i =3D 3; i <=3D NF && !($$i ~ /^#/); ++i) \
> +	     { printf ".%s ", $$i; print } }' /etc/rpc | \
> +makedb --quiet -o $target -
> +echo "done."
> +fi
> +
> +# services.db
> +if [ -e /etc/services ]; then
> +target=3D$VAR_DB/services.db
> +echo -n "services... "
> +awk 'BEGIN { FS=3D"[ \t/]+" } \
> + /^[ \t]*$$/ { next } \
> + /^[ \t]*#/ { next } \
> + /^[^#]/ { sub(/[ \t]*#.*$$/, "");\
> +	   printf ":%s/%s ", $$1, $$3; print; \
> +	   printf ":%s/ ", $$1; print; \
> +	   printf "=3D%s/%s ", $$2, $$3; print; \
> +	   printf "=3D%s/ ", $$2; print; \
> +	   for (i =3D 4; i <=3D NF && !($$i ~ /^#/); ++i) \
> +	     { printf ":%s/%s ", $$i, $$3; print; \
> +	       printf ":%s/ ", $$i; print } }' /etc/services | \
> +makedb --quiet -o $target -
> +echo "done."
> +fi
> +
> +# shadow.db
> +if [ -e /etc/shadow ]; then
> +target=3D$VAR_DB/shadow.db
> +echo -n "shadow... "
> +awk 'BEGIN { FS=3D":"; OFS=3D":" } \
> + /^[ \t]*$$/ { next } \
> + /^[ \t]*#/ { next } \
> + /^[^#]/ { printf ".%s ", $$1; print }' /etc/shadow | \
> +(umask 077 && makedb --quiet -o $target -)
> +echo "done."
> +if chgrp shadow $target 2>/dev/null; then
> +	chmod g+r $target
> +else
> +	chown 0 $target; chgrp 0 $target; chmod 600 $target;
> +	echo
> +	echo "Warning: The shadow password database $target"
> +	echo "has been set to be readable only by root.  You may want"
> +	echo "to make it readable by the \`shadow' group depending"
> +	echo "on your configuration."
> +	echo
> +fi
> +fi
> +
> +# gshadow.db
> +if [ -e /etc/gshadow ]; then
> +target=3D$VAR_DB/gshadow.db
> +echo -n "gshadow... "
> +awk 'BEGIN { FS=3D":"; OFS=3D":" } \
> + /^[ \t]*$$/ { next } \
> + /^[ \t]*#/ { next } \
> + /^[^#]/ { printf ".%s ", $$1; print }' /etc/gshadow | \
> +(umask 077 && makedb --quiet -o $target -)
> +echo "done."
> +if chgrp shadow $target 2>/dev/null; then
> +	chmod g+r $target
> +else
> +	chown 0 $target; chgrp 0 $target; chmod 600 $target
> +	echo
> +	echo "Warning: The shadow group database $target"
> +	echo "has been set to be readable only by root.  You may want"
> +	echo "to make it readable by the \`shadow' group depending"
> +	echo "on your configuration."
> +	echo
> +fi
> +fi
> +
> +# netgroup.db
> +if [ -e /etc/netgroup ]; then
> +target=3D$VAR_DB/netgroup.db
> +echo -n "netgroup... "
> +awk 'BEGIN { ini=3D1 } \
> + /^[ \t]*$$/ { next } \
> + /^[ \t]*#/ { next } \
> + /^[^#]/ { if (sub(/[ \t]*\\$$/, " ") =3D=3D 0) end=3D"\n"; \
> +	   else end=3D""; \
> +	   gsub(/[ \t]+/, " "); \
> +	   sub(/^[ \t]*/, ""); \
> +	   if (ini =3D=3D 0) printf "%s%s", $$0, end; \
> +	   else printf ".%s %s%s", $$1, $$0, end; \
> +	   ini=3Dend =3D=3D "" ? 0 : 1; } \
> + END { if (ini=3D=3D0) printf "\n" }' /etc/netgroup | \
> +makedb --quiet -o $target
> +echo "done."
> +fi
> diff --git a/meta/recipes-core/glibc/glibc_2.28.bb b/meta/recipes-core/=
glibc/glibc_2.28.bb
> index 95e333d..0ebbaf9 100644
> --- a/meta/recipes-core/glibc/glibc_2.28.bb
> +++ b/meta/recipes-core/glibc/glibc_2.28.bb
> @@ -17,6 +17,7 @@ UPSTREAM_CHECK_GITTAGREGEX =3D "(?P<pver>\d+\.\d+(\.(=
?!90)\d+)*)"
>  SRC_URI =3D "${GLIBC_GIT_URI};branch=3D${SRCBRANCH};name=3Dglibc \
>             file://etc/ld.so.conf \
>             file://generate-supported.mk \
> +           file://makedbs.sh \
>             \
>             ${NATIVESDKFIXES} \
>             file://0006-fsl-e500-e5500-e6500-603e-fsqrt-implementation.=
patch \
>=20


--5VHiuwjezfZZfcTtegTdTJ5hkEO0Q4UMF--

--0nnZ6BwctFPf5WQvLROWyHGfp7UKxQX2d
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQSPpVvapDR0rgZCCc27BTNVkZ0zFAUCW3YYVQAKCRC7BTNVkZ0z
FNVWAJ9UyaqSMpZ/q7SMFU3FI9/M3uUS+gCfbm22fmvILIdh8UxVvdkM/z4oAW0=
=abdr
-----END PGP SIGNATURE-----

--0nnZ6BwctFPf5WQvLROWyHGfp7UKxQX2d--
