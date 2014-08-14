Return-Path: <raj.khem@gmail.com>
Received: from mail-pd0-f173.google.com (mail-pd0-f173.google.com
	[209.85.192.173])
	by mail.openembedded.org (Postfix) with ESMTP id D400560CFC
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Aug 2014 04:53:29 +0000 (UTC)
Received: by mail-pd0-f173.google.com with SMTP id w10so899365pde.4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Aug 2014 21:53:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=L+kai8zjhTQmehYbuRz1d3XfmWeQSk3dIXXz+u02jV0=;
	b=vLGQl8L8E1qGCX3omhg3BEN2jaYtX++BAL30G4F5qupPXTapi77+4TGoX54rtQNOfF
	qlBbSVJoDnasCsrMuJpkz9WnVu0OZg2hjG2eSvjM5Cl0gHvWS4cgUHkoTIHOYs/wkVYJ
	YzgWk19OcsfF7R6SJOabk8ai/hSMrQGA9bin9pQ3L0735ivSkrwi1yCHdcrVcIV5fj1l
	1Xf95gWf9uIvkpdeSS3IaZQKF3NDM0sXUfcBjPpz8/5qBZwwIFfA8HNWIuD2WC3+pBFq
	IaiBs9msi/FoAFnYriDAbjm74PdxQIl8XODQdS1KuNPogSJFfkXh4ZQYU81+IoB5mmyP
	qZ2g==
X-Received: by 10.67.15.172 with SMTP id fp12mr1979931pad.4.1407992010570;
	Wed, 13 Aug 2014 21:53:30 -0700 (PDT)
Received: from localhost.localdomain (c-98-207-177-218.hsd1.ca.comcast.net.
	[98.207.177.218])
	by mx.google.com with ESMTPSA id ou5sm3808769pbb.62.2014.08.13.21.53.29
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 13 Aug 2014 21:53:29 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 13 Aug 2014 21:56:42 -0700
Message-Id: <cover.1407992030.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH 0/1] Fix symlinking of linker in gcc-cross-initial
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
X-List-Received-Date: Thu, 14 Aug 2014 04:53:37 -0000

the issue here is that we want to use ld.bfd in gcc-cross-initial
but we miss out when we install symlinks. This hurts when default linker
is gold and eglibc is re-built

The following changes since commit 4321c553d5ae816e566234e981a0815bba046d39:

  SIGGEN_EXCLUDERECIPES_ABISAFE: add initscripts (2014-08-11 17:44:09 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib kraj/gcc-cross-initial-gold
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=kraj/gcc-cross-initial-gold

Khem Raj (1):
  gcc-cross-initial: Use good old bfd linker by default

 meta/recipes-devtools/gcc/gcc-cross-initial.inc |    4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

-- 
1.7.10.4


