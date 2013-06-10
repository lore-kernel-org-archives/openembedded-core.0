Return-Path: <kergoth@gmail.com>
Received: from mail-pd0-f178.google.com (mail-pd0-f178.google.com
	[209.85.192.178])
	by mail.openembedded.org (Postfix) with ESMTP id 5BD946A98B
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Jun 2013 20:46:34 +0000 (UTC)
Received: by mail-pd0-f178.google.com with SMTP id w11so3389951pde.9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Jun 2013 13:46:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=+cFo318JQuBvnMlmTTQQh90V6dqvcNmpFIuho44JH4I=;
	b=r6s4gvqHeGV1Xwyf1mNGjBmgMuSdV+12uA5yrvNctL/1lXPd6Vs/lL4eugFgvY+RAA
	w9PUFELAMwsPJOjI5grFzIQRsVDwhrv4cPLiKL6wLc9CJjhJuLUzRfM1sUsctMV3Wh6g
	qhhqAGywdRwwaSjwwSqOVMvmKQYpYetxOawA3k1hlemsjC+NEBGSrokO+zC0btCrr2fS
	6c1rGCeQndnVkb5dXsBisTF41bCd20HGQ0nu19tmbzqyfzi2NwmM9NJRV1lTxYk89Vss
	CJrNPDXHM7pz7SGs3Gje5p5FLSYDi6RtRetPGM7fSSZEwle2CjAZSHQxoEAoX1A2BhCF
	sJ9A==
X-Received: by 10.68.90.197 with SMTP id by5mr11325718pbb.196.1370897195798;
	Mon, 10 Jun 2013 13:46:35 -0700 (PDT)
Received: from precise64.alm.mentorg.com (nat-lmt.mentorg.com. [139.181.28.34])
	by mx.google.com with ESMTPSA id
	cp1sm11526369pbc.42.2013.06.10.13.46.33 for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 10 Jun 2013 13:46:34 -0700 (PDT)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 10 Jun 2013 13:46:38 -0700
Message-Id: <cover.1370896976.git.chris_larson@mentor.com>
X-Mailer: git-send-email 1.8.3
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [PATCH 0/2] copyleft_compliance fixes
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
X-List-Received-Date: Mon, 10 Jun 2013 20:46:34 -0000

From: Christopher Larson <chris_larson@mentor.com>

The following changes since commit b4f208f418d18f2a4e78a56bebacef481061d917:

  tar: don't mv tar for nativesdk (2013-06-10 18:06:33 +0100)

are available in the git repository at:

  https://github.com/kergoth/oe-core.git copyleft-compliance-fixes
  https://github.com//tree/copyleft-compliance-fixes

Christopher Larson (2):
  copyleft_compliance: handle localpaths ending with '/'
  copyleft_compliance: set 'dirs' flag on task

 meta/classes/copyleft_compliance.bbclass | 3 +++
 1 file changed, 3 insertions(+)

-- 
1.8.3


