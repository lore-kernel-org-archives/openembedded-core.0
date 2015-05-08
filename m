Return-Path: <patrick.ohly@intel.com>
Received: from mail-ig0-f180.google.com (mail-ig0-f180.google.com
	[209.85.213.180])
	by mail.openembedded.org (Postfix) with ESMTP id 2D2E773C7E
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 May 2015 12:37:37 +0000 (UTC)
Received: by igbpi8 with SMTP id pi8so29957547igb.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 May 2015 05:37:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=JeG0KpxY2NeYU8rrSoxLt4z9imLv3+8xuU9QYBRB9wA=;
	b=L2lzM2gu1EX/UMntA861Ur5Byfs/ctaqIKHRPxrfhUFxqLfbnzGEEa/jIUTxaKntgX
	yBDHeV2hOsNnnVWZw+3WXCaqhEqL0qX3zs/U3jBJ7gftnBDhMsf0JZAPlY5jt8cU7NOi
	kJQl89LdfETMhbrapiZHFxEmSiAI0k82v32/BZtKHoO4QTV0be5x/pqpL1tUalmdgFfJ
	mgId3hk5xoTKBVADSH2wm4HnAXWGNwp9n+lVq8FAUWq12dffWQmJIxwwhY9JcckUPXs1
	LmVQDzBi14C9Xy18qf0874Hda1mU3yNE+emruuHXGPUGwiV923yHeuleY05bKh9UjCqV
	9l+A==
X-Gm-Message-State: ALoCoQmuSibwUBJk5VhqPWWEOhHlKa79+eg7ZrxIsTY8fBIQILdnAYSvSdwNQoqYd8e1oOc4rcbE
X-Received: by 10.50.127.232 with SMTP id nj8mr4003657igb.32.1431088658404;
	Fri, 08 May 2015 05:37:38 -0700 (PDT)
Received: from pohly-mobl1.ger.corp.intel.com (p57A57C49.dip0.t-ipconnect.de.
	[87.165.124.73])
	by mx.google.com with ESMTPSA id b2sm3658031igf.10.2015.05.08.05.37.36
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 08 May 2015 05:37:37 -0700 (PDT)
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  8 May 2015 14:37:29 +0200
Message-Id: <cover.1431088309.git.patrick.ohly@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH 0/1] combo-layer + merge requests
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
X-List-Received-Date: Fri, 08 May 2015 12:37:39 -0000

We are using combo-layer with repos hosted on Github, and we use the
"merge pull request" button from Github to import changes. This leads
to merge commits in our component history. Because we avoid
conflict resolution during merging, that mostly works, except for two edge
cases:
1. last_revision not recent enough for the next combo-layer run,
   patch available
2. a merge succeeds automatically (three-way merge), but "git am"
   then is more picky and rejects patches which do not apply cleanly.
   No solution for that yet; we'll have to be more careful about
   rebasing before merging.

The following changes since commit 2258345e19efff7717fe19a5026ec55f1b6f90b6:

  oe-selftest: devtool: add a proper test to see if tap devices exist (2015-05-07 14:59:15 +0100)

are available in the git repository at:

  git://github.com/pohly/openembedded-core master
  https://github.com/pohly/openembedded-core/tree/master

Patrick Ohly (1):
  combo-layer: improve merge commit handling

 scripts/combo-layer | 27 ++++++++++++++++++++++++---
 1 file changed, 24 insertions(+), 3 deletions(-)

-- 
2.1.4


