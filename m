Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tom.rini@gmail.com>) id 1T3WPR-0001ma-OZ
	for openembedded-core@lists.openembedded.org;
	Mon, 20 Aug 2012 20:09:05 +0200
Received: by daks35 with SMTP id s35so2635421dak.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Aug 2012 10:57:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=F5T+IWgNgiRuqbZ6hCOkbRLEBaIvp7wpZkGk9bWWWDE=;
	b=stGOXsVfRoezgZVTH3JJW/XwUTc4LjBRlMk3BR5k5cDXLKcl2RxtOD5Akb0czXzjXw
	jCxx7CQXPyRwtnjNK92TNo8diXG7TDzJG17WOcMgRAsbsCu5cYjvbqWIV2hsO95tBY7O
	1Yw9Ek+/OhOQujD3rzNDNUEVYOBXoJoRFBItksQDu/kRoWSGFl9QnCjt9yncMYeTqTWH
	9k+SYanHjQjJiSN0J0jkgCxCRVEipw0eRVvZ805XnbB/34R591Nt5OK/1y83CDkFJGiw
	UFJXH8RJZNFQJUGbnNu8dKnWpHoNYXWYY+LR17Ux2F7YWBmVXQMlWsidgSTTAvuy/Imy
	Ib6Q==
Received: by 10.68.191.97 with SMTP id gx1mr6557321pbc.149.1345485422073;
	Mon, 20 Aug 2012 10:57:02 -0700 (PDT)
