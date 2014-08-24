Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f179.google.com (mail-wi0-f179.google.com
	[209.85.212.179])
	by mail.openembedded.org (Postfix) with ESMTP id A54BB60169;
	Sun, 24 Aug 2014 15:56:19 +0000 (UTC)
Received: by mail-wi0-f179.google.com with SMTP id f8so1520467wiw.12
	for <multiple recipients>; Sun, 24 Aug 2014 08:56:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=5eQYlc+oeu2DQovYI/uGrg1W0t6R1vSbOKteSuQM9kU=;
	b=DHvBaLtpiaoJSja8aySBW2nHDDFLOuI1DNbL90x61EurF51+zMm13vAOwxiuVFegan
	mkSTCs/dXEvINeCPIBdL+b15lEnKdb60C/2MYCOGQwNGpzCobY+P3SshzQse3+sdU+TW
	+Z7C6wVI3BNmadsuEh4HBwX83P/1xVjGHkVHPHpDJxrRRYtpJpBauczOr75zdWadn2xi
	I3Mo67xQuNMtr9RbBZUAiZ1vOsKjOfWr0pWqMuafTmccT5SwJ7aCvbLQTTbokUp0X0ZA
	TKEtE/EAmxHX6jE43rOGZHqcod6EjfHPx/mT0nhzcoCUCCHUwDrPwvMUx8Sc500TDBbx
	aBwg==
X-Received: by 10.194.174.4 with SMTP id bo4mr3068973wjc.84.1408895780457;
	Sun, 24 Aug 2014 08:56:20 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	o3sm1931593wik.12.2014.08.24.08.56.18 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 24 Aug 2014 08:56:19 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Sun, 24 Aug 2014 17:56:25 +0200
To: openembedded-core@lists.openembedded.org,
	Robert Yang <liezhi.yang@windriver.com>
Message-ID: <20140824155625.GJ20524@jama>
References: <20140823220223.0DA1E50496@opal.openembedded.org>
MIME-Version: 1.0
In-Reply-To: <20140823220223.0DA1E50496@opal.openembedded.org>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-commits@lists.openembedded.org
Subject: Re: [oe-commits] Robert Yang : sanity.bbclass: check the format of MIRRORS
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
X-List-Received-Date: Sun, 24 Aug 2014 15:56:21 -0000
X-Groupsio-MsgNum: 56876
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="XjbSsFHOHxvQpKib"
Content-Disposition: inline

--XjbSsFHOHxvQpKib
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Aug 23, 2014 at 10:02:23PM +0000, git@git.openembedded.org wrote:
> Module: openembedded-core.git
> Branch: master
> Commit: c8c213bb25b137cf70ba8ce9a45e60065d926735
> URL:    http://git.openembedded.org/?p=3Dopenembedded-core.git&a=3Dcommit=
;h=3Dc8c213bb25b137cf70ba8ce9a45e60065d926735
>=20
> Author: Robert Yang <liezhi.yang@windriver.com>
> Date:   Fri Aug 22 01:31:27 2014 -0700
>=20
> sanity.bbclass: check the format of MIRRORS
>=20
> Check the format of MIRRORS, PREMIRRORS and SSTATE_MIRRORS:
> * Each mirror shoudl contain two memebers.

shoudl -> should

> * The local "file://" url must use absolute path (file:///).
> * The protocol must in protocols list.

must "be"? seems like something is missing

> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>=20
> ---
>=20
>  meta/classes/sanity.bbclass | 33 +++++++++++++++++++++++++++++++++
>  1 file changed, 33 insertions(+)
>=20
> diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
> index 3b40ebe..dbcc26b 100644
> --- a/meta/classes/sanity.bbclass
> +++ b/meta/classes/sanity.bbclass
> @@ -753,6 +753,39 @@ def check_sanity_everybuild(status, d):
>      if oeroot.find(' ') !=3D -1:
>          status.addresult("Error, you have a space in your COREBASE direc=
tory path. Please move the installation to a directory which doesn't includ=
e a space since autotools doesn't support this.")
> =20
> +    # Check the format of MIRRORS, PREMIRRORS and SSTATE_MIRRORS
> +    mir_types =3D ['MIRRORS', 'PREMIRRORS', 'SSTATE_MIRRORS']
> +    protocols =3D ['http://', 'ftp://', 'file://', 'https://', 'https?$:=
//', \
> +        'git://', 'gitsm://', 'hg://', 'osc://', 'p4://', 'svk://', 'svn=
://', \
> +        'bzr://', 'cvs://']
> +    for mir_type in mir_types:
> +        mirros =3D (d.getVar(mir_type, True) or '').split('\\n')

Is the "\n" (followed by actuall line break) really required as separator?

openembedded-core/meta/classes/own-mirrors.bbclass doesn't separate the
entries with "\n".

and bitbake code seems to handle them both:
def mirror_from_string(data):
    return [ i.split() for i in (data or "").replace('\\n','\n').split('\n'=
) if i ]

If you want to unify the format to enforce "\\n" then I think it would
be better to show the warning in bitbake fetcher, not in stanity.bbclass

Also the list of supported protocols would be IMHO better in bitbake fetche=
r module.

> +        for mir in mirros:
> +            mir_list =3D mir.split()
> +            # Should be two members.
> +            if len(mir_list) not in [0, 2]:
> +                bb.warn('Invalid %s: %s, should be 2 members, but found =
%s.' \
> +                    % (mir_type, mir.strip(), len(mir_list)))
> +            elif len(mir_list) =3D=3D 2:
> +                # Each member should start with protocols
> +                valid_protocol_0 =3D False
> +                valid_protocol_1 =3D False
> +                file_absolute =3D True
> +                for protocol in protocols:
> +                    if not valid_protocol_0 and mir_list[0].startswith(p=
rotocol):
> +                        valid_protocol_0 =3D True
> +                    if not valid_protocol_1 and mir_list[1].startswith(p=
rotocol):
> +                        valid_protocol_1 =3D True
> +                        # The file:// must be an absolute path.
> +                        if protocol =3D=3D 'file://' and not mir_list[1]=
=2Estartswith('file:///'):
> +                            file_absolute =3D False
> +                    if valid_protocol_0 and valid_protocol_1:
> +                        break
> +                if not (valid_protocol_0 and valid_protocol_1):
> +                    bb.warn('Invalid protocol in %s: %s' % (mir_type, mi=
r.strip()))
> +                if not file_absolute:
> +                    bb.warn('Invalid file url in %s: %s, must be absolut=
e path (file:///)' % (mir_type, mir.strip()))
> +
>      # Check that TMPDIR hasn't changed location since the last time we w=
ere run
>      tmpdir =3D d.getVar('TMPDIR', True)
>      checkfile =3D os.path.join(tmpdir, "saved_tmpdir")
>=20
> --=20
> _______________________________________________
> Openembedded-commits mailing list
> Openembedded-commits@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-commits

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--XjbSsFHOHxvQpKib
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlP6CykACgkQN1Ujt2V2gBzvlACfbZCCb6Jzx8EjWSjKR6xuV15S
XMQAn0+s7GB6qNSGDOdTnm5HvnSXd+Ua
=ccPY
-----END PGP SIGNATURE-----

--XjbSsFHOHxvQpKib--
