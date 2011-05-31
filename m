Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1QRTIN-0006M2-A3
	for openembedded-core@lists.openembedded.org;
	Tue, 31 May 2011 20:03:59 +0200
Received: by fxm19 with SMTP id 19so3762232fxm.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 31 May 2011 11:00:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:date:from:to:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=FvBx1293D1JeCrhRvqInZcPvwgAwDE4NnPOq4qi5mQ4=;
	b=Ieu+zbqZKPu0mvZ0T7WmwiofIJTRBoUqwGeZamyXOSaqRZVOq802wXjgL1N7y9RJ4l
	yLd5Tf6SuezcGHrH67jk2R7wVGcKMOveAQ+zIQXRn+7HpZQ+E1UDGxZL5dBdPgo0uir8
	nURcWMybNRmYIn7/lx7TVoIg1Swqhk6uNX0JE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=O/FhskQWB93fcZZ+uoNFQM81rvq+m50E63xZbpoVFHmyZPRQ91+Q1DWTFFbbZMKK86
	ji/ZJyyLrw5nwah4lDu2vQ/FgBZcLrBG08jFFvgo0uciqUhZPyfrL83zVu2TF3O4sSgU
	vnIMskyAEfYh8ZEXZWCKyL401HcRSr9DZx7XM=
Received: by 10.223.62.77 with SMTP id w13mr2591343fah.53.1306864849665;
	Tue, 31 May 2011 11:00:49 -0700 (PDT)
Received: from localhost ([94.230.152.115])
	by mx.google.com with ESMTPS id h1sm117914fag.35.2011.05.31.11.00.47
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 31 May 2011 11:00:47 -0700 (PDT)
Date: Tue, 31 May 2011 20:00:41 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20110531180041.GC23647@jama.jama.net>
References: <BF0FE697-3489-4B92-AB20-36DE6B63E5C0@dominion.thruhere.net>
MIME-Version: 1.0
In-Reply-To: <BF0FE697-3489-4B92-AB20-36DE6B63E5C0@dominion.thruhere.net>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: New fetcher failure for local files
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
X-List-Received-Date: Tue, 31 May 2011 18:03:59 -0000
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="raC6veAxrt5nqIoY"
Content-Disposition: inline

