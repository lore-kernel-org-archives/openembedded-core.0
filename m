Received: from mail-pw0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QNaJc-0002DF-IC
	for openembedded-core@lists.openembedded.org;
	Sat, 21 May 2011 02:45:13 +0200
Received: by pwj9 with SMTP id 9so1999780pwj.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 May 2011 17:42:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=Iavyb357u52L1PKIFpgpWYDrBnMAdGPR0rQQPxKkw3M=;
	b=NYbeuPJQz8xRAqg11FPDMKezrNHDtBFxNQjHErJLjoeE5umnWWkkL8sOyxYyf5+lMo
	490UhX2yFa3Dg0SpHYIUNH+ReEoihSXs43ZIA+y7l+4znXw9piWKDlMWadQGkVS76sP/
	sxpobU/Wf1ryndg9xjmBIu/EC2v8k3KeCFNZA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=WylGX7FHwDVPY/Yn/P+2VXu6tCypd1An2N9/qM/O08Eo3PRyDzW7RUt1BTuSkpJmyI
	uar3YhnIhIaQ1MXJu29b5fhQfohAxF67VNh5jSD4Fn4L9YUjJ7ADfQRHzfQjbyfHTKLN
	oWugAeLzeM2w2fMwK6rYN3ArrrSCZM5Tibfa8=
Received: by 10.68.58.103 with SMTP id p7mr77010pbq.518.1305938534150;
	Fri, 20 May 2011 17:42:14 -0700 (PDT)
Received: from sakrah.homelinux.org
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id g5sm2763431pbj.62.2011.05.20.17.42.11
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 20 May 2011 17:42:13 -0700 (PDT)
Date: Fri, 20 May 2011 17:41:00 -0700
From: Khem Raj <raj.khem@gmail.com>
To: Saul Wold <saul.wold@intel.com>
Message-ID: <20110521004100.GA7504@sakrah.homelinux.org>
References: <cover.1305933509.git.raj.khem@gmail.com>
	<43cfb965113150ea56c55c3880b67ba272b3c719.1305933509.git.raj.khem@gmail.com>
	<4DD6F98B.7090700@intel.com>
MIME-Version: 1.0
In-Reply-To: <4DD6F98B.7090700@intel.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] opkg_svn.bb: Install rcS.d into ${D} instead of ${IMAGE_ROOTFS}
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
X-List-Received-Date: Sat, 21 May 2011 00:45:14 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (20/05/11 16:30), Saul Wold wrote:
> On 05/20/2011 04:19 PM, Khem Raj wrote:
> >Remove headerfix.patch, its already applied upstream
> >
> Minor nit, should be $D in the subject line also right?

OK it should. I have amended the commit and refreshed pull branch

> 
> Sau!
> 
> >Signed-off-by: Khem Raj<raj.khem@gmail.com>
> >---
> >  meta/recipes-devtools/opkg/opkg/headerfix.patch |   19 -------------------
> >  meta/recipes-devtools/opkg/opkg_svn.bb          |    3 +--
> >  2 files changed, 1 insertions(+), 21 deletions(-)
> >  delete mode 100644 meta/recipes-devtools/opkg/opkg/headerfix.patch
> >
> >diff --git a/meta/recipes-devtools/opkg/opkg/headerfix.patch b/meta/recipes-devtools/opkg/opkg/headerfix.patch
> >deleted file mode 100644
> >index b3515a0..0000000
> >--- a/meta/recipes-devtools/opkg/opkg/headerfix.patch
> >+++ /dev/null
> >@@ -1,19 +0,0 @@
> >-Without this, the FILE reference in this header can cause compile issues.
> >-
> >-RP - 29/1/10
> >-
> >-Upstream-Status: Pending
> >-
> >-Index: trunk/libopkg/pkg_dest.h
> >-===================================================================
> >---- trunk.orig/libopkg/pkg_dest.h	2010-01-29 09:37:22.000000000 +0000
> >-+++ trunk/libopkg/pkg_dest.h	2010-01-29 09:37:33.000000000 +0000
> >-@@ -18,6 +18,8 @@
> >- #ifndef PKG_DEST_H
> >- #define PKG_DEST_H
> >-
> >-+#include<stdio.h>
> >-+
> >- typedef struct pkg_dest pkg_dest_t;
> >- struct pkg_dest
> >- {
> >diff --git a/meta/recipes-devtools/opkg/opkg_svn.bb b/meta/recipes-devtools/opkg/opkg_svn.bb
> >index 5964a47..3f2c22b 100644
> >--- a/meta/recipes-devtools/opkg/opkg_svn.bb
> >+++ b/meta/recipes-devtools/opkg/opkg_svn.bb
> >@@ -11,7 +11,6 @@ RREPLACES_${PN} = "opkg-nogpg"
> >
> >  SRC_URI = "svn://opkg.googlecode.com/svn;module=trunk;proto=http \
> >             file://add_vercmp.patch \
> >-           file://headerfix.patch \
> >  "
> >
> >  S = "${WORKDIR}/trunk"
> >@@ -34,7 +33,7 @@ do_install_append() {
> >  pkg_postinst_${PN} () {
> >  #!/bin/sh
> >  if [ "x$D" != "x" ]; then
> >-	install -d ${IMAGE_ROOTFS}/${sysconfdir}/rcS.d
> >+	install -d $D/${sysconfdir}/rcS.d
> >  	# this happens at S98 where our good 'ole packages script used to run
> >  	echo "#!/bin/sh
> >  opkg-cl configure
> 

-- 
-Khem


