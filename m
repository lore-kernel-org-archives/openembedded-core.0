Return-Path: <armccurdy@gmail.com>
Received: from mail-oi0-f50.google.com (mail-oi0-f50.google.com
	[209.85.218.50])
	by mail.openembedded.org (Postfix) with ESMTP id 5928E77214
	for <openembedded-core@lists.openembedded.org>;
	Sat, 20 Feb 2016 02:53:27 +0000 (UTC)
Received: by mail-oi0-f50.google.com with SMTP id m82so24613780oif.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Feb 2016 18:53:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=wk2Wf6RAPp+GRJBDIJLQYQN9MCqUKBlylxt62yKkWTw=;
	b=hrEd1wz9KEKm78rH5QQHuAo0SUTg70e6xbulzM216kLNWetGnYiNwgLL1b43RBOY9L
	0/6fc8ibE7HR7Jxb0/e+0KcapF+Y4C2WSjObTxOQcztPFUH33SrlrXF9if96fnG/ySab
	I3zHUaYAo+t5o5+BRxwTjAqhSCtIipkV+f0n33UAWhMgfE/Gli6iLpQYDE5u9/zd11nk
	ziQyATu2Jt+dGH3adH7q6DdMkn/1G5/U1iKV1VelCVEYCGPNSxiFDa2XguMgluvBJ7GZ
	Az326n5oj1t5yjkde2/7ckkVkwibxgZSAb0hacSUnI3CspwkGBiaS7eHXhud6lDUJYKj
	M9fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=wk2Wf6RAPp+GRJBDIJLQYQN9MCqUKBlylxt62yKkWTw=;
	b=ERHMgG9ilkArtkpvY6K23kLDN8shvqzgWnxH80PW3plqLs7jNJz75YosPciEJ9eu3H
	GLlhrg4cvD0oPqij8XAJPQYcZvauePk7Pm4sjQpOaPIkhaApriBkFITD+rBtk41dl57f
	xU/gISraeC/59q9VqF8S3zNW7P2e0dFCsgyltRE+wz/fwLpppDnwpt2BoNQpebbXi+ER
	mxJCw9+da+mM/+B9hzjchOUqRdNp98wet+ECB67zDOEq8x8NbqajQuDC5teqiuiOP7zZ
	RvOOVjMAsJtKUXBAcGYWkumbc6cJ9mCX9PB7H9z+VJ7jujt6cx0FXn6POaBtXHLkPXDX
	RjeA==
X-Gm-Message-State: AG10YOSqiLbN2+reRaMVA/54yzs2IUn10YBFiwV5ruX3+3raRGxthw2WpoMOmuVvI5zUNg==
X-Received: by 10.202.84.82 with SMTP id i79mr13779708oib.130.1455936807885;
	Fri, 19 Feb 2016 18:53:27 -0800 (PST)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id
	wh4sm9192764obc.10.2016.02.19.18.53.26
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 19 Feb 2016 18:53:26 -0800 (PST)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 19 Feb 2016 18:53:12 -0800
Message-Id: <1455936797-13430-2-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1455936797-13430-1-git-send-email-armccurdy@gmail.com>
References: <1455936797-13430-1-git-send-email-armccurdy@gmail.com>
Subject: [PATCH 1/6] gstreamer1.0_git: update 1.7.1 -> 1.7.2
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
X-List-Received-Date: Sat, 20 Feb 2016 02:53:27 -0000

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/recipes-multimedia/gstreamer/gstreamer1.0_git.bb | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0_git.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0_git.bb
index cb55c9a..7715bb2 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0_git.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0_git.bb
@@ -10,15 +10,21 @@ SRC_URI = " \
     git://anongit.freedesktop.org/gstreamer/common;destsuffix=git/common;name=common \
 "
 
-PV = "1.7.1+git${SRCPV}"
+PV = "1.7.2+git${SRCPV}"
+
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>(\d+(\.\d+)+))"
 
-SRCREV_base = "2a188848eb2af3c3b357978ff7786a78aad9dd55"
-SRCREV_common = "86e46630ed8af8d94796859db550a9c3d89c9f65"
+SRCREV_base = "9e33bfa2c7a5f43da2c49b0a8235fd43cba9feaf"
+SRCREV_common = "b64f03f6090245624608beb5d2fff335e23a01c0"
 SRCREV_FORMAT = "base"
 
 S = "${WORKDIR}/git"
 
+# The option to configure tracer hooks was added prior to the 1.7.2 release
+# https://cgit.freedesktop.org/gstreamer/gstreamer/commit/?id=e5ca47236e4df4683707f0bcf99181a937d358d5
+PACKAGECONFIG[gst-tracer-hooks] = "--enable-gst-tracer-hooks,--disable-gst-tracer-hooks,"
+PACKAGECONFIG[trace-historic] = "--enable-trace,--disable-trace,"
+
 do_configure_prepend() {
 	${S}/autogen.sh --noconfigure
 }
-- 
1.9.1


