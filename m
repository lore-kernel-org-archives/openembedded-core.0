Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
	[209.85.128.53])
	by mail.openembedded.org (Postfix) with ESMTP id E7CAF6B07E
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 Aug 2019 12:13:17 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id a15so74499613wmj.5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 05 Aug 2019 05:13:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=+Ha4dvjs7eEKXl8mc9OIIJm4zs7Xi/OatJBjMqeoRXY=;
	b=sUFrVotlLOXAP8UtMByZXrE3yEjr7zFC2SEfue9e/POBAlfWPH7mo8DrCarOnhaDSf
	9fqxx8Gf+dFv06Nx1jjyKiB2msHcn+9c66SAebo746MfTxRTSN9obefbkuKm4BVckYOF
	HWJBFNODsbODl1faYGwfCHkIbFJfCMRVk6txro9OF/47/Z0wjMERaFlei38rCLInPmJT
	18DGn53GVqlMhVKw5Vk/HH/DpEzN29qMPIQFrV4WnxgQXiT161evu20kcjpAZJS/+xd4
	9O2XTIFnFaTfBMtQcdABUc4pQ2Cf8930jcD0q6qPgNtjmvuLI/9bnhHukfXYe95ITQbA
	XfpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=+Ha4dvjs7eEKXl8mc9OIIJm4zs7Xi/OatJBjMqeoRXY=;
	b=aGEhXGGIsJRwRrn+ZeGYn5RV18hJ6gjjjkhjo16sJZ6eN9xbPgMVJzys/2F8uMQlLw
	PqZP9h8IFcGcAqBGzud1L4S8FIH2Bgc61JQ1LofPOQJI+kE6gXTRGPcbFajvlkvQm96X
	sJsE2Uui1zEa0yaWKO+pjnxky2HIZyi4zSrJ17NCsl3HxGDND6L1tFMMxl35r+bqZp26
	vRP4+e0DlkONk1OcfMR4ZkI9T1n6esEcct5RmP1/YtWmhHSrkxqECSjLKJTUuIHixZOc
	380MGjyb6Phi/LjXOOuGTTFtCBIPKhgdsTAECj/nf6OkfooKc/xdG8ajlBRFKIcx4Or+
	SP3w==
X-Gm-Message-State: APjAAAUp0qMM2bl/i390mgt7/D+AY4v2b1/5B4K8gMlzkrrHaay157Lm
	ZNsV0pC3GZu7Whg86hXpbqx309tPU5Y=
X-Google-Smtp-Source: APXvYqyCfFVusVqsPH6mE8K2eLzBnjDCRf84xYekWKlnCf5u07r9Ueqybqrt23JKEa8R6qNYZ32c1A==
X-Received: by 2002:a7b:c398:: with SMTP id s24mr18934907wmj.53.1565007198468; 
	Mon, 05 Aug 2019 05:13:18 -0700 (PDT)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	w25sm76641800wmk.18.2019.08.05.05.13.17
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Mon, 05 Aug 2019 05:13:18 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  5 Aug 2019 14:13:13 +0200
Message-Id: <20190805121313.31362-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH] maintainers.inc: assign acpica to Ross
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
X-List-Received-Date: Mon, 05 Aug 2019 12:13:18 -0000

Fathi has as well been inactive for a long time.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/conf/distro/include/maintainers.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index bc13be2fd4f..fe0a7755780 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -28,7 +28,7 @@
 # Please keep this list in alphabetical order.
 #
 RECIPE_MAINTAINER_pn-acl = "Chen Qi <Qi.Chen@windriver.com>"
-RECIPE_MAINTAINER_pn-acpica = "Fathi Boudra <fathi.boudra@linaro.org>"
+RECIPE_MAINTAINER_pn-acpica = "Ross Burton <ross.burton@intel.com>"
 RECIPE_MAINTAINER_pn-acpid = "Ross Burton <ross.burton@intel.com>"
 RECIPE_MAINTAINER_pn-adwaita-icon-theme = "Ross Burton <ross.burton@intel.com>"
 RECIPE_MAINTAINER_pn-alsa-lib = "Tanu Kaskinen <tanuk@iki.fi>"
-- 
2.17.1


