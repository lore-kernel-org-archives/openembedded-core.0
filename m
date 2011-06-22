Received: from mail-pw0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QZCXR-00034l-Sk
	for openembedded-core@lists.openembedded.org;
	Wed, 22 Jun 2011 03:47:30 +0200
Received: by pwi1 with SMTP id 1so351162pwi.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Jun 2011 18:43:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references:in-reply-to:references;
	bh=G+WEA4XqaAp22fUTeEIQW8kZJiZldU3nmB6/s5nC6WA=;
	b=tmbFRFxRXmIZ77m9dGyPeGjn9wuNZkL9K/woJU/KPCJ19/H3zUo+OjjBlkVprtycN7
	s/iSwYo4urd7PXnMMVMCCS16pBpXTor8QeOqEVikF4htVRKEj0CIz1TwsMxIAtP+hkYM
	mInUKKLn5Nu4t25+3Dflb1reI50sOPFklf/d4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=rV4DGar6e5NKAF44HUpidCYKcMin+wJ5i3htLFjNz8LOILXN+eBLXQEb0Fmp82cFDu
	A0e8ULBMT4FrvvVshVyiYOr8DP1NhUp6H7IBDVbQc7xRTGWT7Vym5lI7K8m8Yoo/T1ZF
	PM9eXVp10gR9rsmP3/MeAaIsUwajBh82OR6Uc=
Received: by 10.68.58.193 with SMTP id t1mr44486pbq.43.1308707034836;
	Tue, 21 Jun 2011 18:43:54 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id o2sm64885pbj.17.2011.06.21.18.43.53
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 21 Jun 2011 18:43:54 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: OE core <openembedded-core@lists.openembedded.org>
Date: Tue, 21 Jun 2011 18:43:44 -0700
Message-Id: <7c9cfef4734fe29e2a2324cdac48ebae343f673e.1308706423.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <c51f708783d1e320787117e68f2f98aa53ed292e.1308706423.git.raj.khem@gmail.com>
References: <c51f708783d1e320787117e68f2f98aa53ed292e.1308706423.git.raj.khem@gmail.com>
In-Reply-To: <cover.1308706423.git.raj.khem@gmail.com>
References: <cover.1308706423.git.raj.khem@gmail.com>
Subject: [PATCH 4/4] tcmode-default.inc: Bump EGLIBCVERSION to 2.14
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
X-List-Received-Date: Wed, 22 Jun 2011 01:47:30 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/conf/distro/include/tcmode-default.inc |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/conf/distro/include/tcmode-default.inc b/meta/conf/distro/include/tcmode-default.inc
index 90282ee..20fc119 100644
--- a/meta/conf/distro/include/tcmode-default.inc
+++ b/meta/conf/distro/include/tcmode-default.inc
@@ -20,7 +20,7 @@ GCCVERSION ?= "4.6.0"
 SDKGCCVERSION ?= "4.6.0"
 BINUVERSION ?= "2.21"
 GLIBCVERSION ?= "2.10.1"
-EGLIBCVERSION ?= "2.13"
+EGLIBCVERSION ?= "2.14"
 LINUXLIBCVERSION ?= "2.6.37.2"
 
 # Temporary preferred version overrides for PPC
-- 
1.7.5.1



