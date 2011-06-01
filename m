Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1QRs3q-0008AW-8R
	for openembedded-core@lists.openembedded.org;
	Wed, 01 Jun 2011 22:30:38 +0200
Received: by fxm19 with SMTP id 19so370959fxm.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 01 Jun 2011 13:27:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer;
	bh=Av2J82C54d6QV+9sdnTbRrKMQ4KbQuzoKG6Z3CzIk8g=;
	b=KU5g/fK4mru9cBzkE+t5wpZN77wWjB2Ao5ZFomYBdo/hsGP6pamtx1TbCQB+Ob7RGv
	AR4uvnUWo2IGiXgJz6xS7nGwU63CfDcvFAzQdCjZA4ysWgCAMozXLsNxdnUDnT2xw0ds
	pC51MqAW9Ttpyh8DnCKiGZj1v1nEUDIqa4sWc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=eywoFfDYQx+w9XLoDrlYjpt2NQ4B3q0Jf5ftEqjBW3zEMyjK5+wvFgt4Ri4wTsDbCF
	ZGlsRrIFLI37xrje83Jd+irI0Z+Q75K+Fjxal3CIMEqx5kfyZzOD8sk/c5ulTXXKNKJQ
	LC1xt32GmQRxcwhvDmwKin8h87okgZuP8QxMw=
Received: by 10.223.36.89 with SMTP id s25mr2937388fad.9.1306960047391;
	Wed, 01 Jun 2011 13:27:27 -0700 (PDT)
Received: from localhost ([94.230.152.115])
	by mx.google.com with ESMTPS id a28sm301959fak.1.2011.06.01.13.27.26
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 01 Jun 2011 13:27:26 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  1 Jun 2011 22:27:10 +0200
Message-Id: <1306960030-27190-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.5.3
Subject: [PATCH] siteinfo: replace all-linux with allarch-linux to match 5d7d4e1ed9bedf2b6510796d76ea8f94739b9de2
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
X-List-Received-Date: Wed, 01 Jun 2011 20:30:38 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/classes/siteinfo.bbclass |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/classes/siteinfo.bbclass b/meta/classes/siteinfo.bbclass
index 6c272a7..fb8bac3 100644
--- a/meta/classes/siteinfo.bbclass
+++ b/meta/classes/siteinfo.bbclass
@@ -19,7 +19,7 @@ def get_siteinfo_list(d):
        target = bb.data.getVar('HOST_ARCH', d, 1) + "-" + bb.data.getVar('HOST_OS', d, 1)
 
        targetinfo = {\
-               "all-linux":               "",\
+               "allarch-linux":           "",\
                "armeb-linux":             "endian-big bit-32 common-glibc arm-common",\
                "armeb-linux-gnueabi":     "endian-big bit-32 common-glibc arm-common armeb-linux",\
                "armeb-linux-uclibc":      "endian-big bit-32 common-uclibc arm-common",\
-- 
1.7.5.3



