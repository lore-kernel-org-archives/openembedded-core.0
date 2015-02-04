Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f178.google.com (mail-wi0-f178.google.com
	[209.85.212.178])
	by mail.openembedded.org (Postfix) with ESMTP id DD0C960017
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Feb 2015 15:51:13 +0000 (UTC)
Received: by mail-wi0-f178.google.com with SMTP id bs8so4567848wib.5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 04 Feb 2015 07:51:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id;
	bh=IHypEolJbZjttPe38BCA9tpNa16kyFT0CzVi3C0LBJs=;
	b=ivBQo4Z3J8ZMeFgUtA/5eBZdgvgP+mv2/WBcpBwO3U4z4pAWBq/eBohgvT47eYr4g5
	M7dE+IrHXDt9bg4DgBX/j7Ja+BSdt4X29622UQafhsa+fC0oxnW5N7/iHOWcJGp5hq5A
	pj/J0C9QMJAXZj894FX4rAt5KeUZGh+bGEc9bZesVP4BmleHlzMk+BC2S0WhN1Pu2fEu
	4hZoXhj5Tr7EG2248ly3a4XfkHBkXgvCWUYfNEF29R8y7uW2AsjQSe1ekHZ5hffOV8UR
	LHcH7Z3vjTzfN/RbQceFTNhb2nPqfMQJjAfYeg2aEMG54JbtPZ7hgfTYyv1KQl0hgkB3
	+UzA==
X-Received: by 10.180.89.225 with SMTP id br1mr5826050wib.70.1423065074071;
	Wed, 04 Feb 2015 07:51:14 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	ub1sm3250119wjc.43.2015.02.04.07.51.13
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 04 Feb 2015 07:51:13 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  4 Feb 2015 16:51:26 +0100
Message-Id: <cover.1423065000.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.2.1
Subject: [PATCHv5 0/1] REQUIRED_DISTRO_FEATURES
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
X-List-Received-Date: Wed, 04 Feb 2015 15:51:16 -0000

Changes since v4:
Rebased, other patches from pull-request were merged, only this one is pending now.

The following changes since commit 2104111edc85d057eb4fadecd007f5c592803da6:

  opkg-keyrings: New recipe (2015-02-03 14:53:44 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib jansa/distro
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=jansa/distro

Martin Jansa (1):
  recipes: add x11 to required DISTRO_FEATURES

 meta/recipes-core/packagegroups/packagegroup-self-hosted.bb           | 4 +++-
 meta/recipes-graphics/eglinfo/eglinfo-x11_1.0.bb                      | 4 ++++
 meta/recipes-graphics/fstests/fstests_git.bb                          | 4 +++-
 meta/recipes-graphics/glew/glew_1.11.0.bb                             | 4 +++-
 meta/recipes-graphics/libmatchbox/libmatchbox_1.11.bb                 | 4 +++-
 meta/recipes-graphics/libxsettings-client/libxsettings-client_0.10.bb | 4 +++-
 meta/recipes-graphics/matchbox-wm/matchbox-wm_1.2.bb                  | 4 +++-
 meta/recipes-graphics/matchbox-wm/matchbox-wm_git.bb                  | 4 +++-
 meta/recipes-graphics/packagegroups/packagegroup-core-x11-base.bb     | 4 +++-
 meta/recipes-graphics/packagegroups/packagegroup-core-x11-xserver.bb  | 4 +++-
 meta/recipes-graphics/packagegroups/packagegroup-core-x11.bb          | 4 +++-
 meta/recipes-graphics/pong-clock/pong-clock_1.0.bb                    | 4 ++++
 .../startup-notification/startup-notification_0.12.bb                 | 4 +++-
 meta/recipes-graphics/x11-common/x11-common_0.1.bb                    | 4 ++++
 meta/recipes-graphics/x11vnc/x11vnc_0.9.13.bb                         | 4 +++-
 meta/recipes-graphics/xinput-calibrator/xinput-calibrator_git.bb      | 4 +++-
 meta/recipes-graphics/xrestop/xrestop_0.4.bb                          | 4 +++-
 meta/recipes-graphics/xtscal/xtscal_0.6.3.bb                          | 4 +++-
 meta/recipes-sato/packagegroups/packagegroup-core-x11-sato.bb         | 4 +++-
 meta/recipes-support/atk/at-spi2-core_2.14.1.bb                       | 4 +++-
 meta/recipes-support/consolekit/consolekit_0.4.6.bb                   | 4 +++-
 21 files changed, 66 insertions(+), 18 deletions(-)

-- 
2.2.1


