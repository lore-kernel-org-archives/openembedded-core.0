Return-Path: <patrick.ohly@intel.com>
Received: from mail-ig0-f178.google.com (mail-ig0-f178.google.com
	[209.85.213.178])
	by mail.openembedded.org (Postfix) with ESMTP id A3C0672A78
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Aug 2015 16:01:49 +0000 (UTC)
Received: by igfj19 with SMTP id j19so15646575igf.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Aug 2015 09:01:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to;
	bh=d7HaGlXHKWqCgStKx0bQI8gKpMYVaD3qK42XQMTUr+k=;
	b=I+xebNJ2ZkeCyIY4Unso2JlBgK1mD4Zn35kR4ESUWE8Sk/Zkn00fbEAnS0U0ecJYfv
	D9Vd41vheRzWNmzb/igksnveJGth3BJ6EFDvR3A38X44VdkVFdT6+TghYQ0gfF77SLeG
	pV/GJ400I/Kq1yfOC8NwDwMNGfvHWzzRK7Dew8HOuYnc0ppW/CnZa4vuSmkMkiEjvOW0
	dlHlhD9wGBxmNGMKWkUQqsD1XeI04vPBER3abN6WFXy6V+Au/n8/cY5ne/EqkStneaHh
	z/coGJp0ESFw9aPuYc1/O6dSka06vJI77pBG4iU/b40WS5TX4gvKHl0G8TvlP7MD1Gyh
	8AuA==
X-Gm-Message-State: ALoCoQlUAdaGzPtgdNFk4nwFMx/jwGVU7ER38AsecfZl/Z9wGZ1pDQyepteqebSBnRTR0+Wmn1fk
X-Received: by 10.50.111.164 with SMTP id ij4mr3291900igb.70.1439568109335;
	Fri, 14 Aug 2015 09:01:49 -0700 (PDT)
Received: from pohly-mobl1.ger.corp.intel.com (p5DE8D814.dip0.t-ipconnect.de.
	[93.232.216.20]) by smtp.gmail.com with ESMTPSA id
	h33sm5246371iod.23.2015.08.14.09.01.48
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 14 Aug 2015 09:01:48 -0700 (PDT)
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 14 Aug 2015 18:01:40 +0200
Message-Id: <cover.1439567977.git.patrick.ohly@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <CAJTo0Lb_EAc_qUAOUqTJz8ardk-62z=DJqurpz0S7aoE_=yk1g@mail.gmail.com>
Subject: [PATCH v3 0/2] xattr + tar
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
X-List-Received-Date: Fri, 14 Aug 2015 16:01:51 -0000

This time with tar's do_install logic refactored as suggested by Ross.

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
 meta/recipes-extended/tar/tar.inc                        | 11 +++++------
 3 files changed, 18 insertions(+), 13 deletions(-)
 delete mode 100644 meta/recipes-extended/tar/tar-replacement-native_1.28.bb

-- 
2.1.4


