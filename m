Received: from mx.insigma.com.cn ([115.236.48.170] helo=WX-Edge.insigma.com.cn)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <niqingliang@insigma.com.cn>) id 1QwmX4-0007Ca-5S
	for openembedded-core@lists.openembedded.org;
	Fri, 26 Aug 2011 04:52:34 +0200
Received: from WX-ExchMB.insigma.com.cn (10.0.1.203) by WX-Edge.insigma.com.cn
	(10.0.1.205) with Microsoft SMTP Server (TLS) id 8.1.436.0;
	Fri, 26 Aug 2011 10:47:04 +0800
Received: from [192.168.0.102] (122.224.76.38) by WX-ExchMB.insigma.com.cn
	(10.0.1.203) with Microsoft SMTP Server id 8.1.240.5; Fri, 26 Aug 2011
	10:47:02 +0800
From: Ni Qingliang <niqingliang@insigma.com.cn>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Fri, 26 Aug 2011 10:47:29 +0800
In-Reply-To: <1314325642.1332.54.camel@localhost.localdomain>
References: <cover.1313993805.git.wenzong.fan@windriver.com>
	<1313999777.7620.13.camel@localhost.localdomain>
	<1314325642.1332.54.camel@localhost.localdomain>
X-Mailer: Evolution 3.0.2 
Message-ID: <1314326849.1332.57.camel@localhost.localdomain>
MIME-Version: 1.0
Subject: Re: new feature? (for "DL_DIR")
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
X-List-Received-Date: Fri, 26 Aug 2011 02:52:34 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I found that: for every vcs (e.g. git) package, except a directory in
"git" or "git2", there is another file "*.tar.gz" in the downloads dir.

but for my own package, e.g linux 2.6.35 for i.mx28, only the directory
under "git2", I can't found the tar.gz file in downloads, why?

On Fri, 2011-08-26 at 10:27 +0800, =E5=80=AA=E5=BA=86=E4=BA=AE wrote:
> thanks again, I have setup an internal package server (http), and the
> client can use it in poky.
>=20
> but I have another problem for git svn( for the .gz .bz2 package, no
> problem), the source code of the packages using git/svn/hg are
> directories in the server, does the client can use it???
>=20
> On Mon, 2011-08-22 at 15:56 +0800, =E5=80=AA=E5=BA=86=E4=BA=AE wrote:
> > Do we can assign all package be downloaded from the same path?
> >
> > I want setup one internal server to store the files in upstreamsources,
> > and all developer's PC use it but not the original package address.
> >
> > --
> > Yi Qingliang
> > =E5=80=AA=E5=BA=86=E4=BA=AE
> >
> > Insigma
> >
> >
>=20
> --
> Yi Qingliang
> =E5=80=AA=E5=BA=86=E4=BA=AE
>=20
> Insigma
>=20
>=20

--=20
Yi Qingliang
=E5=80=AA=E5=BA=86=E4=BA=AE

Insigma