--raC6veAxrt5nqIoY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 20, 2011 at 09:25:49AM +0200, Koen Kooi wrote:
> Hi,
>=20
> Since a few days the fetcher is behaving strangely:
>=20
> NOTE: package linux-omap-psp-2.6.32-r99b+gitr5fc29e7b2a76a64a739f857858ef=
0b98294aa155: task do_fetch: Started
> ERROR: Function 'Fetcher failure for URL: 'file://defconfig'. Unable to f=
etch URL file://defconfig from any source.' failed
>=20
> It is present:
>=20
> koen@dominion:/OE/tentacle/sources/meta-texasinstruments$ find . -name "d=
efconfig" | grep beagle
> ./recipes-bsp/linux/linux-omap-psp-2.6.32/beagleboard/defconfig
> ./recipes-bsp/linux/linux-omap/beagleboard/defconfig
>=20
> The strange thing is that it will work once (e.g. bitbake console-image) =
but it will fail after switching TCLIBC. And once it started failing, it do=
esn't work for the default TCLIBC either.
>=20
> What's the best way to debug this? -DDD isn't giving much clues, nor does=
 strace :(
>=20
> regards,
>=20
> Koen

I was hit by similar issues this after last bitbake update, maybe caused by=
 this:
http://git.openembedded.org/cgit.cgi/bitbake/commit/?id=3D6e9119c42d3f4cb3d=
ab3d25856eee8b4bf4ad94f

but sofar only when building with -b and relative path and -b virtual:nativ=
e:sth seems broken again :/

OE om-gta02@shr ~/shr-core $ bitbake -c clean -b openembedded-core/meta/rec=
ipes-support/libnl/libnl_2.0.bb

OE Build Configuration:
BB_VERSION        =3D "1.13.0"
METADATA_BRANCH   =3D "shr"
METADATA_REVISION =3D "2189cc44308ee29cfd0e302da542dc32e246c60c"
TARGET_ARCH       =3D "arm"
TARGET_OS         =3D "linux-gnueabi"
MACHINE           =3D "om-gta02"
DISTRO            =3D "shr"
DISTRO_VERSION    =3D "-20110531"
TARGET_FPU        =3D "soft"

NOTE: Preparing runqueue
NOTE: Executing RunQueue Tasks
NOTE: Running task 1 of 1 (ID: 0, openembedded-core/meta/recipes-support/li=
bnl/libnl_2.0.bb, do_clean)
NOTE: package libnl-2.0-r2: task do_clean: Started
NOTE: package libnl-2.0-r2: task do_clean: Succeeded
NOTE: Tasks Summary: Attempted 1 tasks of which 0 didn't need to be rerun a=
nd 0 failed.
OE om-gta02@shr ~/shr-core $ bitbake -c patch -b openembedded-core/meta/rec=
ipes-support/libnl/libnl_2.0.bb

OE Build Configuration:
BB_VERSION        =3D "1.13.0"
METADATA_BRANCH   =3D "shr"
METADATA_REVISION =3D "2189cc44308ee29cfd0e302da542dc32e246c60c"
TARGET_ARCH       =3D "arm"
TARGET_OS         =3D "linux-gnueabi"
MACHINE           =3D "om-gta02"
DISTRO            =3D "shr"
DISTRO_VERSION    =3D "-20110531"
TARGET_FPU        =3D "soft"

NOTE: Preparing runqueue
NOTE: Executing RunQueue Tasks
NOTE: Running task 1 of 3 (ID: 2, openembedded-core/meta/recipes-support/li=
bnl/libnl_2.0.bb, do_fetch)
NOTE: package libnl-2.0-r2: task do_fetch: Started
ERROR: Function 'Fetcher failure for URL: 'file://fix-makefile.patch'. Unab=
le to fetch URL file://fix-makefile.patch from any source.' failed
ERROR: Logfile of failure stored in: /OE/shr-core/tmp/work/armv4t-oe-linux-=
gnueabi/libnl-2.0-r2/temp/log.do_fetch.9100
Log data follows:
| ERROR: Function 'Fetcher failure for URL: 'file://fix-makefile.patch'. Un=
able to fetch URL file://fix-makefile.patch from any source.' failed
NOTE: package libnl-2.0-r2: task do_fetch: Failed
ERROR: Task 2 (openembedded-core/meta/recipes-support/libnl/libnl_2.0.bb, d=
o_fetch) failed with exit code '1'
ERROR: 'openembedded-core/meta/recipes-support/libnl/libnl_2.0.bb' failed
OE om-gta02@shr ~/shr-core $ bitbake -c patch -b ~/shr-core/openembedded-co=
re/meta/recipes-support/libnl/libnl_2.0.bb

OE Build Configuration:
BB_VERSION        =3D "1.13.0"
METADATA_BRANCH   =3D "shr"
METADATA_REVISION =3D "2189cc44308ee29cfd0e302da542dc32e246c60c"
TARGET_ARCH       =3D "arm"
TARGET_OS         =3D "linux-gnueabi"
MACHINE           =3D "om-gta02"
DISTRO            =3D "shr"
DISTRO_VERSION    =3D "-20110531"
TARGET_FPU        =3D "soft"

NOTE: Preparing runqueue
NOTE: Executing RunQueue Tasks
NOTE: Running task 1 of 3 (ID: 2, /OE/shr-core/openembedded-core/meta/recip=
es-support/libnl/libnl_2.0.bb, do_fetch)
NOTE: package libnl-2.0-r2: task do_fetch: Started
NOTE: package libnl-2.0-r2: task do_fetch: Succeeded
NOTE: Running task 2 of 3 (ID: 0, /OE/shr-core/openembedded-core/meta/recip=
es-support/libnl/libnl_2.0.bb, do_unpack)
NOTE: package libnl-2.0-r2: task do_unpack: Started
NOTE: package libnl-2.0-r2: task do_unpack: Succeeded
NOTE: Running task 3 of 3 (ID: 1, /OE/shr-core/openembedded-core/meta/recip=
es-support/libnl/libnl_2.0.bb, do_patch)
NOTE: package libnl-2.0-r2: task do_patch: Started
NOTE: package libnl-2.0-r2: task do_patch: Succeeded
NOTE: Tasks Summary: Attempted 3 tasks of which 0 didn't need to be rerun a=
nd 0 failed.

OE om-gta02@shr ~/shr-core $ bitbake -c patch -b virtual:native:~/shr-core/=
openembedded-core/meta/recipes-support/db/db_5.1.19.bb
ERROR: Unable to match ~/shr-core/openembedded-core/meta/recipes-support/db=
/db_5.1.19.bb (0 matches found):
ERROR: Command execution failed: Traceback (most recent call last):
  File "/usr/lib64/python2.7/site-packages/bb/command.py", line 102, in run=
AsyncCommand
    commandmethod(self.cmds_async, self, options)
  File "/usr/lib64/python2.7/site-packages/bb/command.py", line 190, in bui=
ldFile
    command.cooker.buildFile(bfile, task)
  File "/usr/lib64/python2.7/site-packages/bb/cooker.py", line 715, in buil=
dFile
    fn =3D self.matchFile(fn)
  File "/usr/lib64/python2.7/site-packages/bb/cooker.py", line 698, in matc=
hFile
    raise MultipleMatches
MultipleMatches

maybe only with absolute path as relative path shows same error as above
OE om-gta02@shr ~/shr-core $ bitbake -c patch -b virtual:native:openembedde=
d-core/meta/recipes-support/db/db_5.1.19.bb

OE Build Configuration:
BB_VERSION        =3D "1.13.0"
METADATA_BRANCH   =3D "shr"
METADATA_REVISION =3D "2189cc44308ee29cfd0e302da542dc32e246c60c"
TARGET_ARCH       =3D "arm"
TARGET_OS         =3D "linux-gnueabi"
MACHINE           =3D "om-gta02"
DISTRO            =3D "shr"
DISTRO_VERSION    =3D "-20110531"
TARGET_FPU        =3D "soft"

NOTE: Preparing runqueue
NOTE: Executing RunQueue Tasks
NOTE: Running task 1 of 3 (ID: 2, virtual:native:openembedded-core/meta/rec=
ipes-support/db/db_5.1.19.bb, do_fetch)
NOTE: package db-native-5.1.19-r2: task do_fetch: Started
ERROR: Function 'Fetcher failure for URL: 'file://arm-thumb-mutex_db5.patch=
;patchdir=3D..'. Unable to fetch URL file://arm-thumb-mutex_db5.patch;patch=
dir=3D.. from any source.' failed
ERROR: Logfile of failure stored in: /OE/shr-core/tmp/work/x86_64-linux/db-=
native-5.1.19-r2/temp/log.do_fetch.9408
Log data follows:
| ERROR: Function 'Fetcher failure for URL: 'file://arm-thumb-mutex_db5.pat=
ch;patchdir=3D..'. Unable to fetch URL file://arm-thumb-mutex_db5.patch;pat=
chdir=3D.. from any source.' failed
NOTE: package db-native-5.1.19-r2: task do_fetch: Failed
ERROR: Task 2 (virtual:native:openembedded-core/meta/recipes-support/db/db_=
5.1.19.bb, do_fetch) failed with exit code '1'
ERROR: 'virtual:native:openembedded-core/meta/recipes-support/db/db_5.1.19.=
bb' failed

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--raC6veAxrt5nqIoY--
