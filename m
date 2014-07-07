Return-Path: <akuster@mvista.com>
Received: from mail-pa0-f50.google.com (mail-pa0-f50.google.com
	[209.85.220.50])
	by mail.openembedded.org (Postfix) with ESMTP id 7C8B8701CA
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Jul 2014 21:33:15 +0000 (UTC)
Received: by mail-pa0-f50.google.com with SMTP id bj1so6031637pad.23
	for <openembedded-core@lists.openembedded.org>;
	Mon, 07 Jul 2014 14:33:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=kYK1jto5l6jMje/+x1V2DUaoe+kqhy9u8lSumhIuZ5c=;
	b=b0ZW2FzEmIRwhHTcSno9ZH7s11wKBwdCC/FqK0mLwqCHfMplLv9jaYP+c1JaABHIB3
	JJmHv2Ov6ASwp0I/U1NFXYQ993shtHCCP31t5oOeL4YkHL5JmsnJOwPaQ+WCKAs6gicQ
	Q/Yutv0S2mPU3E3CDlkNFV74EfTkU3EU7xDn4gVqichYXjRyKZjg+vM2D+w+SjH0cooO
	4kVnsJ/3FP4Bp+RvhOj6X3Cg6stxUEMwTL+B4L/twCoq89fS9Bm0aEuOhItnz6mEND9M
	HNAqZ4UWAcHAHJUtnLFoFHN57svuaMnBBGYlP1+Qfr8TOMpPuMfrMfO04qTXc+D5GSNK
	ZP3g==
X-Gm-Message-State: ALoCoQnLUbovr4p4F8+dDmqRNrXZMPBuIbNdrhcO1VvbdQ/ZyeOf+2dz/FHLdhe3MnmkW0JOSNzM
X-Received: by 10.66.227.196 with SMTP id sc4mr12270387pac.15.1404768796369;
	Mon, 07 Jul 2014 14:33:16 -0700 (PDT)
Received: from Pahoa2.mvista.com (c-98-239-95-55.hsd1.ca.comcast.net.
	[98.239.95.55]) by mx.google.com with ESMTPSA id
	oa17sm21571189pdb.46.2014.07.07.14.33.15
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 07 Jul 2014 14:33:15 -0700 (PDT)
From: Armin Kuster <akuster@mvista.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  7 Jul 2014 14:33:03 -0700
Message-Id: <1404768785-24026-1-git-send-email-akuster@mvista.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH 0/2] update lz4 and add maintainer
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
X-List-Received-Date: Mon, 07 Jul 2014 21:33:22 -0000

Update SRC_URI to github so we can use less complicated fetch
Update to version 119

Add self to maintainers list. If inappropriate, then drop second patch

Armin Kuster (2):
  lz4: update to latest version 119
  lz4: Add self to maintainers list

 meta-yocto/conf/distro/include/maintainers.inc       |  1 +
 meta/recipes-support/lz4/{lz4_svn.bb => lz4_r119.bb} | 12 ++++++------
 2 files changed, 7 insertions(+), 6 deletions(-)
 rename meta/recipes-support/lz4/{lz4_svn.bb => lz4_r119.bb} (63%)

-- 
1.9.1


