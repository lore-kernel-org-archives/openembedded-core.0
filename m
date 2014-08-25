Return-Path: <kergoth@gmail.com>
Received: from mail-pa0-f48.google.com (mail-pa0-f48.google.com
	[209.85.220.48])
	by mail.openembedded.org (Postfix) with ESMTP id B608370F5A
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Aug 2014 22:47:02 +0000 (UTC)
Received: by mail-pa0-f48.google.com with SMTP id et14so21756434pad.35
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Aug 2014 15:47:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=iCDWOo2dkIF0tI7Np3f4X2SbfzHVpezoexbSSZi9R5w=;
	b=LiYg6LgW7FEIKwdI0R/rTs10RKug6IeP01CL4oQVW1fjUUYZ20lsSY9qXtyXQnlgAl
	da4MoZW7/wO1hy5rAfyAsI1m0ewZHqkHhvjhxS6UOzOe3gdHU7d92fg5bHWuCI2PbcOg
	l+s6FgDAIs/sHVx1+AaqVUL0MECltbbK3rSJO0WljrgnQghtpbg2He4HQU/aGTBHCvma
	qDfaSmKi9Xj10uAPlM3PKwjO3W71QNsT7wcew3tHMBFmAI8Z1be5YDidJ40zq2Fh2AxW
	VMqjij3bfBQr01HVGLhwdNzy3J7hWLJA9pAd2MbAKslbNWJctI2NCP0OeXlNc0h7k2Hr
	CDRQ==
X-Received: by 10.66.129.139 with SMTP id nw11mr32682910pab.16.1409006824565; 
	Mon, 25 Aug 2014 15:47:04 -0700 (PDT)
Received: from amyr.alm.mentorg.com (nat-lmt.mentorg.com. [139.181.28.34])
	by mx.google.com with ESMTPSA id j5sm1513440pdp.9.2014.08.25.15.47.02
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 25 Aug 2014 15:47:03 -0700 (PDT)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 25 Aug 2014 15:46:55 -0700
Message-Id: <cover.1409006757.git.chris_larson@mentor.com>
X-Mailer: git-send-email 1.8.3.4
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [PATCH 0/3] sanity: improve mirrors check
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
X-List-Received-Date: Mon, 25 Aug 2014 22:47:08 -0000

From: Christopher Larson <chris_larson@mentor.com>

The following changes since commit 217aa4d9802609d2c3628c8751a27a5d25900898:

  autogen-native: inherit pkgconfig to fix a build failure (2014-08-25 10:25:54 +0100)

are available in the git repository at:

  git@github.com:kergoth/openembedded-core improve-sanity-mirrors-check

for you to fetch changes up to 47b5636f4c87979aecfbcb743235a9e010bedd23:

  sanity: refactor mirrors checks to be more pythonic (2014-08-25 15:45:19 -0700)

----------------------------------------------------------------
Christopher Larson (3):
      sanity: handle both \n and \n in mirror vars
      sanity: fix support for regex schemes in mirrors check
      sanity: refactor mirrors checks to be more pythonic

 meta/classes/sanity.bbclass | 67 ++++++++++++++++++++++++---------------------
 1 file changed, 36 insertions(+), 31 deletions(-)

-- 
1.8.3.4


