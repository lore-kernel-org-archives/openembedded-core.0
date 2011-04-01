Received: from mail-pw0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Q5W2O-0005Li-6j
	for openembedded-core@lists.openembedded.org;
	Fri, 01 Apr 2011 06:32:46 +0200
Received: by pwj9 with SMTP id 9so580415pwj.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Mar 2011 21:30:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=rMNQWav+9uaiLSARF+pluZRevZIfBLYQlpjBvUmCYrw=;
	b=aZW62EWGqtkXR5QeNNa/Ncq0kNja9Fuy+fPI7yq9Pzn01v8iugoshUOSqY3y9YnGZA
	Zt0CNA6KbxqVSiQpb7AOlGBRD454imGZy8eEadBnjOGnGOpYEtgN54zzKF4onPpKXKVm
	Aplxh3FqZSyxXXa3D6J34TS21Ooc4JFBHgIvI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=gQQYSQ0LyeK2eFKmHE2WiEppRLz0u33r41mOzMGrP5oSZisl8v2iiQj1IEnfZd77dK
	KbGk6lLBltUK0p0OPpYcFJEz7K1zqxaEoF83C6dU49t0MD0BfScuohYBOALr4V3LU5av
	1hZclq3BMlLoHYs2nPTt9a/B+pDyUV4UTtlh0=
Received: by 10.143.20.17 with SMTP id x17mr2805580wfi.154.1301632242575;
	Thu, 31 Mar 2011 21:30:42 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id w32sm2383164wfh.19.2011.03.31.21.30.40
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 31 Mar 2011 21:30:41 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: OE core <openembedded-core@lists.openembedded.org>
Date: Thu, 31 Mar 2011 21:30:33 -0700
Message-Id: <9297d4fd4c54761045dac494baea6c5b0d1a4c7c.1301631488.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1301631488.git.raj.khem@gmail.com>
References: <cover.1301631488.git.raj.khem@gmail.com>
Subject: [PATCH 43/46] gnutls.inc: inherit gettext class instead of adding gettext to DEPENDS directly
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
X-List-Received-Date: Fri, 01 Apr 2011 04:32:46 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-support/gnutls/gnutls.inc |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-support/gnutls/gnutls.inc b/meta/recipes-support/gnutls/gnutls.inc
index a795585..2dcd8a0 100644
--- a/meta/recipes-support/gnutls/gnutls.inc
+++ b/meta/recipes-support/gnutls/gnutls.inc
@@ -1,7 +1,7 @@
 DESCRIPTION = "GNU Transport Layer Security Library"
 HOMEPAGE = "http://www.gnu.org/software/gnutls/"
 BUGTRACKER = "https://savannah.gnu.org/support/?group=gnutls"
-DEPENDS = "zlib lzo gettext libtasn1 libgcrypt (>= 1.4.2)"
+DEPENDS = "zlib lzo libtasn1 libgcrypt (>= 1.4.2)"
 
 BBCLASSEXTEND = "native"
 
@@ -17,7 +17,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504 \
 
 SRC_URI = "ftp://ftp.gnutls.org/pub/gnutls/gnutls-${PV}.tar.bz2"
 
-inherit autotools binconfig pkgconfig
+inherit autotools binconfig pkgconfig gettext
 
 EXTRA_OECONF="--with-included-opencdk --with-included-libcfg --disable-rpath \
               --with-libtasn1-prefix=${STAGING_DIR_HOST}${prefix} \
-- 
1.7.4.1



