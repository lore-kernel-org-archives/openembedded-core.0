Return-Path: <ross.burton@intel.com>
Received: from mail-wg0-f51.google.com (mail-wg0-f51.google.com [74.125.82.51])
	by mail.openembedded.org (Postfix) with ESMTP id B42DD6017E
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Sep 2014 14:37:08 +0000 (UTC)
Received: by mail-wg0-f51.google.com with SMTP id b13so4514032wgh.22
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Sep 2014 07:37:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=qVrV1snaMWzSodmzpGO8XP72nr03hKrrOP2OVXbqcdA=;
	b=k6EgcA2UUtItYfRzyAJkbEcI+NqZLtfenYcmfXk59AU6L6hYlSn82JLYJtMz3+IlTs
	sgE6IRvKFHZX8MJhnm7DFAa+0m9P12vqXUV6eJuYC2v7zTAJvuUNkpPSpo435MqCU44T
	+y8uii84ckYKxPiAzGWW3vfmFfsX+Cjc+EdAewf6shfRTBzxdI6JGAmr4eszurLG2zlh
	NMrFeYEderpWSuqc5QnH7IFPyrhUBX5+QCDS2xqMg7ZpevoR5BncXpXVnXTXMqp6ddp4
	vuYJ3zuE751IKwcjW1bhy47LSePglTnTriAY3B1VL2cP3Rhv1qVuj+3pY+HlUugXZWT4
	+dpw==
X-Gm-Message-State: ALoCoQmHvGGKu/FmYen1P7v2neRra3UfaGepS0G5F9/t8MRGj+zumbVyAlkF96f/9IEWp9AifpcB
X-Received: by 10.180.183.163 with SMTP id en3mr66061354wic.36.1412001429028; 
	Mon, 29 Sep 2014 07:37:09 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id
	hf9sm11894862wib.11.2014.09.29.07.37.07
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 29 Sep 2014 07:37:08 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 29 Sep 2014 15:37:05 +0100
Message-Id: <1412001425-14901-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH] mx: remove version from patch directory
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
X-List-Received-Date: Mon, 29 Sep 2014 14:37:16 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../{mx-1.0-1.4.7+gitAUTOINC+9b1db6b806 => mx-1.0}/fix-build-dir.patch |    0
 .../fix-test-includes.patch                                            |    0
 2 files changed, 0 insertions(+), 0 deletions(-)
 rename meta/recipes-graphics/mx/{mx-1.0-1.4.7+gitAUTOINC+9b1db6b806 => mx-1.0}/fix-build-dir.patch (100%)
 rename meta/recipes-graphics/mx/{mx-1.0-1.4.7+gitAUTOINC+9b1db6b806 => mx-1.0}/fix-test-includes.patch (100%)

diff --git a/meta/recipes-graphics/mx/mx-1.0-1.4.7+gitAUTOINC+9b1db6b806/fix-build-dir.patch b/meta/recipes-graphics/mx/mx-1.0/fix-build-dir.patch
similarity index 100%
rename from meta/recipes-graphics/mx/mx-1.0-1.4.7+gitAUTOINC+9b1db6b806/fix-build-dir.patch
rename to meta/recipes-graphics/mx/mx-1.0/fix-build-dir.patch
diff --git a/meta/recipes-graphics/mx/mx-1.0-1.4.7+gitAUTOINC+9b1db6b806/fix-test-includes.patch b/meta/recipes-graphics/mx/mx-1.0/fix-test-includes.patch
similarity index 100%
rename from meta/recipes-graphics/mx/mx-1.0-1.4.7+gitAUTOINC+9b1db6b806/fix-test-includes.patch
rename to meta/recipes-graphics/mx/mx-1.0/fix-test-includes.patch
-- 
1.7.10.4


