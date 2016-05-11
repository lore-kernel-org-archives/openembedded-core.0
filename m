Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f68.google.com (mail-pa0-f68.google.com
	[209.85.220.68])
	by mail.openembedded.org (Postfix) with ESMTP id 411A576806
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 May 2016 17:36:25 +0000 (UTC)
Received: by mail-pa0-f68.google.com with SMTP id yl2so4046869pac.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 May 2016 10:36:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=EKBesTDHUX5HOJtWy9X0kmcrnuveThQ0Ehj1sgpZGmY=;
	b=ltj/xT4hIIlVMahE3eayavD8ecxnurG6Uh4JOTjk8FVc41mXH/BPk5dmF5gC5yOx3q
	Vqe0HllsdOnvx6HRXfZF5e3cpvaPc6pmEMSW9Wf/NirCQZT0sRps8QUQKG87aODlqaBa
	2seYDDMg9wkyCnP5Eticfi4/wj+GAPYY1p4/q8++rKN8zfdHTkfZdwk+3tLYk4zXBtDe
	U4QPmNqACKDEkl5huUo5oH9iJKlo7QEIQF9GTe+h7YOxEQ79gxLWLtKADpyz80TA3irj
	uelkdgUOrraliBRdah0kKSD4UCy7ErPPRpZ5l2Id3IgD+tFM4ssoSWG4AE0d0UnpMuqP
	Ltgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=EKBesTDHUX5HOJtWy9X0kmcrnuveThQ0Ehj1sgpZGmY=;
	b=BqZA3pdn6VW0jJIMlb5Mu+IEt4uKO8vVZF6P8k7U36VtW82i0ZdNq2fbreSoKwdxto
	zBCZaYr5mq0xmcXTFOnl9Vn7yQpmsrxNYnjizzBvzd6W3ulZ0xPuQYbygFXo8ljJGDID
	WVu6trdOqbBIDp5EyqYWWhV16sUYREQPH0l5l8cXYNt+4gX95hWH3f/n9uUef0Yti5hR
	V6Ige7CO1pjK7t6H1CZy9CFPdrp4R0EKWyD6DuINSQ/N5wBKqMS1mUfA/R+I4/YnMzkQ
	yYUTzHf/5Ww+Ki7Mda4t30nb5t9OJV7yfE+J+3J4ZTJi/jnlzmZ77++/4oEcGBhgK8ql
	r9Kg==
X-Gm-Message-State: AOPr4FVwImnWlp/ilG1XwRnaT+1Hj1VstrYPNbjrmwhJdjRZH6iLbIZI/BjvLvXLqQY5QQ==
X-Received: by 10.66.67.11 with SMTP id j11mr6781406pat.45.1462988186320;
	Wed, 11 May 2016 10:36:26 -0700 (PDT)
Received: from haswell.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	a5sm13669903pat.19.2016.05.11.10.36.25
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 11 May 2016 10:36:25 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 11 May 2016 10:35:38 -0700
Message-Id: <6a922b1f6efd06f9fd473a6b56b0b179756b8a0e.1462987863.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.8.2
In-Reply-To: <2e51e9b5fb3911436afc1becd5feb9351b896fa4.1462987863.git.raj.khem@gmail.com>
References: <2e51e9b5fb3911436afc1becd5feb9351b896fa4.1462987863.git.raj.khem@gmail.com>
In-Reply-To: <cover.1462987863.git.raj.khem@gmail.com>
References: <cover.1462987863.git.raj.khem@gmail.com>
Subject: [PATCH 35/42] tcmode-default: Bump gcc,glibc,gdb
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
X-List-Received-Date: Wed, 11 May 2016 17:36:25 -0000

gcc 6.1, glibc 2.24, gdb 7.11

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/conf/distro/include/tcmode-default.inc | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/conf/distro/include/tcmode-default.inc b/meta/conf/distro/include/tcmode-default.inc
index c412420..d3a4351 100644
--- a/meta/conf/distro/include/tcmode-default.inc
+++ b/meta/conf/distro/include/tcmode-default.inc
@@ -22,11 +22,11 @@ PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}libc-initial = "${TCLIBC}-initial"
 PREFERRED_PROVIDER_virtual/nativesdk-${SDK_PREFIX}libc-initial ?= "nativesdk-glibc-initial"
 PREFERRED_PROVIDER_virtual/gettext ??= "gettext"
 
-GCCVERSION ?= "5.3%"
+GCCVERSION ?= "6.1%"
 SDKGCCVERSION ?= "${GCCVERSION}"
 BINUVERSION ?= "2.26%"
-GDBVERSION ?= "7.10%"
-GLIBCVERSION ?= "2.23"
+GDBVERSION ?= "7.11%"
+GLIBCVERSION ?= "2.24"
 UCLIBCVERSION ?= "1.0%"
 LINUXLIBCVERSION ?= "4.4"
 
-- 
2.8.2


