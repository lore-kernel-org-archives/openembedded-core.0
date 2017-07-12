Return-Path: <patrick.ohly@intel.com>
Received: from mail-io0-f173.google.com (mail-io0-f173.google.com
	[209.85.223.173])
	by mail.openembedded.org (Postfix) with ESMTP id 582AB71DD2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Jul 2017 08:44:15 +0000 (UTC)
Received: by mail-io0-f173.google.com with SMTP id h64so8907746iod.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Jul 2017 01:44:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=69TQde5uwNgvOmT2XU+2gZntKcjohHqQ+N2KAXYH9X0=;
	b=YuHdMhpNTH7P1mxVuBx9DJ/29/OjSh2auB7L4njwOcuO1zXOYI0tNTTxqdwv+pEUlV
	KVRMG1Hn7k/XA80eJeu9rSLD4neT3+Y3D/AD7fHRpPg3i0DO7AqgDU6AcK0SyYzn7wPn
	pAyy+FwblucnI5+X1iAH/7tGPR91Ks0GSt4G/3J448zi7w3/FbbRRg3kKLfd7/HKR3EE
	5TQAnPLyNpWT3X5u6SOog9c17iA6ZA0glG4vZjuhGTpRFlDPgNmlHpYMQt9vw5dP8sVT
	pRv3UUIO3i7pszx7VPRovyXjqsaxNjqdUnlIljVG1I4sOAfnS20u7rSRvC3eY4pNaajK
	VVEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=69TQde5uwNgvOmT2XU+2gZntKcjohHqQ+N2KAXYH9X0=;
	b=i5dtJNXZ0IzNFCUEHI1w57R7aZN1DFJMYHPj63U2bvNG4xjfWmy0eha8bjKkGYrrI9
	/cvX75vnQev3WDzGfQW5wVmfFMuRShpUFPDluHJ8Tw6+YlxHxAl2oWkKH2y2mTuDdRU5
	Pll8pm1pZk8gWGqD3gRRFgUHmviqQPKbPaNIXs/of0HiZttjRUUKl/cipioL3dZ0gjI1
	Np64GJx/fyqGX2gqS4tgu9edWegRlGimxK7Q1/zovcIszWtZHvKrxkbbiKqr/FGcAxdd
	XZxDbWA8YVVYa9uRxb3RfhH6y/vQCcvBeUP8sI0shIQcpI9hOjPm9/Fnyvumk04Me2JT
	d3Iw==
X-Gm-Message-State: AIVw113d5ugAuU5d+VMo2ytdlFmP+QLfy+8Zgwtil322F2gzGeUh9K9c
	7/mqutzCMKWzf+BRxbs=
X-Received: by 10.107.190.132 with SMTP id o126mr3980639iof.143.1499849056764; 
	Wed, 12 Jul 2017 01:44:16 -0700 (PDT)
Received: from pohly-desktop.fritz.box (p5DE8F424.dip0.t-ipconnect.de.
	[93.232.244.36]) by smtp.gmail.com with ESMTPSA id
	j96sm1248695ioo.49.2017.07.12.01.44.15
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 12 Jul 2017 01:44:15 -0700 (PDT)
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 12 Jul 2017 10:44:10 +0200
Message-Id: <cover.295e104beddcf41cf864decc94ea28047dd54ec1.1499848992.git-series.patrick.ohly@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH 0/2] some "su -" fixes
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
X-List-Received-Date: Wed, 12 Jul 2017 08:44:16 -0000

Ran into this while experimenting with stateless logins....

Patrick Ohly (2):
  util-linux: fix "su -" and package su separately
  base-files: ignore "mesg n" error messages

 meta/recipes-core/base-files/base-files/share/dot.profile |  3 +-
 meta/recipes-core/util-linux/util-linux.inc               | 13 ++++++--
 2 files changed, 13 insertions(+), 3 deletions(-)

base-commit: 7dd5dfc4d56f1201110d947ce1ca3c6d64fbc7da
-- 
git-series 0.9.1

