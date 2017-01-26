Return-Path: <liu.ming50@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id ABE85606A8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Jan 2017 13:29:45 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id d140so50660729wmd.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Jan 2017 05:29:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=Biz6w0T6SP7L/4QMLDnc6zav374cpUFCowDBHcW16n4=;
	b=ewiV1rSF2LrsmlFhpYNPHI+uq6vzZq+Kw7eZi9HtTxdm13N5VAEDegSu8GnC1ABnGY
	i5hkP/RelIVJdXfoV5HsrrVgh72lfTgGnHB3JAQandhFq75x4zP9sKGWZUn664MFVm5A
	9NRbh4ehAijw+albFcrGYGj5Sv9J9UQfMaPth1tKC4AGo0A8GFcxgtMw7JpKuZk1tVr8
	xk14udgxjuWNAsVSS+BKcvetxYA+hfTdARpDRWdCyQnqfwBIJz44BIfLDs/A0dyPXKUh
	Uf88sSlPlawoZ95kYehy027s1zEglCZDgekGz2HmAJ3zRIhjG8ypAXYXOc9ThuLbNnL0
	KtXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=Biz6w0T6SP7L/4QMLDnc6zav374cpUFCowDBHcW16n4=;
	b=qlZkibOjKsEq3pufqOKST7vhT1wd9zgyvB156eQoOwdZbl2DCJD5IhSf/ecFg7kdav
	+x2+bX1RJzCiVZzHqdseOkLGEH5PhbfWT3rETzi3sLD+tMonWRCw9lkz08YxvSdtrB1M
	g6ctskd/PoDgJiFJ7UJQy2rmUzj7IjhFVrkh8kFa90hsdctiZX6JPYznwbWnLlaGjf45
	1U1mvuceh0mYoPyay0DvtCqQU7DL8EyaRd+XrsLsZDTTeuYDHK+d3FHVTM6lM9qywgXL
	RpCgXGDwEwxAsvcrKFp0cqvcdtxaHx7adQiPIRCUMuAInN+dE470BNIuckwic9v3RVg4
	/+Ng==
X-Gm-Message-State: AIkVDXIPZcwDhNO80MFGnJMj43nBhcEm8KMgc4N3pfjB84RD3mPuhVAUx6C/oj+0A8aWQQ==
X-Received: by 10.28.203.6 with SMTP id b6mr25769829wmg.2.1485437385512;
	Thu, 26 Jan 2017 05:29:45 -0800 (PST)
Received: from peterliu-Precision-M4800.emea.group.atlascopco.com
	([106.116.224.150]) by smtp.gmail.com with ESMTPSA id
	a35sm2611227wra.21.2017.01.26.05.29.43
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 26 Jan 2017 05:29:44 -0800 (PST)
From: liu.ming50@gmail.com
To: openembedded-core@lists.openembedded.org
Date: Thu, 26 Jan 2017 14:29:32 +0100
Message-Id: <1485437372-10456-2-git-send-email-liu.ming50@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1485437372-10456-1-git-send-email-liu.ming50@gmail.com>
References: <1485437372-10456-1-git-send-email-liu.ming50@gmail.com>
Cc: Ming Liu <peter.x.liu@external.atlascopco.com>
Subject: [PATCH] meta: remove remaining True option to getVarFlag calls
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
X-List-Received-Date: Thu, 26 Jan 2017 13:29:46 -0000

From: Ming Liu <peter.x.liu@external.atlascopco.com>

This is a complementary fix to commit 2dea9e49:
[ meta: remove True option to getVarFlag calls ]

it intended to remove all True option to getVarFlag calls, but there are
still some remaining.

Search made with the following regex: getVarFlag ?\((.*), True\)

Signed-off-by: Ming Liu <peter.x.liu@external.atlascopco.com>
---
 meta/lib/oe/data.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oe/data.py b/meta/lib/oe/data.py
index 3956733..80bba2b 100644
--- a/meta/lib/oe/data.py
+++ b/meta/lib/oe/data.py
@@ -30,7 +30,7 @@ def export2json(d, json_file, expand=True):
             continue
         elif key.startswith("do_"):
             continue
-        elif d.getVarFlag(key, "func", True):
+        elif d.getVarFlag(key, "func"):
             continue
 
         keys2export.append(key)
-- 
1.9.1


