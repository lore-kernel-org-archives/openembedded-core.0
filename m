Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f194.google.com (mail-pf0-f194.google.com
	[209.85.192.194])
	by mail.openembedded.org (Postfix) with ESMTP id 240366069D
	for <openembedded-core@lists.openembedded.org>;
	Sun, 25 Sep 2016 15:05:13 +0000 (UTC)
Received: by mail-pf0-f194.google.com with SMTP id 21so7843697pfy.1
	for <openembedded-core@lists.openembedded.org>;
	Sun, 25 Sep 2016 08:05:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id;
	bh=nU2kC/FokXCrZMARYKNQz1mKIaneSvhjCawNGnhKcr8=;
	b=pvzQbxNuFgOaOP3UFQ3rGe7ZctV8jVdJ+60BDEosJyQ0ptpB8xwgL3eqwHnjR8kSqC
	O7cfDBpj3pb71KxW4aN2to3Sd+PUTZGr7LGhI0pE9FF06OG526kbDKWb2XUkqos7WmEw
	snzgTJQ85kHVQgLdnYRPN4Sa8eBlBdYnbBAkFTJR0KZV1xo3PqOvH1msRV0uEOfaPynU
	Dd5v3geLLWEKa4Pvkv299r95/qv79H4iIEgVGh7ikfJT9EuTwmhrdv72v07LMfh3A1Ka
	fFxC7h5puLyJ6lf1Jhf1srjd/eh4vkLKubz6o2pWbd88BW1bpOtH3TOpasDUJ6eXjj97
	vOtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=nU2kC/FokXCrZMARYKNQz1mKIaneSvhjCawNGnhKcr8=;
	b=hFThhXJN50teIHdwSaG4grS83YCvYgtca5wxySry5G/VAOAR4TEqUxAHZQP8ROCJvC
	8qF/2j5zFZLl0ZfTlVcKOvYwVLC+YwwQFkZe8ftFRfLFyplmKR8iOxf4J84mU6jw+K6Q
	SspZ7gzsK5g0aava5mlD1yjFF8doWbPNeqGV7e0c03JVM1UKomzYqItwGL/UMHA0zR1C
	xA7Ke/KR/PETVDrbqd0BYo8QC4x/w6Mv58u0tVdI/fGBcBUpLzjEe1yf7qfNhlKGknLW
	ZMcq4klAk7jmsUYO0s+724wiF7UCONbBshcnumEp3CAdK0ZrIDQkTjaIQPSfC8tfnGYh
	EisQ==
X-Gm-Message-State: AE9vXwOUZ1X9tS6eL60CbmPho8XTQVvGWrE0OKMOE2Z/6iJjTHF2f/245/jWwsShzp5RXQ==
X-Received: by 10.98.34.221 with SMTP id p90mr30791623pfj.18.1474815915078;
	Sun, 25 Sep 2016 08:05:15 -0700 (PDT)
Received: from akuster-ThinkPad-X240.hsd1.ca.comcast.net
	([2601:202:4001:9ea0:c88d:7203:3d56:a160])
	by smtp.gmail.com with ESMTPSA id
	c145sm24488290pfb.15.2016.09.25.08.05.14
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 25 Sep 2016 08:05:14 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: akuster@mvista.com,
	openembedded-core@lists.openembedded.org
Date: Sun, 25 Sep 2016 08:05:03 -0700
Message-Id: <cover.1474815558.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH 0/9] Jethro pull request
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
X-List-Received-Date: Sun, 25 Sep 2016 15:05:14 -0000

Please consider these changes for Jethro 

The following changes since commit c9c85df86cd2270b144fa824ef76adedd3636c8a:

  util-linux: Security fix for CVE-2016-5011 (2016-09-23 23:21:43 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib akuster/jethro-next
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=akuster/jethro-next

Armin Kuster (9):
  openssl: Security fix CVE-2016-2180
  openssl: Security fix CVE-2016-8181
  openssl: Security fix CVE-2016-2182
  openssl: Security fix CVE-2016-6304
  openssl: Security fix CVE-2016-6303
  openssl: Security fix CVE-2016-6304
  openssl: Security fix CVE-2016-6303
  tzdata: update to 2016f
  tzcode-native: update to 2016f

 .../openssl/openssl/CVE-2016-2180.patch            |  44 ++++
 .../openssl/openssl/CVE-2016-2181_p1.patch         |  91 ++++++++
 .../openssl/openssl/CVE-2016-2181_p2.patch         | 239 +++++++++++++++++++++
 .../openssl/openssl/CVE-2016-2181_p3.patch         |  30 +++
 .../openssl/openssl/CVE-2016-2182.patch            |  70 ++++++
 .../openssl/openssl/CVE-2016-6302.patch            |  53 +++++
 .../openssl/openssl/CVE-2016-6303.patch            |  36 ++++
 .../openssl/openssl/CVE-2016-6304.patch            |  75 +++++++
 .../openssl/openssl/CVE-2016-6306.patch            |  71 ++++++
 .../recipes-connectivity/openssl/openssl_1.0.2h.bb |   9 +
 ...code-native_2016e.bb => tzcode-native_2016f.bb} |   8 +-
 .../tzdata/{tzdata_2016e.bb => tzdata_2016f.bb}    |   4 +-
 12 files changed, 724 insertions(+), 6 deletions(-)
 create mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2016-2180.patch
 create mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2016-2181_p1.patch
 create mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2016-2181_p2.patch
 create mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2016-2181_p3.patch
 create mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2016-2182.patch
 create mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2016-6302.patch
 create mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2016-6303.patch
 create mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2016-6304.patch
 create mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2016-6306.patch
 rename meta/recipes-extended/tzcode/{tzcode-native_2016e.bb => tzcode-native_2016f.bb} (68%)
 rename meta/recipes-extended/tzdata/{tzdata_2016e.bb => tzdata_2016f.bb} (98%)

-- 
2.7.4


