Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1UYHCK-0004Gs-Mc for openembedded-core@lists.openembedded.org;
	Fri, 03 May 2013 16:42:56 +0200
Received: from cpc6-cmbg17-2-0-cust487.5-4.cable.virginmedia.com
	([86.30.57.232] helo=[172.30.1.45])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1UYGv0-0002ET-6s; Fri, 03 May 2013 16:25:03 +0200
Message-ID: <1367591101.14512.282.camel@phil-desktop.brightsign>
From: Phil Blundell <pb@pbcl.net>
To: Mark Hatle <mark.hatle@windriver.com>
Date: Fri, 03 May 2013 15:25:01 +0100
In-Reply-To: <51826D24.2020403@windriver.com>
References: <1367500809.14512.252.camel@phil-desktop.brightsign>
	<51826D24.2020403@windriver.com>
X-Mailer: Evolution 3.4.4-1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] package.bbclass: Remove redundant chmod/chown operations
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
X-List-Received-Date: Fri, 03 May 2013 14:42:57 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2013-05-02 at 08:41 -0500, Mark Hatle wrote:
> On 5/2/13 8:20 AM, Phil Blundell wrote:
> > These were introduced in 6021e309e69d823e1467648aee12a32182945569.  The
> > code currently reads:
> >
> >                  os.link(file, fpath)
> >                  fstat =3D cpath.stat(file)
> >                  os.chmod(fpath, fstat.st_mode)
> >                  os.chown(fpath, fstat.st_uid, fstat.st_gid)
> >
> > which can have no useful effect since, if "fpath" is a hard link to
> > "file", it will (by definition) have the same mode, uid and gid.
>=20
> I thought there were filesystems where a link operation can result in dif=
ferent=20
> file permissions, owners and groups.  It's rare, but umask and effective =
uid/gid=20
> could play a part in this.=20

I can't think of any POSIX-conformant systems where this would be true.
1003.1 =C2=A73 is fairly clear that file permissions are a property of the
file, not of the link(s) to it, which would prohibit different links
from having different modes or owners.

Can you give a concrete example of such a scenario?

p.




