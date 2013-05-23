Return-Path: <cazfi74@gmail.com>
Received: from mail-lb0-f176.google.com (mail-lb0-f176.google.com
	[209.85.217.176])
	by mail.openembedded.org (Postfix) with ESMTP id 2849E6089F
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 May 2013 08:52:05 +0000 (UTC)
Received: by mail-lb0-f176.google.com with SMTP id x10so3049412lbi.7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 May 2013 01:52:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=x7RfGFmfwabgGgdVyF4AHtKiS4oWTwqzI8E9BvCF7Z8=;
	b=S6DUlj/E/PymmB12Wi0Ao6uaIuOT1NrpZsTyOUFyTZXvqexRod3FUCmht4Q7wWAXQW
	rRVHo5LSxrnSHCXYdZEFb4UJcoy+ZaTVD8fkRnv664FSLQqVyxE9xxNCNgSr7zDZlIFr
	77YQahS3xD9f72Gt3DnHMbhHMV8J3EbBpNW5mePtNfTaDSSALPWctQdOFejLhmQqITUZ
	1OnKM4Zdr5Nr2NXkGbNsdNtADoLtO89ckA6uRJIT+FHpxPuE4TYtuqxBJrQXty1q3BZf
	0dohIhbEGW+aGUoR0doTEhszRSNvdAI4pjRKuDH9q0AdnJIT+CvL3T15y5aDBwBRLmwT
	nrEg==
X-Received: by 10.112.2.166 with SMTP id 6mr6046653lbv.35.1369299126164;
	Thu, 23 May 2013 01:52:06 -0700 (PDT)
Received: from prime (a91-153-5-47.elisa-laajakaista.fi. [91.153.5.47])
	by mx.google.com with ESMTPSA id 9sm4235973lbz.16.2013.05.23.01.52.04
	for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Thu, 23 May 2013 01:52:05 -0700 (PDT)
Received: from cazfi by prime with local (Exim 4.80)
	(envelope-from <cazfi74@gmail.com>)
	id 1UfRFj-0001KZ-Do; Thu, 23 May 2013 11:52:03 +0300
From: Marko Lindqvist <cazfi74@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 23 May 2013 11:52:00 +0300
Message-Id: <cover.1369298825.git.cazfi74@gmail.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH 0/1] Update automake to version 1.13.2
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
X-List-Received-Date: Thu, 23 May 2013 08:52:07 -0000

New upstream release, 1.13.2, has reverted some of the 1.13.0 backward
compatibility dropping changes, for the duration of 1.13 series. Unlike
earlier 1.13 releases, it can be used without breaking huge number of
packages.

The following changes since commit aeb704fee8b4ffeaeddcdb36ae4e1d62c264ce42:

  scripts/bitbake: Handle the case where git isn't installed cleanly (2013-05-21 10:06:11 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib cazfi/am13
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=cazfi/am13

Marko Lindqvist (1):
  automake: update to upstream version 1.13.2

 .../prefer-cpio-over-pax-for-ustar-archives.patch  |   37 ++++++++++----------
 .../{automake_1.12.6.bb => automake_1.13.2.bb}     |    4 +--
 2 files changed, 21 insertions(+), 20 deletions(-)
 rename meta/recipes-devtools/automake/{automake_1.12.6.bb => automake_1.13.2.bb} (90%)

-- 
1.7.10.4


