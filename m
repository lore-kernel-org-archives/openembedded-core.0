Return-Path: <net147@gmail.com>
Received: from mail-pb0-f42.google.com (mail-pb0-f42.google.com
	[209.85.160.42])
	by mail.openembedded.org (Postfix) with ESMTP id DE8D06A99E
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Jun 2013 01:07:04 +0000 (UTC)
Received: by mail-pb0-f42.google.com with SMTP id un1so4946952pbc.29
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Jun 2013 18:07:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=rGPBK7mruwOV9NAD82w45ZJAFr33EWyTVzsnS4RVHm0=;
	b=ki90u74MVxxRCOqryemiBmJ/BfAd2I3GQ+1XVLWT/Kg0PfIKI2adpcFjeM6+z+TuUJ
	y4giAGIJDkCaNZwMMHq/+q4DVe1Zd7LgOmakBE942xu+kwvr+gA8rDi/R7S/f3dvtFJ7
	MtT4yJ0Lsmth7X88Klw/OxRtzUjKslhxUu4sq5tji1h+AL2CXWGcrx9dAKWcxFvMUQWV
	iYUdNXR1dpmLRpv5e6gya0KPV8Suu8VJnpRQB0Jge6dbsLhwRdLvz1TlwBlUXmw2Ov/Z
	52ZT34gREkul1U6XQnjIUd+TZ2nU9ksr1Qj058J4ieNSet+H6TXqtRyPoZzQT9N78izI
	kH3w==
X-Received: by 10.68.218.8 with SMTP id pc8mr17145509pbc.115.1370999225330;
	Tue, 11 Jun 2013 18:07:05 -0700 (PDT)
Received: from 60-242-179-244.static.tpgi.com.au
	(60-242-179-244.static.tpgi.com.au. [60.242.179.244])
	by mx.google.com with ESMTPSA id
	xe9sm16768081pbc.21.2013.06.11.18.07.02 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 11 Jun 2013 18:07:04 -0700 (PDT)
From: Jonathan Liu <net147@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 12 Jun 2013 11:21:03 +1000
Message-Id: <1371000065-23866-1-git-send-email-net147@gmail.com>
X-Mailer: git-send-email 1.8.3
Subject: [PATCH 0/2] Qt fixes
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
X-List-Received-Date: Wed, 12 Jun 2013 01:07:05 -0000

A couple of Qt fixes. These have been tested by Paul Eggleton.
I have fixed some typos in the commit message for Felipe's patch and
dropped the note regarding the build system going crazy as requested by
Paul.

Felipe F. Tonello (1):
  qt: update qmake2 class to export qconfig.pri mkspec

Jonathan Liu (1):
  classes/qmake_base: allow parallel make

 meta/classes/qmake2.bbclass     | 1 +
 meta/classes/qmake_base.bbclass | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

-- 
1.8.3


