Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com
	[209.85.167.49])
	by mail.openembedded.org (Postfix) with ESMTP id C3B7D7E8DF
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Jun 2019 21:23:43 +0000 (UTC)
Received: by mail-lf1-f49.google.com with SMTP id a25so229383lfg.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Jun 2019 14:23:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=tudFVg6i5SgSpSVdWdmUZ6kR0LLZbfUiyRzLTAoPUvg=;
	b=STp9mtUYrA5pn8Crlatv68xWgzctI9PGVE5yxtPhTMsEBuyea10dLAPjmjMZVk6Mlt
	u6wK8RhRH18dJug6xyzWOVACy/bcVcYaIekJTfyFnHlVNTtiXb4B/t7gEVcrV3StFAOI
	UGmpkYsG/1KdRmT92+oHNpqfkWgHpF+ckCkHJ9aV/0ECAPY4Gb/ub2XW8FHVOKozZLKx
	a97G/AtpaKJqYNNEb10fEwUZCncANiTOqfeoGo5/Kccfz6q17NzVxIFTanNjTbO3vAeW
	i+uhH/A23YNrakAPstZ7aNUDmc8fidLtlM70t6uO++gmsCBnqJTEfZEjUIdYF4swyXvV
	IAEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=tudFVg6i5SgSpSVdWdmUZ6kR0LLZbfUiyRzLTAoPUvg=;
	b=p8+9IKS+vRlUYJaT1C3z5adAOtg2tX7qpBpyhyXD0HehW/3R6XxDD/1VwSUOYfsDHp
	Fg+IG1D4TvFr/K2ozliY53XrmfRaYbMNzV1O7UasmccJkoUxzeT/zbg4+V3wIRYoXX8E
	aZcCLnvmJxFcVLvZrgUXAmCIMzYI9EfFQrvDeIuWy7PUS5QUk9BaxxPqR8IEfPV3Mydb
	rG+ryXcPq8d1x9odcvTTHKWWLUPiPYqgWljGYYKMLl7CdEo+9ASpAuhRexDAJYYiHLy0
	gabrwstyYCzD4bIEhJFvt+RYA9kvKpq0kqt57eNElFjvNdXl3DYpmMTjXm1MUyhrr/5d
	qfXQ==
X-Gm-Message-State: APjAAAXBJRLQ/T8wGkRxzN6iscmCBoK51Gvp2E87y7hdWkhNtKU8EYsr
	Pn0ZjBkOftGU0iL6XjyqXRWf9V5TynE=
X-Google-Smtp-Source: APXvYqySXxLbzh8cF1JJw4wvhg81eOS22L7Zt1Di3ZoW+DOJU7wcZ9KtUAwGlkRONg2lYDc8yzLUoA==
X-Received: by 2002:ac2:4252:: with SMTP id m18mr21390712lfl.100.1560461023616;
	Thu, 13 Jun 2019 14:23:43 -0700 (PDT)
Received: from localhost.localdomain (c83-252-117-108.bredband.comhem.se.
	[83.252.117.108])
	by smtp.gmail.com with ESMTPSA id n3sm156703lfh.3.2019.06.13.14.23.42
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Thu, 13 Jun 2019 14:23:42 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
X-Google-Original-From: Oleksandr Kravchuk <oleksandr.kravchuk@pelagicore.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 13 Jun 2019 23:23:40 +0200
Message-Id: <20190613212340.15009-1-oleksandr.kravchuk@pelagicore.com>
X-Mailer: git-send-email 2.17.1
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH v3] selftest/devtool: fix URI to MarkupSafe package
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
X-List-Received-Date: Thu, 13 Jun 2019 21:23:44 -0000

From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>

PyPi packages are now hosted at files.pythonhosted.org.

[YOCTO #13243]

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


