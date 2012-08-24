Received: from mail-wi0-f177.google.com ([209.85.212.177])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1T4nW2-0004OS-UF
	for openembedded-core@lists.openembedded.org;
	Fri, 24 Aug 2012 08:37:10 +0200
Received: by wibhn17 with SMTP id hn17so393671wib.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Aug 2012 23:25:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=N1m5KgJ+jnMUBjPRIr9MXUEC8D3GdM5OpfkOyx7CuFg=;
	b=n86AyHTDELtiIrZdESRExEnGZqAuCK5ykPde4IT7EgKgvMLRrNPZeoS+de0ltekjId
	1S0GHjuoDFju36/5+ZVn1m6T/JrQDZs/hw/cLE/IdQgFc2eMoaKE1OQwXx5JlfLamDfV
	QPA7wXpRaAr9Y5fTRojWcpoviWd606kM1dbQ5/PBZqX1rdeZxdgOh6H/7VfodQM58Bi9
	TtrU+I/n6PmgqL48dyM0eWHULaXOVWjgGQaAbD0jRLH0wsa5ZQgRZsKzHy97FPgaLBWD
	EqdAJgxuhkPFdyFDO4EJ9uMg2QxniU19dJjSFLDVSmsfEb3gAjJFTG2r5Bi6ZyvPSHBT
	rDOA==
Received: by 10.180.86.106 with SMTP id o10mr2827739wiz.22.1345789503848;
	Thu, 23 Aug 2012 23:25:03 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id j6sm4123496wiy.4.2012.08.23.23.25.01
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 23 Aug 2012 23:25:02 -0700 (PDT)
Date: Fri, 24 Aug 2012 08:25:09 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Message-ID: <20120824062509.GR3029@jama.jama.net>
References: <1345747597-18078-1-git-send-email-msm@freescale.com>
	<CAJTo0LZNhPx5Fj59mSnGudsmMQxDxNefZi+98HWuiSqdFoTJdQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJTo0LZNhPx5Fj59mSnGudsmMQxDxNefZi+98HWuiSqdFoTJdQ@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Matthew McClintock <msm@freescale.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] distutils-common-base.bbclass: Pick up additional .debug folders:
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
X-List-Received-Date: Fri, 24 Aug 2012 06:37:11 -0000
X-Groupsio-MsgNum: 28167
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="f4HxWLVbzokH9yio"
Content-Disposition: inline

--f4HxWLVbzokH9yio
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 23, 2012 at 11:13:08PM +0100, Burton, Ross wrote:
> On 23 August 2012 19:46, Matthew McClintock <msm@freescale.com> wrote:
> >    ${PYTHON_SITEPACKAGES_DIR}/.debug \
> >    ${PYTHON_SITEPACKAGES_DIR}/*/.debug \
> >    ${PYTHON_SITEPACKAGES_DIR}/*/*/.debug \
> > +  ${libdir}/${PYTHON_DIR}/.debug \
> > +  ${libdir}/${PYTHON_DIR}/*/.debug \
> > +  ${libdir}/${PYTHON_DIR}/*/*/.debug \
>=20
> I thought packages that used distutils generally put their files under
> sitepackages, and not the python base directory...  Are some packages
> doing it wrong?

Yes, almost all python-* recipes after this patch
http://git.openembedded.org/openembedded-core/commit/?id=3D3b23feca31480cc5=
6f55301fd0274e622c40b522

I have 9 such recipes in my dep tree.

Cheers,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--f4HxWLVbzokH9yio
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlA3HkUACgkQN1Ujt2V2gBwz1gCfVsHJ96xmCkKepq3j1X+jwN3X
ClgAmwX+i48KaVf8vn8FKnQwz3rTKUhj
=zWqL
-----END PGP SIGNATURE-----

--f4HxWLVbzokH9yio--
