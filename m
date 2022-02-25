Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6DDAC433EF
	for <webhook@archiver.kernel.org>; Fri, 25 Feb 2022 05:31:10 +0000 (UTC)
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com
 [209.85.210.175])
 by mx.groups.io with SMTP id smtpd.web09.3749.1645767070548090977
 for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Feb 2022 21:31:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Lvvdgw8m;
 spf=pass (domain: gmail.com, ip: 209.85.210.175,
 mailfrom: ticotimo@gmail.com)
Received: by mail-pf1-f175.google.com with SMTP id p8so3787273pfh.8
        for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Feb 2022 21:31:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=yJzYWEL4suFsfSm5FovBlD8Sk6cSxPpriDA2PwZCYbo=;
        b=Lvvdgw8mFK0tDAHPACYshU8V5oYgjkXQAkcNnkWA8sLrMHLQUI9zGvLZgWslE7zgl5
         kFXxBbbyj2ujC9d1CCobkXCHQNSLUdl3f7B9omn0SFaSQCn/rOGXaKGF6NelcmJ/tysu
         0hELht49guauxORPiMZ0hZPcxVG21s29hxO6z90RBlhhmithOFjxeXVt+Rpo9KqjTMPH
         l4nhM9zrTKouqITjtFn5740hkCvowcc3HH9y+Lotufz+jvUxuzEg/jXdAthWa2Dj14Ua
         rRnxLx5z4NFeI1s1PPUZWRuJBRyEi6bEm2CVkvV3ir0qeKRyh7Ru+zOs31INcekV15gn
         +wSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=yJzYWEL4suFsfSm5FovBlD8Sk6cSxPpriDA2PwZCYbo=;
        b=Ayq6hvaQhK8sraUcyrE1fep9PgLGGssT3aTOlUL5TcGuL8L8M+/+Mu1bDLIKqUPH8U
         OHbZOK3ac6KjbDOKc4LlUiRHtzwnYhOgEc9q0QDJt/AFg95e3zifvrT8krmv9JS30Msm
         sikvtOoPt/jcHe679kyULXcdn+AmvFTUXmH4gK1bDjD8pbAh4dMvhjMC+n2lctUHhwVt
         gK0S+Bue21V3HmYx9iapg4PAdfu9HyX9M1D71iSlk9PVxU/CeJ/ViCoVWKPoCVmvkJYc
         tEsWnMec262+GIVNwVVm+8QWdl3dlaTWIB8Hw8VP1kkjJZvYOasCPNSh5WA44Q4H5UXJ
         kfbQ==
X-Gm-Message-State: AOAM532zVwzn+LkCTSs1LGYvpKaJpNUt3lw4hJU+Tf6NV7ma+gtBj/Lt
	TC4pj2csL/lSq/VZqCxJV8bDicodhBHPrQ==
X-Google-Smtp-Source: 
 ABdhPJx9kUajDK5hptK54QjrdVREl6y+622I2I/FOqhbMNwXebm1lyGqnxyDoOY2NTi/ft/Nw/y0lw==
X-Received: by 2002:a63:f315:0:b0:376:2310:ffed with SMTP id
 l21-20020a63f315000000b003762310ffedmr2643331pgh.23.1645767069624;
        Thu, 24 Feb 2022 21:31:09 -0800 (PST)
Received: from nereus.hsd1.or.comcast.net
 ([2601:1c0:6000:1b20:263d:523e:139c:a040])
        by smtp.gmail.com with ESMTPSA id
 d5-20020a056a0010c500b004e1b283a072sm1375634pfu.76.2022.02.24.21.31.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Feb 2022 21:31:09 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-core@lists.openembedded.org
Cc: Tim Orling <tim.orling@konsulko.com>
Subject: [PATCH 2/2] selftest: drop distutils3 test from recipetool
Date: Thu, 24 Feb 2022 21:30:51 -0800
Message-Id: <20220225053051.1000603-2-tim.orling@konsulko.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220225053051.1000603-1-tim.orling@konsulko.com>
References: <20220225053051.1000603-1-tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 25 Feb 2022 05:31:10 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162339

The distutils*.bbclasses have been moved from oe-core to
meta-python, so drop test_recipetool_create_python3_distutils
test case.

[YOCTO #14610]

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 meta/lib/oeqa/selftest/cases/recipetool.py | 19 -------------------
 1 file changed, 19 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/recipetool.py b/meta/lib/oeqa/selftest/cases/recipetool.py
index 9db1ddb5320..09448bad016 100644
--- a/meta/lib/oeqa/selftest/cases/recipetool.py
+++ b/meta/lib/oeqa/selftest/cases/recipetool.py
@@ -472,25 +472,6 @@ class RecipetoolCreateTests(RecipetoolBase):
         inherits = ['setuptools3']
         self._test_recipe_contents(recipefile, checkvars, inherits)
 
-    def test_recipetool_create_python3_distutils(self):
-        # Test creating python3 package from tarball (using distutils3 class)
-        temprecipe = os.path.join(self.tempdir, 'recipe')
-        os.makedirs(temprecipe)
-        pn = 'docutils'
-        pv = '0.14'
-        recipefile = os.path.join(temprecipe, '%s_%s.bb' % (pn, pv))
-        srcuri = 'https://files.pythonhosted.org/packages/84/f4/5771e41fdf52aabebbadecc9381d11dea0fa34e4759b4071244fa094804c/docutils-%s.tar.gz' % pv
-        result = runCmd('recipetool create -o %s %s' % (temprecipe, srcuri))
-        self.assertTrue(os.path.isfile(recipefile))
-        checkvars = {}
-        checkvars['LICENSE'] = 'BSD-3-Clause & GPL & PSF'
-        checkvars['LIC_FILES_CHKSUM'] = 'file://COPYING.txt;md5=35a23d42b615470583563132872c97d6'
-        checkvars['SRC_URI'] = 'https://files.pythonhosted.org/packages/84/f4/5771e41fdf52aabebbadecc9381d11dea0fa34e4759b4071244fa094804c/docutils-${PV}.tar.gz'
-        checkvars['SRC_URI[md5sum]'] = 'c53768d63db3873b7d452833553469de'
-        checkvars['SRC_URI[sha256sum]'] = '51e64ef2ebfb29cae1faa133b3710143496eca21c530f3f71424d77687764274'
-        inherits = ['distutils3']
-        self._test_recipe_contents(recipefile, checkvars, inherits)
-
     def test_recipetool_create_github_tarball(self):
         # Basic test to ensure github URL mangling doesn't apply to release tarballs
         temprecipe = os.path.join(self.tempdir, 'recipe')
-- 
2.30.2


