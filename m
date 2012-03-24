Received: from mail-wi0-f171.google.com ([209.85.212.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SBGpK-0003Wf-EP
	for openembedded-core@lists.openembedded.org;
	Sat, 24 Mar 2012 03:35:34 +0100
Received: by wibhj13 with SMTP id hj13so2382394wib.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Mar 2012 19:26:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=wEHzpOOKB3HkAAzJ7KgbQoha4RbW3x6VZGMA942NOz4=;
	b=g0H2ZIYqlimgZmFVHWj3+IWe0VI94kByLiYhwOWMQBhKBALO+/XpF8EXU3U8ziEKlE
	FnfdO5pymgTJ+NVdC9qU5+68lyCUrvohHbYx1qdm4MnQTorW//g2N2w+wzUPXvrznjzL
	iZystLyZMygmuXjGmtXzjN+mNqPqzdHI4ArxkNvSioGZ0Npa2drw/OatZ3yumEjlKU+l
	YD/qN57jsV1ocTQLo4a8mNRZamC7ZEdjLJxznxYGKZ6c37kdHoCPNZOb06Otv4QgkN2/
	Wxg/l+N3Tl7B8OafW+eLxg1SErYHmFVB/ShXYvx4fZ1pjlvbp9F6uTvSv17EBoMSx2Fi
	kX+Q==
Received: by 10.180.95.34 with SMTP id dh2mr1800178wib.15.1332555997784;
	Fri, 23 Mar 2012 19:26:37 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id n8sm30893783wix.10.2012.03.23.19.26.36
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 23 Mar 2012 19:26:36 -0700 (PDT)
Date: Sat, 24 Mar 2012 03:26:39 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20120324022639.GF4604@jama.jama.net>
References: <1332471418-31459-1-git-send-email-raj.khem@gmail.com>
	<1332504325.9740.395.camel@ted>
	<20120323131701.GF3879@jama.jama.net>
MIME-Version: 1.0
In-Reply-To: <20120323131701.GF3879@jama.jama.net>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH 1/2] eglibc-2.15: Update SRCREV
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
X-List-Received-Date: Sat, 24 Mar 2012 02:35:34 -0000
X-Groupsio-MsgNum: 19655
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="8JPrznbw0YAQ/KXy"
Content-Disposition: inline

--8JPrznbw0YAQ/KXy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 23, 2012 at 02:17:02PM +0100, Martin Jansa wrote:
> On Fri, Mar 23, 2012 at 12:05:25PM +0000, Richard Purdie wrote:
> > On Thu, 2012-03-22 at 19:56 -0700, Khem Raj wrote:
> > > Get new patches and remove the one that got merged upstream
> > >=20
> > > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > > ---
> > >  .../eglibc/eglibc-2.15/GLRO_dl_debug_mask.patch    |  108 ++++++++++=
++++++++++
> > >  .../eglibc-2.15/armv4-eabi-compile-fix.patch       |   25 -----
> > >  .../eglibc/eglibc-2.15/initgroups_keys.patch       |   20 ++++
> > >  meta/recipes-core/eglibc/eglibc_2.15.bb            |    5 +-
> > >  4 files changed, 131 insertions(+), 27 deletions(-)
> > >  create mode 100644 meta/recipes-core/eglibc/eglibc-2.15/GLRO_dl_debu=
g_mask.patch
> > >  delete mode 100644 meta/recipes-core/eglibc/eglibc-2.15/armv4-eabi-c=
ompile-fix.patch
> > >  create mode 100644 meta/recipes-core/eglibc/eglibc-2.15/initgroups_k=
eys.patch
> >=20
> > Since 2.15 isn't the default I'm tempted to merge this despite the point
> > we're at in the release cycle. I'd like to give anyone using this the
> > opportunity to comment first though.
>=20
> I'm testing this on all archs I'm using (armv4t, armv5te, armv7a,
> x86-64) and will report tomorrow.

Doesn't look related to this change, but I got interesing error on other
buildhost (on mine everything seems fine sofar including tests on
target), I don't have log from armv4t build on mine, because it's on tmpfs
and there was unexpected reboot when I wasn't home :/.

Failing is testing ld from armv4t-oe-linux-gnueabi.gcc-cross-intermediate:
configure:4894: checking whether /var/lib/jenkins/jobs/shr-core/workspace/s=
hr-core/tmp-eglibc/sysroots/x86_64-linux/usr/libexec/armv4t-oe-linux-gnueab=
i.gcc-cross-intermediate/gcc/arm-oe-linux-gnueabi/4.6.4/as is GNU as
configure:4908: result: yes
configure:4913: checking whether /var/lib/jenkins/jobs/shr-core/workspace/s=
hr-core/tmp-eglibc/sysroots/x86_64-linux/usr/libexec/armv4t-oe-linux-gnueab=
i.gcc-cross-intermediate/gcc/arm-oe-linux-gnueabi/4.6.4/ld is GNU ld
configure:4927: result: yes
configure:4937: checking for /var/lib/jenkins/jobs/shr-core/workspace/shr-c=
ore/tmp-eglibc/sysroots/x86_64-linux/usr/libexec/armv4t-oe-linux-gnueabi.gc=
c-cross-intermediate/gcc/arm-oe-linux-gnueabi/4.6.4/as
configure:4964: result: /var/lib/jenkins/jobs/shr-core/workspace/shr-core/t=
mp-eglibc/sysroots/x86_64-linux/usr/libexec/armv4t-oe-linux-gnueabi.gcc-cro=
ss-intermediate/gcc/arm-oe-linux-gnueabi/4.6.4/as
configure:4979: checking version of /var/lib/jenkins/jobs/shr-core/workspac=
e/shr-core/tmp-eglibc/sysroots/x86_64-linux/usr/libexec/armv4t-oe-linux-gnu=
eabi.gcc-cross-intermediate/gcc/arm-oe-linux-gnueabi/4.6.4/as
configure:4989: result: 2.22, ok
configure:5000: checking for /var/lib/jenkins/jobs/shr-core/workspace/shr-c=
ore/tmp-eglibc/sysroots/x86_64-linux/usr/libexec/armv4t-oe-linux-gnueabi.gc=
c-cross-intermediate/gcc/arm-oe-linux-gnueabi/4.6.4/ld
configure:5027: result: /var/lib/jenkins/jobs/shr-core/workspace/shr-core/t=
mp-eglibc/sysroots/x86_64-linux/usr/libexec/armv4t-oe-linux-gnueabi.gcc-cro=
ss-intermediate/gcc/arm-oe-linux-gnueabi/4.6.4/ld
configure:5042: checking version of /var/lib/jenkins/jobs/shr-core/workspac=
e/shr-core/tmp-eglibc/sysroots/x86_64-linux/usr/libexec/armv4t-oe-linux-gnu=
eabi.gcc-cross-intermediate/gcc/arm-oe-linux-gnueabi/4.6.4/ld
configure:5052: result: v. ?.??, bad

working is testing ld directly from native sysroot:
configure:4894: checking whether /OE/shr-core/tmp-eglibc/sysroots/x86_64-li=
nux/usr/libexec/armv5te-oe-linux-gnueabi.gcc-cross-intermediate/gcc/arm-oe-=
linux-gnueabi/4.6.4/as is GNU as
configure:4908: result: yes
configure:4913: checking whether /OE/shr-core/tmp-eglibc/sysroots/x86_64-li=
nux/usr/bin/armv5te-oe-linux-gnueabi/arm-oe-linux-gnueabi-ld.bfd is GNU ld
configure:4927: result: yes
configure:4937: checking for /OE/shr-core/tmp-eglibc/sysroots/x86_64-linux/=
usr/libexec/armv5te-oe-linux-gnueabi.gcc-cross-intermediate/gcc/arm-oe-linu=
x-gnueabi/4.6.4/as
configure:4964: result: /OE/shr-core/tmp-eglibc/sysroots/x86_64-linux/usr/l=
ibexec/armv5te-oe-linux-gnueabi.gcc-cross-intermediate/gcc/arm-oe-linux-gnu=
eabi/4.6.4/as
configure:4979: checking version of /OE/shr-core/tmp-eglibc/sysroots/x86_64=
-linux/usr/libexec/armv5te-oe-linux-gnueabi.gcc-cross-intermediate/gcc/arm-=
oe-linux-gnueabi/4.6.4/as
configure:4989: result: 2.22, ok
configure:5000: checking for /OE/shr-core/tmp-eglibc/sysroots/x86_64-linux/=
usr/bin/armv5te-oe-linux-gnueabi/arm-oe-linux-gnueabi-ld.bfd
configure:5027: result: /OE/shr-core/tmp-eglibc/sysroots/x86_64-linux/usr/b=
in/armv5te-oe-linux-gnueabi/arm-oe-linux-gnueabi-ld.bfd
configure:5042: checking version of /OE/shr-core/tmp-eglibc/sysroots/x86_64=
-linux/usr/bin/armv5te-oe-linux-gnueabi/arm-oe-linux-gnueabi-ld.bfd
configure:5052: result: 2.22, ok

Cheers,


--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--8JPrznbw0YAQ/KXy
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk9tMN8ACgkQN1Ujt2V2gBzYKACeNC8Azoy/DiU1HLI8Dsa9cmFW
2M8An1bPJoNaRTGy+vCfNr6k1SBe/UVn
=+8gJ
-----END PGP SIGNATURE-----

--8JPrznbw0YAQ/KXy--
