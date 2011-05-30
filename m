Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ke.yu@intel.com>) id 1QQw95-00089E-8e
	for openembedded-core@lists.openembedded.org;
	Mon, 30 May 2011 08:40:11 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 29 May 2011 23:37:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,290,1304319600"; d="scan'208";a="10784369"
Received: from kyu3-dev32.bj.intel.com (HELO localhost) ([10.238.153.187])
	by fmsmga001.fm.intel.com with ESMTP; 29 May 2011 23:37:00 -0700
From: Yu Ke <ke.yu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 30 May 2011 14:41:02 +0800
Message-Id: <a18c819bfe6fbf86ea3b70aeae7dc35e2bb6efde.1306737527.git.ke.yu@intel.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <cover.1306737527.git.ke.yu@intel.com>
References: <cover.1306737527.git.ke.yu@intel.com>
Subject: [PATCH 1/1] site/powerpc-common: remove the incorrect dlopen default setting
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
X-List-Received-Date: Mon, 30 May 2011 06:40:11 -0000

These two setting for dlopen is not correct. dlopen is not available in libc,
instead it is provided by libdl. so the setting should not be "yes" by default.

This fixes [YOCTO #736] [YOCTO #737]

Thanks Richard for pointing out the root cause.

CC: Richard Purdie <richard.purdie@linuxfoundation.org>
CC: Philip Balister <philip@balister.org>
CC: Koen Kooi <koen@dominion.thruhere.net>

Signed-off-by: Yu Ke <ke.yu@intel.com>
---
 meta/site/powerpc-common |    2 --
 1 files changed, 0 insertions(+), 2 deletions(-)

diff --git a/meta/site/powerpc-common b/meta/site/powerpc-common
index 8c0da23..4d0378b 100644
--- a/meta/site/powerpc-common
+++ b/meta/site/powerpc-common
@@ -239,8 +239,6 @@ ac_cv_sizeof_int=${ac_cv_sizeof_int='4'}
 #modphp 
 ac_cv_c_bigendian_php=${ac_cv_c_bigendian_php=yes}
 ac_cv_sizeof_ptrdiff_t=${ac_cv_sizeof_ptrdiff_t=4}
-ac_cv_func_dlopen=${ac_cv_func_dlopen=yes}
-lt_cv_dlopen_self=${lt_cv_dlopen_self=yes}
 
 # apache2 (note other apache stanza in this file)
 ap_void_ptr_lt_long=${ap_void_ptr_lt_long=no}
-- 
1.7.0.4



