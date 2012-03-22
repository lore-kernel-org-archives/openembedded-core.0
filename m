Received: from mail-wi0-f177.google.com ([209.85.212.177])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1SAk2E-0003bD-62
	for openembedded-core@lists.openembedded.org;
	Thu, 22 Mar 2012 16:34:42 +0100
Received: by wibhj13 with SMTP id hj13so830953wib.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Mar 2012 08:25:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references:x-gm-message-state;
	bh=MoST1CGb7z+5RNLB3xCCQkpM05O8sCPXwfgAIHjYtpg=;
	b=l06E6GBSLemKI6aV0c4rt9i3QkySgRgZm8Mmethdo9xYVzzeVxMG8GDZA6Lga7XcxI
	LdbVjMJjfIX9zzk5V465GTiOGmBeIMA7ZTh3KQWyXuYAVR459JOw97IUaTdO/XYHfk6x
	chK2IhxFM9g6Cufued8wfcb+NsezqD5A2w0fs7Uuf8gFeBFGQtVii9S1uWa19xt7bkeG
	m13NsAU7PUt8SB4+mI1jVnPDGTVXqGWLlrEgo1+ZQMYHJj6vxsl+QLCTnFM78Yi8w7Ex
	Mvq49laUUGx5m/J6HWmv362rLvO44xyDLWHM9I2d6fXE4WucjhdKo/BT4wJJRsbBOO+8
	7UTA==
MIME-Version: 1.0
Received: by 10.180.24.7 with SMTP id q7mr6064133wif.11.1332429947297;
	Thu, 22 Mar 2012 08:25:47 -0700 (PDT)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl. [84.80.112.235])
	by mx.google.com with ESMTPS id w10sm10067545wiy.3.2012.03.22.08.25.45
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 22 Mar 2012 08:25:46 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-core@lists.openembedded.org
Date: Thu, 22 Mar 2012 16:25:40 +0100
Message-Id: <1332429941-19621-2-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <1332429941-19621-1-git-send-email-koen@dominion.thruhere.net>
References: <1332429941-19621-1-git-send-email-koen@dominion.thruhere.net>
X-Gm-Message-State: ALoCoQnI8Ota+cl3RBlhA5DRgdTTYKOT/+x+PZEh5afSoIFNMmZez+Q+gARrhQvtwT+8o1NaEK+W
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [PATCHv3 2/3] buildhistory: record all builds
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
X-List-Received-Date: Thu, 22 Mar 2012 15:34:42 -0000

When nothing has changed an empty commit prefixed with "No changes" will get generated

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 meta/classes/buildhistory.bbclass |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/meta/classes/buildhistory.bbclass b/meta/classes/buildhistory.bbclass
index 764e1e8..2305b50 100644
--- a/meta/classes/buildhistory.bbclass
+++ b/meta/classes/buildhistory.bbclass
@@ -408,6 +408,8 @@ buildhistory_commit() {
 			if [ "${BUILDHISTORY_PUSH_REPO}" != "" ] ; then
 				git push -q ${BUILDHISTORY_PUSH_REPO}
 			fi
+		else
+			git commit ${BUILDHISTORY_DIR}/ --allow-empty -m "No changes: Build ${BUILDNAME} of ${DISTRO} ${DISTRO_VERSION} for machine ${MACHINE} on $HOSTNAME" --author "${BUILDHISTORY_COMMIT_AUTHOR}" > /dev/null
 		fi) || true
 }
 
-- 
1.7.2.5



