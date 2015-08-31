Return-Path: <kergoth@gmail.com>
Received: from mail-wi0-f180.google.com (mail-wi0-f180.google.com
	[209.85.212.180])
	by mail.openembedded.org (Postfix) with ESMTP id BB67E76EA4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 31 Aug 2015 19:12:01 +0000 (UTC)
Received: by wicmc4 with SMTP id mc4so9790703wic.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 31 Aug 2015 12:12:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=Fo6pdX64X8Iw6gFrVb+kWnm5HzFzA5kQnkOlDgYxXS8=;
	b=PtMzEsJlvUfnwdGp6/WNrAS6pPxMmvoRZgUMQYYzpWYqDfme82nec8jx98RLhUs9Lg
	xwMI8Riqwc/6CDKCwD9c4iXRaSApIg/OtliBwmpcITztZft0KUEQTUQmjK6gOycL4JAI
	diNVDf/kuvTkF+TmukYXR9TocyqXQs8YheOE4yzhdBVFN3GD42qmuweZ4o97SYv2dFyY
	p/pulnh5NQ+NX3UmWzcdJxG1llX7ig8ctWFG1HYFuHax35MFTGFsJzDhsuyYqbsJ2B2P
	o7oEi+wQgk9yrf9iEAzXY31ceF8GVfWnBSU+yipz9dftLpYCjK0MpBD4WRc1pp9qsAqc
	amvQ==
X-Received: by 10.194.112.3 with SMTP id im3mr29050282wjb.54.1441048321548;
	Mon, 31 Aug 2015 12:12:01 -0700 (PDT)
Received: from amyr.alm.mentorg.com (nat-lmt.mentorg.com. [139.181.28.34])
	by smtp.gmail.com with ESMTPSA id d7sm98012wiz.22.2015.08.31.12.11.58
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 31 Aug 2015 12:12:00 -0700 (PDT)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 31 Aug 2015 12:11:53 -0700
Message-Id: <cover.1441048182.git.chris_larson@mentor.com>
X-Mailer: git-send-email 2.2.1
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [PATCHv2 0/3] Various bits related to pulseaudio
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
X-List-Received-Date: Mon, 31 Aug 2015 19:12:04 -0000

From: Christopher Larson <chris_larson@mentor.com>

While it was pointed out that a configuration option for autospawn-for-root
may be preferable, we can switch to that as a future improvement, so I think
it should still go in as is, unless there's an objection to that.

v2 changes: removed inaccurate comment regarding autospawn-for-root
packageconfig.

The following changes since commit 524c590fb44d0ef9711accf2db1a21e4a3cbcfc2:

  oe-selftest: test devtool build-image plugin (2015-08-31 11:37:00 +0100)

are available in the git repository at:

  git://github.com/kergoth/openembedded-core pulseaudio-related-bits
  https://github.com/kergoth/openembedded-core/tree/pulseaudio-related-bits

Christopher Larson (3):
  packagegroup-core-x11-sato: obey the pulseaudio distro feature
  pulseaudio: pass --with-systemduserunitdir
  pulseaudio: add 'autospawn-for-root' PACKAGECONFIG

 meta/recipes-multimedia/pulseaudio/pulseaudio.inc      | 18 +++++++++++++++++-
 .../packagegroups/packagegroup-core-x11-sato.bb        |  3 +--
 2 files changed, 18 insertions(+), 3 deletions(-)

-- 
2.2.1


