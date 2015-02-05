Return-Path: <akuster808@gmail.com>
Received: from mail-pd0-f179.google.com (mail-pd0-f179.google.com
	[209.85.192.179])
	by mail.openembedded.org (Postfix) with ESMTP id E871072E0E
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Feb 2015 16:05:24 +0000 (UTC)
Received: by pdbft15 with SMTP id ft15so8554207pdb.11
	for <openembedded-core@lists.openembedded.org>;
	Thu, 05 Feb 2015 08:05:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references:mime-version:content-type
	:content-transfer-encoding;
	bh=tMLXkGzACeC9HdZgdt0XprQNeedejxaXtg7fCNkoJRk=;
	b=Y6WQ5FvbpUB1XL2YrAAjxZ580GpV1FLQIHo6/njFrNAoFBjCnEBia3p37wqcL/8Djh
	meklY+jq+p7DDuMbu0eUFeIgRcfxsiCgRtMQihTI6L1BGsqwaUvgZFdmrzUO7j7vzLK6
	yBItgXtolXmWpp0iBZXVjoE5w0kDdQEJecinb7rRDzuwr9aeWRWNX5FVp9nmHjXbwhfQ
	QK78bzGcLZ4l0MmZ+R7bi9Pgr7KfZzc1H3bmf2m0ByAjaRa0Xag2PYZqjWqxg7Ycy2Kn
	Emrpr/gPgyaPP4/P5wAEqcVrUs5eB318k50azB7yLQT8hG5Ji1ZdDpr0y6yDu3PFnIQJ
	15uw==
X-Received: by 10.66.66.166 with SMTP id g6mr6039479pat.88.1423152326538;
	Thu, 05 Feb 2015 08:05:26 -0800 (PST)
Received: from bigisland.hsd1.ca.comcast.net
	(c-76-20-92-207.hsd1.ca.comcast.net. [76.20.92.207])
	by mx.google.com with ESMTPSA id uq7sm5468848pbc.48.2015.02.05.08.05.23
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 05 Feb 2015 08:05:24 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  5 Feb 2015 08:03:44 -0800
Message-Id: <5692daa4271bd6fd1224ba3fb5b77506b4efd294.1423150740.git.akuster808@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <73eeb20b36b0a6b5c13a5af50d76ed70c8fccc65.1423150738.git.akuster808@gmail.com>
References: <73eeb20b36b0a6b5c13a5af50d76ed70c8fccc65.1423150738.git.akuster808@gmail.com>
In-Reply-To: <cover.1423150737.git.akuster808@gmail.com>
References: <cover.1423150737.git.akuster808@gmail.com>
MIME-Version: 1.0
Cc: =?UTF-8?q?Vincent=20G=C3=A9nieux?= <vincent2014@startigen.fr>
Subject: [PATCH 36/61] fix '[[: not found' error message using dash
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
X-List-Received-Date: Thu, 05 Feb 2015 16:05:25 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Vincent Génieux <vincent2014@startigen.fr>

Remove bash specific syntax '[[ test ]]' replaced with '[ test ]'.

Fixes [YOCTO #7112]

(From OE-Core rev: f2ff849d5936d3dc5e24301e0620da265df50fea)

Signed-off-by: Vincent Génieux <vincent2014@startigen.fr>
Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/classes/kernel.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index 70ed95b..2a6ec34 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -403,7 +403,7 @@ do_strip() {
 			  gawk '{print $1}'`
 
 		for str in ${KERNEL_IMAGE_STRIP_EXTRA_SECTIONS}; do {
-			if [[ "$headers" != *"$str"* ]]; then
+			if [ "$headers" != *"$str"* ]; then
 				bbwarn "Section not found: $str";
 			fi
 
-- 
1.9.1


