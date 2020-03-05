Return-Path: <jpuhlman@gmail.com>
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com
	[209.85.210.176])
	by mail.openembedded.org (Postfix) with ESMTP id AEB04616EC
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Mar 2020 00:33:12 +0000 (UTC)
Received: by mail-pf1-f176.google.com with SMTP id y26so1849090pfn.11
	for <openembedded-core@lists.openembedded.org>;
	Wed, 04 Mar 2020 16:33:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=5yeFIvs6/svmVjzOIqDTSS8qIrAZygYqvsNjDBxmQcQ=;
	b=ZoqKqMflML9VR9FD0/qmEixf9csilamp5jpU8iBXcRQjmCuhSHkXl+I3nSkQosnQnw
	SbKhQ3bGFeD8T6bbyIqxxKO3lPG53CeE4bjOmLteY01p/Z+mRx38RbE4r+gpTgQ4MDw/
	NB17Id83LCbEh57WgpQjl5AJ2e86DOdG5Ddo+1zx3Zmbd+Hij7WU+vLWQat81ig0p0PZ
	Uhm1pzGIt+t23/hws+hM1di8uRXWKwBeNrNb2N5l4Q6n1+9d4NZ7iQW0J++1uGaBpKF/
	XctSZ5Zk0ZY+eNpAWJXo5rcawqptfWQs3Vy7zRwM/pO6bUxbLSVRCY+rgILuAAfjQcUv
	Q/Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding;
	bh=5yeFIvs6/svmVjzOIqDTSS8qIrAZygYqvsNjDBxmQcQ=;
	b=tQ/WjtfqA/0IJmZdOrdxWW7J9uygl3CQx1iFYvSDvPHDSRoyQV3Dn5LwlRpz/7LXDN
	tfyvq6aeU+soRjPRMUOaTdfQA+NHjFmAYsmyD0w63Ae/zdu5qs/jfE/YTJwoK7xEFjPK
	7yktOoXLQEOtCGSmH/7xgL9ePV1iOngNVdA5hNWUIuESBPjLRJaeTYIw9MD4oKaqXxac
	xRymj59NykJgxrPEoVEnQJyVFYko3g7y4Dy1Qoj/NJSsKaM7/AqpuQC2l/3mZLETrC+1
	cjMYzm/+cD4o0h9UraHseklxBs5Z3RIzuOkIaQktDjJdfoWJMBwANoHego/Vf5b4Cj/1
	3K1g==
X-Gm-Message-State: ANhLgQ08Ap0JRqQsoxBM75K1qpyzffgaw2rh4+DnaF0jv4e36v/Y+KbX
	5BkxEepVGvDYh86YkTWNyZYbwkWoxA0=
X-Google-Smtp-Source: ADFU+vvSClrDQVwIw/Z7U0u45ywzclPLaHudJLwNGzW16XA8gPFvROSS9uJxzn7mX8tickS+D48QrA==
X-Received: by 2002:a63:1d18:: with SMTP id d24mr4749225pgd.189.1583368393223; 
	Wed, 04 Mar 2020 16:33:13 -0800 (PST)
Received: from workhorse.localdomain
	([2600:1700:4c90:60a0:56be:f7ff:fe12:d0bd])
	by smtp.gmail.com with ESMTPSA id
	f123sm2150449pfg.120.2020.03.04.16.33.12
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 04 Mar 2020 16:33:12 -0800 (PST)
Sender: Jeremy Puhlman <jpuhlman@gmail.com>
Received: by workhorse.localdomain (Postfix, from userid 1000)
	id B5BAD2A07BB; Wed,  4 Mar 2020 16:33:11 -0800 (PST)
From: "Jeremy A. Puhlman" <jpuhlman@mvista.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  4 Mar 2020 16:33:10 -0800
Message-Id: <20200305003310.8052-1-jpuhlman@mvista.com>
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
X-List-Received-Date: Thu, 05 Mar 2020 00:33:12 -0000
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


