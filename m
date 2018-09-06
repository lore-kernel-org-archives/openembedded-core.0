Return-Path: <alex.kanavin@gmail.com>
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com
	[209.85.208.53])
	by mail.openembedded.org (Postfix) with ESMTP id E9C4779625
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Sep 2018 10:40:51 +0000 (UTC)
Received: by mail-ed1-f53.google.com with SMTP id h33-v6so8483007edb.5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 06 Sep 2018 03:40:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=ug947M3On8IxYDyyA1Iw8/oaLmY/RA/cOhjx/KnsUzM=;
	b=frEQ111TwdHXR4VxM6wYRrYzvvxw78TI0RJraC8soaGqJNWSseeM2j/+XZt7mziyUy
	2efjjH7T6LhPr/qEWhKGcwIqw3XbjNqy5J60rDTaUKpuvcT3CPfK8IJ8Tv+GcM3KI4RY
	uTvh0byCu4UmkCA+zazCWcHzb0PNnBt//0sGx5IfcIKRtgTk1c24WduMWx9gSeqwL0rt
	s1A7K1ztN8veV9iTTZPaTI2dOEr/xv2eMjM4oTbwE7eDJ2WcH8ZSuLRu2tSNqL8Fd+cf
	mapL5iiYhLJgrnFmfFX/vNLDRr9Dux8ORiKmI6/bU/Sm+vMkzlkD0kTlHsY2nOlutNAh
	l2aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=ug947M3On8IxYDyyA1Iw8/oaLmY/RA/cOhjx/KnsUzM=;
	b=is46cAzkOIHafkQGxB0H/wPE1hwy1X4ToJQqTlStmRKEkG0YmNX4T2ujd1n4xURavH
	WWzkIZgXVAf40Ir4QuYtxQMghbGGGbMonoFZ2HXiBGuqRVUO/yIAB9jB+oTLllhx6Fze
	ceb5oCP7exbhagL051NTHr+XowtIDnCjfHiCcfiodAlbH2oBavHCPNk88+FQil3swueW
	IPs43ME0bChN/v4jSJhd6Ud76M7cajHzz77Yowi6uuJZ8irkYwwfOrQo7z0j1ExPZOXn
	6AgIUtQIeJDfcXpEB7z054HKsycVu4wKEY2AoD09rPdWEQvTld5ILMfwZl6pCllswzYE
	lekA==
X-Gm-Message-State: APzg51BSGs2FLK1PfsWIysNnLW+tG4rbNpvzOEWf/KCjv+xWry2ngeJ1
	FsMeHuw11ifLUVaCEDJ2qlw+KOHuPHM=
X-Google-Smtp-Source: ANB0VdZG57AvBd3i2KvIhfq/QioEE0DXoJUZu8rlYObPy79wahH1QJ2oFwrtuefHD1Oj5hwtfjCMNQ==
X-Received: by 2002:a50:ad5a:: with SMTP id
	z26-v6mr2777080edc.142.1536230452549; 
	Thu, 06 Sep 2018 03:40:52 -0700 (PDT)
Received: from localhost.localdomain ([79.140.126.226])
	by smtp.gmail.com with ESMTPSA id
	k28-v6sm2256506ede.11.2018.09.06.03.40.51
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 06 Sep 2018 03:40:51 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  6 Sep 2018 12:40:29 +0200
Message-Id: <1536230436-30342-14-git-send-email-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1536230436-30342-1-git-send-email-alex.kanavin@gmail.com>
References: <1536230436-30342-1-git-send-email-alex.kanavin@gmail.com>
Subject: [PATCHv2 14/21] gdbm: update to 1.18
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
X-List-Received-Date: Thu, 06 Sep 2018 10:40:52 -0000

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-support/gdbm/files/ptest.patch        | 22 +++++++++-------------
 .../gdbm/{gdbm_1.14.1.bb => gdbm_1.18.bb}          |  4 ++--
 2 files changed, 11 insertions(+), 15 deletions(-)
 rename meta/recipes-support/gdbm/{gdbm_1.14.1.bb => gdbm_1.18.bb} (88%)

