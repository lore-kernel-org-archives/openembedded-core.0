Return-Path: <patrick.ohly@intel.com>
Received: from mail-io0-f175.google.com (mail-io0-f175.google.com
	[209.85.223.175])
	by mail.openembedded.org (Postfix) with ESMTP id 7E8EA6E268
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Aug 2015 14:59:16 +0000 (UTC)
Received: by iodt126 with SMTP id t126so87567400iod.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Aug 2015 07:59:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to;
	bh=LW1yhiySu5BBgpCH+zTni3MDNbmkJ/gUINjpmpD0SoQ=;
	b=A29L0TmGTMlfknbnk1cnPxg0wpEi3uhIONYia7DEuMitpQWzTvqQl9bHekhUAwkUGf
	rqK9JKV13627wjIAka3nzag2CFkERu3GPeawDmDZKsRh/9d/gn+N+IE/5zQozoCvWIyP
	UtwDMhtAp58qcwGlu87QXVDBnC36Qx6L2G7Rvu0Vs/2gvo194MyQNt+QQWjdgdu1gjD2
	ZwG3dEyjRfb79xwHR+KJAUZjr4w9NK1ogQp1wjD1VBL6M3+0cZ5vAfhpPG45MAkUSiq5
	ahWnlY0kIuKTouV3Ld8AM7bZHJqSJsFTS1rkhNzpXqlkEyGiY1QxTS7Q9T+fbmhbgCZ7
	leYA==
X-Gm-Message-State: ALoCoQnxICcipADeAHO++14kNNIyprPHXa9Y1bC3JNu8vGz2iUCz/KZkGOK3SiPstb81xhagnoOv
X-Received: by 10.107.47.152 with SMTP id v24mr44062159iov.180.1439564356474; 
	Fri, 14 Aug 2015 07:59:16 -0700 (PDT)
Received: from pohly-mobl1.ger.corp.intel.com (p5DE8D814.dip0.t-ipconnect.de.
	[93.232.216.20])
	by smtp.gmail.com with ESMTPSA id d3sm2701488igx.5.2015.08.14.07.59.15
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 14 Aug 2015 07:59:15 -0700 (PDT)
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 14 Aug 2015 16:59:02 +0200
Message-Id: <cover.1439564102.git.patrick.ohly@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1439563928.28153.65.camel@intel.com>
Subject: [PATCH v2 0/2] xattr + tar
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
X-List-Received-Date: Fri, 14 Aug 2015 14:59:19 -0000

This gets rid of tar-replacement-native and instead allows installing tar
as opt-in binary under a path where it is not normally picked up.

The mtd-utils patch is not included anymore because Ross already staged it.

The following changes since commit 4e0fb630d3bb0250ece6e2071ae49b2601ae3e57:

  tzdata: update to 2015f (2015-08-14 08:30:21 +0100)

are available in the git repository at:

  git://github.com/pohly/openembedded-core xattr
  https://github.com/pohly/openembedded-core/tree/xattr

Patrick Ohly (2):
  tar-replacement-native: relocate via NATIVE_PACKAGE_PATH_SUFFIX
  image_types.bbclass: allow replacing tar command

 meta/classes/image_types.bbclass                         | 14 +++++++++++++-
 meta/recipes-extended/tar/tar-replacement-native_1.28.bb |  6 ------
 meta/recipes-extended/tar/tar.inc                        |  6 +++++-
 3 files changed, 18 insertions(+), 8 deletions(-)
 delete mode 100644 meta/recipes-extended/tar/tar-replacement-native_1.28.bb

-- 
2.1.4


