Received: from mail-wg0-f45.google.com ([74.125.82.45])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>)
	id 1TzEbu-0008Tg-HS; Sat, 26 Jan 2013 23:52:38 +0100
Received: by mail-wg0-f45.google.com with SMTP id dq12so1002052wgb.24
	for <multiple recipients>; Sat, 26 Jan 2013 14:36:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=MRB7hDXwZPr2veLV69Kfo+wswUruDjoFkiUz29HXoXs=;
	b=hVXQCmwht1rDEj2v+rWIbneVOY9AaLfQPATpyyx0AoqVF16j0gDTD8a0iW7bD2ExEg
	AVoT9874zMuO7susglhEkvFPZ238x/kerN+83+9Y2J0Ca31dL14yrHJvF52+IzIc+Se8
	1pLcG43hEVao+wNoCdvwFqh7XsFABNplPavBbV+uTig7vAht6D0dgq3GJhSmV91pYjDg
	kvtMt5YG26lWPqP9m1TcW5ClkwS8BHJZPZdU7oT2JbBcwMC0eDkKinUgvcL/CY3Ysjww
	wAm5G3hMg0sKRlVoOGTDkTZNOGswoF1LmFXdixcPbPtF40gY4h2FmcJenPMZG3zW9Ym7
	8ing==
X-Received: by 10.194.119.5 with SMTP id kq5mr14694975wjb.48.1359239814596;
	Sat, 26 Jan 2013 14:36:54 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id eo10sm5273757wib.9.2013.01.26.14.36.53
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Sat, 26 Jan 2013 14:36:53 -0800 (PST)
Date: Sat, 26 Jan 2013 23:36:55 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org,
	Constantin Musca <constantinx.musca@intel.com>
Message-ID: <20130126223655.GK16904@jama.palm1.palmone.com>
References: <20130122160542.D7B3110368@opal>
MIME-Version: 1.0
In-Reply-To: <20130122160542.D7B3110368@opal>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-commits@lists.openembedded.org
Subject: Re: [oe-commits] Constantin Musca : prserv: add LOCALCOUNT to AUTOINCs migration feature
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 26 Jan 2013 22:52:38 -0000
X-List-Received-Date: Sat, 26 Jan 2013 22:52:38 -0000
X-Groupsio-MsgNum: 34502
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="mPOSj6iWmtyhwOMz"
Content-Disposition: inline

--mPOSj6iWmtyhwOMz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 22, 2013 at 04:05:42PM +0000, git@git.openembedded.org wrote:
> Module: openembedded-core.git
> Branch: master
> Commit: ffab86f13cafb10d8d6273b6af8cd9a3c84eae20
> URL:    http://git.openembedded.org/?p=3Dopenembedded-core.git&a=3Dcommit=
;h=3Dffab86f13cafb10d8d6273b6af8cd9a3c84eae20
>=20
> Author: Constantin Musca <constantinx.musca@intel.com>
> Date:   Tue Jan 22 11:39:30 2013 +0200
>=20
> prserv: add LOCALCOUNT to AUTOINCs migration feature
>=20
> - use migrate_localcount.bbclass to generate AUTOINC entries
> which are exported to LOCALCOUNT_DUMPFILE
> - import the generated AUTOINC entries
> - one can migrate LOCALCOUNT to AUTOINC by executing:
>     bitbake-prserv-tool migrate_localcount

It probably does not work correctly with recipes with bumped PE

Summary: There were 266 ERROR messages shown, returning a non-zero exit cod=
e.

ERROR: Package version for package libphone-ui-shr-locale-sv went
backwards which would break package feeds from
(1:0.0.1+gitr19+6dde9f5ed47f7e102866b55bcc2b8512708f7adb-r2 to
1:0.0.1+gitr0+6dde9f5ed47f7e102866b55bcc2b8512708f7adb-r2.0)

