Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web12.4267.1611217216016244839
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Jan 2021 00:20:16 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: wangmy@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.79,363,1602518400"; 
   d="scan'208";a="103692436"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 21 Jan 2021 16:19:58 +0800
Received: from G08CNEXMBPEKD05.g08.fujitsu.local (unknown [10.167.33.204])
	by cn.fujitsu.com (Postfix) with ESMTP id 8D34F4CE4B3E
	for <openembedded-core@lists.openembedded.org>; Thu, 21 Jan 2021 16:19:55 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Thu, 21 Jan 2021 16:19:55 +0800
From: "Wang Mingyu" <wangmy@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@cn.fujitsu.com>
Subject: [OE-core] [PATCH] pulseaudio: upgrade 14.0 -> 14.2
Date: Thu, 21 Jan 2021 16:19:51 +0800
Message-ID: <1611217191-45157-1-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204)
X-yoursite-MailScanner-ID: 8D34F4CE4B3E.A55C9
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangmy@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

refresh 0002-do-not-display-CLFAGS-to-improve-reproducibility-bui.patch

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 ...ot-display-CLFAGS-to-improve-reproducibility-bui.patch | 8 ++++----
 .../pulseaudio/{pulseaudio_14.0.bb => pulseaudio_14.2.bb} | 4 ++--
 2 files changed, 6 insertions(+), 6 deletions(-)
 rename meta/recipes-multimedia/pulseaudio/{pulseaudio_14.0.bb => pulseaudio_14.2.bb} (78%)

diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio/0002-do-not-display-CLFAGS-to-improve-reproducibility-bui.patch b/meta/recipes-multimedia/pulseaudio/pulseaudio/0002-do-not-display-CLFAGS-to-improve-reproducibility-bui.patch
index 43add75db4..48f0492177 100644
--- a/meta/recipes-multimedia/pulseaudio/pulseaudio/0002-do-not-display-CLFAGS-to-improve-reproducibility-bui.patch
+++ b/meta/recipes-multimedia/pulseaudio/pulseaudio/0002-do-not-display-CLFAGS-to-improve-reproducibility-bui.patch
@@ -13,18 +13,18 @@ Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/src/daemon/main.c b/src/daemon/main.c
-index c80fa94..75496be 100644
+index 30ef499..5c3abf0 100644
 --- a/src/daemon/main.c
 +++ b/src/daemon/main.c
-@@ -908,7 +908,7 @@ int main(int argc, char *argv[]) {
+@@ -916,7 +916,7 @@ int main(int argc, char *argv[]) {
+     pa_set_env_and_record("PULSE_SYSTEM", conf->system_instance ? "1" : "0");
  
      pa_log_info("This is PulseAudio %s", PACKAGE_VERSION);
-     pa_log_debug("Compilation host: %s", CANONICAL_HOST);
 -    pa_log_debug("Compilation CFLAGS: %s", PA_CFLAGS);
 +    pa_log_debug("Compilation CFLAGS: ***");
  
  #ifdef HAVE_LIBSAMPLERATE
      pa_log_warn("Compiled with DEPRECATED libsamplerate support!");
 -- 
-2.7.4
+2.25.1
 
diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio_14.0.bb b/meta/recipes-multimedia/pulseaudio/pulseaudio_14.2.bb
similarity index 78%
rename from meta/recipes-multimedia/pulseaudio/pulseaudio_14.0.bb
rename to meta/recipes-multimedia/pulseaudio/pulseaudio_14.2.bb
index fccca1ba48..03b99306b3 100644
--- a/meta/recipes-multimedia/pulseaudio/pulseaudio_14.0.bb
+++ b/meta/recipes-multimedia/pulseaudio/pulseaudio_14.2.bb
@@ -7,6 +7,6 @@ SRC_URI = "http://freedesktop.org/software/pulseaudio/releases/${BP}.tar.xz \
            file://0001-meson-Check-for-__get_cpuid.patch \
            file://volatiles.04_pulse \
            "
-SRC_URI[md5sum] = "84a7776e63dd55c40db8fbd7c7e2e18e"
-SRC_URI[sha256sum] = "a834775d9382b055504e5ee7625dc50768daac29329531deb6597bf05e06c261"
+SRC_URI[md5sum] = "1efc916251910f1e9d4df7810e3e69f8"
+SRC_URI[sha256sum] = "75d3f7742c1ae449049a4c88900e454b8b350ecaa8c544f3488a2562a9ff66f1"
 UPSTREAM_CHECK_REGEX = "pulseaudio-(?P<pver>\d+(\.(?!99)\d+)+)\.tar"
-- 
2.25.1



