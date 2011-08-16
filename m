Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QtRme-0004zj-3L
	for openembedded-core@lists.openembedded.org;
	Wed, 17 Aug 2011 00:06:52 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 16 Aug 2011 15:02:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="38396465"
Received: from unknown (HELO [10.255.13.235]) ([10.255.13.235])
	by orsmga002.jf.intel.com with ESMTP; 16 Aug 2011 15:02:12 -0700
Message-ID: <4E4AE8E4.1020501@linux.intel.com>
Date: Tue, 16 Aug 2011 15:02:12 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:5.0) Gecko/20110707 Thunderbird/5.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1313463192-1911-1-git-send-email-aalonso00@gmail.com>
	<4E4A7FE5.10602@gmail.com>
	<CAAB-1ywbXiBh0wHqPdPaFVy=eeYMe14H3e4Xk1qzdkQvjn0wMw@mail.gmail.com>
In-Reply-To: <CAAB-1ywbXiBh0wHqPdPaFVy=eeYMe14H3e4Xk1qzdkQvjn0wMw@mail.gmail.com>
Subject: Re: [PATCH] rpm: configure with staging native path for magic file
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
X-List-Received-Date: Tue, 16 Aug 2011 22:06:52 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 08/16/2011 10:02 AM, Adrian Alonso wrote:
> Um you are right target rpm with conflict with the search path for the
> magic file
>
> So in order to close bug [1358] either apply first proposed patch [1] or
> update
> file_5.04.bb <http://file_5.04.bb> to file_5.07.bb <http://file_5.07.bb>
> that also solves the problem on my F15 dev machine.

I just verified and the patch from Jani [1] is applied, is there still a 
problem with OE-Core?

I would also welcome the update of file to 5.07.

Thanks
	Sau!

> [1] https://lists.yoctoproject.org/pipermail/yocto/2011-August/004486.html
> [1358] http://bugzilla.pokylinux.org/show_bug.cgi?id=1358
>
>
> On Tue, Aug 16, 2011 at 9:34 AM, Khem Raj <raj.khem@gmail.com
> <mailto:raj.khem@gmail.com>> wrote:
>
>     -----BEGIN PGP SIGNED MESSAGE-----
>     Hash: SHA1
>
>     On 08/15/2011 07:53 PM, Adrian Alonso wrote:
>      > * Remove hardcoded system path for path-magic file in order to avoid
>      > potential mistmatch between host and yocto native tools as reported
>      > in yocto mailing list: ---- error: magic_load(ms,
>      > /usr/share/misc/magic) failed: File 5.4 supports only version 7 magic
>      > files. `/usr/share/misc/magic.mgc' is version 8 ---- * Another
>      > solution is to update meta/recipes-devtools/file/file_5.04.bb
>     <http://file_5.04.bb> to a
>      > newer version ie. file_5.07.bb <http://file_5.07.bb>
>      >
>      > Signed-off-by: Adrian Alonso <aalonso00@gmail.com
>     <mailto:aalonso00@gmail.com>> ---
>      > meta/recipes-devtools/rpm/rpm_5.4.0.bb <http://rpm_5.4.0.bb> |
>       4 ++-- 1 files changed, 2
>      > insertions(+), 2 deletions(-)
>      >
>      > diff --git a/meta/recipes-devtools/rpm/rpm_5.4.0.bb
>     <http://rpm_5.4.0.bb>
>      > b/meta/recipes-devtools/rpm/rpm_5.4.0.bb <http://rpm_5.4.0.bb>
>     index c0e3208..948ed84
>      > 100644 --- a/meta/recipes-devtools/rpm/rpm_5.4.0.bb
>     <http://rpm_5.4.0.bb> +++
>      > b/meta/recipes-devtools/rpm/rpm_5.4.0.bb <http://rpm_5.4.0.bb> @@
>     -45,7 +45,7 @@
>      > LIC_FILES_CHKSUM =
>      > "file://COPYING.LIB;md5=2d5025d4aa3495befef8f17206a5b0a1" DEPENDS =
>      > "bzip2 zlib db openssl elfutils expat libpcre attr acl popt
>      > ${extrarpmdeps}" extrarpmdeps = "python perl"
>      > extrarpmdeps_virtclass-native = "" -PR = "r19" +PR = "r20"
>      >
>      > # rpm2cpio is a shell script, which is part of the rpm src.rpm.  It
>      > is needed # in order to extract the distribution SRPM into a format
>      > we can extract... @@ -120,7 +120,7 @@ EXTRA_OECONF = "--verbose \
>      > ${WITH_DB} \ ${WITH_Z} \ --with-file \ -
>      > --with-path-magic=/usr/share/misc/magic \ +
>      > --with-path-magic=${STAGING_DIR_NATIVE}/usr/share/misc/magic.mgc \
>
>     this wont work for target rpm I guess
>
>      > --without-lua \ --without-tcl \ --with-syck=internal \
>
>     -----BEGIN PGP SIGNATURE-----
>     Version: GnuPG v1.4.11 (GNU/Linux)
>
>     iEYEARECAAYFAk5Kf+UACgkQuwUzVZGdMxTmPACgiKm1rdoDPbxVdYhHvCqKEyFJ
>     0A4Anjx/BxnCQm6ZiLKGXOrn2nbFHzyS
>     =jGQc
>     -----END PGP SIGNATURE-----
>
>     _______________________________________________
>     Openembedded-core mailing list
>     Openembedded-core@lists.openembedded.org
>     <mailto:Openembedded-core@lists.openembedded.org>
>     http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>
>
>
>
> --
> Saludos
> Adrian Alonso
> http://aalonso.wordpress.com
>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


