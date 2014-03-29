Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f50.google.com (mail-ee0-f50.google.com [74.125.83.50])
	by mail.openembedded.org (Postfix) with ESMTP id 18B8660E68
	for <openembedded-core@lists.openembedded.org>;
	Sat, 29 Mar 2014 10:34:12 +0000 (UTC)
Received: by mail-ee0-f50.google.com with SMTP id c13so4824743eek.23
	for <openembedded-core@lists.openembedded.org>;
	Sat, 29 Mar 2014 03:34:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id;
	bh=moU1YMWoosAG1Lm7hRAprYWumnFdzfHz9KVufTHDIWw=;
	b=FrBs3/jSL4fXYWK/qLzqUoSW+rCeyEZJDs+oARsx75sMfmnWHZJc0FTnNVAzx/RpVz
	IDPdCMw8LGUKicAmxZMMq8u87XO9TiI1u58NelSh9zvMDP/R4+HXUZWUHXjULgTY+3od
	MkesX2mrnCgKTOmOLb9oGtjbLuatRal64HnFesA09V4m6xmFl05rjHVjZJ/uD/2M2jvX
	9VaL/k/8Fu2LLCmJNzjiI+ZKlPl2cvfcHokia2TsM7YRLIGMb5Tf5jWpuX+lTwZSWGDK
	shFBZbDLtgTeAmJerHqJFTXlmp1h9czGIOr/gLrS1S22yvMioMvJOOIoZ6VDXeHTAhiQ
	S5bg==
X-Received: by 10.14.220.130 with SMTP id o2mr16940667eep.42.1396089252757;
	Sat, 29 Mar 2014 03:34:12 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	45sm17845059eeh.9.2014.03.29.03.34.11
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 29 Mar 2014 03:34:11 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 29 Mar 2014 11:34:09 +0100
Message-Id: <cover.1396089115.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH 0/4] sstate-cache-management fixes
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
X-List-Received-Date: Sat, 29 Mar 2014 10:34:14 -0000

Removing do_package was reported by Jacob Kroon and then I've found
few more issues, the most surprising is the one with populate_lic.

The following changes since commit b16de9af5c7108396a347e7107c73608a2f8d74f:

  packagegroup-toolset-native: Update after ocf-linux -> cryptodev-linux change (2014-03-27 19:53:07 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib jansa/sstate-management
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=jansa/sstate-management

Martin Jansa (4):
  sstate-cache-management: rm_by_stamps - include signatures of
    .sigdata. files
  sstate-cache-management: rm_by_stamps - remove .siginfo and .done
    files
  sstate-cache-management: skip populate_lic archives when removing
    duplicates
  sstate-cache-management: rm_by_stamps - discover all suffixes like
    remove_duplicated does

 scripts/sstate-cache-management.sh | 34 ++++++++++++++++++++--------------
 1 file changed, 20 insertions(+), 14 deletions(-)

-- 
1.9.1


