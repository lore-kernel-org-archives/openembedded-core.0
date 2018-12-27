Return-Path: <roman.stratiienko@globallogic.com>
Received: from mail-lj1-f194.google.com (mail-lj1-f194.google.com
	[209.85.208.194])
	by mail.openembedded.org (Postfix) with ESMTP id DB9556C1B7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Dec 2018 12:39:31 +0000 (UTC)
Received: by mail-lj1-f194.google.com with SMTP id k19-v6so16129831lji.11
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Dec 2018 04:39:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=globallogic.com; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=HVJxg6uvTj+LwdRlxaNcZCCyVH9vDt2SI5JyXhJZrxA=;
	b=PbS2EIuh62r4O8mgkHv/e5qhhyOlXzUSyLqb7fDIhD/Q+3AvRhlumNPuAJRG1D90ik
	nXK+YC5NssALriRoxRoKVpbBgDQYYHSIqG7KpKhwc1aYGzUyEavMzl0buOHg+2OhS1ow
	13dW98jqGyRSFe6Pzy31GVbIq2VTklfg6Az28=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=HVJxg6uvTj+LwdRlxaNcZCCyVH9vDt2SI5JyXhJZrxA=;
	b=Wh+PLPogiRhZKmFdCTm1tiwodD39PrnFQbglBCZA0uu1LqnvczeW5HqnKFDWUGo3wL
	4aGtZVbiHW7D+Ogib44+/C8vdl8itPAkdDuOUT+n0RXUijezCEAwYYlfKy5YV1NxIEip
	w5X4aLgvoT6keotL4CnnslVRBCSlAbDP0FWAtfzBliE0jA++aGIm/ONV7NrrC06RMghs
	VwL/3f4uJaO58bvKxaEaQpAXvqwSDTu+vqFpjg0YEOfqfIrmuXAq48FRYWUitgjxFTqt
	ZgSt50CXsNpJnMExNyuJVL1ig5Lwn9y7yz3h6e/JD7nznF1nuJ7Sqd0l+xH16yHBGqbQ
	hwiw==
X-Gm-Message-State: AJcUukdPXttaCbXFNqcGkrT2uc0BYDC8ZcZnqePJgRg5tc89HMVAyhzx
	4w4hRJtTZKcwnHsPL0IpTTpl4UDtsc0yPQ==
X-Google-Smtp-Source: ALg8bN6i96ADoEjNUj81UoiVz/5KXI8WcZ1kwaCgGDdtxp5TJnPgfwwcKHKcaW+KsmKryg+Yw/P/Xw==
X-Received: by 2002:a2e:5109:: with SMTP id
	f9-v6mr14844201ljb.52.1545914372124; 
	Thu, 27 Dec 2018 04:39:32 -0800 (PST)
Received: from roman-VirtualBox.synapse.com ([195.238.92.107])
	by smtp.gmail.com with ESMTPSA id
	c20sm7467881lfj.67.2018.12.27.04.39.30
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 27 Dec 2018 04:39:31 -0800 (PST)
From: roman.stratiienko@globallogic.com
To: openembedded-core@lists.openembedded.org,
	raj.khem@gmail.com
Date: Thu, 27 Dec 2018 14:38:49 +0200
Message-Id: <20181227123849.5532-2-roman.stratiienko@globallogic.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20181227123849.5532-1-roman.stratiienko@globallogic.com>
References: <20181227123849.5532-1-roman.stratiienko@globallogic.com>
Subject: [PATCH 2/2] eglinfo: add wayland receipe
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
X-List-Received-Date: Thu, 27 Dec 2018 12:39:32 -0000

From: Roman Stratiienko <roman.stratiienko@globallogic.com>

Signed-off-by: Roman Stratiienko <roman.stratiienko@globallogic.com>
---
 .../eglinfo/eglinfo-wayland_1.0.0.bb                | 13 +++++++++++++
 1 file changed, 13 insertions(+)
 create mode 100644 meta/recipes-graphics/eglinfo/eglinfo-wayland_1.0.0.bb

diff --git a/meta/recipes-graphics/eglinfo/eglinfo-wayland_1.0.0.bb b/meta/recipes-graphics/eglinfo/eglinfo-wayland_1.0.0.bb
new file mode 100644
index 0000000000..87a131aa7b
--- /dev/null
+++ b/meta/recipes-graphics/eglinfo/eglinfo-wayland_1.0.0.bb
@@ -0,0 +1,13 @@
+EGLINFO_PLATFORM ?= "wayland"
+EGLINFO_BINARY_NAME ?= "eglinfo-wayland"
+
+require eglinfo.inc
+
+DEPENDS += "wayland"
+
+inherit distro_features_check
+
+# depends on wayland
+REQUIRED_DISTRO_FEATURES += "wayland"
+
+SUMMARY += "(Wayland version)"
-- 
2.17.1


