Return-Path: <patrick.ohly@intel.com>
Received: from mail-it0-f42.google.com (mail-it0-f42.google.com
	[209.85.214.42])
	by mail.openembedded.org (Postfix) with ESMTP id 811F273180
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Jan 2017 14:17:12 +0000 (UTC)
Received: by mail-it0-f42.google.com with SMTP id r185so66478254ita.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Jan 2017 06:17:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=eoBJT4URt281bj1U1yuw2CKyNWlOwlgrnQIPpaB07X8=;
	b=i980Q8RJjLc4wOkHy0qv+z983p2BgARc6Gz2ohbnvK6Jqi+6D/z67SAvjxdksk5+jR
	TuSKo2PCbbgQb+zfKgiyIjlnDufsPinM15Eu7YljS09IBHVMeZIToBaXpBLYDNFp33hz
	BfZ4G1nJaiy2DhcuFQ7Lq2HCQAUVAZ+n1iOo7WKXLpxM49JZ5ce5tZG0YO4pv21zh0iS
	Qvqhtp3lKVLAUEoKorrkUcywZ1ihIMw+MEIkSYV9kZ+Gh6p9YknbgwuIUW49wQN/1q/A
	ONBno1x/gcfcawJ22bInp/oTqDuj7rEsvuS6avxy90Qyn/pWF4CNjBDUgSZogu7W+jqn
	lcZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=eoBJT4URt281bj1U1yuw2CKyNWlOwlgrnQIPpaB07X8=;
	b=CBqaYVgPOp4CN3lxtQUrl9bqcsNG1+edPhKoLr0nu5PT7e0T4kFxrqdNqKu2IMItHN
	A822kPpbloXUgf5zH2y45AAZBlsApBsqOw3emhegSbhTj4V6NWZgMn6wPC5cilgDvUXD
	gWfTsghVaDcqLMLX7Slo6BbqCUn4PytG4ksrYrqaiZvsMcqUVHw1/icmLqiVdjXV+siY
	JgcTgMH6N1Gc15Vaw17HcahoTAfoIIc5teqhZB+WsUnb8DsDX62tKCr9YJjPgM+tROYi
	6akSnN4zj2LSv1izz/ndnPSObdULcEpCszQ+AZktoemfpm3JA3dhBiYUKqOAxU6Q6kxb
	yWiA==
X-Gm-Message-State: AIkVDXJWJAQJ+74CKYl6UrRrSMzqo9JBkhDOdHwHP/M2AsmN2W55x96z7xVAo0hdKAfQ9pCc
X-Received: by 10.36.73.211 with SMTP id e80mr14106744itd.88.1485181033000;
	Mon, 23 Jan 2017 06:17:13 -0800 (PST)
Received: from pohly-desktop.fritz.box (p5DE8FC12.dip0.t-ipconnect.de.
	[93.232.252.18]) by smtp.gmail.com with ESMTPSA id
	v68sm9608633ioi.20.2017.01.23.06.17.10
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 23 Jan 2017 06:17:11 -0800 (PST)
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 23 Jan 2017 15:17:02 +0100
Message-Id: <cover.a45e50ea4fcbfdc1b4f78df0b3380d397b353cf6.1485180970.git-series.patrick.ohly@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH 0/2] enable swtpm-native
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
X-List-Received-Date: Mon, 23 Jan 2017 14:17:14 -0000

swtpm (from meta-security) can be compiled for the host and then be
used to provide a virtual TPM device in qemu. However, it depends on
the native flavor of some recipes in OE-core.

Patrick Ohly (2):
  expect: support native compilation
  socat: support native compilation

 meta/recipes-connectivity/socat/socat_1.7.3.1.bb |  5 ++++-
 meta/recipes-devtools/expect/expect_5.45.bb      |  9 ++++++++-
 2 files changed, 12 insertions(+), 2 deletions(-)

base-commit: 5ecdab6c2589a83bbbc522074052ff4438782102
-- 
git-series 0.9.1

