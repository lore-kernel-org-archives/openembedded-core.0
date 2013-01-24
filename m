Received: from mga10.intel.com ([192.55.52.92] helo=fmsmga102.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TyRFx-00083B-83
	for openembedded-core@lists.openembedded.org;
	Thu, 24 Jan 2013 19:10:33 +0100
Received: from mail-lb0-f197.google.com ([209.85.217.197])
	by mga11.intel.com with ESMTP/TLS/RC4-SHA; 24 Jan 2013 09:54:58 -0800
Received: by mail-lb0-f197.google.com with SMTP id gg6so9642055lbb.8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Jan 2013 09:54:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:x-received:from:to:cc:subject:date:message-id:x-mailer
	:x-gm-message-state;
	bh=v9YV5hOunsjp+iu2R/7hQKe3+eAuxR3W2q21/CiD2R0=;
	b=CElGd+3sfAwGv1dJMNhsj4fDfTwqrh6sMQPJ/J828BJA8GAaTIGj8mbNYhCSP+jPUi
	puG6dzMxEgPdmUWxTyZs/ylz9hVh6Ycxz19St1DKdSxtAcETOA9WpkhJ6ZwSMUSsLU32
	PcHc/29RgR/LXme9bO9tjZRqsZ+QYBuYz3c4Z7LpczRMnixplNqlB1E7si+xztacQPIV
	eCj79xSwLxNw4XXHbWT5b9cReq+ulfNlzRVIO4XdLxBnnx/nBiOc3lzRxnqlD6nC5tSd
	KNIZT/naC+J6KaKlNj+Gd3ayHaQjGtKCuQ9l6yx5gKlcqScMc3uLGwxO2tpyiMfl6gG+
	xvrw==
X-Received: by 10.194.172.228 with SMTP id bf4mr4719436wjc.38.1359050092356;
	Thu, 24 Jan 2013 09:54:52 -0800 (PST)
X-Received: by 10.194.172.228 with SMTP id bf4mr4719421wjc.38.1359050092219;
	Thu, 24 Jan 2013 09:54:52 -0800 (PST)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id t17sm3673126wiv.6.2013.01.24.09.54.50
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 24 Jan 2013 09:54:51 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 24 Jan 2013 17:52:49 +0000
Message-Id: <cover.1359049755.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
X-Gm-Message-State: ALoCoQmKExvV3ZMnLCXu/YLAz2DqKFeHt8/wSaVR8Ksp+LZT4ZFFJnZ73fJo60RL/YZ2Uf9imRULqYNcuWGi/kAI6eQd/6LRyr76+0GeXP2XPZjLOZNk8UUExzwT5ubo4wsMK6wVZ63C00tAc5ZPD/uTgp56/G+cWiXEj+YsqC6RTvCsxneLz7EKSTX8qkhuSA+2SMmrYvcM
Subject: [PATCH 0/2] DISTRO_FEATURES compatibility fixes
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 24 Jan 2013 18:10:33 -0000

Hi,

This series contains two fixes:
- make the init manager backfilled into distro features (thanks, Marcin)
- backfill features earlier in the parse so conditional inherits work with backfilled features (patch as described by Richard over IM)

Between then this makes sysvinit images work again where distributions have set
DISTRO_FEATURES, instead of appending on oe-core's base.

Ross

The following changes since commit 8d6e55bf2192524bda84138b5356a2791adbbe61:

  prserv: add LOCALCOUNT to AUTOINCs migration feature (2013-01-22 16:01:32 +0000)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib ross/backfill

for you to fetch changes up to 6d174abd95de70a59f54ca28c965ca72933a3ce7:

  base: make feature backfilling happen earlier (2013-01-24 17:45:38 +0000)

----------------------------------------------------------------
Marcin Juszkiewicz (1):
      bitbake.conf: unbreak all builds with custom DISTRO_FEATURES

Richard Purdie (1):
      base: make feature backfilling happen earlier

 meta/classes/base.bbclass |    2 ++
 meta/conf/bitbake.conf    |    5 +----
 2 files changed, 3 insertions(+), 4 deletions(-)

Marcin Juszkiewicz (1):
  bitbake.conf: unbreak all builds with custom DISTRO_FEATURES

Richard Purdie (1):
  base: make feature backfilling happen earlier

 meta/classes/base.bbclass |    2 ++
 meta/conf/bitbake.conf    |    5 +----
 2 files changed, 3 insertions(+), 4 deletions(-)

-- 
1.7.10.4



