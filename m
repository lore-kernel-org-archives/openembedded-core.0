Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f47.google.com (mail-wm0-f47.google.com [74.125.82.47])
	by mail.openembedded.org (Postfix) with ESMTP id 48143780D3
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Jun 2017 14:28:26 +0000 (UTC)
Received: by mail-wm0-f47.google.com with SMTP id n195so12504593wmg.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 07 Jun 2017 07:28:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=DZFcYxYmrArnYBwkeRVxNH24jV6bCb/xVgdCFzxu2Fw=;
	b=YAHPq4Lefn/hDWK5sVKNSrtK92ApGtOC+d2JacSYnQcEKeA0JTwzQSmTe3ZDwRUqmY
	lcOT2TMzeiz78ay+VoZCHcxs4tALd7syYqNWh+oYzdcWqkiRxTkMHp6pjZ2uNnoxjTOg
	wvCJNeOndT8uxfzR8OxSZJylaWMxxwdA2vn+vLhZkIoZdOVAftMIsYic2ewsY+V8GdHK
	V5WwqTx0i2yJze3L7SDKj/11olRZH5c3LMy3lM7+J/fFu+XmBLowXGfSvGFoyCnzM1yA
	yNTNdmCMM9BgGsR1cfeykJEo3AS45VBB/94oPOR+e78wZRl4HbW0LXGus8EuBqFd4roc
	5qig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=DZFcYxYmrArnYBwkeRVxNH24jV6bCb/xVgdCFzxu2Fw=;
	b=LAUSos55v6TftiiItQ1HtwzjeiOWlxwLz/bk/22/Z733DibrPhmQLE23/hShk2EXnp
	eTQMaTCvDwC5e97GIHcZtN1CUbX4KxJN2gRjU/qE4F1jIyVJhthB0lNjxaideY0YrT9C
	Q4K8RY43tIGn+49Rp2ExgWqIkCn09luJSU/nu8jtHyvWDCwkZYAe0GcP62TOlzrhvfEy
	46xpacWBIjZK4XYSH71woduGBoTcx3csNn3g8U/Yi3xypS3SojFIl03yxqIvBLLsQ4XZ
	BE4gzgd53sV2IrFJW8L4Ta0H0SF4srest8/NDWmiHAeSMtuYkvRJuJ15ZiPCh6NpPmLq
	pTlw==
X-Gm-Message-State: AODbwcCQBD/5WCUtpDtf/FGorXEsR0dcL0URxaaI7VYiP3fkom+LaA52
	XHZve0jWxG6YJmu5q9A=
X-Received: by 10.28.16.145 with SMTP id 139mr2481939wmq.49.1496845707558;
	Wed, 07 Jun 2017 07:28:27 -0700 (PDT)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id 2sm2588673wrx.26.2017.06.07.07.28.26
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 07 Jun 2017 07:28:26 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  7 Jun 2017 15:28:24 +0100
Message-Id: <1496845704-17170-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.8.1
Subject: [PATCH][krogoth] oeqa/selftest/recipetool: actually fix create_github test
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
X-List-Received-Date: Wed, 07 Jun 2017 14:28:27 -0000

The Meson revision was locked down but the license list change wasn't actually
committed...

Also specify the exact path for recipetool to write to, for clarity.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/lib/oeqa/selftest/recipetool.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oeqa/selftest/recipetool.py b/meta/lib/oeqa/selftest/recipetool.py
index 312684b..0ec8381 100644
--- a/meta/lib/oeqa/selftest/recipetool.py
+++ b/meta/lib/oeqa/selftest/recipetool.py
@@ -448,10 +448,10 @@ class RecipetoolTests(RecipetoolBase):
         os.makedirs(temprecipe)
         recipefile = os.path.join(temprecipe, 'meson_git.bb')
         srcuri = 'https://github.com/mesonbuild/meson;rev=0.32.0'
-        result = runCmd(['recipetool', 'create', '-o', temprecipe, srcuri])
+        result = runCmd(['recipetool', 'create', '-o', recipefile, srcuri])
         self.assertTrue(os.path.isfile(recipefile))
         checkvars = {}
-        checkvars['LICENSE'] = set(['Apache-2.0', 'Unknown'])
+        checkvars['LICENSE'] = set(['Apache-2.0'])
         checkvars['SRC_URI'] = 'git://github.com/mesonbuild/meson;protocol=https'
         inherits = ['setuptools']
         self._test_recipe_contents(recipefile, checkvars, inherits)
-- 
2.8.1


