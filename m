Return-Path: <cazfi74@gmail.com>
Received: from mail-lb0-f169.google.com (mail-lb0-f169.google.com
	[209.85.217.169])
	by mail.openembedded.org (Postfix) with ESMTP id 07EDD6D35F
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Oct 2013 07:39:20 +0000 (UTC)
Received: by mail-lb0-f169.google.com with SMTP id o14so434301lbi.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Oct 2013 00:39:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=qM8PiIjr0ozzHdUeNOp1m+nJ/LEve0LZGV9T5FtNCWg=;
	b=T/vHIaSu5qkSv7B+pnX6UO3+5PYNE7as0l7eJKiqImFiYAwLxq4sLKfUL1c3/QfKo3
	QEjyM8KAn7bUL539zpoXXpEEqZimKqv9ORYNu9xUbmYgqcTzJXBEaqlrQDQOf07TTNLb
	/4jcnpdOP2Xy03/AbH6je/1F4sk1DYBzY4Nbqp16M/GpLLxHS5DGNKBuF++qdf1IFykP
	jFArTa4xjKQvyTJdKK2qIOzyDP33TEYfsXDesQbIocURohPcQx0Lo/NmoHDYhnZWTeh/
	QgVF/SVBnXuwssBzdKTMZ6HEf3JH3Sgsrx180HOZcm3bnmzFugZHBHbf0wAj8SLmyu0J
	FjDA==
X-Received: by 10.152.7.105 with SMTP id i9mr4335674laa.9.1382686761502;
	Fri, 25 Oct 2013 00:39:21 -0700 (PDT)
Received: from prime (a91-153-14-158.elisa-laajakaista.fi. [91.153.14.158])
	by mx.google.com with ESMTPSA id mz3sm1595981lbb.14.2013.10.25.00.39.20
	for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Fri, 25 Oct 2013 00:39:20 -0700 (PDT)
Received: from cazfi by prime with local (Exim 4.80)
	(envelope-from <cazfi74@gmail.com>)
	id 1VZbzL-00083B-4b; Fri, 25 Oct 2013 10:39:19 +0300
From: Marko Lindqvist <cazfi74@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 25 Oct 2013 10:39:17 +0300
Message-Id: <cover.1382686685.git.cazfi74@gmail.com>
X-Mailer: git-send-email 1.8.4.rc3
Subject: [PATCH 0/4] Automake-1.14 fixes
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
X-List-Received-Date: Fri, 25 Oct 2013 07:39:21 -0000

The following changes since commit 843a5dd8f8f0461e286d9fdb3ba55205b4275f88:

  base.bbclass: fix nondeterministic PACKAGECONFIG processing order (2013-10-24 08:38:24 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib cazfi/am14
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=cazfi/am14

Marko Lindqvist (4):
  libxcb: fix build with automake-1.14
  libcheck: allow build with automake-1.14
  libfm: upgrade to upstream version 1.1.2.2
  libfm: allow build with automake-1.14

 .../xcb/libxcb/automake_1.14_fix.patch             | 27 ++++++++++++++++++++++
 meta/recipes-graphics/xcb/libxcb_1.9.1.bb          |  2 +-
 .../libcheck/ignore_automake_warning.patch         | 15 ++++++++++++
 meta/recipes-support/libcheck/libcheck_0.9.10.bb   |  1 +
 .../fix-make-parallelism-issue.patch               |  0
 .../libfm-1.1.2.2/ignore_automake_warnings.patch   | 14 +++++++++++
 .../libfm/{libfm_1.1.0.bb => libfm_1.1.2.2.bb}     |  7 +++---
 7 files changed, 61 insertions(+), 5 deletions(-)
 create mode 100644 meta/recipes-graphics/xcb/libxcb/automake_1.14_fix.patch
 create mode 100644 meta/recipes-support/libcheck/libcheck/ignore_automake_warning.patch
 rename meta/recipes-support/libfm/{libfm-1.1.0 => libfm-1.1.2.2}/fix-make-parallelism-issue.patch (100%)
 create mode 100644 meta/recipes-support/libfm/libfm-1.1.2.2/ignore_automake_warnings.patch
 rename meta/recipes-support/libfm/{libfm_1.1.0.bb => libfm_1.1.2.2.bb} (78%)

-- 
1.8.4.rc3


