Return-Path: <jonas@norrbonn.se>
Received: from mail-lj1-f196.google.com (mail-lj1-f196.google.com
	[209.85.208.196])
	by mail.openembedded.org (Postfix) with ESMTP id B17937C2FD
	for <openembedded-core@lists.openembedded.org>;
	Sun, 27 Jan 2019 09:38:25 +0000 (UTC)
Received: by mail-lj1-f196.google.com with SMTP id c19-v6so11730363lja.5
	for <openembedded-core@lists.openembedded.org>;
	Sun, 27 Jan 2019 01:38:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=norrbonn-se.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=5octnPPiXopFCAN6HHmjwpYulJLicMtbTSR90RF9+8Q=;
	b=DTNm+096/RiDJr6lfIFXQMiKmyRaMpXd5Jev/1DSKXYkxC//Egt4E7rW6HKB0DTP5P
	LhJt4+3671kbna2CaHBkaYbISTTxJ9D4vCEbNoNbRqwrQeUR9JOCUotQT4GxBokWYdRD
	by1LGGyTo71XpAZaxy0m/cJA9N4vqeXtmEnba4OZCGwoKXNqWjyONCNDgbY6KWDi+eG/
	/zcdv1BKPrc6pVQQ9VcvqupVqJx3W47dwnUvkaidNU1a+RQGFTum4ffT/RnA8Dd7smSD
	SEsZvSPmS2cZUXCc6syTtkdzMowR4w+da9KHPY8subVgXSDNEBrU27T4p+53ZI4/xKC6
	kVdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=5octnPPiXopFCAN6HHmjwpYulJLicMtbTSR90RF9+8Q=;
	b=LKVWxUVL1WVlvvfk6MT67PahpKwIBwu68jM6UJK0jq6pobka4YVy5kFTI9Lqto3tqd
	jk6xkSmfD1GJrtBjmy4Jq5pATEBRdwYDxc2pYi7lrz89hGA5PsqAoS0dQkw5PYQM0dYZ
	PWQj/GcAR2hrf5npnh/eObVfMYuPi51mtb2Pb69IRg4F9iTQWUaMjI4QhAi6ix9uUvfM
	E+ZcWWvV8l2ynRzswSDcNDCgpMqP+UWRmGoWcOxkNe0nekS79a1Xg3bzujZf+yt8te2e
	RQ1aOCj3moZu8cX/NBL9JbZg30y41HosAhltVltD3nFLWHTJFtm0vJPiertC8HYSqS5/
	uCtw==
X-Gm-Message-State: AJcUukc/IZ6Zlokq+TkOg4EXzlx7CtRrUxrROU5v4b5Q8iXfysf2IIB7
	acl8tj2PnAhX8nmC8PAPVoEG+kQFUOQ=
X-Google-Smtp-Source: ALg8bN4NE5kEzJsqHtHGB60089L/29Xo+c2jsxpUr8GRW5wi6Z8E1uRscMJeHxsNGLDt04ZTjgu7vA==
X-Received: by 2002:a2e:9b84:: with SMTP id z4-v6mr5681666lji.93.1548581905445;
	Sun, 27 Jan 2019 01:38:25 -0800 (PST)
Received: from mimer.lan (h-29-16.A159.priv.bahnhof.se. [79.136.29.16])
	by smtp.gmail.com with ESMTPSA id
	12-v6sm2398992ljf.96.2019.01.27.01.38.24
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 27 Jan 2019 01:38:24 -0800 (PST)
From: Jonas Bonn <jonas@norrbonn.se>
To: openembedded-core@lists.openembedded.org
Date: Sun, 27 Jan 2019 10:38:16 +0100
Message-Id: <20190127093821.4803-1-jonas@norrbonn.se>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Subject: [PATCH v3 0/5] systemd patches
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
X-List-Received-Date: Sun, 27 Jan 2019 09:38:26 -0000
Content-Transfer-Encoding: 8bit

Changed in v3:
- parameterize preset-file installation location (as suggested in patch
  review)

Changed in v2:
- address patchtest warnings:
  - include sign-offs on patches
  - include License-Update tag on patch that makes licensing change
- dropped patch implementing brute-force removal of unit files installed
  by systemd into /etc
- reworked the systemd-conf patch to restore the installation of the
  base systemd configuration files


**********

These patches make some modifications to systemd with the long-term goal
of being able to run OE in systemd's "stateless" configuration.
"Stateless" boils down to building an image with empty /etc and /var
directories so that volatile (tmpfs) filesystems can be mounted there;
this requires that the system subsequently be able to populate these
directories dynamically, which systemd mostly takes care of if things
are done right.

In these patches:
i)    Don't include machine-id in writable images so that systemd can run
its first-boot machinery
ii)  Allow systemd to dynamically enable services and populate
/etc/systemd/system via the presets mechanism

There's a long way to go to get to a working "stateless" configuration.
Getting to a "volatile" system (just empty /var) should be easier and
I'll post patches moving things in that direction shortly.

/Jonas

Jonas Bonn (5):
  systemd: do not create machine-id
  systemd-conf: simplify creation of machine-specific configuration
  systemd: create preset files instead of installing in image
  systemd-systemctl-native: simplify and support preset-all
  rootfs-postcommands: call preset-all for read-only-rootfs

 meta/classes/rootfs-postcommands.bbclass      |  8 +++
 meta/classes/systemd.bbclass                  | 33 ++++++------
 meta/recipes-core/systemd/systemd-conf.bb     | 53 ++++++++-----------
 .../systemd/systemd-systemctl/systemctl       | 36 +++----------
 meta/recipes-core/systemd/systemd_239.bb      | 17 +++---
 5 files changed, 62 insertions(+), 85 deletions(-)

-- 
2.19.1


