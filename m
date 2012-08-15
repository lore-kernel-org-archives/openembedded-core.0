Received: from mga05.intel.com ([192.55.52.89] helo=fmsmga101.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1T1gWE-0002xv-Mm
	for openembedded-core@lists.openembedded.org;
	Wed, 15 Aug 2012 18:32:30 +0200
Received: from mail-we0-f180.google.com ([74.125.82.180])
	by mga01.intel.com with ESMTP/TLS/RC4-SHA; 15 Aug 2012 09:19:27 -0700
Received: by weyt11 with SMTP id t11so1031661wey.25
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Aug 2012 09:19:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:x-gm-message-state;
	bh=uZs09rDCr9IWaawA4la9TBv71mW3p1GAsIlMREp1h/E=;
	b=RWLjDUYv7TmwEfACcbOfzHhuMdT6v7qRlqtI/xJqEiKdpV4wKJ487XZZ05f3sUh82I
	KGhgYnjW+PNvtkmAer0b0cUL7bA56tKJtWooMjYlxJwWQCeHQ7VnElu50KC8Qjpk236I
	6ntwAlvLbt/rBrIEMtiYEP7eno/Owcye08HpabcBMB3zcp7HYvFlzi3SnoLftZTcuGZ1
	V1q6JdCp2wJPddQxoL65CX029VaklgMhr678a3/lZXrCniv5gPTTMAhRTItJvdLAqNIx
	T7u/y8CLwLSkirCc9QC6fD0/8u5xRLDyw/Tib14zZ24H3ldCgyESgekk1n9sKKI1HpTt
	h2pg==
Received: by 10.180.92.194 with SMTP id co2mr35039776wib.16.1345047565608;
	Wed, 15 Aug 2012 09:19:25 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id cu1sm29480723wib.6.2012.08.15.09.19.24
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 15 Aug 2012 09:19:24 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 15 Aug 2012 17:18:49 +0100
Message-Id: <10192d7fd47ea041f73511eaa8b5e56c13152951.1345047378.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10
In-Reply-To: <cover.1345047378.git.ross.burton@intel.com>
References: <cover.1345047378.git.ross.burton@intel.com>
X-Gm-Message-State: ALoCoQmYvk/vH4Yebg+PwkpGv0B0br7JgiexVTlweN22FNzoo/OAwaVa+J3+6z/KhRLSxYOKEE4L
Subject: [PATCH 1/2] make: add make-replacement-native 3.81
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
X-List-Received-Date: Wed, 15 Aug 2012 16:32:30 -0000

GNU Make 3.82 has some regressions regarding parallel processing that causes
some packages to fail, specifically WebKitGTK+.  Add make-replacement-native
3.81 so that those packages can depend on a Make which is known to work.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-devtools/make/make-replacement-native_3.81.bb |    6 ++++++
 1 file changed, 6 insertions(+)
 create mode 100644 meta/recipes-devtools/make/make-replacement-native_3.81.bb

diff --git a/meta/recipes-devtools/make/make-replacement-native_3.81.bb b/meta/recipes-devtools/make/make-replacement-native_3.81.bb
new file mode 100644
index 0000000..716a8b5
--- /dev/null
+++ b/meta/recipes-devtools/make/make-replacement-native_3.81.bb
@@ -0,0 +1,6 @@
+require make_${PV}.bb
+
+inherit native
+
+BPN = "make"
+EXTRAINSTALL = ""
-- 
1.7.10



