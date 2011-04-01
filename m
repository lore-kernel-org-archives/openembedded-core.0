Received: from mail-px0-f178.google.com ([209.85.212.178])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Q5W2B-0005B8-8H
	for openembedded-core@lists.openembedded.org;
	Fri, 01 Apr 2011 06:32:31 +0200
Received: by mail-px0-f178.google.com with SMTP id 1so849885pxi.9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Mar 2011 21:30:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=K0LfYnv9jiG7mK5ZhGNYTJIgh1wiIzWt/9MFDNqWxPg=;
	b=moWLJ2UR/g99Ikw5nPf+/DHY4kRcZ1ubIwIB9zjb1tZ1kWLkpfz2brsjQxU3rk4KmE
	Qt7KqGBg1U+NEcg5Ldxpglr5Wepa5/8V3q9VRhu8gjJpDVopPx9Ba4Oy1lCc87JQS8OO
	fND9ifibU+4Wvqs/s9skxGaqFh/a8of1IsCas=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=rBNdoBeTkeN1t6thicQVgMOalIJrkg9XoQ1+1sqB9Edf0qiPxgJgYAkYlRqKIbkPm/
	IocHypQdXbbvBiRPb2w1xsvrViTLI+poGE2ZLN/xbB225iJOZcMCfvYIpxzVjho9pmYp
	j4GZMrEx6A5Xv/IrU7mExNwc9feo/NfdpsPx0=
Received: by 10.143.27.33 with SMTP id e33mr2535259wfj.376.1301632232411;
	Thu, 31 Mar 2011 21:30:32 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id w32sm2390676wfh.7.2011.03.31.21.30.30
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 31 Mar 2011 21:30:31 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: OE core <openembedded-core@lists.openembedded.org>
Date: Thu, 31 Mar 2011 21:30:23 -0700
Message-Id: <6192341bf989871ae8710e1f4a5b34a4eb381dd5.1301631488.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1301631488.git.raj.khem@gmail.com>
References: <cover.1301631488.git.raj.khem@gmail.com>
Subject: [PATCH 40/46] libxcb.inc: Replace XCBPROTO_XCBPYTHONDIR to point to staging area
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
X-List-Received-Date: Fri, 01 Apr 2011 04:32:31 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-graphics/xcb/libxcb.inc |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/meta/recipes-graphics/xcb/libxcb.inc b/meta/recipes-graphics/xcb/libxcb.inc
index 81d4a20..6c48da7 100644
--- a/meta/recipes-graphics/xcb/libxcb.inc
+++ b/meta/recipes-graphics/xcb/libxcb.inc
@@ -53,4 +53,6 @@ inherit autotools pkgconfig
 do_configure_prepend () {
     sed -i "s|XCBPROTO_XCBINCLUDEDIR=|XCBPROTO_XCBINCLUDEDIR=${STAGING_DIR_HOST}/|" \
         ${S}/configure.ac
+    sed -i "s|XCBPROTO_XCBPYTHONDIR=|XCBPROTO_XCBPYTHONDIR=${STAGING_DIR_HOST}/|" \
+        ${S}/configure.ac
 }
-- 
1.7.4.1



