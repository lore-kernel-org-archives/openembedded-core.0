Return-Path: <kergoth@gmail.com>
Received: from mail-pa0-f67.google.com (mail-pa0-f67.google.com
	[209.85.220.67])
	by mail.openembedded.org (Postfix) with ESMTP id 33C2E731C6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Apr 2016 23:23:54 +0000 (UTC)
Received: by mail-pa0-f67.google.com with SMTP id zy2so7527343pac.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Apr 2016 16:23:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=DmNIoCqXv0hCLEiAEV4nMxjR5lq6fYA/AXZ1s3aONl4=;
	b=jGWs1waAG67UHFT9e+1EkZmlgrW8GlC+ZBsc1ImmXsqHcbkurjXcGZZJUbf1hC4QXT
	6V6d9uvv07HIfOAFcSK3zBcIZxaRA1OAWwtCOsSezc+j0qg4bzePPxWHMCoPWexDjQxB
	Z4Czo0knGMVJdzNXhX+oECYpjWM8dDOowNB6+jKkubfboa21JAp6RY/Pq5n3LgVyynDK
	C7yRLF81SIYUzhe4xYro7FBDmT4BlMm7Rds5OIvVZg0TMwVppCp1ii+MtnCyLLSCNf+a
	R5+Y7sQ7OV2zSXXaNTNRJN8HLqGdgdHGenY+5fYvwmz4VmWxFH0p6IkqiK2IAxLjakAs
	cxjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=DmNIoCqXv0hCLEiAEV4nMxjR5lq6fYA/AXZ1s3aONl4=;
	b=G5A10EU/2CEJvTpHaE18u0LNoD7pgg8+VojkwePNJtmJgypPZV7lZ/62C+w4Xps2n6
	BAtFJ0RlR9ErIPIGK+CLBChD/r1gHpvYO7nat9VBkZm1+atJxyZHONMdesw29z0C4wUK
	uDt8Ekf48hRyV2zQvhLP7rLl+Ug1hgjbs+GoSDsAq+dJHdt5v2WoSXVJJ2yWdnUKq+Jg
	3riKHCkaMMDXY5XNH7JG3PdlSnif4IbtkPbS5jOlFcnXb3InIGLwmzgkzabS/EhQAxts
	Whb49wGKKAhJi0c7/R4aLp7RsBsOm/LpbAtnFkfmHXvgac7IVZvqawJD6i5nepbNcZxp
	9RrQ==
X-Gm-Message-State: AOPr4FUKQBNoXfGwYO6ERCPizD40fxFFKdbHn7DmGmNuD/8T07WY+JC3KNEc4gd0LJ4gCw==
X-Received: by 10.66.100.228 with SMTP id fb4mr15690147pab.84.1461799435460;
	Wed, 27 Apr 2016 16:23:55 -0700 (PDT)
Received: from quark.alm.mentorg.com (nat-lmt.mentorg.com. [139.181.28.34])
	by smtp.gmail.com with ESMTPSA id 17sm9309917pfp.96.2016.04.27.16.23.52
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 27 Apr 2016 16:23:54 -0700 (PDT)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 27 Apr 2016 16:23:34 -0700
Message-Id: <cover.1461790921.git.chris_larson@mentor.com>
X-Mailer: git-send-email 2.8.0
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [for-master][PATCH 0/4] A few argparse_oe changes/fixes
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
X-List-Received-Date: Wed, 27 Apr 2016 23:23:56 -0000

From: Christopher Larson <chris_larson@mentor.com>

The following changes since commit e2dbe5eb869b8336b91023b83d7ca866197efa73:

  license.bbclass: make sure that image manifest dir exists (2016-04-22 16:28:47 +0100)

are available in the git repository at:

  git://github.com/kergoth/openembedded-core argparse-oe-fixes
  https://github.com/kergoth/openembedded-core/tree/argparse-oe-fixes

Christopher Larson (4):
  scripts/lib/argparse_oe: show self.prog in the error message
  scripts/lib/argparse_oe: show subparser help for unrecognized args
  scripts/lib/argparse_oe: simplify options title change
  scripts/lib/argparse_oe: also change 'positional arguments' to
    'arguments'

 scripts/lib/argparse_oe.py | 64 +++++++++++++++++++++++++++++++++++++---------
 1 file changed, 52 insertions(+), 12 deletions(-)

-- 
2.8.0


