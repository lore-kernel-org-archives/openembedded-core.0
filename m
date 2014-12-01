Return-Path: <ross.burton@intel.com>
Received: from mail-wg0-f49.google.com (mail-wg0-f49.google.com [74.125.82.49])
	by mail.openembedded.org (Postfix) with ESMTP id E457B722B0
	for <openembedded-core@lists.openembedded.org>;
	Mon,  1 Dec 2014 23:48:15 +0000 (UTC)
Received: by mail-wg0-f49.google.com with SMTP id n12so7329415wgh.22
	for <openembedded-core@lists.openembedded.org>;
	Mon, 01 Dec 2014 15:48:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=tGFWuDSn+0FEjknZCnTUH8ULzs2IGXQ7PtboyAmfEJQ=;
	b=YYWLu+9e75r3t7CFMVFYA/5pcKnolUETtNtNFrURZzkzJYnyV3UkS/Mqx1TwfhjBYl
	bIowGv/hXIZU3IrKTwDBVD977z5F0XuIesQoPupu3Hw2YH5zAvJoWLfiwlL/xSPjDZNc
	wsJalFsfjlzRS+op3+iUa0JhDGUQ3SSeXBomJwl3tqwl8BxtOuBUwJWMh+JoIJ001HS8
	ypA3XdW83VWI3XB4EYCEENaEQCRejxeh3oGBpdzXFtI6Z5uFY/6b8MSqBjwCW+yYOP7Q
	HYVRU7BTaO9ksy+fkm/tl6P01sj4GiC4mzNIeztphFgFIKtn1cG7MySAnULBY+zYOIRp
	UA3w==
X-Gm-Message-State: ALoCoQkXNFem+WYcFxFGpN8MJRldX0raIWX7gHj+aI3z0OFODH2ZVUMu/MrrUb1VeXsJzYn2FSXX
X-Received: by 10.180.198.209 with SMTP id je17mr73447181wic.17.1417477695402; 
	Mon, 01 Dec 2014 15:48:15 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by mx.google.com with ESMTPSA id
	he3sm29570430wjc.15.2014.12.01.15.48.14
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 01 Dec 2014 15:48:14 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  1 Dec 2014 23:47:43 +0000
Message-Id: <cover.1417477584.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH 0/4] Updates for defaultval being internal
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
X-List-Received-Date: Mon, 01 Dec 2014 23:48:24 -0000

Hi,

This series cleans up oe-core once the bitbake patch "data: rename defaultval to
_defaultval" is merged.

Ross

The following changes since commit d7bc23167154c336913739b4cf9f2efda4e61499:

  data: rename defaultval to _defaultval (2014-12-01 20:40:18 +0000)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib ross/defaultval

for you to fetch changes up to d818f59b6da77c778d8af9f91ce1ad97dc847c2d:

  bitbake.conf: remove internal flags from BB_SIGNATURE_EXCLUDE_FLAGS (2014-12-01 23:42:51 +0000)

----------------------------------------------------------------
Ross Burton (4):
      base.bbclass: don't skip defaultval
      uboot-config.bbclass: don't skip defaultval
      scripts: don't skip defaultval
      bitbake.conf: remove internal flags from BB_SIGNATURE_EXCLUDE_FLAGS

 meta/classes/base.bbclass                   |    2 --
 meta/classes/uboot-config.bbclass           |    3 ---
 meta/conf/bitbake.conf                      |    2 +-
 scripts/contrib/list-packageconfig-flags.py |    4 +---
 4 files changed, 2 insertions(+), 9 deletions(-)

Ross Burton (4):
  base.bbclass: don't skip defaultval
  uboot-config.bbclass: don't skip defaultval
  scripts: don't skip defaultval
  bitbake.conf: remove internal flags from BB_SIGNATURE_EXCLUDE_FLAGS

 meta/classes/base.bbclass                   |    2 --
 meta/classes/uboot-config.bbclass           |    3 ---
 meta/conf/bitbake.conf                      |    2 +-
 scripts/contrib/list-packageconfig-flags.py |    4 +---
 4 files changed, 2 insertions(+), 9 deletions(-)

-- 
1.7.10.4


