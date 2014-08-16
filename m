Return-Path: <martin.jansa@gmail.com>
Received: from mail-lb0-f171.google.com (mail-lb0-f171.google.com
	[209.85.217.171])
	by mail.openembedded.org (Postfix) with ESMTP id 3CF4060424
	for <openembedded-core@lists.openembedded.org>;
	Sat, 16 Aug 2014 18:21:10 +0000 (UTC)
Received: by mail-lb0-f171.google.com with SMTP id l4so2941246lbv.16
	for <openembedded-core@lists.openembedded.org>;
	Sat, 16 Aug 2014 11:21:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=qdxvf0lBcJteazCk8WVnA8v2qMgUDm4fTdqzbASgvVg=;
	b=IPU6HXLnVb3HMpC9IjrBCLSqss0wJg3FdiF6NiHPQPpgs1nekmywna7kE2qQZh5zPc
	Ev+krIVnvvO0V2t4Rqc9986BX9CGJPXC2s3PdkjdEovbCBezVG/Ax8YSBN2tm5bMPLkA
	ZedPrIrLvJd0vTqUm9P8EckEDB+oh6rzHOAdMYRpnYR5OYCv/h7xQuIYYHxDrFmWiCFl
	qJ/cOzRWVavok8YqDO7sWtTiPyqFOq/9zfOLAsaas7lIeQMg+hSPhCEIviX4SwmW1/7w
	y5r182g9lom5wQx3fijfTxWjzAPj2A3Ay/dYGEb5wmqxJ2Jvl1hdiAIVE9HMe49fxlYd
	iArw==
X-Received: by 10.152.205.35 with SMTP id ld3mr18719062lac.48.1408213271395;
	Sat, 16 Aug 2014 11:21:11 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	f9sm18522458lbd.46.2014.08.16.11.21.10
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 16 Aug 2014 11:21:10 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Sat, 16 Aug 2014 20:21:09 +0200
To: openembedded-core@lists.openembedded.org
Message-ID: <20140816182109.GC3660@jama>
References: <1406294138-31362-1-git-send-email-Martin.Jansa@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1406294138-31362-1-git-send-email-Martin.Jansa@gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [PATCH] buildhistory: rename build-id to build-id.txt and add more info
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
X-List-Received-Date: Sat, 16 Aug 2014 18:21:11 -0000
X-Groupsio-MsgNum: 56614
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="aT9PWwzfKXlsBJM1"
Content-Disposition: inline

--aT9PWwzfKXlsBJM1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 25, 2014 at 03:15:38PM +0200, Martin Jansa wrote:
> * use .txt extension like other reports (e.g. image-info.txt) it's
>   also useful when looking at the file from web server which doesn't
>   have text/plain as default content-type
> * include whole BUILDCFG_HEADER/BUILDCFG_FUNCS instead of just layer
>   info
> * this makes it easier for distro to include more fields without the
>   need to modify buildhistory.bbclass
> * currently it adds following fields:
>   Build Configuration:
>   BB_VERSION        =3D "1.23.1"
>   BUILD_SYS         =3D "x86_64-linux"
>   NATIVELSBSTRING   =3D "Gentoo-2.2"
>   TARGET_SYS        =3D "x86_64-oe-linux"
>   MACHINE           =3D "qemux86-64"
>   DISTRO            =3D "shr"
>   DISTRO_VERSION    =3D "2013.07-next-20140725"
>   TUNE_FEATURES     =3D "m64 core2"
>   TARGET_FPU        =3D ""

ping

>=20
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  meta/classes/buildhistory.bbclass | 26 ++++++++++++++++++--------
>  1 file changed, 18 insertions(+), 8 deletions(-)
>=20
> diff --git a/meta/classes/buildhistory.bbclass b/meta/classes/buildhistor=
y.bbclass
> index 20382ce..479e460 100644
> --- a/meta/classes/buildhistory.bbclass
> +++ b/meta/classes/buildhistory.bbclass
> @@ -461,10 +461,10 @@ END
>  	echo "IMAGESIZE =3D $imagesize" >> ${BUILDHISTORY_DIR_IMAGE}/image-info=
=2Etxt
> =20
>  	# Add some configuration information
> -	echo "${MACHINE}: ${IMAGE_BASENAME} configured for ${DISTRO} ${DISTRO_V=
ERSION}" > ${BUILDHISTORY_DIR_IMAGE}/build-id
> +	echo "${MACHINE}: ${IMAGE_BASENAME} configured for ${DISTRO} ${DISTRO_V=
ERSION}" > ${BUILDHISTORY_DIR_IMAGE}/build-id.txt
> =20
> -	cat >> ${BUILDHISTORY_DIR_IMAGE}/build-id <<END
> -${@buildhistory_get_layers(d)}
> +	cat >> ${BUILDHISTORY_DIR_IMAGE}/build-id.txt <<END
> +${@buildhistory_get_build_id(d)}
>  END
>  }
> =20
> @@ -498,11 +498,21 @@ POPULATE_SDK_POST_HOST_COMMAND_append =3D " buildhi=
story_list_installed_sdk_host ;
> =20
>  SDK_POSTPROCESS_COMMAND +=3D "buildhistory_get_sdkinfo ; "
> =20
> -def buildhistory_get_layers(d):
> -    if d.getVar('BB_WORKERCONTEXT', True) !=3D '1':
> -        return ""
> -    layertext =3D "Configured metadata layers:\n%s\n" % '\n'.join(get_la=
yers_branch_rev(d))
> -    return layertext
> +def buildhistory_get_build_id(d):
> +    localdata =3D bb.data.createCopy(d)
> +    bb.data.update_data(localdata)
> +    statuslines =3D []
> +    for func in oe.data.typed_value('BUILDCFG_FUNCS', localdata):
> +        g =3D globals()
> +        if func not in g:
> +            bb.warn("Build configuration function '%s' does not exist" %=
 func)
> +        else:
> +            flines =3D g[func](localdata)
> +            if flines:
> +                statuslines.extend(flines)
> +
> +    statusheader =3D d.getVar('BUILDCFG_HEADER', True)
> +    return('\n%s\n%s\n' % (statusheader, '\n'.join(statuslines)))
> =20
>  def buildhistory_get_metadata_revs(d):
>      # We want an easily machine-readable format here, so get_layers_bran=
ch_rev isn't quite what we want
> --=20
> 2.0.2
>=20

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--aT9PWwzfKXlsBJM1
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlPvoRUACgkQN1Ujt2V2gByzjwCePNOigMufJTULUwaIkh36qnst
PsYAn2G65etazX9FPrkw71oGvZzk+NGn
=XhFU
-----END PGP SIGNATURE-----

--aT9PWwzfKXlsBJM1--
