Return-Path: <armccurdy@gmail.com>
Received: from mail-pl0-f68.google.com (mail-pl0-f68.google.com
	[209.85.160.68])
	by mail.openembedded.org (Postfix) with ESMTP id 33C35788D5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Jan 2018 05:17:28 +0000 (UTC)
Received: by mail-pl0-f68.google.com with SMTP id b12so6653153plm.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 09 Jan 2018 21:17:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=WZjxAJNbAyqi1l4u6U2ZF2+QFm+QfliOIW712V5Mhd8=;
	b=u3NIELlfDom3M+uKnC7rPCCkeyMtBqPYk6HWJL2I6auchRGm8Vxdrf1sqbMT+y15QY
	GSxHAOUV1mIn3MdIMi+0l1XoO5HuFwYJmtJD/mFXHA3Ol7w8EoPKzSYwTPj5YtZMhGpR
	KqCvyD0KMLme82A4DAJiNeYz5kliLdftTpD83g5pVlv1DaXemW1Z7/EdamKJakcvqs+4
	JlaL/FvamhM5UfmV0aMNWhmhYWoYs/vlVwYxfSbJNULgl55irzNUqIF2W3TlLzbqCBBN
	LFGDzElcjXCoIfRiDNAEd07eZ/f1fTkNVr70KoGq0hJS+Da1uShUjgXWMa2/1PRVuG18
	DcRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=WZjxAJNbAyqi1l4u6U2ZF2+QFm+QfliOIW712V5Mhd8=;
	b=qFg9dBJLB14gJSUlZ/MH/eP+Mxpulvq61FuxhHe0O6iJKv44zALNDgc7NkkzSbsSoL
	jxtCoYB6NobpVWHZIIrlnln7S51YxTkQW6AK2etFdXWW8hwUYheJt+HdOgdJwbIW9cOd
	cXg766oho1SlI+iWszXUPoUEZcewIMJ8NfspJudxjhS2D5oPzZGw9f3SyHQw3Ntgkcen
	KW30zanK0hMwwUuhQ9mEPFZzE5sB8TPkPN4MaZDjDwAoAzF/lQcVSJvsWognOrJoFcmZ
	vfb+3IzSNHvAEPBjNZbtub82IlOBdsRNMGrGUAHu+m49gQGrKejYnHIjj6rvIbsMqJJ2
	rtzA==
X-Gm-Message-State: AKGB3mKKyZp0zR2HJLMdUNhuyDUqRv6WDUyFcjkXZK25zOmIUG9PKSS3
	fVH12HcrbQravOBGrYzL75sdcQ==
X-Google-Smtp-Source: ACJfBovHpOIKNrJcCtbvvC8+L4Zc2OlC/M9qxmyr8T106U5PJy+UllKhhothWjwCDRcej08/Z4651w==
X-Received: by 10.84.129.12 with SMTP id 12mr17772094plb.415.1515561449806;
	Tue, 09 Jan 2018 21:17:29 -0800 (PST)
Received: from e6520.guest-wifi.scl.liberty.com ([4.16.80.121])
	by smtp.gmail.com with ESMTPSA id
	t66sm39592302pfa.153.2018.01.09.21.17.28
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 09 Jan 2018 21:17:28 -0800 (PST)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  9 Jan 2018 21:17:24 -0800
Message-Id: <1515561444-14153-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH] base.bbclass: drop legacy armv7a-vfp-neon TUNE_PKGARCH renaming
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
X-List-Received-Date: Wed, 10 Jan 2018 05:17:29 -0000

ARM specific TUNE_PKGARCH renaming was adding in 2011 handle the
transition from armv7a -> armv7a-vfp-neon:

  http://git.openembedded.org/openembedded-core/commit/?id=08c0b7060009113e8dffdef51ff6b9b4b7f28894

Active package feeds should now have long since updated to the new
naming. For example, Angstrom stopped using on the legacy naming in
2012:

  https://github.com/Angstrom-distribution/meta-angstrom/commit/2e33fb5bd08edda6457dd211f4ff4ec4aad9d85d

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/classes/base.bbclass | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
index 1a32720..6fe6114 100644
--- a/meta/classes/base.bbclass
+++ b/meta/classes/base.bbclass
@@ -170,12 +170,6 @@ python base_do_unpack() {
         bb.fatal(str(e))
 }
 
-def pkgarch_mapping(d):
-    # Compatibility mappings of TUNE_PKGARCH (opt in)
-    if d.getVar("PKGARCHCOMPAT_ARMV7A"):
-        if d.getVar("TUNE_PKGARCH") == "armv7a-vfp-neon":
-            d.setVar("TUNE_PKGARCH", "armv7a")
-
 def get_layers_branch_rev(d):
     layers = (d.getVar("BBLAYERS") or "").split()
     layers_branch_rev = ["%-20s = \"%s:%s\"" % (os.path.basename(i), \
@@ -228,7 +222,6 @@ python base_eventhandler() {
         if not d.getVar("NATIVELSBSTRING", False):
             d.setVar("NATIVELSBSTRING", lsb_distro_identifier(d))
         d.setVar('BB_VERSION', bb.__version__)
-        pkgarch_mapping(d)
         oe.utils.features_backfill("DISTRO_FEATURES", d)
         oe.utils.features_backfill("MACHINE_FEATURES", d)
         # Works with the line in layer.conf which changes PATH to point here
-- 
1.9.1


