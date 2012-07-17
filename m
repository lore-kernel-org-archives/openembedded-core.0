Received: from mga06.intel.com ([134.134.136.21] helo=orsmga101.jf.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1SrAil-0002JS-Rd
	for openembedded-core@lists.openembedded.org;
	Tue, 17 Jul 2012 18:34:00 +0200
Received: from mail-we0-f180.google.com ([74.125.82.180])
	by mga02.intel.com with ESMTP/TLS/RC4-SHA; 17 Jul 2012 09:22:30 -0700
Received: by weyt11 with SMTP id t11so361045wey.25
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Jul 2012 09:22:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:x-gm-message-state;
	bh=wI/4NH4BTuMG8jvD9hHB24GA1dkMkQElp6uhZwzQu2k=;
	b=F2Em7vPqG5+hDD3WUukzVgy0feC8GxCV4ZZpzKYqfsiIY2aJWQjYMjJFHY33NJg7Uf
	EqQ+FrJu1Fab1uN23bzYe7OilsWO9azfPPbuIEkLEVlikmJeioG+F7x44ktQofpekz+m
	RTpEHL0ec4Je3dd8hHSSAt3V8QaZ6QK3WelNAMLc1zCnuhmQXq068iRHttodDSk+Fu34
	OFhg063S6CmwP4MNUtiX8v2DIUn/C6IkPM7tYRPAxMfR5PhxexWPmA5/7Ylz8LgsUHdG
	0DTDnwlG9c9n7C2oyn1dd4O5KJ18ppHPXjl3nM8vslxEhnRnJknMo2n+7bGyKRhPBsPp
	AuPg==
Received: by 10.216.139.196 with SMTP id c46mr1716955wej.220.1342542148748;
	Tue, 17 Jul 2012 09:22:28 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id cl8sm27732790wib.10.2012.07.17.09.22.27
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 17 Jul 2012 09:22:28 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 17 Jul 2012 17:22:07 +0100
Message-Id: <cover.1342542040.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10
X-Gm-Message-State: ALoCoQkKN/s2ptcKvph2+zNvhAvslo5281ibiGiaGttkhivpotOH4I1eYVaTJSGA7nnQSQCI/Ut0
Subject: [PATCH 0/3] Fixes for Web
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
X-List-Received-Date: Tue, 17 Jul 2012 16:34:00 -0000

Some minor fixes for Web.

The following changes since commit 219a855f99bc45fd273f62df9507be7223eff1b4:

  useradd.bbclass: Fix for multilib builds (2012-07-17 10:56:26 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib ross/web

for you to fetch changes up to 245f335b9d6103daba1c90403a94a50eec80e64d:

  web-webkit: don't link using g++, it's not needed anymore (2012-07-17 12:57:04 +0100)

----------------------------------------------------------------
Ross Burton (3):
      web-webkit: remove unused dependencies (taken from the gecko-based recipe)
      web-webkit: push make whitespace fix upstream
      web-webkit: don't link using g++, it's not needed anymore

 .../web/web-webkit/link-with-g++.patch             |   35 --------------------
 meta/recipes-sato/web/web-webkit/make-382.patch    |   17 ----------
 meta/recipes-sato/web/web-webkit_git.bb            |   16 +++------
 3 files changed, 5 insertions(+), 63 deletions(-)
 delete mode 100644 meta/recipes-sato/web/web-webkit/link-with-g++.patch
 delete mode 100644 meta/recipes-sato/web/web-webkit/make-382.patch

Ross Burton (3):
  web-webkit: remove unused dependencies (taken from the gecko-based
    recipe)
  web-webkit: push make whitespace fix upstream
  web-webkit: don't link using g++, it's not needed anymore

 .../web/web-webkit/link-with-g++.patch             |   35 --------------------
 meta/recipes-sato/web/web-webkit/make-382.patch    |   17 ----------
 meta/recipes-sato/web/web-webkit_git.bb            |   16 +++------
 3 files changed, 5 insertions(+), 63 deletions(-)
 delete mode 100644 meta/recipes-sato/web/web-webkit/link-with-g++.patch
 delete mode 100644 meta/recipes-sato/web/web-webkit/make-382.patch

-- 
1.7.10



