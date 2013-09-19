Return-Path: <ross.burton@intel.com>
Received: from mail-wi0-f171.google.com (mail-wi0-f171.google.com
	[209.85.212.171])
	by mail.openembedded.org (Postfix) with ESMTP id 2DC3F6C877
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Sep 2013 10:08:51 +0000 (UTC)
Received: by mail-wi0-f171.google.com with SMTP id hm2so7693614wib.4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Sep 2013 03:08:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=PfXbkoSKNfaEpnBG8jdiHNZzF9slPq/7UbuKebvFShA=;
	b=Kor7th7PadmSg5ebFJtFDWExC0RvNY9VusBIaN2T5Y3HUl3lE8Ec3Nu8A406YFrK4x
	HvRH7vl787XKwpdCH+Yu260WOMBUhRnIGEAKVnJMOekDyExCMn9iHp2+/LUS3LcReJqT
	/3YUaEIiWaukcCAGXb4LU9uzRdcomj7QWLrk5lQw0w3mfQFk4jtj3LBS+Rv3EU7exJ8z
	RtRTTUzuJCaMDiLmWaKGyzGMCF7UzDbGb6vTqlfg6Mkb9KxqpsGdBk9cZYe2U083zh+Q
	DcwJqa+Esb+0+j5Ch8on62FIhWhz/IS5sjMaMpoOSuKxosWMlID6sack9wQjLFnka+r3
	rDqg==
X-Gm-Message-State: ALoCoQnKYTA0DWZ9uQSTFk+GVOQD9EWT/+6EjhR1f402z/Rt0uIalddfCpnd7tjECiGe71cl+c7a
X-Received: by 10.180.109.132 with SMTP id hs4mr10905182wib.46.1379585332687; 
	Thu, 19 Sep 2013 03:08:52 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id mw9sm16316350wib.0.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 19 Sep 2013 03:08:52 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 19 Sep 2013 11:08:48 +0100
Message-Id: <1379585328-27537-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH] wipe-sysroot: delete pkgdata stamps
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
X-List-Received-Date: Thu, 19 Sep 2013 10:08:51 -0000

The pkgdata stamps now need to be wiped away if the sysroot is destroyed.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 scripts/wipe-sysroot |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/scripts/wipe-sysroot b/scripts/wipe-sysroot
index 1c01166..7ca26fe 100755
--- a/scripts/wipe-sysroot
+++ b/scripts/wipe-sysroot
@@ -39,6 +39,8 @@ rm -rf $STAGING_DIR
 # The stamps that said the sysroot was populated
 rm -rf $STAMPS_DIR/*/*/*.do_populate_sysroot.*
 rm -rf $STAMPS_DIR/*/*/*.do_populate_sysroot_setscene.*
+rm -rf $STAMPS_DIR/*/*/*.do_packagedata.*
+rm -rf $STAMPS_DIR/*/*/*.do_packagedata_setscene.*
 
 # The sstate manifests
 rm -rf $SSTATE_MANIFESTS/manifest-*.populate-sysroot
-- 
1.7.10.4


