Return-Path: <koen.kooi@linaro.org>
Received: from mail-wi0-f177.google.com (mail-wi0-f177.google.com
	[209.85.212.177])
	by mail.openembedded.org (Postfix) with ESMTP id 6B81C65F8D
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 May 2014 07:03:50 +0000 (UTC)
Received: by mail-wi0-f177.google.com with SMTP id f8so362901wiw.16
	for <openembedded-core@lists.openembedded.org>;
	Tue, 06 May 2014 00:03:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=vcGD2c33lVjgjzpD019KDm+2xirTmLipOdwGcOpWQKs=;
	b=l+5gODcQqpxVl8MuZIaA4xnGqI4fX50LbKD1bVPWUGNvNtPvL9hLKFRsO5wLRCxhqI
	5z6W6rNT+r42DHZozQLUNo9oL8Om1HdiuXs63kHbhXhxTvZGT7hV7bRQ6c6KEb4MmRpH
	DhEOEdmzcP96iAcEPIiJMc3FqpIbkHUvClv6EQDQdFtVWQNyZYiwh3qjx2pJMPwHSDxe
	HdwVaTNxfiqmgaZ+ijAfvB5qpjkceQQUVKdLXguumL7HS6qvRO16MkUcFwa/Ts7oWiF9
	6ytHQsnl3j1u03ysJCsX7PZkzCSoj6ABo7kaizhD3+GGclRLB5YVCIG1/5EDF5VfZJCn
	pIDg==
X-Gm-Message-State: ALoCoQk16nX5a2lHAZw56dfBlR7JGzAxfW2hFbFkPWlrjtzcmwvcjusjHuYn2pjz9+gZg0qHUjcG
X-Received: by 10.180.94.98 with SMTP id db2mr13905569wib.1.1399359831137;
	Tue, 06 May 2014 00:03:51 -0700 (PDT)
Received: from localhost ([2001:610:612:0:5e51:4fff:fec8:7c15])
	by mx.google.com with ESMTPSA id
	t18sm22716131wiv.16.2014.05.06.00.03.50 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 06 May 2014 00:03:50 -0700 (PDT)
From: Koen Kooi <koen.kooi@linaro.org>
To: openembedded-core@lists.openembedded.org
Date: Tue,  6 May 2014 09:03:46 +0200
Message-Id: <1399359826-26761-1-git-send-email-koen.kooi@linaro.org>
X-Mailer: git-send-email 1.9.0
Cc: Koen Kooi <koen.kooi@linaro.org>
Subject: [PATCH] ltp: enable PM and RT tests
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
X-List-Received-Date: Tue, 06 May 2014 07:03:53 -0000

Signed-off-by: Koen Kooi <koen.kooi@linaro.org>
---
 meta/recipes-extended/ltp/ltp_20140422.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-extended/ltp/ltp_20140422.bb b/meta/recipes-extended/ltp/ltp_20140422.bb
index bad9e6f..995d617 100644
--- a/meta/recipes-extended/ltp/ltp_20140422.bb
+++ b/meta/recipes-extended/ltp/ltp_20140422.bb
@@ -36,6 +36,8 @@ TARGET_CC_ARCH += "${LDFLAGS}"
 export prefix = "/opt/ltp"
 export exec_prefix = "/opt/ltp"
 
+EXTRA_OECONF = " --with-power-management-testsuite --with-realtime-testsuite "
+
 # ltp doesn't regenerate ffsb-6.0-rc2 configure and hardcode configure call.
 # we explicitly force regeneration of that directory and pass configure options.
 do_configure_append() {
-- 
1.9.0


