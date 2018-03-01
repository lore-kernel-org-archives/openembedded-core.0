Return-Path: <matt@madison.systems>
Received: from mail-pl0-f65.google.com (mail-pl0-f65.google.com
	[209.85.160.65])
	by mail.openembedded.org (Postfix) with ESMTP id 84302788DC
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Mar 2018 23:17:07 +0000 (UTC)
Received: by mail-pl0-f65.google.com with SMTP id ay8-v6so4548265plb.4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 01 Mar 2018 15:17:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=madison-systems.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=x62buxftu2YJKMN9wDD7oHgNmhfDxDzFgLOlqOlLmU0=;
	b=x5Aqgj1SePNDcOwFXgSmCfamvQu78PQra2K8WY3/UcMazbIKU6sUC8KA9hwdBu3a26
	+omDlmRXIkP3SucADGhndB2k5ntAY2s6Ppon+4tz9eAw1hSfDs4Z4xDKCqD2o38NuWwI
	n1CasvfluT1zQuLuJ5vCvjGFLv6Lyd694OrPejLEOCeYTB03GcBO8GeHrmsURynoZdcr
	vAE24D9A0nsWZv49jg7Od89/h6/qV/+lQbTTqR6tFCGo66LoLSx3FqfATIz6q0shZCRn
	nw8C+SVJi+qMRw1exYqchrvTxkiijeTYdqZUtbVlFmB/BAAsZkVrAoCgPkQJASh9Ubvb
	3i2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=x62buxftu2YJKMN9wDD7oHgNmhfDxDzFgLOlqOlLmU0=;
	b=O1X16CONscmgw6lpf/pntZZ6OUx4CHYqiBhyoVqVKPryGIGXkCSJ8BWp6pKmnXx0Yx
	CLxQ2Y+YI3OVLi40QetJ41O9wb8kl1THDsv1mcPi1pC1ZMkARHXmseKxkZsVcH2EQ15R
	n0LbjcDKMovF+u/22F3X2yBAcmp0bk/NJrqlqFeU5P/w168dgYsbVaY/CJEPc1qGA+d6
	sD18xe5VA4kp08719FXNSnqf4WKDwsbvZc9GCZWUbjbWy/ULdVipO2lHORAbv2epKhp1
	kBv++gTo203XnpnmXvvP0DRoxlJVUDwxOTkRFSGNl6tAM17QYee76112MSSYgGbwCPfP
	l7Yg==
X-Gm-Message-State: APf1xPDwxvQAxpayedDc541NfWv0+KkbmijTtkQP/MIALIy9LRgHkmOH
	IpwVB1EzwBCt/0vmf/ByWSQb5yon
X-Google-Smtp-Source: AG47ELsQi7KnI8jbPuZ2p4g+gqF4s6R+TFHvxxkyHlGq7B8hN6+CJus/dsj47B+zWq5Hl+022E9Gzw==
X-Received: by 2002:a17:902:e65:: with SMTP id
	92-v6mr3389843plw.268.1519946228466; 
	Thu, 01 Mar 2018 15:17:08 -0800 (PST)
Received: from workhorse.athrat.org (c-67-170-200-185.hsd1.ca.comcast.net.
	[67.170.200.185]) by smtp.gmail.com with ESMTPSA id
	p128sm7853503pga.45.2018.03.01.15.17.06
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 01 Mar 2018 15:17:07 -0800 (PST)
From: Matt Madison <matt@madison.systems>
To: openembedded-core@lists.openembedded.org
Date: Thu,  1 Mar 2018 15:16:45 -0800
Message-Id: <20180301231654.24018-5-matt@madison.systems>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20180301231654.24018-1-matt@madison.systems>
References: <20180301231654.24018-1-matt@madison.systems>
Subject: [PATCH v3 04/13] go.bbclass: remove debug-related commands
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
X-List-Received-Date: Thu, 01 Mar 2018 23:17:07 -0000

The 'go env' in the do_compile function and
the set -x/+x in the do_install_ptest function
were used for debugging the bbclass, and aren't
really needed.

Signed-off-by: Matt Madison <matt@madison.systems>
---
 meta/classes/go.bbclass | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/meta/classes/go.bbclass b/meta/classes/go.bbclass
index a126d531b8..a20d2dc0a7 100644
--- a/meta/classes/go.bbclass
+++ b/meta/classes/go.bbclass
@@ -88,7 +88,6 @@ go_do_configure() {
 do_configure[dirs] =+ "${GOTMPDIR}"
 
 go_do_compile() {
-	${GO} env
 	if [ -n "${GO_INSTALL}" ]; then
 		${GO} install ${GO_LINKSHARED} ${GOBUILDFLAGS} `go_list_packages`
 	fi
@@ -120,7 +119,6 @@ go_do_install() {
 }
 
 do_install_ptest_base() {
-set -x
     test -f "${B}/.go_compiled_tests.list" || exit 0
     tests=""
     while read test; do
@@ -154,7 +152,6 @@ EOF
     else
         rm -rf ${D}${PTEST_PATH}
     fi
-set +x
 }
 
 EXPORT_FUNCTIONS do_unpack do_configure do_compile do_install
-- 
2.14.1


