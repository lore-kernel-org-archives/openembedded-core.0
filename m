Return-Path: <Alexey.Brodkin@synopsys.com>
Received: from smtprelay.synopsys.com (smtprelay2.synopsys.com
	[198.182.60.111])
	by mail.openembedded.org (Postfix) with ESMTP id 6BA45798ED
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Sep 2018 14:26:24 +0000 (UTC)
Received: from mailhost.synopsys.com (mailhost1.synopsys.com [10.12.238.239])
	by smtprelay.synopsys.com (Postfix) with ESMTP id E2D9A10C1BAC;
	Fri, 21 Sep 2018 07:26:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1537539985; bh=LA6dM/Krw+MMLZmUDFr/EFuNS9FNPwprKdqOzIIUCfg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=SoUSZoRbXn33dbzLhCvZWCr+xuZrOifVH/arqCyps4gQzeQR3XlGEZljUl5MDJYSj
	njfSu0t14wAdX9wU/Ia+x2SRsPqjNIaeAgUWh6nmnQwQA0YdTkCj8+k3lzNfxJr9nO
	YRUHe68hU87xuaaVyddKn+WbDRu01vd9wqI7Q8ayr57Gn9vZPOmZ/2oaFziYQK3eka
	n51tvWqwxOco5YLlG+sVBEAdwv9pkev+dGPodMOYbWKQMOi1xyfEzD/4+p8xj9uaJo
	GL8VtjYEu+PwZL++BZeZs8YqXyfESYOki3NVRdBAxvsKs01mNdOsNDqbcQhVMEMKl9
	N8fNtHOOMqhVQ==
Received: from ru20arcgnu1.internal.synopsys.com
	(ru20arcgnu1.internal.synopsys.com [10.121.9.48])
	by mailhost.synopsys.com (Postfix) with ESMTP id 65E295DD1;
	Fri, 21 Sep 2018 07:26:24 -0700 (PDT)
From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 21 Sep 2018 17:26:06 +0300
Message-Id: <20180921142608.36203-8-abrodkin@synopsys.com>
X-Mailer: git-send-email 2.16.2
In-Reply-To: <20180921142608.36203-1-abrodkin@synopsys.com>
References: <20180921142608.36203-1-abrodkin@synopsys.com>
Cc: linux-snps-arc@lists.infradead.org,
	Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Subject: [PATCH v3 7/9] gcc: Disable libitm for ARC
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
X-List-Received-Date: Fri, 21 Sep 2018 14:26:24 -0000

The libitm is not supported on ARC, so disable it

Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
---

No changes in v3.

No changes in v2.

 meta/recipes-devtools/gcc/gcc-runtime.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/gcc/gcc-runtime.inc b/meta/recipes-devtools/gcc/gcc-runtime.inc
index 72b8081cd3..9e7e7c5b3d 100644
--- a/meta/recipes-devtools/gcc/gcc-runtime.inc
+++ b/meta/recipes-devtools/gcc/gcc-runtime.inc
@@ -17,6 +17,7 @@ EXTRA_OECONF_PATHS = "\
 EXTRA_OECONF_append_linuxstdbase = " --enable-clocale=gnu"
 
 RUNTIMELIBITM = "libitm"
+RUNTIMELIBITM_arc = ""
 RUNTIMELIBITM_mipsarch = ""
 RUNTIMELIBITM_nios2 = ""
 RUNTIMELIBITM_microblaze = ""
-- 
2.16.2


