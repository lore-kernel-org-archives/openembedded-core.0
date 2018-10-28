Return-Path: <brendank310@gmail.com>
Received: from mail-qt1-f193.google.com (mail-qt1-f193.google.com
	[209.85.160.193])
	by mail.openembedded.org (Postfix) with ESMTP id 841ED745D4
	for <openembedded-core@lists.openembedded.org>;
	Sun, 28 Oct 2018 13:40:13 +0000 (UTC)
Received: by mail-qt1-f193.google.com with SMTP id v1-v6so2132908qtq.5
	for <openembedded-core@lists.openembedded.org>;
	Sun, 28 Oct 2018 06:40:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=TdaCRT3ZZvfcBE2huKoPi4c7C4p17fzq+ZMJtYxIGlA=;
	b=shjOVKSUUmCjUF4iPR3760WP76TlMsEHGGPqOt4zCqwjLMho56WBKZEpZ1CmQf3exR
	kUb0n6pu/JMGia8PpStOnt8JyRGz2HKyUloP7JrPOaPudsGNCYjUIPxUjaOqRwdA4oZ1
	VnJAdsqpIeVJPhGhIhkXjkCW/5ameuEI6zY6Z1A20qIeSbsEa04JxAwR/WtsNzpuea2h
	Klv1puBm3wkuxxnAx50WuWoGS4pWkNiN8ZHHkfVuYa4fFb3uUY55oi1qHf6xK8F2Vld1
	kzvBgNlNOy1NQFqx/0tYyVB8A836gAE5qzjWiULwQNO+PnY/BnEQJBHcbRysjVSuhQbK
	lqow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=TdaCRT3ZZvfcBE2huKoPi4c7C4p17fzq+ZMJtYxIGlA=;
	b=P+FLVGuvl9QPpQuGxsNSkbmi7KCXhby76fVy94494fZNUDwfg8V7it5Q8JUId+MOLX
	Qo0zIV/CZ6g+o7IXADqpTjqw1dKylOVcdcbqaNUDx4TRu0UtBuhmRJWsqwSCG4nvvtPx
	6d1HnJ5DaN+8lP7k5jCzyHLZbZNnfmQ3Uwoi6WRKiX8D+IgJTAlAE0vSiXSZLzDCPD9u
	/ZBy5Px3f2T4nqq6tPl8CXTvL1/WK9RgNCQPUtT3i6eYitH2+Jy9mqt3MYtnVTyyJoSe
	paZ4I/cWwdvRYzMa3/18MHLNBbxzjjRKZ1f1icdA4W6HYWuxD04pRU0oZ3omjXUalXat
	a9Mg==
X-Gm-Message-State: AGRZ1gJYe9ZNTaUWp21c+YMjYbDZ6e17eQc+Hs871++mM3xPi3h8KZpU
	0YuzC4DUixGLwio2zFTMnWl+X/3Llg8=
X-Google-Smtp-Source: AJdET5ep8l4pKWJz2hsLAemxq7F6yFpzofunBJCpk4r5xLrQKYZBepQqI/oIkc3zec86P+18fCcM0Q==
X-Received: by 2002:a0c:985d:: with SMTP id e29mr1048589qvd.16.1540734013971; 
	Sun, 28 Oct 2018 06:40:13 -0700 (PDT)
Received: from localhost.localdomain (209-217-208-226.northland.net.
	[209.217.208.226]) by smtp.gmail.com with ESMTPSA id
	b11-v6sm12716173qta.88.2018.10.28.06.40.12
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 28 Oct 2018 06:40:13 -0700 (PDT)
From: brendank310 <brendank310@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 28 Oct 2018 09:40:07 -0400
Message-Id: <20181028134007.30976-1-brendank310@gmail.com>
X-Mailer: git-send-email 2.17.1
Cc: Brendan Kerrigan <kerriganb@ainfosec.com>
Subject: [PATCH] go: allow recipes to override the build mode for golang
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
X-List-Received-Date: Sun, 28 Oct 2018 13:40:13 -0000

From: Brendan Kerrigan <kerriganb@ainfosec.com>

Signed-off-by: Brendan Kerrigan <kerriganb@ainfosec.com>
---
 meta/classes/go.bbclass | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/classes/go.bbclass b/meta/classes/go.bbclass
index 167d02e3fa..6cf93c14aa 100644
--- a/meta/classes/go.bbclass
+++ b/meta/classes/go.bbclass
@@ -28,6 +28,7 @@ export GOPATH_OMIT_IN_ACTIONID ?= "1"
 export GOPTESTBUILDFLAGS ?= "${GOBUILDFLAGS} -c"
 export GOPTESTFLAGS ?= ""
 GOBUILDFLAGS_prepend_task-compile = "${GO_PARALLEL_BUILD} "
+GOBUILDMODE ?= "pie"
 
 export GO = "${HOST_PREFIX}go"
 GOTOOLDIR = "${STAGING_LIBDIR_NATIVE}/${TARGET_SYS}/go/pkg/tool/${BUILD_GOTUPLE}"
@@ -187,5 +188,5 @@ python() {
     if 'mips' in d.getVar('TARGET_ARCH'):
         d.appendVar('INSANE_SKIP_%s' % d.getVar('PN'), " textrel")
     else:
-        d.appendVar('GOBUILDFLAGS', ' -buildmode=pie')
+        d.appendVar('GOBUILDFLAGS', ' -buildmode=%s' % d.getVar('GOBUILDMODE'))
 }
-- 
2.17.1


