Return-Path: <roman.stratiienko@globallogic.com>
Received: from mail-lf1-f65.google.com (mail-lf1-f65.google.com
	[209.85.167.65])
	by mail.openembedded.org (Postfix) with ESMTP id BE0A3606B2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Dec 2018 10:17:18 +0000 (UTC)
Received: by mail-lf1-f65.google.com with SMTP id e26so11832864lfc.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Dec 2018 02:17:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=globallogic.com; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=HVJxg6uvTj+LwdRlxaNcZCCyVH9vDt2SI5JyXhJZrxA=;
	b=LGbcwl+pl08jF2j+wHRZsNPE4IIfAnLzO308vn6HTSjlBfJJDhirApRuJ/URwMf1sV
	/c1YBG/GO0yR3/Nq99S9b7EzzFdRDrNld1Lwr6A7Rzimc68ckC/NqxvKCierDgd4DBNh
	Vzfb2y1K5CnpgZWYieN0Z9ccU7r0pmrV42HW8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=HVJxg6uvTj+LwdRlxaNcZCCyVH9vDt2SI5JyXhJZrxA=;
	b=cmEXIOySmumXW9u+a88NlAB0In66gH+K3L2Aeagn0oQSNSdlMHsKHL5+4qlVx8ykaE
	YObVrj00B0MCPyLRaVDz2Ot3vo8vshgllRcYGIIFX+OrS3Ei+vLXzjC13M96SqOYR8Up
	O1jhC/HYjkHXWarP5EjCnjWkeYocymFppfgRz/7aFYeJ/6V45X9dURYM7b+T1hWq9kZK
	Aka/2b3wQfgFwMBaPEC3LztDkq0lea2KxF31+szQC8Vj0J9Ze+jn5pXghwGR1goOR7y3
	CsJaB8scESk8yVB2X0TlGHvA66KjFTJ37MoXZl4O5i+je3WpVxPEZuNma/vRB0K0scCY
	gr4w==
X-Gm-Message-State: AA+aEWbFdJT9TKAGPhRwNCNDnvTy7WwRA+YKAZMt3s5MqPGxjLednMUs
	rL0meBBaNUtch6VBFC12NTIYPz0kE4o=
X-Google-Smtp-Source: AFSGD/VTPzfa9HwsG+vfNmkg4A5/Yej0RhjV5u6GM9tBSJo88p8zjpgPFvxT6+ICFgBFb3uDQ/NZPA==
X-Received: by 2002:a19:789:: with SMTP id 131mr10119542lfh.11.1545128238978; 
	Tue, 18 Dec 2018 02:17:18 -0800 (PST)
Received: from roman-VirtualBox.synapse.com ([195.238.92.107])
	by smtp.gmail.com with ESMTPSA id
	b17-v6sm2936830ljj.93.2018.12.18.02.17.17
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 18 Dec 2018 02:17:18 -0800 (PST)
From: roman.stratiienko@globallogic.com
To: openembedded-core@lists.openembedded.org
Date: Tue, 18 Dec 2018 12:16:59 +0200
Message-Id: <20181218101659.6531-2-roman.stratiienko@globallogic.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20181218101659.6531-1-roman.stratiienko@globallogic.com>
References: <20181218101659.6531-1-roman.stratiienko@globallogic.com>
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
X-List-Received-Date: Tue, 18 Dec 2018 10:17:19 -0000

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


