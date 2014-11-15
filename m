Return-Path: <paul.betafive@gmail.com>
Received: from mail-wi0-f170.google.com (mail-wi0-f170.google.com
	[209.85.212.170])
	by mail.openembedded.org (Postfix) with ESMTP id 3002C714D7
	for <openembedded-core@lists.openembedded.org>;
	Sat, 15 Nov 2014 20:15:53 +0000 (UTC)
Received: by mail-wi0-f170.google.com with SMTP id r20so2236829wiv.3
	for <openembedded-core@lists.openembedded.org>;
	Sat, 15 Nov 2014 12:15:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id;
	bh=iavvYB9d/JMJo1wZsIRB254zlv8Mv3AUFaX6oSB9VIU=;
	b=qY+sLqEQlnECea8ws7aM83+s7Su2D2OLI043IEm+RpqUGfGTRV5Z25iKz/Ssn6s2Ha
	ui2dvVz0MCjhfDDem8iWVGZNjO09S7TPCx6XKCXxCF5TLxuMK8lOqDibL0MjO0gUKPAt
	eOlcx1Z50Dcv6Eb3DFt5pgRrsMd9cEZyF5Rza+nDcD0gbocLgnwMVpPIW5HxfRbLB+PC
	03vx9zs0mCwJ4UZotwILZ1ftlvCq0LCwl+Blxc1SdcuGm84R+NDY9LKYC3YtO83PahiO
	X4eucH5xFBbiTm34nt4ldhTABLYzCb27r4FS1NKMBrdix1KUueqI5TQijViTbFA6eir2
	aEhA==
X-Received: by 10.194.223.9 with SMTP id qq9mr4015258wjc.36.1416082553306;
	Sat, 15 Nov 2014 12:15:53 -0800 (PST)
Received: from loki.localdomain (ygg.betafive.co.uk. [5.9.90.21])
	by mx.google.com with ESMTPSA id s2sm8266290wia.3.2014.11.15.12.15.52
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 15 Nov 2014 12:15:52 -0800 (PST)
Sender: Paul Barker <paul.betafive@gmail.com>
From: Paul Barker <paul@paulbarker.me.uk>
To: openembedded-core@lists.openembedded.org
Date: Sat, 15 Nov 2014 20:15:40 +0000
Message-Id: <1416082543-7559-1-git-send-email-paul@paulbarker.me.uk>
X-Mailer: git-send-email 2.1.3
Subject: [PATCH 0/3] opkg updates
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
X-List-Received-Date: Sat, 15 Nov 2014 20:15:57 -0000

Hi all,

This patch series updates opkg and opkg-utils (this is a further update to
opkg-utils after the one that got merged a couple of days ago). The bug which
cause core-image-sato-sdk do_rootfs to fail with opkg v0.2.3 has been fixed in
opkg v0.2.4.

I've build tested core-image-minimal, core-image-full-cmdline, core-image-sato
and core-image-sato-sdk for qemuarm and qemux86. I've also done some tests of
'opkg update', 'opkg install' and 'opkg upgrade' on both platforms. Everything
worked here so hopefully there won't be any autobuilder surprises this time.

Paul Barker (3):
  opkg: Upgrade to v0.2.4
  opkg: Update patch status
  opkg-utils: Update SRCREV

 meta/recipes-devtools/opkg-utils/opkg-utils_git.bb |  2 +-
 meta/recipes-devtools/opkg/opkg/add-exclude.patch  | 24 ++++++++++----------
 .../opkg/opkg/no-install-recommends.patch          | 26 +++++++++++-----------
 .../opkg/{opkg_0.2.2.bb => opkg_0.2.4.bb}          |  4 ++--
 4 files changed, 28 insertions(+), 28 deletions(-)
 rename meta/recipes-devtools/opkg/{opkg_0.2.2.bb => opkg_0.2.4.bb} (70%)

-- 
2.1.3


