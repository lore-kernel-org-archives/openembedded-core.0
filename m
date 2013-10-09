Return-Path: <cazfi74@gmail.com>
Received: from mail-la0-f51.google.com (mail-la0-f51.google.com
	[209.85.215.51])
	by mail.openembedded.org (Postfix) with ESMTP id C54936CDA7
	for <openembedded-core@lists.openembedded.org>;
	Wed,  9 Oct 2013 23:29:41 +0000 (UTC)
Received: by mail-la0-f51.google.com with SMTP id es20so1370046lab.38
	for <openembedded-core@lists.openembedded.org>;
	Wed, 09 Oct 2013 16:29:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=Ktg1NpjXcO10+SbIKJjALXH0SamgcpcjSq2TI4IGacs=;
	b=UTk5DVAhH0bVSL78zr+EEfFD489v6XevLUIgewmk70fgvJbbk7O6Dqb4kL9cOMuOLu
	MLg6MQmTxqTCTC9bhd8OBJNZa4LE2/D9+VfAV6ApKQ2dxPAC4aNvDFho7rnox7iN3/8h
	Rc+3c6hF8igbNN10FrTBd7EVMo/qi8d5aTB90qWa5oIRauJGvNqhB/P/YZ0nVmXn8eRC
	zynzhkuonXbxtDNKTpxdPTSNe7DBwx0dv3ixGSoIb0tjSK91PKGNaMiJC7vEjvVsbCDY
	PBW1yV53CZ+B3xaBwQNwAnBnbkC8gUI59wPMkI96Z24Adf+1JFBmBEGjN7q5tJyyaHpG
	lg5A==
X-Received: by 10.112.159.166 with SMTP id xd6mr9389199lbb.22.1381361382982;
	Wed, 09 Oct 2013 16:29:42 -0700 (PDT)
Received: from prime (a91-153-14-158.elisa-laajakaista.fi. [91.153.14.158])
	by mx.google.com with ESMTPSA id b6sm37229312lae.0.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Wed, 09 Oct 2013 16:29:42 -0700 (PDT)
Received: from cazfi by prime with local (Exim 4.80)
	(envelope-from <cazfi74@gmail.com>)
	id 1VU3CG-0006tI-Jh; Thu, 10 Oct 2013 02:29:40 +0300
From: Marko Lindqvist <cazfi74@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 10 Oct 2013 02:29:32 +0300
Message-Id: <cover.1381360919.git.cazfi74@gmail.com>
X-Mailer: git-send-email 1.8.4.rc3
Subject: [PATCH 0/2] Automake update to 1.13
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
X-List-Received-Date: Wed, 09 Oct 2013 23:29:42 -0000

Previous version of the series was reduced to just one patch -
the actual automake update.
This version has one more patch before the actual update. Without
"unhardcode version number" -patch old version number is still expected
as part of the name of the command to modify in do_install_append().

The following changes since commit 1149b1fef8912f77d971242dfec151fff5a3aa51:

  build-appliance: Update SRCREV for release (2013-10-08 16:33:25 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib cazfi/am13
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=cazfi/am13

Marko Lindqvist (2):
  automake: unhardcode version number
  automake: update to upstream version 1.13.4

 .../prefer-cpio-over-pax-for-ustar-archives.patch  | 37 +++++++++++-----------
 .../{automake_1.12.6.bb => automake_1.13.4.bb}     | 10 +++---
 2 files changed, 24 insertions(+), 23 deletions(-)
 rename meta/recipes-devtools/automake/{automake_1.12.6.bb => automake_1.13.4.bb} (83%)

-- 
1.8.4.rc3


