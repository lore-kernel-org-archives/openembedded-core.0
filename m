Return-Path: <george.mccollister@gmail.com>
Received: from mail-it0-f66.google.com (mail-it0-f66.google.com
	[209.85.214.66])
	by mail.openembedded.org (Postfix) with ESMTP id D6A9273201
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Feb 2017 22:07:37 +0000 (UTC)
Received: by mail-it0-f66.google.com with SMTP id 203so782326ith.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Feb 2017 14:07:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=awbudWXdU98X2KOCGWQwwoER2m3Cqq+ezdyjW+enP+s=;
	b=hbsDv3MWlNMTTJmBGm0hXYq9TGZMb+JVriHRV73lol1dPJyr4p2bCNZGrmX8EcAc2q
	T8tggAskmbt9sQhKlCzXiKAai3TkzoVMwEC+le+kkEzXDAIhNXcv2pgsFSfeo8wERZys
	tVyhgV4C5F4Bw7AMXXc35Rj2JC36UcaMqdx7p6uVuks61sZ+FGD1HdvAeDKcbk11MkC4
	8ahmQHDyeSFdpTMev6JNl4zEdPX2yWT1KVUf4L6aoylKL5FCTmp1QMOSu2f73dgvfwcf
	Rx9gLREkaJcbWTjFGFX1mPPKxAsninADv9FynYnTRwJEoknNLVtBvVcrEuwLlxMnRqAD
	nP0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=awbudWXdU98X2KOCGWQwwoER2m3Cqq+ezdyjW+enP+s=;
	b=aIK+c9PWCAmTW1sLJo0ICm0pgfWq3Ri9k98net/f5zIeVc62tA0cVFO/BFuSyRhRd3
	NVpsV7/xDUrBzjURXXhBGGEDlsEJ8eJ8zpjLa+kpxY7X5qgzxldCO6LF3Qu/HxMCMcNn
	6WFSEyU0cHzlbFhRbN4gNOoC3GQc+i3H+U5ZqUShUi/9qgr8zHlsc9bxqSu5EWwN3+sh
	gQ9spzlZ2XUnUVBsQyOqcS3un1Bk5TdkIx5Y2NLxEPypYessn/n10W5SckF5eLkhXQ7y
	h4vKgyLCTxtc8CblKWlb0WnobrdG3ZqDvXApo3HdLuPMhMq1P6kj4SM1POuPqIM5ZiIE
	5nXg==
X-Gm-Message-State: AMke39lJXNk4bD7UpwuaYl0x0pAPhaaYbbV3t5ABYL6S1LpDs/d2an4R6/mt+BQ8FFzeNQ==
X-Received: by 10.36.139.133 with SMTP id g127mr573906ite.4.1487023657826;
	Mon, 13 Feb 2017 14:07:37 -0800 (PST)
Received: from localhost.localdomain (216-21-169-52.slc.googlefiber.net.
	[216.21.169.52])
	by smtp.gmail.com with ESMTPSA id m6sm4457659ioa.57.2017.02.13.14.07.36
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 13 Feb 2017 14:07:37 -0800 (PST)
From: George McCollister <george.mccollister@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 13 Feb 2017 16:06:56 -0600
Message-Id: <e1c58b1a96784ec61c2f3b0096e4a435e0269dbf.1487022302.git.george.mccollister@gmail.com>
X-Mailer: git-send-email 2.8.0
In-Reply-To: <cover.1487022302.git.george.mccollister@gmail.com>
References: <cover.1487022302.git.george.mccollister@gmail.com>
Subject: [morty][PATCH v2 3/3] python-3-manifest: fix adding imp to importlib
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
X-List-Received-Date: Mon, 13 Feb 2017 22:07:38 -0000

From: Anders Darander <anders@chargestorm.se>

Commit: 512334f102a33833d39af53467894315f0715d07
	"python-3.5-manifest: Add imp to importlib"

added imp to importlib in the generated manifest, but not in the generator script.

Signed-off-by: Anders Darander <anders@chargestorm.se>
Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 scripts/contrib/python/generate-manifest-3.5.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/contrib/python/generate-manifest-3.5.py b/scripts/contrib/python/generate-manifest-3.5.py
index 2906cc6..71a71f7 100755
--- a/scripts/contrib/python/generate-manifest-3.5.py
+++ b/scripts/contrib/python/generate-manifest-3.5.py
@@ -269,7 +269,7 @@ if __name__ == "__main__":
     "formatter.* htmlentitydefs.* htmllib.* markupbase.* sgmllib.* HTMLParser.* " )
 
     m.addPackage( "${PN}-importlib", "Python import implementation library", "${PN}-core ${PN}-lang",
-    "importlib" )
+    "importlib imp.*" )
 
     m.addPackage( "${PN}-gdbm", "Python GNU database support", "${PN}-core",
     "lib-dynload/_gdbm.*.so" )
-- 
2.8.0