diff --git a/meta/recipes-support/gdbm/files/ptest.patch b/meta/recipes-support/gdbm/files/ptest.patch
index b9461be..1e67dbd 100644
--- a/meta/recipes-support/gdbm/files/ptest.patch
+++ b/meta/recipes-support/gdbm/files/ptest.patch
@@ -1,4 +1,4 @@
-From 4e4b70a4a3dcf1fdbee9e68bed3b62f42b197a3a Mon Sep 17 00:00:00 2001
+From 41448708e163c8ec1f980464e7dd6741db427c8a Mon Sep 17 00:00:00 2001
 From: Josep Puigdemont <josep.puigdemont@enea.com>
 Date: Sun, 4 May 2014 16:02:07 +0200
 Subject: [PATCH] Add install-ptest rules.
@@ -9,14 +9,14 @@ Upstream-Status: Pending
 
 ---
  Makefile.am       |  5 +++++
- tests/Makefile.am | 12 +++++++++++-
- 2 files changed, 16 insertions(+), 1 deletion(-)
+ tests/Makefile.am | 11 +++++++++++
+ 2 files changed, 16 insertions(+)
 
 diff --git a/Makefile.am b/Makefile.am
-index 4cdc734..24b99f0 100644
+index ecc03df..9fbbda5 100644
 --- a/Makefile.am
 +++ b/Makefile.am
-@@ -45,3 +45,8 @@ ChangeLog:
+@@ -55,3 +55,8 @@ ChangeLog:
                  awk -f $(top_srcdir)/git2chg.awk                            \
                      -v append=$(top_srcdir)/$(prev_change_log) > ChangeLog; \
          fi
@@ -26,14 +26,13 @@ index 4cdc734..24b99f0 100644
 +		$(MAKE) -C $$subdir DESTDIR=$(DESTDIR)/$$subdir $@; \
 +	done
 diff --git a/tests/Makefile.am b/tests/Makefile.am
-index 3dbb580..22ffc44 100644
+index dbe17dd..06f537f 100644
 --- a/tests/Makefile.am
 +++ b/tests/Makefile.am
-@@ -130,4 +130,14 @@ dtfetch_LDADD = ../src/libgdbm.la ../compat/libgdbm_compat.la
- dtdel_LDADD = ../src/libgdbm.la ../compat/libgdbm_compat.la
- d_creat_ce_LDADD = ../src/libgdbm.la ../compat/libgdbm_compat.la
+@@ -169,3 +169,14 @@ EXTRA_DIST += \
+   gdbmtool/base.exp\
+   config/default.exp
  
--
 +buildtests: $(check_PROGRAMS) $(TESTSUITE)
 +
 +install-ptest: $(check_PROGRAMS) $(TESTSUITE)
@@ -45,6 +44,3 @@ index 3dbb580..22ffc44 100644
 +			$(INSTALL_PROGRAM) $$file $(DESTDIR) ; \
 +		fi \
 +	done
--- 
-2.11.0
-
diff --git a/meta/recipes-support/gdbm/gdbm_1.14.1.bb b/meta/recipes-support/gdbm/gdbm_1.18.bb
similarity index 88%
rename from meta/recipes-support/gdbm/gdbm_1.14.1.bb
rename to meta/recipes-support/gdbm/gdbm_1.18.bb
index 54e5696..2d2016d 100644
--- a/meta/recipes-support/gdbm/gdbm_1.14.1.bb
+++ b/meta/recipes-support/gdbm/gdbm_1.18.bb
@@ -10,8 +10,8 @@ SRC_URI = "${GNU_MIRROR}/gdbm/gdbm-${PV}.tar.gz \
            file://ptest.patch \
           "
 
-SRC_URI[md5sum] = "c2ddcb3897efa0f57484af2bd4f4f848"
-SRC_URI[sha256sum] = "cdceff00ffe014495bed3aed71c7910aa88bf29379f795abc0f46d4ee5f8bc5f"
+SRC_URI[md5sum] = "e316f8e4a3e7e4f23955be65d54fec48"
+SRC_URI[sha256sum] = "b8822cb4769e2d759c828c06f196614936c88c141c3132b18252fe25c2b635ce"
 
 inherit autotools gettext texinfo lib_package ptest
 
-- 
2.7.4


