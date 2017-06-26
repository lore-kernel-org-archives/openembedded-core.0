Return-Path: <anders@chargestorm.se>
Received: from mail-lf0-f53.google.com (mail-lf0-f53.google.com
	[209.85.215.53])
	by mail.openembedded.org (Postfix) with ESMTP id 8585671A15
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Jun 2017 06:52:59 +0000 (UTC)
Received: by mail-lf0-f53.google.com with SMTP id m77so55159328lfe.0
	for <openembedded-core@lists.openembedded.org>;
	Sun, 25 Jun 2017 23:53:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=chargestorm-se.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=seCdmq+esdEHkp+0sWz/5Wb8I3jZh7QIc6QEayXmEQo=;
	b=10BUpw2SlCZFJ8gA1vUa74Dli6ZB2Xfo4v7F3jYpbYeWfeKRhJMDNUc6M+ALoO3xTl
	JR6JnrSxt3pRkRabPQSzlTSnv2Lij+azmgUwh/wpHEIlh8MyTH1F/oORJ4mYIqq/y421
	bFt3gDf8JK+/gNiUgUQzfxSeh96EDQzebnx8MZwnMi3Bs+IdiOAoGoy/eQxodJ4d3vzd
	tCum1HwENYlMDTsl2hpNRcOIl3ByQ4PXPaeo2yTZOVdEug8jKy+GphucPhRCZiWrOfce
	e6F/x5nk+gKtwarUzPOKl8yKvXi6fMx2UOEuqF+VyRGsM3ESKIdwtEBV1vLQz4zqIUtt
	/Bkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=seCdmq+esdEHkp+0sWz/5Wb8I3jZh7QIc6QEayXmEQo=;
	b=RZH9wh8busws8L4BxsPoYajZSCzGSPmDL7aLlJVzTSA5gAW8rDX3C8ntNeeVKuR3vC
	qiTxnYbE6MTY9PjA6RXDvpFm8oEARUZHdlUA75vqrvfHvLRZf0OuZvbBhgPrAeazajFt
	IatIplI4j9+kUPDRn/MI9fa8kZtluC9eLAhd89vJom8Q7uTk/j7EinHYzdFlSqrhmkQn
	+1ioM0msEI9Eha4gopxMOxaDxiWLK/WarnN8kn3lr44/Etz9DiAHAt+HXMcYV7hixk8p
	iwzMcXMVKToopVKbGqIb0J/DZw6mhq+luVSJBcOEkS0A2ZggXV35STtRQVAEMsC08cPi
	+f1A==
X-Gm-Message-State: AKS2vOw54OHbeRhYTSwBIJUU+rm0Ky4jN7gKeD6tOtJS5XjUZuQ6XJ7x
	FgNGHnEhCM4jsI8T4IksCw==
X-Received: by 10.46.88.78 with SMTP id x14mr5640429ljd.108.1498459979694;
	Sun, 25 Jun 2017 23:52:59 -0700 (PDT)
Received: from localhost (194-237-220-218.customer.telia.com.
	[194.237.220.218]) by smtp.gmail.com with ESMTPSA id
	n132sm3490800lfn.61.2017.06.25.23.52.58
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sun, 25 Jun 2017 23:52:58 -0700 (PDT)
From: Anders Darander <anders@chargestorm.se>
To: openembedded-core@lists.openembedded.org
Date: Mon, 26 Jun 2017 08:52:53 +0200
Message-Id: <cover.1498459830.git.anders@chargestorm.se>
X-Mailer: git-send-email 2.13.1
Subject: [pyro][PATCH 0/1] Backport fix for debugfs generation
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
X-List-Received-Date: Mon, 26 Jun 2017 06:53:00 -0000

An older commit, which is in both master and pyro, broke the generation of 
debugfs'. This has been fixed in master by Martin Jansa, so lets backport this to
pyro.

The following changes since commit 0b5e0d072f93a958e4211a8aeb2fd8cc3c25cc21:

  package_ipk: Clean up Source entry in ipk packages (2017-06-16 10:18:55 +0100)

are available in the git repository at:

  git://github.com/darander/openembedded-core pyro-debugfs
  https://github.com/darander/openembedded-core/tree/pyro-debugfs

Martin Jansa (1):
  package_manager: flush installed_pkgs file before oe-pkgdata-util uses
    it

 meta/lib/oe/package_manager.py | 1 +
 1 file changed, 1 insertion(+)

-- 
2.13.1


