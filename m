Return-Path: <akuster808@gmail.com>
Received: from mail-pg0-f66.google.com (mail-pg0-f66.google.com [74.125.83.66])
	by mail.openembedded.org (Postfix) with ESMTP id AB71E71A8E
	for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Dec 2017 16:34:40 +0000 (UTC)
Received: by mail-pg0-f66.google.com with SMTP id e14so8226132pgr.9
	for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Dec 2017 08:34:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id;
	bh=Uqw7LV7IqkQNApDe8b1PRsS52vtnc5L80Nu+QVMNcZE=;
	b=pE52Hi7Fw5wqZIpmb9B2m6YZKcb0oyybbx0oqTeXU4KBOkG596f68RYAljcj0T1J22
	D7gqo9dn9tSeE/eITwlEpj/kNTO+FWisd9QkkTmcyO8qEstXqkhMvV525QV4z5gYNfGs
	RabQI2DKcal082vjV8lXKBC0pJOLCEcslBkIsXYkrElz8NcsbT/0wnRxJeCX82+KwSfq
	6cb0eZ+7nTpg0cTdVIn3zFFSnU3xfgke+WJc2wE4U3m0eEe6N+R4Ja7JPogewCLM6Bo/
	8Oy0Vr2uUB5dveifi61FVuMPlWltQVDIqX0ClQtvaZfZrmJtfRUzkNwuzPy4WkYSAfjj
	OAtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=Uqw7LV7IqkQNApDe8b1PRsS52vtnc5L80Nu+QVMNcZE=;
	b=msQNgngFP27lgZSaoEuJ2/ABWBFwLRq7jp0aAtrXWNOmdhS7XWqasShxPKLB9AfWPO
	9fzjVt0csWC531I0pf9rS9vretrXEfG6xrHrtZD7znU93ICg+FJV0OmTuvTsP5zs+6wX
	sQzAfqP764aHsBo4+REdlhmYzeEJD5XBesa4+b1h7qFw0zzDn+HAbuzw2rMQ75OCi5hS
	RGZZVtullQSmMAu185m2h+xM7/uxE9qwZ0fqQ1udjgBFKFbR926mdbCnm9NOiD/1woO1
	AZksXSJLRuGb8iRbyD7tFx2GXkT9hZoj23Hq0u1V7NqGkuIbBbH0Sj7Ca2+vC+JK+VFS
	0ZAQ==
X-Gm-Message-State: AKGB3mI751kfz/WR7cvrWU84Q5wn54Y9quJPUru2gYpP7YPZpJxTir3B
	19l4LXuBUJG8ySdIEj0802PhZQ==
X-Google-Smtp-Source: ACJfBovdRNar7+dl1tCvHJ714LChqsYD3AlAQHExC3S+NimWJxUj+Z57suLGyhw2UMHkLwfHcGV9bQ==
X-Received: by 10.99.186.1 with SMTP id k1mr1866301pgf.356.1513528481743;
	Sun, 17 Dec 2017 08:34:41 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4000:1184:35e6:5321:54f2:87e6])
	by smtp.gmail.com with ESMTPSA id
	t202sm18393035pgb.75.2017.12.17.08.34.40
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 17 Dec 2017 08:34:41 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: akuster@mvista.com,
	openembedded-core@lists.openembedded.org
Date: Sun, 17 Dec 2017 08:34:29 -0800
Message-Id: <cover.1513527416.git.akuster@mvista.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH 0/8] Consolidated package updates
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
X-List-Received-Date: Sun, 17 Dec 2017 16:34:40 -0000

From: Armin Kuster <akuster@mvista.com>

Conver letter only

The following changes since commit cf5c44ac611c2c2657e6fd3c1f723bcb20b812dd:

  python-scons: upgrade to v3.0.1; use pypi.bbclass (2017-12-13 13:59:46 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib akuster/master-updates
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=akuster/master-updates

Armin Kuster (8):
  nss: update to 3.34.1
  pinentry: update to 1.1.0
  libassuan: update to 2.5.1
  libxfont: update 1.5.4 with sec fix
  libxfont2: update to 2.0.3 with sec fix
  libxcursor: update to 1.1.15 plus sec fixes
  kexec-tools: update to 2.0.16 and simplify
  bind: Update to 9.11.2

 .../bind/bind/dont-test-on-host.patch              | 13 ++--
 .../bind/{bind_9.10.6.bb => bind_9.11.2.bb}        | 10 +--
 .../{libxcursor_1.1.14.bb => libxcursor_1.1.15.bb} |  4 +-
 .../{libxfont2_2.0.2.bb => libxfont2_2.0.3.bb}     |  4 +-
 .../{libxfont_1.5.3.bb => libxfont_1.5.4.bb}       |  4 +-
 meta/recipes-kernel/kexec/kexec-tools.inc          | 38 ----------
 ...kexec-tools_2.0.15.bb => kexec-tools_2.0.16.bb} | 84 +++++++++++++++-------
 .../{libassuan_2.4.4.bb => libassuan_2.5.1.bb}     |  4 +-
 .../nss/{nss_3.34.bb => nss_3.34.1.bb}             |  4 +-
 .../gpg-error_pkconf.patch                         |  0
 .../libassuan_pkgconf.patch                        |  0
 .../{pinentry_1.0.0.bb => pinentry_1.1.0.bb}       |  4 +-
 12 files changed, 84 insertions(+), 85 deletions(-)
 rename meta/recipes-connectivity/bind/{bind_9.10.6.bb => bind_9.11.2.bb} (92%)
 rename meta/recipes-graphics/xorg-lib/{libxcursor_1.1.14.bb => libxcursor_1.1.15.bb} (80%)
 rename meta/recipes-graphics/xorg-lib/{libxfont2_2.0.2.bb => libxfont2_2.0.3.bb} (80%)
 rename meta/recipes-graphics/xorg-lib/{libxfont_1.5.3.bb => libxfont_1.5.4.bb} (81%)
 delete mode 100644 meta/recipes-kernel/kexec/kexec-tools.inc
 rename meta/recipes-kernel/kexec/{kexec-tools_2.0.15.bb => kexec-tools_2.0.16.bb} (44%)
 rename meta/recipes-support/libassuan/{libassuan_2.4.4.bb => libassuan_2.5.1.bb} (88%)
 rename meta/recipes-support/nss/{nss_3.34.bb => nss_3.34.1.bb} (98%)
 rename meta/recipes-support/pinentry/{pinentry-1.0.0 => pinentry-1.1.0}/gpg-error_pkconf.patch (100%)
 rename meta/recipes-support/pinentry/{pinentry-1.0.0 => pinentry-1.1.0}/libassuan_pkgconf.patch (100%)
 rename meta/recipes-support/pinentry/{pinentry_1.0.0.bb => pinentry_1.1.0.bb} (90%)

-- 
2.7.4


