Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6455.1794455917821134604
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Nov 2026 19:58:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=d17J2tP/;
 spf=pass (domain: gmail.com, ip: 209.85.215.169, mailfrom: bbnpreetsingh@gmail.com)
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-cd8ba7c2694so1512333a12.1
        for <openembedded-core@lists.openembedded.org>; Wed, 11 Nov 2026 19:58:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794455917; x=1795060717; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jID7rv9CuP81VaLsbyAftDEqjSjFw28aBZ4LuywuYII=;
        b=d17J2tP/LfxzffXW7O3PB9HDmrSjkDq8IiBJA24Hn4Oc2qmUSuyhCOkRgVupQKswOH
         IjjW+3uNyRlP3TdQQNO5Fe+IZCzIJtCvky009dThng0TtdLtyCEfsl4OEFGB7JmbyIUT
         I3hno/LlOw65X6/SABbC/wXNXPzgKERwmVDcl/zIv7Z0Q7b2EQ+ugiKjD/8u5giTLMmK
         /8lLng5IyPIRyhTopGiIU2+zyDZIu5QIx3aEI9nbLsDFJVt43LU9jXl1l8/8hnG7GmpF
         aalhBVM02lVDCchVQKg/vdvTHElah8w0FGM1e/6OBmBr5JIC5FV0RTfXEPW4P1KUbbyP
         MUcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794455917; x=1795060717;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jID7rv9CuP81VaLsbyAftDEqjSjFw28aBZ4LuywuYII=;
        b=gS+afR7u0/Sl9r85PKsL02ZNuOq8ZdK1TSdybs52Bso/zNDCMATuJ1rb1wRvb4LdCV
         oFp6mNS9d7o/y31ZC9XIN5ERyP5hVEscOjPqs5ZqqQGG/Em7JYV3ttuKm2QkL+uEDOaK
         rFr+RIUe6NMo1QfS0hqJver6vb9JXWr0WKGbfNHXPZxVvreHdBWlOMybjSi1oqxXWi+Y
         XjToRxPrM2cJllQrTvSO/ZNOLLnoxVb1uXAmbim5AcvzO26818Px8CfnU7nMnTlfW+iG
         b9FuCAGL1rrdJ8bdPpzBrkwsix/bj748CqeKoORhi8r/KbfvMacjY/T/mF/bFv/YD5Xi
         mQmg==
X-Gm-Message-State: APuU4Z/6b6COwIXzdPFDZzNv6jKsakgHRaFcUSnarswgF/GpjTgIAOTr
	/n26w87djChM9b5tuZjpJBZCciVGV1hWOKsWnVlDuRbUo0dhWc2pqO/63uGChXho
X-Gm-Gg: AYBFou0dYGLRDEmjY+zY6DBEhOfajYTVwqbnzOrOvVYxqzX4DcIH3TmpZeBkzFyUKj/
	dU7iqM3Dp1GRWyRHG2AFUljy+6Gn7VRfHOkuMviuAmxow97Pkmc5y2WaplVTNSctvifK+Q15ONL
	qDsEUu4D+OhcbyEZLgeYPAVQtsM+E7qar1u750Y9+Z3CsU92JSvzPhlZ6kgwoFJCp0xJmvSNOel
	VrRT6kkf2jYUnD3ynISivDm/k6lIoAqVq8A9GMb/LAjDKz+7dYc4RHRmxRy2U2GuOHjfZM0B5fX
	zY9AZtmb/9On8KasTqhrMbk9hySloFHOV43qfhvYNJfOL+Xzsr+UchGfZ7Mymd/ybm5gZzm04cU
	UB+zheXVl2S454HIl1lhZBuOm+wJKqGX1+mfeUiQY3cjGObBXRg+M33NfWcWbW7jK0FPCCEjYgk
	TVkB8ZbpqcIPXhXwPwVcTDOx038G7F4J3oJAml21R3Qpol/TRkAmw1fwNCsBiWV2/dFvdn0llpN
	j1oHgOK+qaa26fuaN3+/uSX5XrbgKl2N0ofuv+pjpDLCdA2/rtbJt4ogmwM44824W6MMRu66+Mo
	QH79QtUhN3vzaen8JnnuDKcoY7K3NJOFoOw1pbDL6NoMU38jQ/HGg1V0ryBDdDo=
