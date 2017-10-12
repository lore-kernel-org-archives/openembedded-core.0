Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id CEF2671C7A;
	Thu, 12 Oct 2017 01:53:07 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id t69so9053054wmt.2;
	Wed, 11 Oct 2017 18:53:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=UBIi4WvKMnmoGHKHWFqmyaHzKFmNA2ITlbezWwCH3Ig=;
	b=YRxcrmPTFwkagwhRCpsASffnOAx63kR6ZI1qVpr5cMQfmxUCzUHXUw5waDHRDuwHXB
	+SgEyOWFBnqy6LLRwvdf/R4gt2/x/zizJm1rk3fQ+VolUpaUFA5GPt09z0Fr+uWH5BZP
	mKZFlGN5cUSokov+CHupQyAWZmZNDMuVjzZgRI1Lww1je1vvE3r823X6GSSbLQ31CHqI
	rcbYXDSjREmvld5+gnu+FDfihZk02AnC6pgaS8mkO/mmGQR2eNYSmBSP44Ug69BczyDP
	bmDeqsTDnQ1FJdTsC19wCsU/XRuscYElxqVeYIwLr8ODPbZ8jnL7BCTK4OiPdMMOypv3
	B0xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=UBIi4WvKMnmoGHKHWFqmyaHzKFmNA2ITlbezWwCH3Ig=;
	b=dmDpk1aO9UMhdywQqUR7EvS29pIoNaqDstqlRIOP8MbNCXYMAA+cfevG65h64/qVV8
	4S/IvIozWppSmR9j177KoVbSSVamlpeet+u3VQoYerHqpk2Nwo6aB89gvaT7y4mVELut
	0LlPMlq/VkaPRRgzuX0tUs+MafQoOlpE+tC9KUq3pSpmP4CDmcNy81cycwrhRJLk7xFD
	7BRoX30O1nUH9yCXbNDswTxSyDNSkuHLvW4ABZtoRHyHHVOEhf13HdUxoCY6836HvdFM
	kEcuzDE7cC2w0NIGdO/tFkrYhaFpynuxuv7yH+fCvRATwPwTOLuJvnxjhbEumq7xubPV
	yL8g==
X-Gm-Message-State: AMCzsaX3o7xbWpC60wNDl/h22T77VVne254ci/g5e2UzX4iiB3kUw6EO
	7o3+BT2N+COLKV7mqkJtkFPSfA==
X-Google-Smtp-Source: AOwi7QB2gufCmb3MbI8tZ57nPcJUaurqHrK9yCEHuNG+buz1KY0j0Gs+OWIpfngi5uDly1TbFS6ihQ==
X-Received: by 10.28.232.138 with SMTP id f10mr465578wmi.130.1507773188594;
	Wed, 11 Oct 2017 18:53:08 -0700 (PDT)
Received: from localhost ([217.30.68.212])
	by smtp.gmail.com with ESMTPSA id 5sm6262125wrt.59.2017.10.11.18.53.07
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 11 Oct 2017 18:53:07 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 12 Oct 2017 03:56:09 +0200
To: openembedded-core@lists.openembedded.org, Chen Qi <Qi.Chen@windriver.com>
Message-ID: <20171012015609.GA3832@jama>
References: <150754017019.10662.17591818165714630277@git.openembedded.org>
	<20171009090930.73387234938@git.openembedded.org>
MIME-Version: 1.0
In-Reply-To: <20171009090930.73387234938@git.openembedded.org>
User-Agent: Mutt/1.9.1 (2017-09-22)
Cc: openembedded-commits@lists.openembedded.org
Subject: Re: [oe-commits] [openembedded-core] 01/01: bitbake.conf: add tools required by testimage to HOSTTOOLS conditionally
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
X-List-Received-Date: Thu, 12 Oct 2017 01:53:08 -0000
X-Groupsio-MsgNum: 103874
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="HlL+5n6rz5pIUxbD"
Content-Disposition: inline

--HlL+5n6rz5pIUxbD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 09, 2017 at 09:09:31AM +0000, git@git.openembedded.org wrote:
> This is an automated email from the git hooks/post-receive script.
>=20
> rpurdie pushed a commit to branch master
> in repository openembedded-core.
>=20
> commit 8ca61a5464743ff85b6d26886112750d6ddd13e0
> Author: Chen Qi <Qi.Chen@windriver.com>
> AuthorDate: Sat Sep 30 16:15:42 2017 +0800
>=20
>     bitbake.conf: add tools required by testimage to HOSTTOOLS conditiona=
lly
>    =20
>     Add tools required by testimage to HOSTTOOLS only when testimage is
>     inherited. These tools, as described in the comment, are only required
>     by the testimage task. So this change should not have negtive effect.
>     This would also solve build error on hosts which miss some tool such =
as scp.
>    =20
>     Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
>     Signed-off-by: Ross Burton <ross.burton@intel.com>
>     Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  meta/conf/bitbake.conf | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> index 6f53b23..0eefb86 100644
> --- a/meta/conf/bitbake.conf
> +++ b/meta/conf/bitbake.conf
> @@ -484,7 +484,7 @@ HOSTTOOLS +=3D " \
>  "
> =20
>  # Tools needed to run testimage runtime image testing
> -HOSTTOOLS +=3D "ip ping ps scp ssh stty"
> +HOSTTOOLS +=3D "${@['', 'ip ping ps scp ssh stty'][bb.data.inherits_clas=
s('testimage', d)]}"

Shouldn't we include at least ssh by default?

I have some builds where CONNECTIVITY_CHECK_URIS contains private git repo =
(to make sure that users
configured their git + ssh correctly before starting the build) and since t=
his change it fails, because
of missing ssh:

ERROR:  OE-core's config sanity checker detected a potential misconfigurati=
on.
    Either fix the cause of this error or at your own risk disable the chec=
ker (see sanity.conf).
    Following is the list of potential problems / advisories:

    Fetcher failure: Fetch command export PATH=3D"...snip.../hosttools"; ex=
port HOME=3D"/home/jenkins"; git -c core.fsyncobjectfiles=3D0 ls-remote ssh=
://foo.com/bar/repo  failed with exit code 128, output:
error: cannot run ssh: No such file or directory
fatal: unable to fork
=2E
    Please ensure your host's network is configured correctly,
    or set BB_NO_NETWORK =3D "1" to disable network access if
    all required sources are on local disk.

I know I can add ssh locally, but do we really need to be so strict
here? We already include git and git might need ssh.

Regards,

>  # Link to these if present
>  HOSTTOOLS_NONFATAL +=3D "aws ccache gcc-ar gpg ld.bfd ld.gold nc sftp so=
cat sudo"
>=20
> --=20
> To stop receiving notification emails like this one, please contact
> the administrator of this repository.
> --=20
> _______________________________________________
> Openembedded-commits mailing list
> Openembedded-commits@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-commits

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--HlL+5n6rz5pIUxbD
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCWd7LuAAKCRA3VSO3ZXaA
HIHbAJ4ltaRlDXDmi0DdS7V4k/7ikFnK5QCghj54VyerE9YNyhpwqCXJiIy2S3c=
=drdc
-----END PGP SIGNATURE-----

--HlL+5n6rz5pIUxbD--
