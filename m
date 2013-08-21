Return-Path: <cazfi74@gmail.com>
Received: from mail-la0-f51.google.com (mail-la0-f51.google.com
	[209.85.215.51])
	by mail.openembedded.org (Postfix) with ESMTP id 2A75B6B5A2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Aug 2013 13:08:29 +0000 (UTC)
Received: by mail-la0-f51.google.com with SMTP id es20so318047lab.10
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Aug 2013 06:08:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=/b5Noc13KSh5Aa13aquUyUG3lEgauLQG8l013HiEA4o=;
	b=vttzOVzDTfwlv0OWAZRPiJdrTYNQWAXxZ5p29UTL6kDj4Fl8W6aL4MNPXLEtYcXhcW
	CfE4H7gObrdvPv1qJqXhQkjVkS9yMfLsUmrC08CVKbXx1HrfgytyU0xU05mrUjDqNMVV
	dmcpegQr5QWJcgzAvZ/zeMG7rB73secpstm0O6E9CBkCg5adOspo/Z0QlzIgsWL2YFb0
	qaZNwuSAcA15XNArv/q8Xp9duWw+bcZv/q8BQQL1x6nwJ54h3mbzerMNGpX9D+tY3BL5
	qUKca8CSLmtOhNY4UpZ8ATMBr2AywYWWM6NK74eHuS+u1Ea09pi2x/hgg4mFVHkLaLjF
	sNrw==
X-Received: by 10.152.9.37 with SMTP id w5mr5999814laa.23.1377090510292;
	Wed, 21 Aug 2013 06:08:30 -0700 (PDT)
Received: from prime (a91-153-14-158.elisa-laajakaista.fi. [91.153.14.158])
	by mx.google.com with ESMTPSA id w5sm3149724lbw.3.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Wed, 21 Aug 2013 06:08:29 -0700 (PDT)
Received: from cazfi by prime with local (Exim 4.80)
	(envelope-from <cazfi74@gmail.com>)
	id 1VC89D-00062K-Ci; Wed, 21 Aug 2013 16:08:27 +0300
From: Marko Lindqvist <cazfi74@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 21 Aug 2013 16:08:26 +0300
Message-Id: <cover.1377090438.git.cazfi74@gmail.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH 0/1] Fix boost build
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
X-List-Received-Date: Wed, 21 Aug 2013 13:08:30 -0000

The following changes since commit d98f08a7ad95d0b17846276b028a6614f16b6846:

  genext2fs: fix memory corruption on powerpc (2013-08-20 07:11:44 -0700)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib cazfi/fixes
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=cazfi/fixes

Marko Lindqvist (1):
  boost: fix build when PARALLEL_MAKE is not set

 meta/recipes-support/boost/boost.inc |    2 ++
 1 file changed, 2 insertions(+)

-- 
1.7.10.4


