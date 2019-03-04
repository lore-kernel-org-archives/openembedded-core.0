Return-Path: <ross.burton@intel.com>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id 9C6EC7C92C
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Mar 2019 17:31:51 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id w6so6475848wrs.4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 04 Mar 2019 09:31:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=XZX/RYF2gDdnrolerYygfTt05wfEPT/+96Wx1MW0hp4=;
	b=azsYK8HVNd40McNUwltY0c/a22CCr4FDmpwccRVHQ99aCdTiGDUC/F4I+03R0xbG83
	S9FPtjihlZvH/+9zWzJt8h0R2ZKZcqizwmpbD+rPmMWTqXu6cBkgSVrwj4qd9qN4jTxN
	MkEXFf3f/s8/rL0hH7KcFsIlxMNPx7w3d0DJzr5tuwksiPOvME5tmmh+SZSWPPA+f8H1
	wq0RHHPvPFD1TRzv6gwJTL8q1lOX7IHN9/OtxFOISP42hE5QbCqTnRgraRzYq+VbnU/W
	kf6E8u3Ci2CV8FNrU/rl7RnFoC61d06CLTKTuVgcRTDy2we/qZ4+wKzbFCNdjll+mnfJ
	Weow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=XZX/RYF2gDdnrolerYygfTt05wfEPT/+96Wx1MW0hp4=;
	b=GQKkeAjPth+TzmMTY6AlPUVqP3ds9OW7gifaP6eWG2dYgdRfEFSUGwCzewKvcxop3M
	g+NITVenHtoH3AEuZUbL9/iuX0zYCjcclQftbkf4N8HVy0YXG/XpJT00ibcqOCLFJtkM
	Z5FKq1R2gO5wnMRPxt3EQKHSd+SyZObw5v0H+pblsdghfGfmhqq9w/77J2+BAZ7nXPQJ
	XDWOLmwnuWA5niAFc/MIelQjMxfWbnwDJnS3+kFulUWQtAqTOi2fXX+fIkJ/u2VoVNST
	rkuWMHF0t+uZ1zWURLgpsnowIDu6CbUh0pWu5fvqxQMk2VZgF5H7o7vGKLR7aMT66OUO
	+z0w==
X-Gm-Message-State: APjAAAW46dj1v/hoGIvkPmK43PxcvF84ya5+Q9AhEnAllwZasKK1F8gQ
	CtegXGGrfdfhfV8NUZhduYja8RwlpBQ=
X-Google-Smtp-Source: APXvYqyD7fVPqctBCSNeb8tzYIIsnokVfPu/2wmWRDW4NcvLJqYn0AjHhtkzrOMfEz17uAOXMmorVw==
X-Received: by 2002:a5d:464b:: with SMTP id j11mr12974472wrs.307.1551720712144;
	Mon, 04 Mar 2019 09:31:52 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	v67sm10137991wmb.9.2019.03.04.09.31.50
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 04 Mar 2019 09:31:51 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  4 Mar 2019 17:31:41 +0000
Message-Id: <20190304173144.25675-3-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190304173144.25675-1-ross.burton@intel.com>
References: <20190304173144.25675-1-ross.burton@intel.com>
Subject: [PATCH 3/6] packagegroup-core-tools-testapps: remove lrzsz
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
X-List-Received-Date: Mon, 04 Mar 2019 17:31:51 -0000

We can assume that modern boards don't need X/Y/ZMODEM transfer tools for
testing purposes.  The few users that need this tool for testing can add it
themselves.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-core/packagegroups/packagegroup-core-tools-testapps.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/recipes-core/packagegroups/packagegroup-core-tools-testapps.bb b/meta/recipes-core/packagegroups/packagegroup-core-tools-testapps.bb
index 2b7e78911b3..a5fc1528593 100644
--- a/meta/recipes-core/packagegroups/packagegroup-core-tools-testapps.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-core-tools-testapps.bb
@@ -38,7 +38,6 @@ X11TOOLS = "\
 
 RDEPENDS_${PN} = "\
     blktool \
-    lrzsz \
     ${KEXECTOOLS} \
     alsa-utils-amixer \
     alsa-utils-aplay \
-- 
2.11.0


