Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1PzRMN-0005k9-FJ
	for openembedded-core@lists.openembedded.org;
	Tue, 15 Mar 2011 11:20:15 +0100
Received: by bwz10 with SMTP id 10so366014bwz.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Mar 2011 03:18:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:subject:date:message-id:x-mailer;
	bh=y2FpMbsfF+gH+wSSjlz0TVChLmMwQp0rPWOQzkmWJ80=;
	b=QXZOCItrsEGqGCQZT5G3678satk0DdR4t1L4ldK659CxhIOLHyOg+Y0C9sfaEPhrxN
	Rc7Cg4XANs9kwZeOUuHs8f7mTCAkut7Cz8nnX8+mQUShGlp7vmaQQIxc1mB+CGUy5lt6
	RUbM7pjeVDB/It3+o5iFRun0cNyKRrvr73phE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer;
	b=lKZdM0BS9B4V7P/0YN+TXIrbpghW9NmDHWdtrjlYhtyFMcHiAzOxDNFRuqxmFdlPz6
	4RkNJxyzKgm701y4mjl78Qxl17701sT4R/v5/5JjgekXbjQyTt6tjXJkumaHGmpIdm3x
	EyaKaZ0qgatZekC2OSYWgVOgvj1ajLQiMdXjY=
Received: by 10.205.37.2 with SMTP id tc2mr10428481bkb.14.1300184310585;
	Tue, 15 Mar 2011 03:18:30 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id l1sm5847643bkl.1.2011.03.15.03.18.28
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 15 Mar 2011 03:18:29 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 15 Mar 2011 11:18:27 +0100
Message-Id: <cover.1300184240.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.4.1
Subject: [PATCH 0/1] scripts/create-pull-request: update URL and reuse variables where possible
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 15 Mar 2011 10:20:15 -0000

Pull URL: git://git.openembedded.org/openembedded-core-contrib
  Branch: jansa/scripts
  Browse: http://git.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=jansa/scripts

Thanks,
    Martin Jansa <Martin.Jansa@gmail.com>
---


Martin Jansa (1):
  create-pull-request: switch URL from git.pokylinux.org/poky-contrib
    to git.openembedded.org/openembedded-core-contrib

 scripts/create-pull-request |    7 ++++---
 1 files changed, 4 insertions(+), 3 deletions(-)

-- 
1.7.4.1



