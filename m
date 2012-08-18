Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1T2bHb-00020r-3M
	for openembedded-core@lists.openembedded.org;
	Sat, 18 Aug 2012 07:09:11 +0200
Received: by daks35 with SMTP id s35so1296695dak.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Aug 2012 21:57:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=jaSfEe4ka4qddy4XgG3q21JAmAx7estwvbwZJW9PXs4=;
	b=mkQhMpkXe2ai1jy5KghLzliidO11fxII3+QuLM216g8DHM1W8X5V4uXTuysIOG5ga5
	AO0al7sWShNjv6VrAxnohjOlwpMfPk+oXeE9UoKQ91yiVGeYbI20QHTlJk7EjAKJI/2H
	OtiF776BcQp2ebvHd2oP0Uph6SNRvoQF+XmAjsUBUmmdDd4KJqd0mjKbNNhr+rjHkjNt
	caSCYogWZ7L+L+r0qaaD4i6hb+HPKGGFX82c/FD7TOYCprcImKTxN4egLgZFjMEyqmNd
	sQ8+wxdyt3p6JMM7n5Xm7NtLSlUFcATewiD4rKczpD1goaLE0dBjMiNitf/HO2nW7sWG
	NKQw==
Received: by 10.68.218.163 with SMTP id ph3mr11345543pbc.58.1345265831004;
	Fri, 17 Aug 2012 21:57:11 -0700 (PDT)
Received: from agate.agate.openembedded.org (oldbuilder.nslu2-linux.org.
	[140.211.169.168])
	by mx.google.com with ESMTPS id uj3sm6266915pbc.39.2012.08.17.21.57.09
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 17 Aug 2012 21:57:10 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 17 Aug 2012 21:56:42 -0700
Message-Id: <1345265802-16783-2-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1345265802-16783-1-git-send-email-raj.khem@gmail.com>
References: <1345265802-16783-1-git-send-email-raj.khem@gmail.com>
Subject: [PATCH 2/2] unifdef-native: Correct LICENSE
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
X-List-Received-Date: Sat, 18 Aug 2012 05:09:11 -0000

The header in sourcefile says its BSD licensed
not GPL therefore make the correction

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../unifdef/unifdef-native_2.6.18+git.bb           |    4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/unifdef/unifdef-native_2.6.18+git.bb b/meta/recipes-devtools/unifdef/unifdef-native_2.6.18+git.bb
index 1b93816..3909e1c 100644
--- a/meta/recipes-devtools/unifdef/unifdef-native_2.6.18+git.bb
+++ b/meta/recipes-devtools/unifdef/unifdef-native_2.6.18+git.bb
@@ -1,6 +1,8 @@
 DESCRIPTION = "Kernel header preprocessor"
 SECTION = "devel"
-LICENSE = "GPL"
+LICENSE = "BSD"
+
+PR = "r1"
 
 LIC_FILES_CHKSUM = "file://${WORKDIR}/unifdef.c;endline=32;md5=1a33f5c39aa718a89058721df61979bd"
 
-- 
1.7.9.5



