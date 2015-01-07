Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 6318D7213F
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Jan 2015 15:04:15 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id t07F4GL9014814
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 7 Jan 2015 07:04:16 -0800 (PST)
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.174.1;
	Wed, 7 Jan 2015 07:04:16 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 7 Jan 2015 07:04:15 -0800
Message-ID: <60148d7c84934ad6e8231906495084c71bef03de.1420643014.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1420643014.git.liezhi.yang@windriver.com>
References: <cover.1420643014.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] glib-2.0: add HOMEPAGE
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
X-List-Received-Date: Wed, 07 Jan 2015 15:04:15 -0000
Content-Type: text/plain

It doesn't have a homepage except gtk.org, use its reference manual page
as the homepage, which we can easily know whether it is a stable version
or not.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-core/glib-2.0/glib.inc |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-core/glib-2.0/glib.inc b/meta/recipes-core/glib-2.0/glib.inc
index 2d81afc..072f790 100644
--- a/meta/recipes-core/glib-2.0/glib.inc
+++ b/meta/recipes-core/glib-2.0/glib.inc
@@ -1,5 +1,7 @@
 SUMMARY = "A general-purpose utility library"
 DESCRIPTION = "GLib is a general-purpose utility library, which provides many useful data types, macros, type conversions, string utilities, file utilities, a main loop abstraction, and so on."
+HOMEPAGE = "https://developer.gnome.org/glib/"
+
 # pcre is under BSD;
 # docs/reference/COPYING is with a 'public domai'-like license!
 LICENSE = "LGPLv2+ & BSD & PD"
-- 
1.7.9.5


