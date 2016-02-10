Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f43.google.com (mail-wm0-f43.google.com [74.125.82.43])
	by mail.openembedded.org (Postfix) with ESMTP id 7738E606D1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Feb 2016 13:56:57 +0000 (UTC)
Received: by mail-wm0-f43.google.com with SMTP id g62so27813577wme.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Feb 2016 05:56:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=wq7DP6rEP2a9g9/Qm7wYmj7adypNFjIcZvhQIUJfHkk=;
	b=XuZWk/Dvh2b3mkeu1eoAmnE9pzfWmASUqQUtN4un0JkI+WR2uMWtLNNH4ervDgpj53
	OrCd2XAfDEmvJzwJxx2uSvatG7klwNTnnk0UFuLDFeLembjYnLfuODjchzEtufhY6FvU
	TfXFv85m6lWBgZmNjjnlP8fgVVWtZI3h23UhMkCMU2mRZFC3b8VVzRNevNn/L/cMvv59
	oBpdTIsRADRyr6I0NkQeaPOr8TYW7tOmoMWLwQ0iZXFgXtvDDtosG4KGroqiYlY/v2yO
	DyMV1pEhl6JKtWHUNqsujnJp8XWpHusO0JoildLzD0wANmlHDRnqJcAfoDlC5TkpnASg
	4CtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=wq7DP6rEP2a9g9/Qm7wYmj7adypNFjIcZvhQIUJfHkk=;
	b=K1rhFpLVsToTAWjcFsDdCpEelxwrKoPT/NfQvRq0KsRj4VnIzqEzS/tKJUT0jfmVPa
	eJckNy58MRU5grhcWAIUWuiwSSPkzHMBTEjfLoXpm0pvpJfZ050sC19xfnhHATx4J0yT
	sg0ayp/Jp5vUBosjSeZav1dwby1WVjU7MHxDI266uykjjEH4orwo/uVY8lTRHSShJSFC
	j5nMwiMfK2O+/PBreMgzgVSRlQ+L0Iwdb2Sh6rAxS5YGukCo0A4/gQHDllQ6xie11wQ3
	+sBOtRDxdqGHrnzwm1O3xAPKXyTiFON1EBihenh8xP5/amGZd/i7AmnniVFaTErIp9l5
	X7/g==
X-Gm-Message-State: AG10YOQFDXN/VgVrxJAgnpiNyCI8b6VRxPj5TbQVaj7ghzAhTsXpoQg/Tb9qddstril1nqLt
X-Received: by 10.194.78.230 with SMTP id e6mr9451554wjx.179.1455112618400;
	Wed, 10 Feb 2016 05:56:58 -0800 (PST)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id
	ll9sm3095568wjc.29.2016.02.10.05.56.57
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 10 Feb 2016 05:56:57 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 10 Feb 2016 13:56:54 +0000
Message-Id: <1455112614-7112-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.7.0
Subject: [PATCH] piglit: add missing dependency on python-xml
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
X-List-Received-Date: Wed, 10 Feb 2016 13:56:58 -0000

Piglit uses ElementTree so ensure that python-xml is a dependency.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-graphics/piglit/piglit_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/piglit/piglit_git.bb b/meta/recipes-graphics/piglit/piglit_git.bb
index 4858652..82912fd 100644
--- a/meta/recipes-graphics/piglit/piglit_git.bb
+++ b/meta/recipes-graphics/piglit/piglit_git.bb
@@ -35,7 +35,7 @@ do_configure_prepend() {
 }
 
 RDEPENDS_${PN} = "waffle python python-mako python-json python-subprocess \
-	python-argparse python-importlib python-unixadmin \
+	python-argparse python-importlib python-unixadmin python-xml \
 	python-multiprocessing python-textutils python-netserver python-shell \
 	mesa-demos bash \
 	"
-- 
2.7.0


