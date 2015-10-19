Return-Path: <ross.burton@intel.com>
Received: from mail-wi0-f180.google.com (mail-wi0-f180.google.com
	[209.85.212.180])
	by mail.openembedded.org (Postfix) with ESMTP id A29627702A
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Oct 2015 22:03:19 +0000 (UTC)
Received: by wicll6 with SMTP id ll6so2133638wic.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Oct 2015 15:03:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=5mMaEQS/eky8PlCiC9/dUX+mirZEFP2SXJ1zYE42baU=;
	b=VlpLtHeMTlwQ8go7qJ5TEg13IXTUPSFr1NYx3TjzvI3NlzzytPFJxLJmPDv4Uvdzms
	6EDQqiZJ5OoTGmcOJyiw++7fyadKdkiicYgeO0y/1xFzHrCB49CIl3D8Fv/x3Sg010Fj
	JdE29NvDE/aXhA/XDBEmoDeR3WggrssoPkpgTqnba1NAyAevamjp7wfwmvIDUyNzyIJg
	WOYR52FGLywwoUFgxqBEGB4ZMAL+0Wmz6Quy8itOjQP4I9xAa+XEjyXvuRkIbsSc5lGl
	lrknPsJlW7ZhmlMD6XDGxRQPfAgmbhB2zYUKGZljNrRVYyql1IvnIV5lP/2K8VGUgmWz
	dm/Q==
X-Gm-Message-State: ALoCoQlyd+IzEbomI4BZhE0RZSrxh5MsyIxjM9VHieAT9fBHXZrwQ70WkmmE616BzAjKSWHuaxKz
X-Received: by 10.194.115.101 with SMTP id jn5mr25521776wjb.134.1445292199428; 
	Mon, 19 Oct 2015 15:03:19 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	jd7sm42607072wjb.19.2015.10.19.15.03.18
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 19 Oct 2015 15:03:18 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 19 Oct 2015 22:55:40 +0100
Message-Id: <1445291743-6618-2-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1445291743-6618-1-git-send-email-ross.burton@intel.com>
References: <1445291743-6618-1-git-send-email-ross.burton@intel.com>
Subject: [PATCH][V2 2/5] sanity: check that the host has file installed
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
X-List-Received-Date: Mon, 19 Oct 2015 22:03:20 -0000

Now that file-native is ASSUME_PROVIDED, check that it's actually present.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/classes/sanity.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
index d0b5cd0..ae86d26 100644
--- a/meta/classes/sanity.bbclass
+++ b/meta/classes/sanity.bbclass
@@ -3,7 +3,7 @@
 #
 
 SANITY_REQUIRED_UTILITIES ?= "patch diffstat makeinfo git bzip2 tar \
-    gzip gawk chrpath wget cpio perl"
+    gzip gawk chrpath wget cpio perl file"
 
 def bblayers_conf_file(d):
     return os.path.join(d.getVar('TOPDIR', True), 'conf/bblayers.conf')
-- 
2.1.4


