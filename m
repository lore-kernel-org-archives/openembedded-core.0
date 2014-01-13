Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f53.google.com (mail-ee0-f53.google.com [74.125.83.53])
	by mail.openembedded.org (Postfix) with ESMTP id 53BBE6B5D8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Jan 2014 11:58:41 +0000 (UTC)
Received: by mail-ee0-f53.google.com with SMTP id t10so135625eei.40
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Jan 2014 03:58:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=QfJ3H+sa1aMDo2OYHWBdP1Tz4kiff+1eE04mx7umQPE=;
	b=XJPcTKO7sjT+vgajt7euhOSh2jk15S4+IeTRezWCSMZ7Zdw66VKOZw6iSdYO4pFv36
	pWXxg0PxEN7deU/KfbOMZ/6shdU1ROMoknqcPPjbrEBttUsEkOZyCpVRBCvFW6qDVRK0
	IrgnLpMempler1DgVxNWg74TUzUq62eiCVojQXszNkAdS3PB1Cr8McYlvovg70GlfNJe
	+0UwW3whwdg4wk+rwLulN3TNCyx7d9pcI0yozdjibsvv8yBxSv8+2T5Q84kpDbOCvWWX
	UZoL8XZwSn0YKHRPqZyIhWXfOuvFm48a7YjhplH75DKMBvIqsiKwCfaDGLPUehHVAnSr
	p0pg==
X-Received: by 10.14.99.66 with SMTP id w42mr27040404eef.63.1389614319969;
	Mon, 13 Jan 2014 03:58:39 -0800 (PST)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107]) by mx.google.com with ESMTPSA id
	o13sm39119512eex.19.2014.01.13.03.58.38 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 13 Jan 2014 03:58:38 -0800 (PST)
Date: Mon, 13 Jan 2014 12:58:56 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Henning Heinold <heinold@inf.fu-berlin.de>
Message-ID: <20140113115856.GL16995@jama>
References: <cover.1389629682.git.liezhi.yang@windriver.com>
	<20140113102147.GK16995@jama> <52D3C44B.20403@windriver.com>
	<20140113115249.GA22825@mail.zedat.fu-berlin.de>
MIME-Version: 1.0
In-Reply-To: <20140113115249.GA22825@mail.zedat.fu-berlin.de>
User-Agent: Mutt/1.5.22 (2013-10-16)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/5] refactor the archive*.bbcalss
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
X-List-Received-Date: Mon, 13 Jan 2014 11:58:41 -0000
X-Groupsio-MsgNum: 48902
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="HVCoas+krw6dou6l"
Content-Disposition: inline

--HVCoas+krw6dou6l
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 13, 2014 at 12:52:49PM +0100, Henning Heinold wrote:
> On Mon, Jan 13, 2014 at 06:47:39PM +0800, Robert Yang wrote:
> >=20
> > On 01/13/2014 06:21 PM, Martin Jansa wrote:
> > >On Tue, Jan 14, 2014 at 12:20:14AM +0800, Robert Yang wrote:
> > >>* The archive*.bbclass didn't work, and there were a few problems, for
> > >>   example:
> > >>   1) There were a few duplicated code
> > >>   2) There was no src_dir.org (or orig), but the diff command still =
use
> > >>      it, and it is not easy to fix this issue if we don't change a l=
ot
> > >>      of the code.
> > >>   3) It didn't archive the source for the native or gcc
> > >>   4) The work flow is not very well
> > >>   5) The "subprocess.call('fakeroot cp xxxx'" should be removed
> > >>   6) And others ...
> > >>
> > >>* So that we have to refactor it, the benefits are:
> > >>   1) Fix the problems and make it work well.
> > >>   2) Reduce more than 400 lines in total.
> > >>   3) Make it easy to use.
> > >
> > >Have you seen
> > >http://lists.openembedded.org/pipermail/openembedded-core/2013-Decembe=
r/087729.html
> > >?
> > >
> > >Could you review it/integrate changes from it?
> >=20
> > I've looked at it just now, I think the problems that you mentioned hav=
e been
> > fixed during the refactor. It won't install/remove the files manually a=
ny more,
> > they will be installed/removed by the sstate. And the usage become easi=
er, just
> > this would be OK by default:
> >=20
> > INHERIT +=3D "archiver"
> >=20
> > And we can easily add other functions when needed.
> >=20
> > // Robert
> >=20
>=20
> Hi Robert,
>=20
> does the whole thread means it is broken in dora too? Are there plans to =
backport the patches?

AFAIK it's broken everywhere, I would like to have it backported to
dylan as well (after testing that it indeed fixes source files being
removed)

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--HVCoas+krw6dou6l
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlLT1QAACgkQN1Ujt2V2gBxSpwCffGQaQ7H3PYVO1JaaJbGmLoEK
5L4Aniyx0w0QqEL/qoE2L2Rvy9ieMFrn
=1AQO
-----END PGP SIGNATURE-----

--HVCoas+krw6dou6l--
