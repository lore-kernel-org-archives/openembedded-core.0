Return-Path: <paul.betafive@gmail.com>
X-Greylist: delayed 363 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 28 May 2014 15:26:06 UTC
Received: from mail-we0-f170.google.com (unknown [74.125.82.170])
	by mail.openembedded.org (Postfix) with ESMTP id 4414365D1A
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 May 2014 15:26:06 +0000 (UTC)
Received: by mail-we0-f170.google.com with SMTP id u57so11658336wes.29
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 May 2014 08:26:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id;
	bh=kt3ySsUelxT9nIyKLb8KNGzxQd1j5VJSWyybxIDbwfo=;
	b=oguUv6KPlWgwOnb5nR+2pikoDKF/3CVvDGbJKM3Co4o+6oiBstMQXX3VTtg9r0o4lM
	xgwGWBhQkkn1YKx0TzuoVhPcijhn4m5t9juPw7F5sRYs8vyauTjZ4Q6/hAvgI+s5to9D
	ENWul+G4jSrXZXm6A3rQsIYWq4iJed6UDb1M/eLISqPBr/KrQ2C+MJFUBKJnC8tVan5+
	RmjzAJEBCh4wXuEXoJM+OwNU9LZQjLfsNrlx6aNjQK05XP8Ke31zzKCZ9PKPX65j3v4P
	BdOCvdchsVqlRbI3WTMjfa8FiS9qr+6q+I4sCPBm8l2kDqDuN+bxezbxDnXrq7HbCgYu
	zXaQ==
X-Received: by 10.180.78.225 with SMTP id e1mr50251704wix.17.1401290402675;
	Wed, 28 May 2014 08:20:02 -0700 (PDT)
Received: from localhost.localdomain (ygg.betafive.co.uk. [5.9.90.21])
	by mx.google.com with ESMTPSA id
	r15sm17617729wiw.17.2014.05.28.08.20.01 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 28 May 2014 08:20:01 -0700 (PDT)
Sender: Paul Barker <paul.betafive@gmail.com>
From: Paul Barker <paul@paulbarker.me.uk>
To: openembedded-core@lists.openembedded.org
Date: Wed, 28 May 2014 15:19:48 +0000
Message-Id: <1401290390-5959-1-git-send-email-paul@paulbarker.me.uk>
X-Mailer: git-send-email 1.9.3
Subject: [PATCH 0/2] IPK_HIERARCHICAL_FEED support
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
X-List-Received-Date: Wed, 28 May 2014 15:26:15 -0000

This is a follow up to the RFC patches I sent out a few weeks ago. I've finally
had time to finish up the work and give it another round of testing. Everything
looks good both with and without IPK_HIERARCHICAL_FEED set. I've tested that it
is possible to install from a hierarchical feed using opkg on qemuarm.

Paul Barker (2):
  opkg-utils: Update SRCREV
  package_ipk.bbclass: Support hierarchical feed

 meta/classes/package_ipk.bbclass                   | 27 +++++++++++++++++++++-
 meta/conf/local.conf.sample.extended               | 23 ++++++++++++++++++
 meta/recipes-devtools/opkg-utils/opkg-utils_git.bb |  2 +-
 3 files changed, 50 insertions(+), 2 deletions(-)

-- 
1.9.3


