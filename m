Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com
	[209.85.210.170])
	by mail.openembedded.org (Postfix) with ESMTP id 673C87F4BA
	for <openembedded-core@lists.openembedded.org>;
	Sun,  1 Sep 2019 14:36:51 +0000 (UTC)
Received: by mail-pf1-f170.google.com with SMTP id y9so7380608pfl.4
	for <openembedded-core@lists.openembedded.org>;
	Sun, 01 Sep 2019 07:36:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=BzB7vH//eWVq19WOL2q6aONVCwV2L6YjvlLpjrkKxS8=;
	b=YpKoX+EVVNHM/nEkFos3ScOz2UKuJZ1Zoz9CFa/a6epwoyynx3UQPKMTCvLgYulCel
	ROGOtNt5eVqxDNdvRO5AQgy8Av42JtruizpzhHgxqdHTfaNNdqBO0USwLWm9LVbaaMXB
	zBX8mhKCowBtPNR7gmc93D6LtYlpVoJWCxhGBJAEHNgqS3uj8nRlbeZVbTRxKnuhCgqz
	7EtvLj/RiamrUmKxVAbfFnzTyaGcOqILXmbaImcyDDjuX6SLkDq4sHxl3OBB2xLzSIFD
	w/puIRMx70oT9xVnfPe/PvuSXWPERPsks1o38ygMNgnhy+ypt6iCJez9+cLFWDYK4Dut
	GO8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=BzB7vH//eWVq19WOL2q6aONVCwV2L6YjvlLpjrkKxS8=;
	b=mn4WQozMgNUgNfh34YbRnjtuKOZ8FriSl1NSofyDBmESUkxB8laiVtuSkd10ZKMQoS
	CowGHrH29LqT+1xHaV9yVRwI1iL4+t4T/SycgLdyooTJMKAAzyjWAKzKCyv1Djf8vIdM
	DGqk5qZRka0Q8/eo2FoU3owmZTnscjTMqNi9S6ncNMiGhUIfZtSHLdGEUccukXzOVz6S
	BW1SzHZXN15euoRRp1i2tWoX7/QHns6vDJBvsbUgMzUZpfS57Af4nNdg+PHNv3CkM9R8
	ET1Z8PJLd5TqiLzI2Ged5KXCcWwPT82re1WpfRTa08T9rnyKvvVUL5m8Q4hNVRJyjRqs
	uEuA==
X-Gm-Message-State: APjAAAXDIcbPDTfWGMC9BUegpRMM9WfLIpfyN9pQHKYO67brWG0lQ42U
	w0L/XEQIo4jKlGjiqXwjLRxzsdnp
X-Google-Smtp-Source: APXvYqwXSiiXRd+KHnN8GCDgmqbtRJSn+NBK/zM8UvwfeDdnsOQN0Yba5wAQLxnVBggMAW/uL0+spw==
X-Received: by 2002:aa7:91d7:: with SMTP id z23mr16480259pfa.262.1567348612463;
	Sun, 01 Sep 2019 07:36:52 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:c33:1d53:5246:e59:bfe9])
	by smtp.gmail.com with ESMTPSA id
	s16sm15911381pfs.6.2019.09.01.07.36.51
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 01 Sep 2019 07:36:52 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun,  1 Sep 2019 07:36:07 -0700
Message-Id: <5da7878c965dff6a350b1a002e16de5f342255f0.1567348433.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1567348433.git.akuster808@gmail.com>
References: <cover.1567348433.git.akuster808@gmail.com>
Subject: [warrior 29/43] dpkg: Use less as pager
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
X-List-Received-Date: Sun, 01 Sep 2019 14:36:51 -0000

From: Ricardo Ribalda Delgado <ricardo@ribalda.com>

Debian traditionaly uses /usr/bin/pager as the system pager, which is a
link to the user preferred pager. This is a Debianism.

Without this patch:

root@qt5122:~# dpkg -l
sh: pager: command not found
dpkg-query: error: showing package list on pager subprocess returned error exit status 127

Signed-off-by: Ricardo Ribalda Delgado <ricardo@ribalda.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Richard Leitner <richard.leitner@skidata.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-devtools/dpkg/dpkg/pager.patch | 21 +++++++++++++++++++++
 meta/recipes-devtools/dpkg/dpkg_1.19.4.bb   |  1 +
 2 files changed, 22 insertions(+)
 create mode 100644 meta/recipes-devtools/dpkg/dpkg/pager.patch

diff --git a/meta/recipes-devtools/dpkg/dpkg/pager.patch b/meta/recipes-devtools/dpkg/dpkg/pager.patch
new file mode 100644
index 0000000..e56b9d2
--- /dev/null
+++ b/meta/recipes-devtools/dpkg/dpkg/pager.patch
@@ -0,0 +1,21 @@
+pager: Use less instead of pager
+
+pager is a Debianism. Istead use directly pager.
+
+Upstream-Status: Inappropriate [OE-Core integration specific]
+
+Suggested-by: Burton, Ross <ross.burton@intel.com>
+Signed-off-by: Ricardo Ribalda <ricardo@ribalda.com>
+diff --git a/lib/dpkg/dpkg.h b/lib/dpkg/dpkg.h
+index 2bb067a..6cbce80 100644
+--- a/lib/dpkg/dpkg.h
++++ b/lib/dpkg/dpkg.h
+@@ -95,7 +95,7 @@ DPKG_BEGIN_DECLS
+ #define MAXUPDATES         250
+ 
+ #define DEFAULTSHELL        "sh"
+-#define DEFAULTPAGER        "pager"
++#define DEFAULTPAGER        "less"
+ 
+ #define MD5HASHLEN           32
+ #define MAXTRIGDIRECTIVE     256
diff --git a/meta/recipes-devtools/dpkg/dpkg_1.19.4.bb b/meta/recipes-devtools/dpkg/dpkg_1.19.4.bb
index c3dbda7..e6083e2 100644
--- a/meta/recipes-devtools/dpkg/dpkg_1.19.4.bb
+++ b/meta/recipes-devtools/dpkg/dpkg_1.19.4.bb
@@ -13,6 +13,7 @@ SRC_URI = "${DEBIAN_MIRROR}/main/d/${BPN}/${BPN}_${PV}.tar.xz \
            file://0006-add-musleabi-to-known-target-tripets.patch \
            file://0007-dpkg-deb-build.c-Remove-usage-of-clamp-mtime-in-tar.patch \
            file://0001-dpkg-Support-muslx32-build.patch \
+           file://pager.patch \
            "
 SRC_URI_append_class-native = " file://glibc2.5-sync_file_range.patch \
                                 file://tweak-options-require-tar-1.27.patch \
-- 
2.7.4


