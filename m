Return-Path: <ross.burton@intel.com>
Received: from mail-wi0-f181.google.com (mail-wi0-f181.google.com
	[209.85.212.181])
	by mail.openembedded.org (Postfix) with ESMTP id CB4D36D2DB
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Nov 2013 12:16:32 +0000 (UTC)
Received: by mail-wi0-f181.google.com with SMTP id m19so150118wiv.8
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 Nov 2013 04:16:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=t7gDTQjNjnS2CVP7+x5mgGhn+qLcYuvzpfDpc8PmOVY=;
	b=KYXaQEyz1L/+oJqNHQQHpl7kFEQ61AhGvTbEsyCbra2cN7/tADoQZRXbzV5RnHq/9q
	tbIQPupUhIL2mYKcPOhsrImKFETLdWliCUl/sPDakt1+TQWqQrfsDFfe7Nbp0qXIjwVI
	qtdfydSfxJITm2J4mNW/HHo6jg2PYkOLzG12lWs2TQ0v3baI0u5SakJVHLmXYqmGzRdV
	CkztGLndNRgtqrcOhZ2pgbbdlnwvUqRlW4jrnNNFEHffmWd8tkW7u5KFB3i28RGCQQ6X
	8FcZPzEAsLfG7qVzeTv+11064/bXeISYa0610ZS/0GKwUpNNZe9T8QYKwo/uqsXVAuLC
	JvuA==
X-Gm-Message-State: ALoCoQkSXiqxcZgFzlbSQuJW81EqfzPkpdHfS2e8vyhbm6cy6weaAkvHJA+FhrydVOLlRmjFKhD4
X-Received: by 10.180.108.131 with SMTP id hk3mr2188274wib.10.1383912993970;
	Fri, 08 Nov 2013 04:16:33 -0800 (PST)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id b7sm5001807wiz.8.2013.11.08.04.16.32
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 08 Nov 2013 04:16:33 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  8 Nov 2013 12:16:30 +0000
Message-Id: <1383912990-12718-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH] syslinux: add APPENDS to dependency list
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
X-List-Received-Date: Fri, 08 Nov 2013 12:16:33 -0000

Changing APPENDS wasn't causing syslinux to re-run, so add a manual dependency.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/classes/syslinux.bbclass |    1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes/syslinux.bbclass b/meta/classes/syslinux.bbclass
index 2a5b766..62d4b7a 100644
--- a/meta/classes/syslinux.bbclass
+++ b/meta/classes/syslinux.bbclass
@@ -179,3 +179,4 @@ python build_syslinux_cfg () {
 
     cfgfile.close()
 }
+build_syslinux_cfg[vardeps] += "APPEND"
-- 
1.7.10.4


