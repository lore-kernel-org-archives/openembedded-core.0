Return-Path: <raj.khem@gmail.com>
Received: from mail-pd0-f181.google.com (mail-pd0-f181.google.com
	[209.85.192.181])
	by mail.openembedded.org (Postfix) with ESMTP id 039006AC7B
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Aug 2014 18:57:22 +0000 (UTC)
Received: by mail-pd0-f181.google.com with SMTP id g10so20509255pdj.40
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Aug 2014 11:57:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=6oLRrlGMTT9OokoULmCeoYAatxeEK9+JOgkPWpq2ycU=;
	b=e9NNTqQduryB34OboDFyfmJbLTRnprMWR9zYg8hX4iHCgl0Y3NlgXGELSduS/51l89
	LifZjI/pYdg9bH5fdXEyrYKFmgyWERajyQJdW2/8t67aXYvVBvKMN7Dyu4OAGWqx+vNf
	EJL68T5c9Kml16DE4J37mV0r3NwkGsAl5j+zcxOmdSJE4ZxidH9l7ibk4rPQDhu2qBFt
	cGRMl51O22kelDQTjvrpaMMM3IbmE4cNhzJ0vi/340Jhge1HGtxh3P1UvaesPOCNk4fi
	UNM+LHfV7e7TjjQnjwjcK/7FkXAcKoOtC13zra8bRYg70NrmJW213df6xZfvdbVqBJH/
	e87g==
X-Received: by 10.66.139.232 with SMTP id rb8mr13501134pab.130.1408993044167; 
	Mon, 25 Aug 2014 11:57:24 -0700 (PDT)
Received: from localhost.localdomain (c-98-207-177-218.hsd1.ca.comcast.net.
	[98.207.177.218])
	by mx.google.com with ESMTPSA id ju4sm605825pbc.6.2014.08.25.11.57.23
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 25 Aug 2014 11:57:23 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 25 Aug 2014 12:01:03 -0700
Message-Id: <cover.1408993148.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH 0/1] Empty out MACHINE overrides for native and nativesdk
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
X-List-Received-Date: Mon, 25 Aug 2014 18:57:24 -0000


The following changes since commit 217aa4d9802609d2c3628c8751a27a5d25900898:

  autogen-native: inherit pkgconfig to fix a build failure (2014-08-25 10:25:54 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib kraj/machineoverride
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=kraj/machineoverrides

Khem Raj (1):
  native/nativesdk: Clear MACHINEOVERRIDES

 meta/classes/native.bbclass    |    1 +
 meta/classes/nativesdk.bbclass |    1 +
 2 files changed, 2 insertions(+)

-- 
1.7.10.4


