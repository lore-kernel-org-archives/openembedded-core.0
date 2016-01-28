Return-Path: <armccurdy@gmail.com>
Received: from mail-oi0-f65.google.com (mail-oi0-f65.google.com
	[209.85.218.65])
	by mail.openembedded.org (Postfix) with ESMTP id 8498577156
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Jan 2016 02:11:20 +0000 (UTC)
Received: by mail-oi0-f65.google.com with SMTP id r14so54152oie.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Jan 2016 18:11:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=m64icBZjB8kOIKctVa31CPlIei4HZX9btxuQLrPkAh4=;
	b=bqmlp1lzRdkj5QvGpm0iIkyyB3bGC/QKXfzyS0nikzQWNxnApm/NkHC53Yt+zwxNjx
	he92Wh8+dwr3KXXliu0R4L1oBxLWGHmF3+ze39c01gzZwdrScq+qrymTDBlF8YZHlQLH
	gJM3HTcittjL4OBZ8ZzHT3FuicQ9FhIlyYSX4SbWkf13hQ07rxD7VCQ+bkpd+xUNj7vn
	WtulfllKya0liSk5FlVzF2rDfvtJSJ9qx6K/zNiRBtOapUKJyEv+ZL1HLxdQJqWEcv3F
	Jg6M/uAhk6JUZy5hp6N6TwChS7Lpa2bCqbaxbke1t+lrpw/amtIO63jAaM6Gklk4XUZQ
	fC9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=m64icBZjB8kOIKctVa31CPlIei4HZX9btxuQLrPkAh4=;
	b=CKtRECJbg7MnLyX5Ltpb4tqI4lMwnRJaJFUp35m6231WFFVga67BMlHXBFHf2RhbWl
	m9O60tkXF45FO8sg1dJMaXoXwFpnBE9n2CRE5ok8Lx/SqioCIt8Q2cwqGVCRuHXAUXg4
	iv8zu58E9IQ9PsKHHSjCIbqro3TVIjOHImmfjbmR90lKHcP/yRKO7YHZqMZQUDXLSJtn
	ZxYWEWscbFI+Ym4f7D6H999r3ZP66pd9THUdqV3LbeGoJEq/slJ6O5fW3SyXxV8ePYI5
	ydGRqXUfmwr9ipmFTGLNzz0dpN2tfcgO62RnxAsn8tDMpk9J+6bHpBL+R5U3Vzviu0N5
	L8+g==
X-Gm-Message-State: AG10YOQhSL4cYiEI1nxz3gVoDpBdgHt9bRCYy2fMM7X6oo4OD98UHP+wceBhvpl5dq+zDg==
X-Received: by 10.202.0.204 with SMTP id 195mr287775oia.131.1453947080962;
	Wed, 27 Jan 2016 18:11:20 -0800 (PST)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id q4sm4448874oew.6.2016.01.27.18.11.19
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 27 Jan 2016 18:11:19 -0800 (PST)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 27 Jan 2016 18:11:09 -0800
Message-Id: <1453947071-13364-2-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1453947071-13364-1-git-send-email-armccurdy@gmail.com>
References: <1453947071-13364-1-git-send-email-armccurdy@gmail.com>
Subject: [PATCH 1/3] bitbake.conf: stop exporting PATCH_GET = "0"
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
X-List-Received-Date: Thu, 28 Jan 2016 02:11:20 -0000

Exporting PATCH_GET = "0" has been redundant since patch 2.6.0 was
released in 2009:

  http://git.savannah.gnu.org/cgit/patch.git/commit/?id=b008dece18e6b94b8a13ea44a253855bf407ed01

Host distros which shipped with patch 2.5.x (e.g. Centos 5) are no
longer supported, so this export can be retired from bitbake.conf.

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/conf/bitbake.conf | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index e80ee18..1a2f420 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -629,16 +629,6 @@ FAKEROOTDIRS = "${PSEUDO_LOCALSTATEDIR}"
 PREFERRED_PROVIDER_virtual/fakeroot-native ?= "pseudo-native"
 
 ##################################################################
-# Miscellaneous utilities.
-##################################################################
-
-# GNU patch tries to be intellgent about checking out read-only files from
-# a RCS, which freaks out those special folks with active Perforce clients
-# the following makes patch ignore RCS:
-
-export PATCH_GET="0"
-
-##################################################################
 # Not sure about the rest of this yet.
 ##################################################################
 
-- 
1.9.1


