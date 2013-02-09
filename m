Received: from mail-ee0-f53.google.com ([74.125.83.53])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrei@gherzan.ro>) id 1U4Eaj-00064Y-4Z
	for openembedded-core@lists.openembedded.org;
	Sat, 09 Feb 2013 18:52:04 +0100
Received: by mail-ee0-f53.google.com with SMTP id e53so2572386eek.40
	for <openembedded-core@lists.openembedded.org>;
	Sat, 09 Feb 2013 09:36:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer
	:x-gm-message-state;
	bh=swaoz4tpnZwcV2Nz7hJslwzf8i9fP6m6PB7yZPt1du0=;
	b=JIUDT5w73X3GnnMRgyOZd3V1nHeJOQXJ0aoyumGl52lY5xhCdFWSL525zHlHamKdPF
	FDKd/5Oj69Xe2jouTRHHRDXuulq0kG6l7e0qi44uqwmWQKiJ/vhdSoxW7/Wv5LtCIllH
	1UNoz0ItHfyEp4lOgsMj2RoG22z3yteCbU4cSuFs4HSAxvZZxngA80uQAG5nYv/LerGp
	CDmyVShFwZCPTus1RADEalF61juZWF+JnILKn/KrvWljPG/DKfqwP/3gfCVTRuO47Mr7
	O6u71rvcLvgSf3LkqmqYDWXCjR3U61iah4sMfz4hO1m+9TR89gDCLLVJFRHMXPqUu0nP
	b4HA==
X-Received: by 10.14.219.6 with SMTP id l6mr29406416eep.23.1360431361527;
	Sat, 09 Feb 2013 09:36:01 -0800 (PST)
Received: from otp-agherzan-l1.corp.ad.wrs.com
	(5-13-217-124.residential.rdsnet.ro. [5.13.217.124])
	by mx.google.com with ESMTPS id 44sm53362891eek.5.2013.02.09.09.35.59
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sat, 09 Feb 2013 09:36:00 -0800 (PST)
From: Andrei Gherzan <andrei@gherzan.ro>
To: openembedded-core@lists.openembedded.org
Date: Sat,  9 Feb 2013 19:35:52 +0200
Message-Id: <1360431352-29452-1-git-send-email-andrei@gherzan.ro>
X-Mailer: git-send-email 1.7.9.5
X-Gm-Message-State: ALoCoQkenRr4ik35cOmlKT/H2ihih9fiwSSxb9aamT1aif4KiTcQhJn2fn1h62TELuauG6qh53jf
Subject: [PATCH 1/1] eglibc: Add missing dependency of gettext-native
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
X-List-Received-Date: Sat, 09 Feb 2013 17:52:05 -0000

/bin/bash: msgfmt: command not found
| make[2]: *** [be.mo] Error 127

Signed-off-by: Andrei Gherzan <andrei@gherzan.ro>
---
 meta/recipes-core/eglibc/eglibc_2.17.bb |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/eglibc/eglibc_2.17.bb b/meta/recipes-core/eglibc/eglibc_2.17.bb
index fb49ac4..03e0ea4 100644
--- a/meta/recipes-core/eglibc/eglibc_2.17.bb
+++ b/meta/recipes-core/eglibc/eglibc_2.17.bb
@@ -1,8 +1,8 @@
 require eglibc.inc
 
-PR = "r3"
+PR = "r4"
 
-DEPENDS += "gperf-native kconfig-frontends-native"
+DEPENDS += "gperf-native kconfig-frontends-native gettext-native"
 
 SRC_URI = "http://downloads.yoctoproject.org/releases/eglibc/eglibc-${PV}-svnr22064.tar.bz2 \
            file://eglibc-svn-arm-lowlevellock-include-tls.patch \
-- 
1.7.9.5



