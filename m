Return-Path: <matt@madison.systems>
Received: from mail-pg0-f67.google.com (mail-pg0-f67.google.com [74.125.83.67])
	by mail.openembedded.org (Postfix) with ESMTP id 66EE078A8F
	for <openembedded-core@lists.openembedded.org>;
	Sun,  4 Mar 2018 21:09:47 +0000 (UTC)
Received: by mail-pg0-f67.google.com with SMTP id q27so6021562pgn.8
	for <openembedded-core@lists.openembedded.org>;
	Sun, 04 Mar 2018 13:09:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=madison-systems.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=q7chO612lqrUmiILVz0aIoY9t42mimVZSQC1uQ3sK/c=;
	b=0P02WOM05BKenAzcB8fnLqEScFaaEXS6y8Ho/I+yWxeEvQP7qgTW2SIOdxv40qQVQg
	v8yBKfU/2XWhyxdDqxUR8dAZ7RDAiwH3WkR7a+VQ9AyB+lMCanPTWqKSrJBGiP1wwxMF
	NALpiKAsu/vmUPVKeHd+IUA1DjLXMXG0taTxpz2COBVoddjplSui8K13j8n09KMPmCCi
	/nvPVsKv1iOFoq6dkQ+0CjG7jAxuq+tP0lqyALFvj+wiZcIZTAO6nGsOWUH93wrVwmjx
	qSCtDLOqZ5ljWteuFo+BYF1YIS6anZJrcvl3QF7hiiDwpbnFvUFEelxM0M5OAf130ZzA
	zL/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=q7chO612lqrUmiILVz0aIoY9t42mimVZSQC1uQ3sK/c=;
	b=fxQfMCAj295izNGfeyXB5DTy+c2DGTVrQEY0QaHcrVDvSrUk3o00gCcv6TQ3h0H7pQ
	IPRj+ufod8TJqgx15t56N4u2593odYGe7c0Ghx1pFHwHDzbajrvRtrboZLoGs4DijCby
	uquVtTuFfmSIDQHAoVE1xBTULCYyLlYtOxOlWC19YyOkzlXVv6wtWXnMzLMEPN+0ZQwf
	BuSQNla6e8UdSgpS8zdN/+ebHOlhPCTSXOqEF8wryKdBGs366PA5ZBsypmjalLEGKc9H
	DGiQ69hBaqa+yqxmPSAdZCiCcXmr3Mur58JH0e/QtR8fK4eUwAqfwRmYS4VpH8Dql7ry
	hlaA==
X-Gm-Message-State: APf1xPDImN5/AvS/9QSsdmFWmUBsw2DkgFAY3oukPwBvVIhFJtTZ5CSj
	gFLf0SZKV+0iRFlSJv0lHFJ9hJxu
X-Google-Smtp-Source: AG47ELu8OkCz2aRA+G7BQK/W/o6+E2d8IzxOCeC8/PRrY99c8j4+gSvXEfY/ayhlfGOfwCiBQMTCoA==
X-Received: by 10.101.102.21 with SMTP id w21mr10747536pgv.247.1520197788384; 
	Sun, 04 Mar 2018 13:09:48 -0800 (PST)
Received: from workhorse.athrat.org (c-67-170-200-185.hsd1.ca.comcast.net.
	[67.170.200.185]) by smtp.gmail.com with ESMTPSA id
	x123sm18594829pgb.5.2018.03.04.13.09.46
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 04 Mar 2018 13:09:47 -0800 (PST)
From: Matt Madison <matt@madison.systems>
To: openembedded-core@lists.openembedded.org
Date: Sun,  4 Mar 2018 13:09:28 -0800
Message-Id: <20180304210937.29727-5-matt@madison.systems>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20180304210937.29727-1-matt@madison.systems>
References: <20180304210937.29727-1-matt@madison.systems>
Subject: [PATCH v5 04/13] go.bbclass: remove debug-related commands
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
X-List-Received-Date: Sun, 04 Mar 2018 21:09:47 -0000

The 'go env' in the do_compile function and
the set -x/+x in the do_install_ptest function
were used for debugging the bbclass, and aren't
really needed.

Signed-off-by: Matt Madison <matt@madison.systems>
---
 meta/classes/go.bbclass | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/meta/classes/go.bbclass b/meta/classes/go.bbclass
index 96302a187c..21ac2276c5 100644
--- a/meta/classes/go.bbclass
+++ b/meta/classes/go.bbclass
@@ -89,7 +89,6 @@ do_configure[dirs] =+ "${GOTMPDIR}"
 
 go_do_compile() {
 	export TMPDIR="${GOTMPDIR}"
-	${GO} env
 	if [ -n "${GO_INSTALL}" ]; then
 		if [ -n "${GO_LINKSHARED}" ]; then
 			${GO} install ${GOBUILDFLAGS} `go_list_packages`
@@ -126,7 +125,6 @@ go_do_install() {
 }
 
 do_install_ptest_base() {
-set -x
     test -f "${B}/.go_compiled_tests.list" || exit 0
     tests=""
     while read test; do
@@ -160,7 +158,6 @@ EOF
     else
         rm -rf ${D}${PTEST_PATH}
     fi
-set +x
 }
 
 EXPORT_FUNCTIONS do_unpack do_configure do_compile do_install
-- 
2.14.1


