Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-lf1-f66.google.com (mail-lf1-f66.google.com
	[209.85.167.66])
	by mail.openembedded.org (Postfix) with ESMTP id 345A57E978
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Jun 2019 16:05:24 +0000 (UTC)
Received: by mail-lf1-f66.google.com with SMTP id p24so1951801lfo.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Jun 2019 09:05:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=HV86RG+UfmyPt4qSblU4evPv9NIsyQRqmOc8N/3SzUw=;
	b=TDOVxvPg9iMfRUs+5/VXsoXv9kL/hdVnv2ZAI0zoXh4p17ZZZcccNmf0ZrJaIYJCSz
	HIv0TRy+4GS0/ispUCraxTg1gCr7ZNEJyMq5K3vtM9HASAQ1Nrvr0p2kAJPiwp3l2ulw
	Jgcb8rVJM43575vzSkTvUNF5fjnP6+TFHs6Zyln+qADZg0XdY/VdskcOlCvi2tFRYcPz
	6u0n/S1IYyNYb2gywjyXgZaEZhGrdiBB5IwxCHj7avf+fOy3QEr26aOisZekznjsI8xl
	EjyKQGFgrAYY2FcvEl1Y17Jl25TQtwcxWel1paIXLGylPQ/CRQvrW6sEiIRXCEG2Ia8h
	kEyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=HV86RG+UfmyPt4qSblU4evPv9NIsyQRqmOc8N/3SzUw=;
	b=hIWTsGF5z/58g47feBuSGQLrTy6TfS0DlpCWITkqb+i0ijNcPXNH1LRypfnWb6x4Qc
	Lfr+wMgkMdpzz9fcS7oa7oOvjGKwS9zd8y94MIS6goRC0bxZbAsyMH1+s9ieEZbETv/D
	UcMuU+K30xuiRgrR1Em40bQPnN+G9wP4mcbA1RXCQsxFUwYEjsKq+tbRt03CYF3iAhft
	FSgT4i8EUjqIxkddp53WkX9cqGA8RuWLmNXInp0q0x+mZR9cEogT7HUFVUn0M14xSM0/
	ttmLvH7iLrf+CPkwKc08gfREY5ONryEIAgmq/p3QXE3PJRX4Lu8flDE7Z0e5sXSSEqqJ
	cllg==
X-Gm-Message-State: APjAAAXEAxdcaQwCfXm2XdmG2lPBoNv16SwTm9F5jzTZKe9Wxt9yk9Qh
	1ahJ1+fdNtgUTOt3dbAr6tS0qZU8dO4=
X-Google-Smtp-Source: APXvYqwwxC8yEfI+aNHMylkRGO6korl8qYsnCGhGV7JeMGDyP2duVPSTiL4NTc+Xzwas5QNP6D/wIA==
X-Received: by 2002:a19:7110:: with SMTP id m16mr2496454lfc.4.1561651524571;
	Thu, 27 Jun 2019 09:05:24 -0700 (PDT)
Received: from localhost.localdomain (c83-252-117-108.bredband.comhem.se.
	[83.252.117.108])
	by smtp.gmail.com with ESMTPSA id p27sm456231lfh.8.2019.06.27.09.05.23
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Thu, 27 Jun 2019 09:05:23 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 27 Jun 2019 18:02:08 +0200
Message-Id: <20190627160208.29640-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.17.1
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH] git: update to 2.22.0
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
X-List-Received-Date: Thu, 27 Jun 2019 16:05:24 -0000

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 meta/recipes-devtools/git/git_2.21.0.bb | 11 -----------
 meta/recipes-devtools/git/git_2.22.0.bb | 11 +++++++++++
 2 files changed, 11 insertions(+), 11 deletions(-)
 delete mode 100644 meta/recipes-devtools/git/git_2.21.0.bb
 create mode 100644 meta/recipes-devtools/git/git_2.22.0.bb

diff --git a/meta/recipes-devtools/git/git_2.21.0.bb b/meta/recipes-devtools/git/git_2.21.0.bb
deleted file mode 100644
index 434ff8f3d4..0000000000
--- a/meta/recipes-devtools/git/git_2.21.0.bb
+++ /dev/null
@@ -1,11 +0,0 @@
-require git.inc
-
-EXTRA_OECONF += "ac_cv_snprintf_returns_bogus=no \
-                 ac_cv_fread_reads_directories=${ac_cv_fread_reads_directories=yes} \
-                 "
-EXTRA_OEMAKE += "NO_GETTEXT=1"
-
-SRC_URI[tarball.md5sum] = "b8e00c2997774c5d4aaf26fd9d9aaf64"
-SRC_URI[tarball.sha256sum] = "85eca51c7404da75e353eba587f87fea9481ba41e162206a6f70ad8118147bee"
-SRC_URI[manpages.md5sum] = "8a168697b99a9a3f04f29f7d4bacd70b"
-SRC_URI[manpages.sha256sum] = "14c76ebb4e31f9e55cf5338a04fd3a13bced0323cd51794ccf45fc74bd0c1080"
diff --git a/meta/recipes-devtools/git/git_2.22.0.bb b/meta/recipes-devtools/git/git_2.22.0.bb
new file mode 100644
index 0000000000..9e55fd6eae
--- /dev/null
+++ b/meta/recipes-devtools/git/git_2.22.0.bb
@@ -0,0 +1,11 @@
+require git.inc
+
+EXTRA_OECONF += "ac_cv_snprintf_returns_bogus=no \
+                 ac_cv_fread_reads_directories=${ac_cv_fread_reads_directories=yes} \
+                 "
+EXTRA_OEMAKE += "NO_GETTEXT=1"
+
+SRC_URI[tarball.md5sum] = "6deab33485c07cb3391ea0f255a936f2"
+SRC_URI[tarball.sha256sum] = "a4b7e4365bee43caa12a38d646d2c93743d755d1cea5eab448ffb40906c9da0b"
+SRC_URI[manpages.md5sum] = "d6cb42f12185a47ce3adaac24a1ded50"
+SRC_URI[manpages.sha256sum] = "f6a5750dfc4a0aa5ec0c0cc495d4995d1f36ed47591c3941be9756c1c3a1aa0a"
-- 
2.17.1


