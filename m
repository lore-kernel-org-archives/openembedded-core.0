Return-Path: <ross.burton@intel.com>
Received: from mail-we0-f172.google.com (mail-we0-f172.google.com
	[74.125.82.172])
	by mail.openembedded.org (Postfix) with ESMTP id D208260886
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Aug 2013 11:23:53 +0000 (UTC)
Received: by mail-we0-f172.google.com with SMTP id t61so238001wes.17
	for <openembedded-core@lists.openembedded.org>;
	Tue, 06 Aug 2013 04:23:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=98qeXBQlmwRv+4vT9kGboci5Wr/FFGaUxvqoGd0DQ48=;
	b=Wz4BiNlkFM5Abi9U+n79AtjhY3W5jOurJ8HdYFCLBfVxv4ExgYH8EgTGqDHFbhTVu2
	jkYlDWiVhlakI3K5qZXa6p/8Y5gNZK/S5cNTTyqmd9aPp7U2U5Nol6dmz3Io2sb1J6YN
	cIiltk0q2ICI6rFeRguCxMFCLsNIEFpBVX62CYjymkHdV7ka9SovgT6cPkGb3e4MY2II
	5ctOitqS+MTasr/I/Fj0SNeQyV1MKreyOvIaU8uAtYnmZrKtAurRwqFlCN6aDrKtS0Pn
	IhcNfRUQFYw6aQwVCrc1o9ezKSnhqU6RHubYRA4MqqruhjMzBoIos3evITVzdwiruQbj
	QVyQ==
X-Gm-Message-State: ALoCoQnFm+AJ6rjT7dng939amRT9HsRZWd99Q2a0IpX8gqmaUQkOKoZXnUCqB4cFmBsy6n5ZqTyO
X-Received: by 10.180.94.69 with SMTP id da5mr1678300wib.3.1375788233647;
	Tue, 06 Aug 2013 04:23:53 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id a8sm4867929wie.6.2013.08.06.04.23.52
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 06 Aug 2013 04:23:52 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  6 Aug 2013 12:23:49 +0100
Message-Id: <1375788230-30885-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH] separatebuilddir: add comments
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
X-List-Received-Date: Tue, 06 Aug 2013 11:23:54 -0000

Add a comment explaining the libproxy failure, and note that wpa-supplicant doesn't support B!=S.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/conf/distro/include/seperatebuilddir.inc |    4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/conf/distro/include/seperatebuilddir.inc b/meta/conf/distro/include/seperatebuilddir.inc
index 979f44b..fbd5bdb 100644
--- a/meta/conf/distro/include/seperatebuilddir.inc
+++ b/meta/conf/distro/include/seperatebuilddir.inc
@@ -323,6 +323,7 @@ B_pn-libpcre = "${SEPB}"
 B_pn-libpcre-native = "${SEPB}"
 B_pn-libpng = "${SEPB}"
 B_pn-libpng-native = "${SEPB}"
+# Needs automatic support in cmake.bbclass
 #B_pn-libproxy = "${SEPB}"
 B_pn-libpthread-stubs = "${SEPB}"
 B_pn-libpthread-stubs-native = "${SEPB}"
@@ -773,3 +774,6 @@ B_pn-xz-native = "${SEPB}"
 B_pn-yasm = "${SEPB}"
 B_pn-yasm-native = "${SEPB}"
 B_pn-zaurusd = "${SEPB}"
+
+# Recipes that cannot by design use a separate build directory:
+# wpa-supplicant
-- 
1.7.10.4


