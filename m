Return-Path: <jpuhlman@gmail.com>
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com
	[209.85.214.176])
	by mail.openembedded.org (Postfix) with ESMTP id F29C56111A
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Mar 2020 00:32:23 +0000 (UTC)
Received: by mail-pl1-f176.google.com with SMTP id j20so1422099pll.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 04 Mar 2020 16:32:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=5yeFIvs6/svmVjzOIqDTSS8qIrAZygYqvsNjDBxmQcQ=;
	b=VwVuehONwBv/gjOJYVhW/W0YG4Jvmm+iEQJyEo34JIsR7FjYMZNdEmuyC7ncKEteOF
	SogSuVnK3m0EAPm8gm6X5RB7FfUB296NcihuHeXvhn+GYopHM8cgQfYwwCMXVls1hrRu
	6asg8DQACqH2zVJb36fPBDq9spQNL3+lf6TQemZTnAQ1JWDGRM3DOEa4w0xMGCORHPWN
	AJLgFfQ8xkDC7dBmG0Et28KlV9c1lkUitGlg6kk+S3/9giiEFer5EV8pyMnla40NfVwi
	cDto/QwPej5mKscqNybXZVRtkPpM8pyuCXa0mn7PZykCOGVGSBoepvNnHMiohlTSW9iw
	KPWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding;
	bh=5yeFIvs6/svmVjzOIqDTSS8qIrAZygYqvsNjDBxmQcQ=;
	b=PsDn1cqdw+GTt9/fH5DcNUbGhI9/XTBjozqxKA3GckgID7ndKu8xRY702JFdVRmKmV
	TDZicn75t1F9MeDnyRkNpX8z+lg0hhr/QbavvTCjgBL7Y3rGxgFtwXJnLnZzYqUPhC3X
	T1j2+pOSQFRBdaRIPC00Iu1jumCPLTU11RTBKxFwNC+Ed2biE9Of6rDdNfcanTGrOpvQ
	1xdiuLK5nZhoXdkWyNB91Ryqp/ZFoyu8S2p132t/7DZKbGF/B0u9dN96ajzBwCaQ7UMr
	O5wnBdB4QJUI5b3RcNIFN39Tsn81+5wK8JNQEXKC5SBabD/wezVnjUka92s+glVGJGsZ
	Vqgw==
X-Gm-Message-State: ANhLgQ3GElxxT7MR3Ct5CBlGZC+nirMIju65f9MtaExEQJKCmEWsAFrD
	2Cs3NT/xoCBW01/fXwADlis6W0LJGQw=
X-Google-Smtp-Source: ADFU+vv9iXD0livdJRH9a9cb5UAOOsLzlqMPGQzEzdvQwfRmKYUZkfK6qCZjuQib/2wuA59DanPe5Q==
X-Received: by 2002:a17:90a:858c:: with SMTP id
	m12mr5530461pjn.127.1583368344488; 
	Wed, 04 Mar 2020 16:32:24 -0800 (PST)
Received: from workhorse.localdomain
	(99-14-97-149.lightspeed.frokca.sbcglobal.net. [99.14.97.149])
	by smtp.gmail.com with ESMTPSA id
	193sm7371495pfu.181.2020.03.04.16.32.23
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 04 Mar 2020 16:32:23 -0800 (PST)
Sender: Jeremy Puhlman <jpuhlman@gmail.com>
Received: by workhorse.localdomain (Postfix, from userid 1000)
	id A42F12A07BB; Wed,  4 Mar 2020 16:32:22 -0800 (PST)
From: "Jeremy A. Puhlman" <jpuhlman@mvista.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  4 Mar 2020 16:32:20 -0800
Message-Id: <20200305003220.7961-1-jpuhlman@mvista.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH v2] gdbm-native: disable readline for the native package.
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
X-List-Received-Date: Thu, 05 Mar 2020 00:32:24 -0000
Content-Transfer-Encoding: 8bit

Turns off readline for both.
Also corrected a typo with enable-libgdbm-compat

Signed-off-by: Jeremy A. Puhlman <jpuhlman@mvista.com>
---
 meta/recipes-support/gdbm/gdbm_1.18.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/gdbm/gdbm_1.18.1.bb b/meta/recipes-support/gdbm/gdbm_1.18.1.bb
index 7e2efe3c9b..5cb7c558b8 100644
--- a/meta/recipes-support/gdbm/gdbm_1.18.1.bb
+++ b/meta/recipes-support/gdbm/gdbm_1.18.1.bb
@@ -16,7 +16,7 @@ SRC_URI[sha256sum] = "86e613527e5dba544e73208f42b78b7c022d4fa5a6d5498bf18c8d6f74
 inherit autotools gettext texinfo lib_package ptest
 
 # Needed for dbm python module
-EXTRA_OECONF = "-enable-libgdbm-compat"
+EXTRA_OECONF = "--enable-libgdbm-compat --without-readline"
 
 # Stop presence of dbm/nbdm on the host contaminating builds
 CACHED_CONFIGUREVARS += "ac_cv_lib_ndbm_main=no ac_cv_lib_dbm_main=no"
-- 
2.20.1