X-Received: by 2002:a17:90b:2688:b0:3a7:9adb:2a0d with SMTP id 98e67ed59e1d1-3b182d4462bmr4111794a91.0.1794455917096;
        Wed, 11 Nov 2026 19:58:37 -0800 (PST)
Return-Path: <bbnpreetsingh@gmail.com>
Received: from localhost.localdomain ([108.180.159.198])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197d0fdbdsm2254249a91.10.2026.11.11.19.58.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 19:58:36 -0800 (PST)
From: Babanpreet Singh <bbnpreetsingh@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Ross Burton <ross.burton@arm.com>,
	Babanpreet Singh <bbnpreetsingh@gmail.com>
Subject: [PATCH 2/2] recipetool: create: fix git URLs that only specify a tag
Date: Thu, 12 Nov 2026 03:58:34 +0000
Message-ID: <20261112035834.7-2-bbnpreetsingh@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261112035834.7-1-bbnpreetsingh@gmail.com>
References: <20261112035834.7-1-bbnpreetsingh@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 12 Nov 2026 03:58:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250063
Content-Type: text/plain; charset="utf-8"

A git URL with tag= and no branch= fails with:

  Unable to resolve '' in upstream git repository

AUTOREV has no branch to follow now that bitbake no longer defaults to
master. Fetch the tag itself, which also lets the branch be found from
it.

AI-Generated: Uses Claude (claude-fable-5-2)
Signed-off-by: Babanpreet Singh <bbnpreetsingh@gmail.com>
---

Notes:
    Tested with oe-selftest -r recipetool.RecipetoolCreateTests. Not tried
    on wrynose, which has the same code.

 meta/lib/oeqa/selftest/cases/recipetool.py | 7 +++++++
 scripts/lib/recipetool/create.py           | 4 ++++
 2 files changed, 11 insertions(+)

diff --git a/meta/lib/oeqa/selftest/cases/recipetool.py b/meta/lib/oeqa/selftest/cases/recipetool.py
index c278abdab2..804efcc755 100644
--- a/meta/lib/oeqa/selftest/cases/recipetool.py
+++ b/meta/lib/oeqa/selftest/cases/recipetool.py
@@ -811,6 +811,13 @@ class RecipetoolCreateTests(RecipetoolBase):
         self._test_recipetool_create_git('git://git.yoctoproject.org/matchbox-keyboard;branch=matchbox-keyboard-0-1;protocol=https;tag=0.1.1',
                                          extravars={'SRCREV': '630d89068dc0a1e9199306d405cb32f892dfa4d3'})
 
+    def test_recipetool_create_git_srcuri_tag(self):
+        # The 0.1.1 tag is only on the matchbox-keyboard-0-1 branch
+        srcuri = 'git://git.yoctoproject.org/matchbox-keyboard;protocol=https;tag=0.1.1'
+        self._test_recipetool_create_git(srcuri,
+                                         extravars={'SRC_URI': srcuri + ';branch=matchbox-keyboard-0-1',
+                                                    'SRCREV': '630d89068dc0a1e9199306d405cb32f892dfa4d3'})
+
     def _go_urifiy(self, url, version, modulepath = None, pathmajor = None, subdir = None):
         modulepath = ",path='%s'" % modulepath if len(modulepath) else ''
         pathmajor = ",pathmajor='%s'" % pathmajor if len(pathmajor) else ''
diff --git a/scripts/lib/recipetool/create.py b/scripts/lib/recipetool/create.py
index 662e7a6232..0e73f462d3 100644
--- a/scripts/lib/recipetool/create.py
+++ b/scripts/lib/recipetool/create.py
@@ -520,6 +520,10 @@ def create_recipe(args):
             storeTagName = params['tag']
             params['nobranch'] = '1'
             del params['tag']
+            if srcrev == '${AUTOREV}':
+                # Nothing for ${AUTOREV} to resolve without a branch, so
+                # fetch the tag itself
+                srcrev = storeTagName
         # Assume 'master' branch if not set
         if scheme in ['git', 'gitsm'] and 'branch' not in params and 'nobranch' not in params:
             params['branch'] = 'master'
-- 
2.43.0

