Return-Path: <nathan@nathanrossi.com>
Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com
	[209.85.214.196])
	by mail.openembedded.org (Postfix) with ESMTP id ECE617F0DC
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Aug 2019 05:07:38 +0000 (UTC)
Received: by mail-pl1-f196.google.com with SMTP id o3so410882plb.13
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Aug 2019 22:07:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=nathanrossi.com; s=google;
	h=date:message-id:in-reply-to:references:from:to:cc:subject
	:content-transfer-encoding:mime-version;
	bh=NMYU6tgAwE2p3qn5n3alLdWbOs4XToE8EyJmSd+pZXs=;
	b=ddDlBugxyIKhlC6m8C+obXg65BZsoq1GjPa0ZFmuEwAjvGuX7qfrw028ImvavUj4tN
	AMQcLrlyGQQp/gwmQWiPxwFXxFfobAORa31+ZUWt8sALnkFpDTK61xCNDQs1uYSTcEcg
	+E1La6rNxsJ8YjWCJFaaGTLrvHg/jgaLvw+BaRViy1UTUCKlzIlyz00nY8T1Cul99RCx
	Ijgi5P8i6zS7Gl8O2qXmN9dGWmGBF19SUgU6P9sBJCzK1Mvrk5gXw3kHECY1gZrprK0H
	LDckTnFSKFsmvk7FC7d2yHaPKAuH9dCO2UeOlUI9LbW0jD7TaX8PUN8+EnbRHd7wADKW
	PQ8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:message-id:in-reply-to:references:from:to
	:cc:subject:content-transfer-encoding:mime-version;
	bh=NMYU6tgAwE2p3qn5n3alLdWbOs4XToE8EyJmSd+pZXs=;
	b=LNFRRpLhK6t/Lj72ql9bx199M68i4kDm4367Q2NWKeSCVDtP/gyHwwkJy0E5NucqR5
	pBJpQdOs69tmc/iMAWAenAxHNCtJzi8zXqGQz5cqChU+1pn2v7ogcK5k1/hQ3NyAvSp7
	V6SXyrrbjyhOw2/y0AdLjrnWS+Ivp0+8E3jxS+RDQv0/xgScVJwtnRVNxtpwlelQppMo
	1wfShobsDr2tgr3CVhg2+I4kRJRNEPIwMtkdUyRqODVBRBJ2WO4VHLfpKUKLA3E5DfMg
	3WNDNOZKFXPD6VqFue4hvdg5glUUlacFURWahqhEZWlclw4QbP+FPijwFOLqWbjwrg0Y
	uWkg==
X-Gm-Message-State: APjAAAXklA6hy7eCdHQkvyYGj2xz7ZeR6qoUiZnVtbr1DYFKHmpgpQdn
	kH6YpYQQk7wDtD9OgMDU+GG2+A==
X-Google-Smtp-Source: APXvYqwbqqnEg/cqzi9Vq4vSL59JlBlNFkNnuZvxO2YW240ARrr0h2ilea4vzBWisEM0SIFecnUt6Q==
X-Received: by 2002:a17:902:b40c:: with SMTP id
	x12mr2463514plr.81.1566968860109; 
	Tue, 27 Aug 2019 22:07:40 -0700 (PDT)
Received: from [127.0.1.1] ([101.184.76.229])
	by smtp.gmail.com with UTF8SMTPSA id
	z16sm982760pgi.8.2019.08.27.22.07.37
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 27 Aug 2019 22:07:39 -0700 (PDT)
Date: Wed, 28 Aug 2019 05:06:29 +0000
Message-Id: <20190828050629.6392-11-nathan@nathanrossi.com>
In-Reply-To: <20190828050629.6392-0-nathan@nathanrossi.com>
References: <20190828050629.6392-0-nathan@nathanrossi.com>
From: Nathan Rossi <nathan@nathanrossi.com>
To: openembedded-core@lists.openembedded.org
MIME-Version: 1.0
Subject: [PATCH 11/11] scripts/lib/resulttool/report.py: Add more result types
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
X-List-Received-Date: Wed, 28 Aug 2019 05:07:39 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

Add additional result types into the dictionary to handle dejagnu style
test results. These include PASS, FAIL, XPASS, XFAIL, UNSUPPORTED,
UNTESTED, UNRESOLVED and ERROR.

Signed-off-by: Nathan Rossi <nathan@nathanrossi.com>
---
 scripts/lib/resulttool/report.py | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/scripts/lib/resulttool/report.py b/scripts/lib/resulttool/report.py
index f706280aa7..8b03717d29 100644
--- a/scripts/lib/resulttool/report.py
+++ b/scripts/lib/resulttool/report.py
@@ -19,9 +19,9 @@ class ResultsTextReport(object):
         self.ptests = {}
         self.ltptests = {}
         self.ltpposixtests = {}
-        self.result_types = {'passed': ['PASSED', 'passed'],
-                             'failed': ['FAILED', 'failed', 'ERROR', 'error', 'UNKNOWN'],
-                             'skipped': ['SKIPPED', 'skipped']}
+        self.result_types = {'passed': ['PASSED', 'passed', 'PASS', 'XFAIL'],
+                             'failed': ['FAILED', 'failed', 'FAIL', 'ERROR', 'error', 'UNKNOWN', 'XPASS'],
+                             'skipped': ['SKIPPED', 'skipped', 'UNSUPPORTED', 'UNTESTED', 'UNRESOLVED']}
 
 
     def handle_ptest_result(self, k, status, result, machine):
---
2.23.0.rc1

