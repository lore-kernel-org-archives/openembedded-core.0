Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RXyqK-0006ac-K9
	for openembedded-core@lists.openembedded.org;
	Tue, 06 Dec 2011 18:30:12 +0100
Received: by eeav2 with SMTP id v2so1342374eea.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 06 Dec 2011 09:23:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=LkU/f9dMj2L/gKqGUXuc2N735wX9O9lg9JlvAsh+m+g=;
	b=qWzCAiXWgDWHmZsryILXjMx5gzke7OipXxc0ezHqwTDOgnfahRN05emvznNsjEa9UH
	FY13GYJXNpf/cDnbLHlms/ryXWcdJU0mx5alCixq7FFN14wpJ33iDmldE8h+3SMvskYm
	0JgB5bPS6f/Id2qSjV1ByQ0Yp3gImA5udr2og=
Received: by 10.14.15.83 with SMTP id e59mr2830142eee.77.1323192201118;
	Tue, 06 Dec 2011 09:23:21 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id x12sm73249918eef.9.2011.12.06.09.23.18
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 06 Dec 2011 09:23:19 -0800 (PST)
Date: Tue, 6 Dec 2011 18:23:06 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20111206172306.GC5456@jama.jama.net>
References: <1323163736-18065-1-git-send-email-Martin.Jansa@gmail.com>
	<CABcZANk4oH-dDHDZHW+ioRi13AXCS3rBNiUeUZGRZisg56fQfw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CABcZANk4oH-dDHDZHW+ioRi13AXCS3rBNiUeUZGRZisg56fQfw@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH] bitbake.conf: change APACHE_MIRROR to use archive site
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
X-List-Received-Date: Tue, 06 Dec 2011 17:30:12 -0000
X-Groupsio-MsgNum: 13693
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="S1BNGpv0yoYahz37"
Content-Disposition: inline

--S1BNGpv0yoYahz37
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 06, 2011 at 07:15:57AM -0700, Chris Larson wrote:
> On Tue, Dec 6, 2011 at 2:28 AM, Martin Jansa <martin.jansa@gmail.com> wro=
te:
> > * there are newest as well as older releases, so the SRC_URIs are valid=
 longer
> > * someone with fast line should try to redownload world to see if the
> > =A0structure is the same for all projects (checked for subversion)
>=20
> Would it not be better to do what we do for other projects, and add
> the archive URI to either the global MIRRORS for fallback, or prepend
> to MIRRORS in the appropriate .inc?

