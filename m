Received: from mail-wi0-f171.google.com ([209.85.212.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1T4wmp-0007jx-VP
	for openembedded-core@lists.openembedded.org;
	Fri, 24 Aug 2012 18:31:08 +0200
Received: by wibhq4 with SMTP id hq4so974330wib.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Aug 2012 09:19:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=u8QaUMrD+gVdR/2etGiZakbovDaPzo9zI2skwL7f5nc=;
	b=GFbrUVswuElQMtDa12ZBkz4XvH4oCRRVH92JmOQWCdhqANlEy/VQ046NYUixr84oQv
	pRHL2HHGNoVOJ0Oya6IZSPwmmz+dLYNavinO8IYTLBuHQFqfhLaQtS64zqslr850N3WU
	A4O/FuGTHMshhKIT5SG7yXAQERALDd4xVspxOC90j61lFlIVcItXNZwqJ0n8pZp0RYy9
	ADIgIOf1i/jWUKM1Nf/IrXCFs6bcKi5BeHYubC56WLdtRGZLoG98JUtNkuTJ8gNFofsk
	gD25XnkCG1tPKKwLhNBXc/Fs03uDewQkHudq/6bs3Wrc6cS7aYw5trCpO8u9pMk/1Lim
	4QGg==
Received: by 10.180.78.99 with SMTP id a3mr6667433wix.15.1345825140232;
	Fri, 24 Aug 2012 09:19:00 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id fu8sm386304wib.5.2012.08.24.09.18.56
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 24 Aug 2012 09:18:57 -0700 (PDT)
Date: Fri, 24 Aug 2012 18:19:04 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: McClintock Matthew-B29882 <B29882@freescale.com>
Message-ID: <20120824161904.GU3029@jama.jama.net>
References: <1345747597-18078-1-git-send-email-msm@freescale.com>
	<CAJTo0LZNhPx5Fj59mSnGudsmMQxDxNefZi+98HWuiSqdFoTJdQ@mail.gmail.com>
	<20120824062509.GR3029@jama.jama.net>
	<70CC66F5C30A414DADDA6973E4CA391A6160FE@039-SN1MPN1-001.039d.mgd.msft.net>
MIME-Version: 1.0
In-Reply-To: <70CC66F5C30A414DADDA6973E4CA391A6160FE@039-SN1MPN1-001.039d.mgd.msft.net>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
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
X-List-Received-Date: Fri, 24 Aug 2012 16:31:08 -0000
X-Groupsio-MsgNum: 28190
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="+Yg8W10oK6rlW0RR"
Content-Disposition: inline

--+Yg8W10oK6rlW0RR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 24, 2012 at 04:06:45PM +0000, McClintock Matthew-B29882 wrote:
> On Fri, Aug 24, 2012 at 1:25 AM, Martin Jansa <martin.jansa@gmail.com> wr=
ote:
> > On Thu, Aug 23, 2012 at 11:13:08PM +0100, Burton, Ross wrote:
> >> On 23 August 2012 19:46, Matthew McClintock <msm@freescale.com> wrote:
> >> >    ${PYTHON_SITEPACKAGES_DIR}/.debug \
> >> >    ${PYTHON_SITEPACKAGES_DIR}/*/.debug \
> >> >    ${PYTHON_SITEPACKAGES_DIR}/*/*/.debug \
> >> > +  ${libdir}/${PYTHON_DIR}/.debug \
> >> > +  ${libdir}/${PYTHON_DIR}/*/.debug \
> >> > +  ${libdir}/${PYTHON_DIR}/*/*/.debug \
> >>
> >> I thought packages that used distutils generally put their files under
> >> sitepackages, and not the python base directory...  Are some packages
> >> doing it wrong?
> >
> > Yes, almost all python-* recipes after this patch
> > http://git.openembedded.org/openembedded-core/commit/?id=3D3b23feca3148=
0cc56f55301fd0274e622c40b522
> >
> > I have 9 such recipes in my dep tree.
>=20
> Martin,
>=20
> Can you look at:
>=20
> http://patches.openembedded.org/patch/35245/

Not right now.. the builder with OEBasicHash which failed because of
this will be busy for next 40 hours at least because pixman PRINC was
bumped..

Cheers,

> -M
>=20
> >
> > Cheers,
> >
> > --
> > Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
> >
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
> >

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--+Yg8W10oK6rlW0RR
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlA3qXgACgkQN1Ujt2V2gByIOwCfUs8oWtqhHmZGDpBXdNp00Ng/
aLAAn3aw/uXe5FZYNqEgrYP93aryRPqp
=Cm7V
-----END PGP SIGNATURE-----

--+Yg8W10oK6rlW0RR--