sqlite> select * from PRMAIN_nohist where version like
'%libphone-ui-shr%';
AUTOINC-libphone-ui-shr-0.0.1+gitr|cortexa8-vfp-neon|AUTOINC+6dde9f5ed47f7e=
102866b55bcc2b8512708f7adb|20
AUTOINC-libphone-ui-shr-0.0.1+gitr|x86_64|AUTOINC+6dde9f5ed47f7e102866b55bc=
c2b8512708f7adb|20
AUTOINC-libphone-ui-shr-0.0.1+gitr|arm920tt|AUTOINC+6dde9f5ed47f7e102866b55=
bcc2b8512708f7adb|20
AUTOINC-libphone-ui-shr-0.0.1+gitr|xscalete|AUTOINC+6dde9f5ed47f7e102866b55=
bcc2b8512708f7adb|20
AUTOINC-libphone-ui-shr-1_0.0.1+gitr|cortexa8-vfp-neon|AUTOINC+6dde9f5ed47f=
7e102866b55bcc2b8512708f7adb|0
libphone-ui-shr-1_0.0.1+gitrAUTOINC+6dde9f5ed47f7e102866b55bcc2b8512708f7ad=
b-r2|cortexa8-vfp-neon|3c197dcf167bb6820407d32c26930bc2|0

ERROR: Package version for package mkdump went backwards which would
break package feeds from
(2:1.0.0+gitr49+fd67082900ca1dc04e6fc827d05ad4106a1c838e-r5.0 to
2:1.0.0+gitr0+fd67082900ca1dc04e6fc827d05ad4106a1c838e-r5.0.0)

sqlite> select * from PRMAIN_nohist where version like '%mkdump%';
AUTOINC-mkdump-1.0.0+gitr|cortexa8-vfp-neon|AUTOINC+fd67082900ca1dc04e6fc82=
7d05ad4106a1c838e|49
AUTOINC-mkdump-1.0.0+gitr|x86_64|AUTOINC+fd67082900ca1dc04e6fc827d05ad4106a=
1c838e|49
AUTOINC-mkdump-1.0.0+gitr|arm920tt|AUTOINC+fd67082900ca1dc04e6fc827d05ad410=
6a1c838e|49
AUTOINC-mkdump-1.0.0+gitr|xscalete|AUTOINC+fd67082900ca1dc04e6fc827d05ad410=
6a1c838e|49
AUTOINC-mkdump-2_1.0.0+gitr|cortexa8-vfp-neon|AUTOINC+fd67082900ca1dc04e6fc=
827d05ad4106a1c838e|0
mkdump-2_1.0.0+gitrAUTOINC+fd67082900ca1dc04e6fc827d05ad4106a1c838e-r5.0|co=
rtexa8-vfp-neon|7fadf9af56aa317c2644c62541eefd62|0

=2E...

Regards,

