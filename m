Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com
	[209.85.210.170])
	by mail.openembedded.org (Postfix) with ESMTP id C038B6C0C0
	for <openembedded-core@lists.openembedded.org>;
	Sat, 23 Mar 2019 02:13:33 +0000 (UTC)
Received: by mail-pf1-f170.google.com with SMTP id r15so2678526pfn.9
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Mar 2019 19:13:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id;
	bh=QQ03yYFZCnHzjzp5a5YpYg9+X0nOm3HBxgUDDcjPKLI=;
	b=T6WXYTYOQI+EtQLROjqxCaYGO4765U+ASKZUe8d+2uXs70DQi1HG0uvwW95WDKmhNb
	VdSV4P01HlfV0/BB7j7Mj0AVxT5Iz5v+IjMHEAH7/j5S7Ou+1VWJvuud6oDzuUGB/ukl
	/Mnpi6OlkDtEAw8WpkKg6Egwd/bD9EWlmEHai+U300GjydZCW6bU4GpjD7SF7o5Wp3xi
	kAxMClFjj1E1NcGO00bY0ccgggx50BRLIAA78OkPr28uEWSVnE/gsCvaxuvy0KogiW8C
	hLJXKXBqEJR1tNHXgNDF/pY9HUkwJ3nAR2dWqXxv5SDr9OgCgI8NKMVAef+yPQHv4WzE
	NV5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=QQ03yYFZCnHzjzp5a5YpYg9+X0nOm3HBxgUDDcjPKLI=;
	b=XQ3NA4IKrxR7RamERF+RPVkdkfEgcgRBK4N728JM8z9mDL2NyavGsT9j6Pk238PPZe
	QVbO9TJ7yXzvpYmnhAg+LUakE5uD4fcOLRvlQDHBD+xP9KRD3K2Kbl87inbfulXGXvBA
	qzv/KxpBjSY0/rkDDXkunREcDONUKL8bPGzSXXlUE0murQO6UrdiK4v4JcDpbj2EexhL
	6ejJ0ENIS+SgOFkpfWqnJIPmclHZ38NGttllK9CumlULGnJHpqrq05o203YUUnewtcug
	MBPzmur8mrf5FGg/58i+5f4W6gPeI8aAgnssgiQtDH3gOPPjUfT819e/R8RPw2eW8cFK
	oqRQ==
X-Gm-Message-State: APjAAAWUC84wyJR3VwYWbXGevI358WXa4qFnGyBwQPFjKJ+L9nbu4rOn
	mZWOnrAFamGPPG60cLTu4f1hp1tI
X-Google-Smtp-Source: APXvYqx+NsUY76VnRIG/pWVKW3rnHwYMOqDIaDP+CR+Uitx6sVlUmd6Utv1yOOR3pO9AkL85P6TjJw==
X-Received: by 2002:a17:902:a98c:: with SMTP id
	bh12mr12458993plb.289.1553307214512; 
	Fri, 22 Mar 2019 19:13:34 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:c33:45a8:35fd:6c1a:9e02])
	by smtp.gmail.com with ESMTPSA id
	a13sm9870889pgw.91.2019.03.22.19.13.33
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 22 Mar 2019 19:13:33 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 22 Mar 2019 19:13:18 -0700
Message-Id: <cover.1553306877.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH 00/12] Sumo pull request
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
X-List-Received-Date: Sat, 23 Mar 2019 02:13:33 -0000

Please consider this for the next sumo update

The following changes since commit 6d56e912fbbaa22830b4da5ab230586a3d15b23e:

  package_rpm/archiver: Apply bandaid to src.rpm creation (2019-02-25 22:13:08 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib stable/sumo-next
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/sumo-next

Chen Qi (2):
  systemd: fix CVE-2018-15686
  systemd: fix CVE-2018-15688

George McCollister (5):
  systemd: fix CVE-2018-15687
  systemd: Security fix CVE-2018-16864
  systemd: Security fix CVE-2018-16865
  systemd: fix CVE-2018-6954
  systemd: fix CVE-2019-6454

Marcus Cooper (1):
  systemd: Security fix CVE-2018-16866

Mingli Yu (1):
  logrotate.py: restore /etc/logrotate.d/wtmp

ROGEZ Matthieu (1):
  systemd: Fix typo in root home variable.

Richard Purdie (1):
  oeqa/runtime/dnf: Fix test error when static libs are enabled

Stefan Agner (1):
  run-postinsts: for dpkg/opkg, do not rely on /etc/*-postinsts

 meta/lib/oeqa/runtime/cases/dnf.py                 |    2 +-
 meta/lib/oeqa/runtime/cases/logrotate.py           |    6 +-
 ...sive-let-s-rework-the-recursive-logic-to-.patch |  252 +++
 ...eserializing-state-always-use-read_line-L.patch |  250 +++
 ...sure-we-have-enough-space-for-the-DHCP6-o.patch |   39 +
 ...n-t-resolve-pathnames-when-traversing-rec.patch |  643 +++++++
 .../systemd/systemd/0002-Make-tmpfiles-safe.patch  | 1828 ++++++++++++++++++++
 ...-not-store-the-iovec-entry-for-process-co.patch |  193 +++
 ...ld-set-a-limit-on-the-number-of-fields-1k.patch |   60 +
 ...ote-set-a-limit-on-the-number-of-fields-i.patch |   79 +
 ...nal-fix-out-of-bounds-read-CVE-2018-16866.patch |   49 +
 .../systemd/systemd/CVE-2019-6454.patch            |  210 +++
 ...e-receive-an-invalid-dbus-message-ignore-.patch |   61 +
 meta/recipes-core/systemd/systemd_237.bb           |   13 +-
 .../run-postinsts/run-postinsts/run-postinsts      |   21 +-
 .../run-postinsts/run-postinsts.service            |    1 -
 16 files changed, 3694 insertions(+), 13 deletions(-)
 create mode 100644 meta/recipes-core/systemd/systemd/0001-chown-recursive-let-s-rework-the-recursive-logic-to-.patch
 create mode 100644 meta/recipes-core/systemd/systemd/0001-core-when-deserializing-state-always-use-read_line-L.patch
 create mode 100644 meta/recipes-core/systemd/systemd/0001-dhcp6-make-sure-we-have-enough-space-for-the-DHCP6-o.patch
 create mode 100644 meta/recipes-core/systemd/systemd/0001-tmpfiles-don-t-resolve-pathnames-when-traversing-rec.patch
 create mode 100644 meta/recipes-core/systemd/systemd/0002-Make-tmpfiles-safe.patch
 create mode 100644 meta/recipes-core/systemd/systemd/0024-journald-do-not-store-the-iovec-entry-for-process-co.patch
 create mode 100644 meta/recipes-core/systemd/systemd/0025-journald-set-a-limit-on-the-number-of-fields-1k.patch
 create mode 100644 meta/recipes-core/systemd/systemd/0026-journal-remote-set-a-limit-on-the-number-of-fields-i.patch
 create mode 100644 meta/recipes-core/systemd/systemd/0027-journal-fix-out-of-bounds-read-CVE-2018-16866.patch
 create mode 100644 meta/recipes-core/systemd/systemd/CVE-2019-6454.patch
 create mode 100644 meta/recipes-core/systemd/systemd/sd-bus-if-we-receive-an-invalid-dbus-message-ignore-.patch

-- 
2.7.4


