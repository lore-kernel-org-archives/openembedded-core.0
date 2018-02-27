Return-Path: <matt@madison.systems>
Received: from mail-pl0-f68.google.com (mail-pl0-f68.google.com
	[209.85.160.68])
	by mail.openembedded.org (Postfix) with ESMTP id 91D5678766
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Feb 2018 12:36:58 +0000 (UTC)
Received: by mail-pl0-f68.google.com with SMTP id k8so11268692pli.8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Feb 2018 04:37:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=madison-systems.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=x62buxftu2YJKMN9wDD7oHgNmhfDxDzFgLOlqOlLmU0=;
	b=boczFOy2/3F4d59RUO7OnZ82VM9m/COI31ApGjnbg6Qh/Agw+TblEgOzo8mFbTC7BB
	Wxv8Ogbhv/sP5JZd2yQXQZWEkq5DC6TO8OaKCfLIRTOAn4qoQnEkzVV9RFf0Znfz+snJ
	pcqhopyTHBgWBwSwoMyVCVO3IxzPYm84Z8+VNX13NeGZrTBPc8/SAIRVfAJXTVGAlEcz
	T7G79jl9LSnmwzsK7qwCsqpt5Jj2S83BaGjPqb48rr6kyI59Lakl5ngvGkX91kLz08xS
	8En3ba7/7p41Plw6FEnLtSFIakOE+P9ebt10Rcmc444pddiwkePIm3QAxxGOAyPsVO47
	qvCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=x62buxftu2YJKMN9wDD7oHgNmhfDxDzFgLOlqOlLmU0=;
	b=KlyD63Y4pQ9JzfWnDU9+crFIqIFinLNPxOOZfZ1UXfNK/0AXqj118I+61fvVfKAxjd
	ndBN98Wgs8Hvv3kul+uqUGGmIumpJ5WwNt/aqh9l29cEK8iuZbxFVBOxP7dJm3MD/WYo
	+QjJ+BEuVAuFvWgaE9KYMCUdSIMzzhAyBoSykARALafoJPvWI/twPWlfXsybsZhSvReo
	Q1MLG7CgD5qIS3EWc0YVbdgH7pB87V6Rfrcv/N+apkV5QaQSCdzXBwaOgux8m7LzTsqf
	1n9FpSOSzVXWhBhpWDUwQyINK/8gD+BRb/Hxu0GdF5rth5yDAXK3XNBcoOEq/Hi/i+W3
	fcVA==
X-Gm-Message-State: APf1xPCFZGwYdnb1utH8p+MRKahVRW/1FG0R+BBrHHcGY7FLdKTrO3rO
	JeNAXCbO0EOwYkeTwtRMYCL0UQ5V
X-Google-Smtp-Source: AH8x226OGj91i8ERAxvpAEaBeZjRWnDanbbAwYE6xCFktUvULiGDB8Y9+tnFFVm7OiNvGOz+yo17Xw==
X-Received: by 2002:a17:902:850a:: with SMTP id
	bj10-v6mr14386586plb.5.1519735019411; 
	Tue, 27 Feb 2018 04:36:59 -0800 (PST)
Received: from workhorse.athrat.org (c-67-170-200-185.hsd1.ca.comcast.net.
	[67.170.200.185]) by smtp.gmail.com with ESMTPSA id
	o82sm1596760pfj.163.2018.02.27.04.36.57
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 27 Feb 2018 04:36:58 -0800 (PST)
From: Matt Madison <matt@madison.systems>
To: openembedded-core@lists.openembedded.org
Date: Tue, 27 Feb 2018 04:36:30 -0800
Message-Id: <20180227123634.2812-5-matt@madison.systems>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20180227123634.2812-1-matt@madison.systems>
References: <20180227123634.2812-1-matt@madison.systems>
Subject: [PATCH v2 4/8] go.bbclass: remove debug-related commands
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
X-List-Received-Date: Tue, 27 Feb 2018 12:36:58 -0000

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