>=20
> [YOCTO #3071]
>=20
> Signed-off-by: Constantin Musca <constantinx.musca@intel.com>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>=20
> ---
>=20
>  meta/classes/migrate_localcount.bbclass |   47 +++++++++++++++++++++++++=
++++++
>  meta/conf/migrate_localcount.conf       |    1 +
>  scripts/bitbake-prserv-tool             |   32 +++++++++++++++++++++
>  3 files changed, 80 insertions(+), 0 deletions(-)
>=20
> diff --git a/meta/classes/migrate_localcount.bbclass b/meta/classes/migra=
te_localcount.bbclass
> new file mode 100644
> index 0000000..59f14e8
> --- /dev/null
> +++ b/meta/classes/migrate_localcount.bbclass
> @@ -0,0 +1,47 @@
> +PRSERV_DUMPDIR ??=3D "${LOG_DIR}/db"
> +LOCALCOUNT_DUMPFILE ??=3D "${PRSERV_DUMPDIR}/prserv-localcount-exports.i=
nc"
> +
> +python migrate_localcount_handler () {
> +    import bb.event
> +    if not e.data:
> +        return
> +
> +    if isinstance(e, bb.event.RecipeParsed):
> +        pv =3D e.data.getVar('PV', True)
> +        if not 'AUTOINC' in pv:
> +            return
> +
> +        localcounts =3D bb.persist_data.persist('BB_URI_LOCALCOUNT', e.d=
ata)
> +        pn =3D e.data.getVar('PN', True)
> +        revs =3D localcounts.get_by_pattern('%%-%s_rev' % pn)
> +        counts =3D localcounts.get_by_pattern('%%-%s_count' % pn)
> +        if not revs or not counts:
> +            return
> +
> +        srcrev =3D bb.fetch2.get_srcrev(e.data)
> +        bpv =3D pv[:pv.find(srcrev)]
> +
> +        if len(revs) !=3D len(counts):
> +            bb.warn("The number of revs and localcounts don't match in %=
s" % pn)
> +            return
> +
> +        version =3D 'AUTOINC-%s-%s' % (pn, bpv)
> +        pkgarch =3D e.data.getVar('PACKAGE_ARCH', True)
> +        value =3D max(int(count) for count in counts)
> +
> +        if len(revs) =3D=3D 1:
> +            if srcrev !=3D ('AUTOINC+%s' % revs[0]):
> +                value +=3D 1
> +        else:
> +            value +=3D 1
> +
> +        bb.utils.mkdirhier(e.data.getVar('PRSERV_DUMPDIR', True))
> +        df =3D e.data.getVar('LOCALCOUNT_DUMPFILE', True)
> +        flock =3D bb.utils.lockfile("%s.lock" % df)
> +        with open(df, 'a') as fd:
> +            fd.write('PRAUTO$%s$%s$%s =3D "%s"\n' %
> +                    (version, pkgarch, srcrev, str(value)))
> +        bb.utils.unlockfile(flock)
> +}
> +
> +addhandler migrate_localcount_handler
> diff --git a/meta/conf/migrate_localcount.conf b/meta/conf/migrate_localc=
ount.conf
> new file mode 100644
> index 0000000..e486e03
> --- /dev/null
> +++ b/meta/conf/migrate_localcount.conf
> @@ -0,0 +1 @@
> +INHERIT +=3D "migrate_localcount"
> diff --git a/scripts/bitbake-prserv-tool b/scripts/bitbake-prserv-tool
> index f3855df..4654e6d 100755
> --- a/scripts/bitbake-prserv-tool
> +++ b/scripts/bitbake-prserv-tool
> @@ -47,6 +47,35 @@ do_import ()
>      return $ret
>  }
> =20
> +do_migrate_localcount ()
> +{
> +    df=3D`bitbake -R conf/migrate_localcount.conf -e | \
> +                grep ^LOCALCOUNT_DUMPFILE=3D | cut -f2 -d\"`
> +    if [ "x${df}" =3D=3D "x" ];
> +    then
> +        echo "LOCALCOUNT_DUMPFILE is not defined!"
> +        return 1
> +    fi
> +
> +    rm -rf $df
> +    clean_cache
> +    echo "Exporting LOCALCOUNT to AUTOINCs..."
> +    bitbake -R conf/migrate_localcount.conf -p
> +    [ ! $? -eq 0 ] && echo "Exporting failed!" && exit 1
> +
> +    echo "Importing generated AUTOINC entries..."
> +    [ -e $df ] && do_import $df
> +
> +    if [ ! $? -eq 0 ]
> +    then
> +        echo "Migration from LOCALCOUNT to AUTOINCs failed!"
> +        return 1
> +    fi
> +
> +    echo "Migration from LOCALCOUNT to AUTOINCs succeeded!"
> +    return 0
> +}
> +
>  [ $# -eq 0 ] && help  && exit 1
> =20
>  case $1 in
> @@ -56,6 +85,9 @@ export)
>  import)
>      do_import $2
>      ;;
> +migrate_localcount)
> +    do_migrate_localcount
> +    ;;
>  *)
>      help
>      exit 1
>=20
>=20
> _______________________________________________
> Openembedded-commits mailing list
> Openembedded-commits@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-commits

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--mPOSj6iWmtyhwOMz
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlEEWocACgkQN1Ujt2V2gBwJ8wCggZWJoijed/ZAjgz0BkKmcE7Q
Ou0AoICL/KSxLNf9ITlGXiNmGXHefK+X
=wNgB
-----END PGP SIGNATURE-----

--mPOSj6iWmtyhwOMz--
