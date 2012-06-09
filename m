Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SdOwI-0004SW-Sk
	for openembedded-core@lists.openembedded.org;
	Sat, 09 Jun 2012 18:55:03 +0200
Received: by pbbrq2 with SMTP id rq2so3571196pbb.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 09 Jun 2012 09:44:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=TJnh48CasjVZjt31Z2bJpRVxQzXe+JsgHD0L3h5isAQ=;
	b=YVJsLejhK+Ceo4Qwg8Cuz4jojrPfpa2EKWcA9CPT3juwK6In2uGRP0OVZ11Gu+FV63
	7WI/SFSonVZ5hDE5LJHiXJx8Hw+ypd7zfyCb6YmbC909jnVnQj/+P7g7CD1zXzUlZL0R
	wUCdVouqPH3N9B9XhNs+3ZyHlH6GLr19FCzQJR5SldbcBXldAcI/qovayg1PNtVZhwCy
	ltLGjC+VfyBJBxq2ePEFeWO+cHm/aEtDi081i2udtIRtSx4F3wcHGZgj1igKbRA0ZQqN
	ebx502fLX4OzK6oDg8UTmNQ6kKbZjIz4Fmc0wblsafWLNKpr37WixVcjEcYtxZ9RnZ27
	J/fQ==
Received: by 10.68.233.102 with SMTP id tv6mr7657681pbc.153.1339260271160;
	Sat, 09 Jun 2012 09:44:31 -0700 (PDT)
Received: from localhost.localdomain (oldbuilder.nslu2-linux.org.
	[140.211.169.168])
	by mx.google.com with ESMTPS id hc7sm11897651pbc.54.2012.06.09.09.44.29
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 09 Jun 2012 09:44:30 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat,  9 Jun 2012 09:43:10 -0700
Message-Id: <ba4edc2842f548b44617811ec9b810863afe8201.1339259893.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <c8b84221a903fa86e1ba3df402166720c7ca9b16.1339259893.git.raj.khem@gmail.com>
References: <c8b84221a903fa86e1ba3df402166720c7ca9b16.1339259893.git.raj.khem@gmail.com>
In-Reply-To: <cover.1339259893.git.raj.khem@gmail.com>
References: <cover.1339259893.git.raj.khem@gmail.com>
Subject: [PATCH 12/16] libzypp: Define OECMAKE_CXX_LINK_FLAGS when compiling for uclibc
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
X-List-Received-Date: Sat, 09 Jun 2012 16:55:03 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-extended/libzypp/libzypp_git.bb |    3 +--
 1 files changed, 1 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-extended/libzypp/libzypp_git.bb b/meta/recipes-extended/libzypp/libzypp_git.bb
index 0fe6114..ad38751 100644
--- a/meta/recipes-extended/libzypp/libzypp_git.bb
+++ b/meta/recipes-extended/libzypp/libzypp_git.bb
@@ -48,8 +48,7 @@ FILES_${PN}-pkgmgt = "${bindir}/package-manager \
                      "
 
 EXTRA_OECMAKE += " -DLIB=${@os.path.basename('${libdir}')}"
-
-LDFLAGS += "-lpthread"
+OECMAKE_CXX_LINK_FLAGS_libc-uclibc += "-pthread"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
-- 
1.7.5.4



