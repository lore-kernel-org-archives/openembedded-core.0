Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id A6FC072D84
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Jan 2015 06:52:30 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id t0S6qVoB001045
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Jan 2015 22:52:31 -0800 (PST)
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.174.1;
	Tue, 27 Jan 2015 22:52:31 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 27 Jan 2015 22:52:24 -0800
Message-ID: <4692cca1f7992ffec81dc153a8008c3826136b0e.1422427700.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1422427700.git.liezhi.yang@windriver.com>
References: <cover.1422427700.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 09/12] pax: fix SRC_URI and HOMEPAGE
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 28 Jan 2015 06:52:30 -0000
Content-Type: text/plain

Fixed:
WARNING: Failed to fetch URL ftp://ftp.suse.com/pub/people/kukuk/pax/pax-3.4.tar.bz2, attempting MIRRORS if available

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-extended/pax/pax_3.4.bb |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-extended/pax/pax_3.4.bb b/meta/recipes-extended/pax/pax_3.4.bb
index 0c10688..ad04871 100644
--- a/meta/recipes-extended/pax/pax_3.4.bb
+++ b/meta/recipes-extended/pax/pax_3.4.bb
@@ -1,6 +1,6 @@
 SUMMARY = "Portable Archive eXchange"
 DESCRIPTION = "pax (Portable Archive eXchange) is the POSIX standard archive tool"
-HOMEPAGE = "http://www.openbsd.org/cgi-bin/cvsweb/src/bin/pax/"
+HOMEPAGE = "http://cvsweb.openbsd.org/cgi-bin/cvsweb/src/bin/pax/"
 BUGTRACKER = "http://www.openbsd.org/query-pr.html"
 
 LICENSE = "BSD"
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4b0b674dfdc56daa3832d4069b820ea0 \
 SECTION = "base"
 PR = "r2"
 
-SRC_URI = "ftp://ftp.suse.com/pub/people/kukuk/pax/pax-${PV}.tar.bz2 \
+SRC_URI = "http://pkgs.fedoraproject.org/repo/pkgs/${BPN}/${BP}.tar.bz2/fbd9023b590b45ac3ade95870702a0d6/${BP}.tar.bz2 \
 	file://fix_for_compile_with_gcc-4.6.0.patch \
 	file://pax-3.4_fix_for_x32.patch"
 
-- 
1.7.9.5


