Received: from mail-px0-f178.google.com ([209.85.212.178])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QSDsz-0000s8-Kk
	for openembedded-core@lists.openembedded.org;
	Thu, 02 Jun 2011 21:48:53 +0200
Received: by pxj25 with SMTP id 25so643158pxj.9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 02 Jun 2011 12:45:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer;
	bh=58YtZztfTvnr3XrVjP8HK3r0WdQ+5rlUhmJt9kiIeaw=;
	b=snRt2aHS6EJ4Tkv3CdnLasGDwLDQDFvZT4DnUajfV3HZpoUjHC0PAc5tK87EfdM13g
	nhd6xLd0MRnw8zj6jyzz8GMqRZ0mePGin5P/d0EAKbfglw710mUuJUiW/DoY0xpq92VI
	nr0kW45H9TrEzFAJ5DPNZ1S/anlSS85dOSWNc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=LSM8G7GqRXJ2sgP1oaiQGPBAfinSzWrwozcth0xo3LsNumBwv3c/I+Wm95QK0LPwaA
	8nYszN50JqLYWQX5qB1jHuhHxhPAKjsXcbWqpeb7hXvW16e57fWoFPJKNqos4k7x6vaG
	2WFQ4L3D8UD8Pjcq3VhgOWm1GwBBtlz+Z4fqk=
Received: by 10.68.57.38 with SMTP id f6mr418970pbq.471.1307043940785;
	Thu, 02 Jun 2011 12:45:40 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id f3sm803486pbj.32.2011.06.02.12.45.38
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 02 Jun 2011 12:45:39 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  2 Jun 2011 12:45:25 -0700
Message-Id: <1307043926-18177-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.4.1
Subject: [PATCH 1/2] allarch.bbclass: Define BASE_PACKAGE_ARCH = "all"
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
X-List-Received-Date: Thu, 02 Jun 2011 19:48:53 -0000

If not overridden it gets the value which is for target recipes
usually defined in machine tune files

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/classes/allarch.bbclass |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/meta/classes/allarch.bbclass b/meta/classes/allarch.bbclass
index 26fca70..e3ac392 100644
--- a/meta/classes/allarch.bbclass
+++ b/meta/classes/allarch.bbclass
@@ -2,6 +2,7 @@
 # This class is used for architecture independent recipes/data files (usally scripts)
 #
 
+BASE_PACKAGE_ARCH = "all"
 PACKAGE_ARCH = "all"
 
 # No need for virtual/libc or a cross compiler
-- 
1.7.4.1



