Return-Path: <ross.burton@intel.com>
Received: from mail-we0-f179.google.com (mail-we0-f179.google.com
	[74.125.82.179])
	by mail.openembedded.org (Postfix) with ESMTP id 71CB16CDCB
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Nov 2013 10:31:31 +0000 (UTC)
Received: by mail-we0-f179.google.com with SMTP id q59so922431wes.24
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Nov 2013 02:31:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=RwW5HYfzG2fAj64WgzpP0SbefexPS2y1JE82lycX1iU=;
	b=IBwMarzyw3TXfhI6OB+bznaHIC1nuU/kubKix0MPwtLxoTsnzbP1VQCM8W5vPyIZMD
	6WobXtC84LXyP5XMjPdbw5bVK1RvpAnLtGtk0Bsn5vEc5auiZ2vFoKedII7hFD2+hCI1
	Smm1KUo8wKhvOe5hc2vuobYcZYpGWharqON3Qs+ZwqhTl8CZYtetLaRkH01f5KK/xHWT
	bAqMSyoHoanzpnEdkLU3noryGgzFMjSob+JCkxN47osC4u7FUURseEdH2KuMiAspXs3q
	pvC+I4vXFQLz4iVO0f6t+/QmQaBkODuukMnWKDXoPLqpKhYafFifacxyLgecn7a8acYd
	kT7w==
X-Gm-Message-State: ALoCoQk5QweXE8aMkeuJB6vMh/nFUvrtP5b1OXyesASqLE9LF11/bfxcw609yIcqD7RqgWRsSamP
X-Received: by 10.180.11.37 with SMTP id n5mr1961324wib.25.1385116290527;
	Fri, 22 Nov 2013 02:31:30 -0800 (PST)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id
	ll10sm14375867wic.9.2013.11.22.02.31.29
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 22 Nov 2013 02:31:29 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 22 Nov 2013 10:31:26 +0000
Message-Id: <1385116286-13076-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH][V2] initscripts: remove erroneous call to /etc/default/rcS in mountnfs.sh
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
X-List-Received-Date: Fri, 22 Nov 2013 10:31:31 -0000

This doesn't exist when using systemd as it's part of the sysvinit package, and
this script doesn't need it.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-core/initscripts/initscripts-1.0/mountnfs.sh |    2 --
 1 file changed, 2 deletions(-)

diff --git a/meta/recipes-core/initscripts/initscripts-1.0/mountnfs.sh b/meta/recipes-core/initscripts/initscripts-1.0/mountnfs.sh
index 4fffe4e..fe6c196 100755
--- a/meta/recipes-core/initscripts/initscripts-1.0/mountnfs.sh
+++ b/meta/recipes-core/initscripts/initscripts-1.0/mountnfs.sh
@@ -7,8 +7,6 @@
 # Default-Stop:
 ### END INIT INFO
 
-. /etc/default/rcS
-
 #
 #	Run in a subshell because of I/O redirection.
 #
-- 
1.7.10.4


