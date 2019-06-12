Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-lj1-f196.google.com (mail-lj1-f196.google.com
	[209.85.208.196])
	by mail.openembedded.org (Postfix) with ESMTP id 092EA6C44B
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Jun 2019 22:51:21 +0000 (UTC)
Received: by mail-lj1-f196.google.com with SMTP id 16so16566256ljv.10
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Jun 2019 15:51:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=AgaUDUyR9zqP4YYXbMGUSmAuhZaHkYBTPA7Hi14kfXc=;
	b=IV2P44zmLPheqnG+mToGNZ4AqVJBTiy8J6dgV2I6PKYWEVrNrzjzBf6hrY1RLIfZtH
	iSMAM24ZZAleg5xwxbEd7jqqxbYFfR3fi5eL5DGDj1+641Yai142yDATop7mwPJ5q7C3
	ZOkBPm3+4jdGqDqwD/Q7pxNlgc7dQsDDfcXN9KfEkHQInJNtxz0risCa1MSy4CgLRBP8
	HNx348rEzUh0TWVNlZ66ubYY7S/xC2CEsjlYaFfbLIaI9UJuKrvkN44nSp4aKszWQ5op
	DkCOM3s5pReKWiKQmp4hv654HYk8fZ6gWY93yA4rEkkqJjKH7LUcJmNrcgToezS1jQkA
	qoew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=AgaUDUyR9zqP4YYXbMGUSmAuhZaHkYBTPA7Hi14kfXc=;
	b=onZSu3GN+dHPwILhk2eTc0x8EoiqJV4DaiGvRCy8ujWuL+yQ6tFDxboP86s1IbMvMY
	Tp6+qiNEp2pHlThsRV/Xwl/WBqmPzejAqqfZhTs7K+IgaeKzmuXGTZg+0mtOHYENIB01
	TAxMepQAW69GGadCfK1coo4gvz78wZbo+2nolGbL1IH1nYiSNMqnKNoW/aPW4FKzwoLa
	2JdlK5kQZh67q46oCC7A1YS4QFuYb0y0yZFKK32g32ZX81QwTIZ95ybIbhEO+Vi5+5an
	Qr3gSASoXMHrw6+5cHhpNvEot+vDZQUfMYgK3F+FoZGqgk5/sD/FO/xyAuIo+F6eX+3m
	aqeA==
X-Gm-Message-State: APjAAAVk8e+epeuXonVyxXsKJmvYi2+TUczxqlO0E/r1KGfZ4hWt2lwk
	mpx83WYiWFD+ocWO4LkDuKoLFexrlVQ=
X-Google-Smtp-Source: APXvYqwrDnhHC11buJaHFgFdJjTG8Fyi4ThusNL0rXB2jVq27JwtlOCKH1h8r7K6VqUh1g5noFO62Q==
X-Received: by 2002:a2e:2c14:: with SMTP id s20mr17709868ljs.54.1560379882385; 
	Wed, 12 Jun 2019 15:51:22 -0700 (PDT)
Received: from localhost.localdomain (c83-252-117-108.bredband.comhem.se.
	[83.252.117.108])
	by smtp.gmail.com with ESMTPSA id m17sm205425lji.16.2019.06.12.15.51.21
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Wed, 12 Jun 2019 15:51:21 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 13 Jun 2019 00:51:08 +0200
Message-Id: <20190612225108.19045-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.17.1
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH] selftest/devtool: fix URI to MarkupSafe package
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
X-List-Received-Date: Wed, 12 Jun 2019 22:51:23 -0000

PyPi packages are now hosted at files.pythonhosted.org.

[YOCTO Bug 13243]

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 meta/lib/oeqa/selftest/cases/devtool.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/cases/devtool.py b/meta/lib/oeqa/selftest/cases/devtool.py
index 434a7b9dd4..904ff6988b 100644
--- a/meta/lib/oeqa/selftest/cases/devtool.py
+++ b/meta/lib/oeqa/selftest/cases/devtool.py
@@ -393,7 +393,7 @@ class DevtoolAddTests(DevtoolBase):
         tempdir = tempfile.mkdtemp(prefix='devtoolqa')
         self.track_for_cleanup(tempdir)
         testver = '0.23'
-        url = 'https://pypi.python.org/packages/source/M/MarkupSafe/MarkupSafe-%s.tar.gz' % testver
+        url = 'https://files.pythonhosted.org/packages/c0/41/bae1254e0396c0cc8cf1751cb7d9afc90a602353695af5952530482c963f/MarkupSafe-%s.tar.gz' % testver
         testrecipe = 'python-markupsafe'
         srcdir = os.path.join(tempdir, testrecipe)
         # Test devtool add
-- 
2.17.1