You're right, it's even there already (I didn't know).. but it didn't work =
for me with subversion...

somehow it managed to append subversion-1.7.1.tar.bz2 twice

DEBUG: For url ['http', 'www.apache.org', '/dist/subversion/subversion-1.7.=
1.tar.bz2', '', '', {}] comparing ['http', 'www.apache.org', '/dist', '', '=
', {}] to ['http', 'archive.apache.org', '/dist', '', '', {}]
DEBUG: For url http://www.apache.org/dist/subversion/subversion-1.7.1.tar.b=
z2 returning http://archive.apache.org/dist/subversion/subversion-1.7.1.tar=
=2Ebz2/subversion-1.7.1.tar.bz2

longer version:
DEBUG: For url ['http', 'www.apache.org', '/dist/subversion/subversion-1.7.=
1.tar.bz2', '', '', {}] comparing ['ftp', 'lsof.itap.purdue.edu', '/pub/too=
ls/unix/lsof/', '', '', {}] to ['ftp', 'the.wiretapped.net', '/pub/security=
/host-security/lsof/', '', '', {}]
DEBUG: For url ['http', 'www.apache.org', '/dist/subversion/subversion-1.7.=
1.tar.bz2', '', '', {}] comparing ['http', 'www.apache.org', '/dist', '', '=
', {}] to ['http', 'archive.apache.org', '/dist', '', '', {}]
DEBUG: For url http://www.apache.org/dist/subversion/subversion-1.7.1.tar.b=
z2 returning http://archive.apache.org/dist/subversion/subversion-1.7.1.tar=
=2Ebz2/subversion-1.7.1.tar.bz2
NOTE: fetch http://archive.apache.org/dist/subversion/subversion-1.7.1.tar.=
bz2/subversion-1.7.1.tar.bz2
DEBUG: executing /usr/bin/env wget -t 5 -q --passive-ftp --no-check-certifi=
cate -P /var/lib/jenkins/jobs/shr-core-gta02/workspace/shr-core/downloads '=
http://archive.apache.org/dist/subversion/subversion-1.7.1.tar.bz2/subversi=
on-1.7.1.tar.bz2'
DEBUG: Fetcher accessed the network with the command /usr/bin/env wget -t 5=
 -q --passive-ftp --no-check-certificate -P /var/lib/jenkins/jobs/shr-core-=
gta02/workspace/shr-core/downloads 'http://archive.apache.org/dist/subversi=
on/subversion-1.7.1.tar.bz2/subversion-1.7.1.tar.bz2'
DEBUG: Running export HOME=3D"/var/lib/jenkins"; export GIT_CONFIG=3D"/var/=
lib/jenkins/jobs/shr-core-gta02/workspace/shr-core/tmp-eglibc/sysroots/x86_=
64-linux/usr/etc/gitconfig"; export PATH=3D"/var/lib/jenkins/jobs/shr-core-=
gta02/workspace/shr-core/tmp-eglibc/sysroots/x86_64-linux/usr/bin/armv4t-li=
nux:/var/lib/jenkins/jobs/shr-core-gta02/workspace/shr-core/tmp-eglibc/sysr=
oots/x86_64-linux/usr/bin:/var/lib/jenkins/jobs/shr-core-gta02/workspace/sh=
r-core/tmp-eglibc/sysroots/x86_64-linux/usr/sbin:/var/lib/jenkins/jobs/shr-=
core-gta02/workspace/shr-core/tmp-eglibc/sysroots/x86_64-linux/usr/bin:/var=
/lib/jenkins/jobs/shr-core-gta02/workspace/shr-core/tmp-eglibc/sysroots/x86=
_64-linux/sbin:/var/lib/jenkins/jobs/shr-core-gta02/workspace/shr-core/tmp-=
eglibc/sysroots/x86_64-linux//bin:/var/lib/jenkins/jobs/shr-core-gta02/work=
space/shr-core/openembedded-core/scripts/native-intercept:/var/lib/jenkins/=
jobs/shr-core-gta02/workspace/shr-core/openembedded-core/scripts:/var/lib/j=
enkins/jobs/shr-core-gta02/workspace/shr-core/bitbake/bin:/usr/local/bin:/u=
sr/bin:/bin:/usr/local/games:/usr/games:/var/lib/jenkins/jobs/shr-core-gta0=
2/workspace/shr-core/openembedded-core/scripts"; /usr/bin/env wget -t 5 -q =
--passive-ftp --no-check-certificate -P /var/lib/jenkins/jobs/shr-core-gta0=
2/workspace/shr-core/downloads 'http://archive.apache.org/dist/subversion/s=
ubversion-1.7.1.tar.bz2/subversion-1.7.1.tar.bz2'
DEBUG: Mirror fetch failure for url http://archive.apache.org/dist/subversi=
on/subversion-1.7.1.tar.bz2/subversion-1.7.1.tar.bz2 (original url: http://=
www.apache.org/dist/subversion/subversion-1.7.1.tar.bz2)
DEBUG: Fetcher failure for URL: 'None'. Fetch command export HOME=3D"/var/l=
ib/jenkins"; export GIT_CONFIG=3D"/var/lib/jenkins/jobs/shr-core-gta02/work=
space/shr-core/tmp-eglibc/sysroots/x86_64-linux/usr/etc/gitconfig"; export =
PATH=3D"/var/lib/jenkins/jobs/shr-core-gta02/workspace/shr-core/tmp-eglibc/=
sysroots/x86_64-linux/usr/bin/armv4t-linux:/var/lib/jenkins/jobs/shr-core-g=
ta02/workspace/shr-core/tmp-eglibc/sysroots/x86_64-linux/usr/bin:/var/lib/j=
enkins/jobs/shr-core-gta02/workspace/shr-core/tmp-eglibc/sysroots/x86_64-li=
nux/usr/sbin:/var/lib/jenkins/jobs/shr-core-gta02/workspace/shr-core/tmp-eg=
libc/sysroots/x86_64-linux/usr/bin:/var/lib/jenkins/jobs/shr-core-gta02/wor=
kspace/shr-core/tmp-eglibc/sysroots/x86_64-linux/sbin:/var/lib/jenkins/jobs=
/shr-core-gta02/workspace/shr-core/tmp-eglibc/sysroots/x86_64-linux//bin:/v=
ar/lib/jenkins/jobs/shr-core-gta02/workspace/shr-core/openembedded-core/scr=
ipts/native-intercept:/var/lib/jenkins/jobs/shr-core-gta02/workspace/shr-co=
re/openembedded-core/scripts:/var/lib/jenkins/jobs/shr-core-gta02/workspace=
/shr-core/bitbake/bin:/usr/local/bin:/usr/bin:/bin:/usr/local/games:/usr/ga=
mes:/var/lib/jenkins/jobs/shr-core-gta02/workspace/shr-core/openembedded-co=
re/scripts"; /usr/bin/env wget -t 5 -q --passive-ftp --no-check-certificate=
 -P /var/lib/jenkins/jobs/shr-core-gta02/workspace/shr-core/downloads 'http=
://archive.apache.org/dist/subversion/subversion-1.7.1.tar.bz2/subversion-1=
=2E7.1.tar.bz2' failed with signal 8, output:

DEBUG: For url ['http', 'www.apache.org', '/dist/subversion/subversion-1.7.=
1.tar.bz2', '', '', {}] comparing ['ftp', '.*', '/.*', '', '', {}] to ['htt=
p', 'build.shr-project.org', '/sources/', '', '', {}]
DEBUG: For url ['http', 'www.apache.org', '/dist/subversion/subversion-1.7.=
1.tar.bz2', '', '', {}] comparing ['https?$', '.*', '/.*', '', '', {}] to [=
'http', 'build.shr-project.org', '/sources/', '', '', {}]
DEBUG: For url http://www.apache.org/dist/subversion/subversion-1.7.1.tar.b=
z2 returning http://build.shr-project.org/sources/subversion-1.7.1.tar.bz2
NOTE: fetch http://build.shr-project.org/sources/subversion-1.7.1.tar.bz2
DEBUG: executing /usr/bin/env wget -t 5 -q --passive-ftp --no-check-certifi=
cate -P /var/lib/jenkins/jobs/shr-core-gta02/workspace/shr-core/downloads '=
http://build.shr-project.org/sources/subversion-1.7.1.tar.bz2'
DEBUG: Fetcher accessed the network with the command /usr/bin/env wget -t 5=
 -q --passive-ftp --no-check-certificate -P /var/lib/jenkins/jobs/shr-core-=
gta02/workspace/shr-core/downloads 'http://build.shr-project.org/sources/su=
bversion-1.7.1.tar.bz2'
DEBUG: Running export HOME=3D"/var/lib/jenkins"; export GIT_CONFIG=3D"/var/=
lib/jenkins/jobs/shr-core-gta02/workspace/shr-core/tmp-eglibc/sysroots/x86_=
64-linux/usr/etc/gitconfig"; export PATH=3D"/var/lib/jenkins/jobs/shr-core-=
gta02/workspace/shr-core/tmp-eglibc/sysroots/x86_64-linux/usr/bin/armv4t-li=
nux:/var/lib/jenkins/jobs/shr-core-gta02/workspace/shr-core/tmp-eglibc/sysr=
oots/x86_64-linux/usr/bin:/var/lib/jenkins/jobs/shr-core-gta02/workspace/sh=
r-core/tmp-eglibc/sysroots/x86_64-linux/usr/sbin:/var/lib/jenkins/jobs/shr-=
core-gta02/workspace/shr-core/tmp-eglibc/sysroots/x86_64-linux/usr/bin:/var=
/lib/jenkins/jobs/shr-core-gta02/workspace/shr-core/tmp-eglibc/sysroots/x86=
_64-linux/sbin:/var/lib/jenkins/jobs/shr-core-gta02/workspace/shr-core/tmp-=
eglibc/sysroots/x86_64-linux//bin:/var/lib/jenkins/jobs/shr-core-gta02/work=
space/shr-core/openembedded-core/scripts/native-intercept:/var/lib/jenkins/=
jobs/shr-core-gta02/workspace/shr-core/openembedded-core/scripts:/var/lib/j=
enkins/jobs/shr-core-gta02/workspace/shr-core/bitbake/bin:/usr/local/bin:/u=
sr/bin:/bin:/usr/local/games:/usr/games:/var/lib/jenkins/jobs/shr-core-gta0=
2/workspace/shr-core/openembedded-core/scripts"; /usr/bin/env wget -t 5 -q =
--passive-ftp --no-check-certificate -P /var/lib/jenkins/jobs/shr-core-gta0=
2/workspace/shr-core/downloads 'http://build.shr-project.org/sources/subver=
sion-1.7.1.tar.bz2'
DEBUG: Mirror fetch failure for url http://build.shr-project.org/sources/su=
bversion-1.7.1.tar.bz2 (original url: http://www.apache.org/dist/subversion=
/subversion-1.7.1.tar.bz2)
DEBUG: Fetcher failure for URL: 'None'. Fetch command export HOME=3D"/var/l=
ib/jenkins"; export GIT_CONFIG=3D"/var/lib/jenkins/jobs/shr-core-gta02/work=
space/shr-core/tmp-eglibc/sysroots/x86_64-linux/usr/etc/gitconfig"; export =
PATH=3D"/var/lib/jenkins/jobs/shr-core-gta02/workspace/shr-core/tmp-eglibc/=
sysroots/x86_64-linux/usr/bin/armv4t-linux:/var/lib/jenkins/jobs/shr-core-g=
ta02/workspace/shr-core/tmp-eglibc/sysroots/x86_64-linux/usr/bin:/var/lib/j=
enkins/jobs/shr-core-gta02/workspace/shr-core/tmp-eglibc/sysroots/x86_64-li=
nux/usr/sbin:/var/lib/jenkins/jobs/shr-core-gta02/workspace/shr-core/tmp-eg=
libc/sysroots/x86_64-linux/usr/bin:/var/lib/jenkins/jobs/shr-core-gta02/wor=
kspace/shr-core/tmp-eglibc/sysroots/x86_64-linux/sbin:/var/lib/jenkins/jobs=
/shr-core-gta02/workspace/shr-core/tmp-eglibc/sysroots/x86_64-linux//bin:/v=
ar/lib/jenkins/jobs/shr-core-gta02/workspace/shr-core/openembedded-core/scr=
ipts/native-intercept:/var/lib/jenkins/jobs/shr-core-gta02/workspace/shr-co=
re/openembedded-core/scripts:/var/lib/jenkins/jobs/shr-core-gta02/workspace=
/shr-core/bitbake/bin:/usr/local/bin:/usr/bin:/bin:/usr/local/games:/usr/ga=
mes:/var/lib/jenkins/jobs/shr-core-gta02/workspace/shr-core/openembedded-co=
re/scripts"; /usr/bin/env wget -t 5 -q --passive-ftp --no-check-certificate=
 -P /var/lib/jenkins/jobs/shr-core-gta02/workspace/shr-core/downloads 'http=
://build.shr-project.org/sources/subversion-1.7.1.tar.bz2' failed with sign=
al 8, output:

ERROR: Function 'Fetcher failure for URL: 'http://www.apache.org/dist/subve=
rsion/subversion-1.7.1.tar.bz2'. Unable to fetch URL http://www.apache.org/=
dist/subversion/subversion-1.7.1.tar.bz2 from any source.' failed

Cheers,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--S1BNGpv0yoYahz37
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk7eT3oACgkQN1Ujt2V2gBxRIgCfc8hwDwvcqIpcLDJJZKjVKtvv
lf0An1KDoZ8KPb92VTaVvYQK3ENBttlp
=EAD4
-----END PGP SIGNATURE-----

--S1BNGpv0yoYahz37--