Received: from bill-the-cat ([2001:470:d:eba:e1a8:889a:f3cb:3ea7])
	by mx.google.com with ESMTPS id qb6sm10592001pbb.18.2012.08.20.10.57.01
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 20 Aug 2012 10:57:01 -0700 (PDT)
Date: Mon, 20 Aug 2012 10:57:02 -0700
From: Tom Rini <tom.rini@gmail.com>
To: Saul Wold <sgw@linux.intel.com>
Message-ID: <20120820175702.GA9706@bill-the-cat>
References: <1345222136-24839-1-git-send-email-trini@ti.com>
	<1345222136-24839-2-git-send-email-trini@ti.com>
	<502F01FB.1020303@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <502F01FB.1020303@linux.intel.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/5] u-boot-fw-utils: Correct EXTRA_OEMAKE
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
X-List-Received-Date: Mon, 20 Aug 2012 18:09:06 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Aug 17, 2012 at 07:46:19PM -0700, Saul Wold wrote:
> On 08/17/2012 09:48 AM, Tom Rini wrote:
> >- HOSTCFLAGS / HOSTLDFLAGS have been valid for a long time for tools/env
> >- HOSTSTRIP will be needed in the future, does no harm to be correct
> >   now.
> >
> >Signed-off-by: Tom Rini <trini@ti.com>
> >---
> >  meta/recipes-bsp/u-boot/u-boot-fw-utils_2011.06.bb |    4 ++--
> >  .../u-boot/u-boot-fw-utils_2012.04.01.bb           |    4 +++-
> >  2 files changed, 5 insertions(+), 3 deletions(-)
> >
> >diff --git a/meta/recipes-bsp/u-boot/u-boot-fw-utils_2011.06.bb b/meta/recipes-bsp/u-boot/u-boot-fw-utils_2011.06.bb
> >index 7c4df1a..99eef15 100644
> >--- a/meta/recipes-bsp/u-boot/u-boot-fw-utils_2011.06.bb
> >+++ b/meta/recipes-bsp/u-boot/u-boot-fw-utils_2011.06.bb
> >@@ -6,7 +6,7 @@ SECTION = "bootloader"
> >
> >  DEPENDS = "mtd-utils"
> >
> >-PR = "r1"
> >+PR = "r2"
> >
> >  SRC_URI = "ftp://ftp.denx.de/pub/u-boot/u-boot-${PV}.tar.bz2"
> >
> >@@ -15,7 +15,7 @@ SRC_URI[sha256sum] = "362ddb935885da98cf461eba08f31e3e59d0c4ada6cb2fa15596f43af3
> >
> >  S = "${WORKDIR}/u-boot-${PV}"
> >
> >-EXTRA_OEMAKE = 'HOSTCC="${CC}"'
> >+EXTRA_OEMAKE = 'HOSTCC="${CC}" HOSTCFLAGS="${CFLAGS} HOSTLDFLAGS="${LDFLAGS}" HOSTSTRIP=true'
> >
> >  do_compile () {
> >    oe_runmake env
> >diff --git a/meta/recipes-bsp/u-boot/u-boot-fw-utils_2012.04.01.bb b/meta/recipes-bsp/u-boot/u-boot-fw-utils_2012.04.01.bb
> >index fe3422a..364f8a5 100644
> >--- a/meta/recipes-bsp/u-boot/u-boot-fw-utils_2012.04.01.bb
> >+++ b/meta/recipes-bsp/u-boot/u-boot-fw-utils_2012.04.01.bb
> >@@ -5,6 +5,8 @@ SECTION = "bootloader"
> >
> >  DEPENDS = "mtd-utils"
> >
> >+PR = "r1"
> >+
> >  # This is needs to be validated among supported BSP's before we can
> >  # make it default
> >  DEFAULT_PREFERENCE = "-1"
> >@@ -20,7 +22,7 @@ SRC_URI = "git://git.denx.de/u-boot.git;branch=master;protocol=git"
> >
> >  S = "${WORKDIR}/git"
> >
> >-EXTRA_OEMAKE = 'HOSTCC="${CC}"'
> >+EXTRA_OEMAKE = 'HOSTCC="${CC}" HOSTCFLAGS="${CFLAGS} HOSTLDFLAGS="${LDFLAGS}" HOSTSTRIP=true'
> >
> >  do_compile () {
> >    oe_runmake env
> >
> 
> 
> This had a failure also:
> 
> >ERROR: Function failed: do_install (see /srv/ssd/sgw_ab/yocto-autobuilder/yocto-slave/nightly-world/build/build/tmp/work/i586-poky-linux/u-boot-fw-utils-2011.06-r2/temp/log.do_install.69452 for further information)
> >ERROR: Logfile of failure stored in: /srv/ssd/sgw_ab/yocto-autobuilder/yocto-slave/nightly-world/build/build/tmp/work/i586-poky-linux/u-boot-fw-utils-2011.06-r2/temp/log.do_install.69452
> >Log data follows:
> >| DEBUG: Executing shell function do_install
> >| install: cannot stat `/srv/ssd/sgw_ab/yocto-autobuilder/yocto-slave/nightly-world/build/build/tmp/work/i586-poky-linux/u-boot-fw-utils-2011.06-r2/u-boot-2011.06/tools/env/fw_printenv': No such file or directory
> >| ERROR: Function failed: do_install (see /srv/ssd/sgw_ab/yocto-autobuilder/yocto-slave/nightly-world/build/build/tmp/work/i586-poky-linux/u-boot-fw-utils-2011.06-r2/temp/log.do_install.69452 for further information)
> >NOTE: package u-boot-fw-utils-2011.06-r2: task do_install: Failed
> >ERROR: Task 2755 (/srv/ssd/sgw_ab/yocto-autobuilder/yocto-slave/nightly-world/build/meta/recipes-bsp/u-boot/u-boot-fw-utils_2011.06.bb, do_install) failed with exit code '1'

I have to admit that since these were trivial changes I didn't try and
build them.  But oe-core doesn't build anymore.  Doing:
git pull
git reset --hard origin/master
rm -rf build/conf build/tmp*
. oe-init-build-env
bitbake core-image-sato

Fails and can't give me a log.  Can you pastebin the compile logs?
Thanks!

-- 
Tom


