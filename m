Received: from mga07.intel.com ([143.182.124.22] helo=azsmga101.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TxJkV-00074I-Mg
	for openembedded-core@lists.openembedded.org;
	Mon, 21 Jan 2013 16:57:30 +0100
Received: from mail-ee0-f69.google.com ([74.125.83.69])
	by mga03.intel.com with ESMTP/TLS/RC4-SHA; 21 Jan 2013 07:41:55 -0800
Received: by mail-ee0-f69.google.com with SMTP id e49so7346332eek.8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Jan 2013 07:41:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:x-received:from:to:subject:date:message-id:x-mailer
	:x-gm-message-state;
	bh=C/FtBdKZMxCQKfxflZ/pCNxr7rTck60E1dmUr0f2gNk=;
	b=bv5y8+JTU7tjSK1Pt1xCqwNHdzqnZGQySigS9//gTMcDBnnX0sHf1exRywStAAyQnZ
	HrcxNr3aaXZkZ2z1syw9guQ9kr50w2EvIKHXy6kfd0uLUXZLi0HsqTp3QJZeT8DCPqJV
	DuvGaKbzRWbDR26O3AiPG9kw952UEoEPqd5tFw28JHg7LHsjyDw3kbcNRhY9KXQbp0Bv
	v7sXKvj6gFpNxZ7VVmUIWKp1Xe1qQcjEDPeT2IxWgXl9KoFShQ4hkUgi1FjRMgcZZJU4
	7QSgk9EZ5TetHev/RuJnyszY9VtfQMdodjQVzwwZ5as3j0EfMipjwDbKm0CVHzr8TI7F
	WoEQ==
X-Received: by 10.194.19.170 with SMTP id g10mr27179027wje.56.1358782912948;
	Mon, 21 Jan 2013 07:41:52 -0800 (PST)
X-Received: by 10.194.19.170 with SMTP id g10mr27179009wje.56.1358782912797;
	Mon, 21 Jan 2013 07:41:52 -0800 (PST)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id s16sm21584806wii.0.2013.01.21.07.41.51
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 21 Jan 2013 07:41:52 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 21 Jan 2013 15:39:54 +0000
Message-Id: <1358782794-16860-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
X-Gm-Message-State: ALoCoQmP+64u14VzwmmJeuimoUdwh6hRpVKMjAAQWJ2hSraqgSXK+9/GBivrzVsWIp/p5ZpjUcuSOdxo4GFzwMVDfn7q+klpaO1PD386aFMpDzyfF09AzKBtlbX6Wzme8JSxJMII0LlP/2crZbHcj1AqMrl1jJPaGMEIUEHybGysJfO28Gn8cMdUgI1/UQF7VopYGnRSbcqI
Subject: [PATCH] site: add x86-32/64 alignment values for at-spi2-core
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
X-List-Received-Date: Mon, 21 Jan 2013 15:57:31 -0000

This package isn't yet in oe-core, but GTK+ 3.6 depends on it so will be here at
some point.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/site/ix86-common  |   10 ++++++++++
 meta/site/x86_64-linux |    9 +++++++++
 2 files changed, 19 insertions(+)

diff --git a/meta/site/ix86-common b/meta/site/ix86-common
index 20cac75..5c90865 100644
--- a/meta/site/ix86-common
+++ b/meta/site/ix86-common
@@ -220,3 +220,13 @@ ac_cv_lib_c_signalfd=${ac_cv_lib_c_signalfd=yes}
 nfsd_cv_broken_setfsuid=${nfsd_cv_broken_setfsuid=0}
 nfsd_cv_func_statfs=${nfsd_cv_func_statfs=statfs2_bsize}
 nfsd_cv_bsd_signals=${nfsd_cv_bsd_signals=yes}
+
+# dbind, in at-spi2-core
+ac_cv_alignof_char=1
+ac_cv_alignof_dbind_pointer=4
+ac_cv_alignof_dbind_struct=1
+ac_cv_alignof_dbus_bool_t=4
+ac_cv_alignof_dbus_int16_t=2
+ac_cv_alignof_dbus_int32_t=4
+ac_cv_alignof_dbus_int64_t=4
+ac_cv_alignof_double=4
diff --git a/meta/site/x86_64-linux b/meta/site/x86_64-linux
index 3acc294..78a3b85 100644
--- a/meta/site/x86_64-linux
+++ b/meta/site/x86_64-linux
@@ -124,3 +124,12 @@ ac_cv_func__restgpr_14_x=no
 
 # cvs
 cvs_cv_func_printf_ptr=${cvs_cv_func_printf_ptr=yes}
+
+# dbind
+ac_cv_alignof_dbind_pointer=8
+ac_cv_alignof_dbind_struct=1
+ac_cv_alignof_dbus_bool_t=4
+ac_cv_alignof_dbus_int16_t=2
+ac_cv_alignof_dbus_int32_t=4
+ac_cv_alignof_dbus_int64_t=8
+ac_cv_alignof_double=8
-- 
1.7.10.4



