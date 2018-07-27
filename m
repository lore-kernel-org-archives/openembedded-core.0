Return-Path: <kergoth@gmail.com>
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com
	[209.85.210.169])
	by mail.openembedded.org (Postfix) with ESMTP id 97BD274581
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Jul 2018 17:24:40 +0000 (UTC)
Received: by mail-pf1-f169.google.com with SMTP id l9-v6so1951376pff.9
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Jul 2018 10:24:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=8JLjoREjqo1FQqdJ6jPsp87edtPGSqWTX8uqG1VKRBA=;
	b=u3TV4Nodt2fjBhLtDkxq+pIy01IE6IDqWiWbwan7qcY0w8j68g3YSz9QQIXxD1cHMz
	ka6MrzKmEk2ClQJEmmW2MDw97btkVNpxszCqisOheX+URi/FdFHaRJKP46spEkPenHxI
	XROIW+lKtCGk5KdwLzFv8w+ii8n0Bgi/NW/EComvHadm01GBJ835n7ie5MjdwBeDMvjo
	5v0UNu2sA1CSLNynzpgY2ouUf4yAvVyCdk0MbzQqIWdNXYbWeH4iXRFWG8mARASQIlq2
	zxDp66fEChhJ1rQVy97UeyKDx3EEQFCjXp95dmW19fyCpDjKcrvkNj0ixFBUYazkdhpd
	nAMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=8JLjoREjqo1FQqdJ6jPsp87edtPGSqWTX8uqG1VKRBA=;
	b=bKIQ/moREBVOcE3xfGQCA4mKNbNvNW1YrRFouNQUn3YX4nY2Z7yPYaiId/ySRv1JMH
	ymq9aIk9KbCbeMnsZSq1PwKzEvP2FvlBhOEeqQ6pQvupJ159x47O3JtQdbHHTWlQHBy/
	+EPwm5D8EL9ct5YAG1y3l4yIVbGbiO59DRYOdzuajmv0lA884GsfRCTUBkrnyZV6ELBc
	yim4YbJ3lfwZlH7G5SyUv+i0wgdnbH98RSpyXnpMlXD0EEbisyljny16I5aPRDmwIcwB
	zP3CB0mLUrqEmdDVmZfNEuleOoqGlAuppz04aDWGmFEJQatT/d6ohdfOo8lFu7oXI7fw
	6nRQ==
X-Gm-Message-State: AOUpUlFAcjXhL2tL4B/IpAfCvwaTCjsrMkQQi9//e7Fkuymtf4aAixbF
	V4zFJCKWV5XzZHcaPw5XcG41kFsE
X-Google-Smtp-Source: AAOMgpfwL1iMOOijL9tSlOO14sLc20Ma6/YjHH9xBMOTC72uNRfaJFQ4JUZOl4AsCQ8+gmhI5XpyNg==
X-Received: by 2002:a63:68c1:: with SMTP id
	d184-v6mr6896912pgc.239.1532712281349; 
	Fri, 27 Jul 2018 10:24:41 -0700 (PDT)
Received: from svr-pkl-eng-07.mgc.mentorg.com ([110.93.212.98])
	by smtp.gmail.com with ESMTPSA id
	v17-v6sm6399195pfn.177.2018.07.27.10.24.38
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 27 Jul 2018 10:24:40 -0700 (PDT)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 27 Jul 2018 22:24:26 +0500
Message-Id: <cover.1532711448.git.chris_larson@mentor.com>
X-Mailer: git-send-email 2.11.1
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [PATCHv2 0/4] Pull postinst-intercepts from BBPATH
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
X-List-Received-Date: Fri, 27 Jul 2018 17:24:40 -0000

From: Christopher Larson <chris_larson@mentor.com>

These are the bits to  allow us to pull intercepts from BBPATH. This is kept
as a separate class, as it's needed by both image construction and sdk
construction, the latter to support meta-toolchain & similar recipes.

The following changes since commit 364449251ffe4ff2c11acaa258edcec244c38818:

  classes/package: fix variable name in comment (2018-07-26 16:55:21 +0100)

are available in the git repository at:

  git@github.com:kergoth/openembedded-core.git bbpath-intercepts

for you to fetch changes up to fc32ec263034818cd182e093685d776b8d50a3a2:

  populate_sdk_base.bbclass: inherit and use image-postinst-intercepts (2018-07-27 22:04:40 +0500)

----------------------------------------------------------------

v2 changes:
- rebased
- renamed bbpath-intercepts.bbclass to image-postinst-intercepts.bbclass, as
  requested by Richard

Christopher Larson (4):
  oe.package_manager: support loading intercepts from multiple paths
  image-postinst-intercepts.bbclass: add class
  image.bbclass: inherit and use image-postinst-intercepts
  populate_sdk_base.bbclass: inherit and use image-postinst-intercepts

 meta/classes/image-postinst-intercepts.bbclass | 23 +++++++++++++++++++++++
 meta/classes/image.bbclass                     |  2 ++
 meta/classes/populate_sdk_base.bbclass         |  3 ++-
 meta/lib/oe/package_manager.py                 | 19 +++++++++++++------
 4 files changed, 40 insertions(+), 7 deletions(-)
 create mode 100644 meta/classes/image-postinst-intercepts.bbclass

-- 
2.11.1


