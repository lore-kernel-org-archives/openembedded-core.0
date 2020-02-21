Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-qk1-f196.google.com (mail-qk1-f196.google.com
	[209.85.222.196])
	by mail.openembedded.org (Postfix) with ESMTP id 9AFF761712
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Feb 2020 17:46:13 +0000 (UTC)
Received: by mail-qk1-f196.google.com with SMTP id c20so2606586qkm.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Feb 2020 09:46:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=YYe8tvGp1SIZxU65rkSRqE/6uxyan/LaRJhjN+ZKIPM=;
	b=QF7ahrrKDnZbxbiMD1QWNIzBRZFfpMrlLDejh9I4vzjyPAGMnWcYpZbjkAkt8Di3zx
	ZUZdDh51mNAv3D/TCYljm39ciKqiQ7N8iIoLH2FYY/Y5Pkeg2PCwnKOM34Q62Q6qDUc0
	Q7kOjXBvjBFNHyY2U6bvZF1OMjbk0L/Hy6qxad9nrgMGNROsdLZcmdI8gBLDkVoe7TAW
	z3eCCbw3icbWwo4ZpDnnA0McNVOYL98mYkvSHexlOWHyixfSXy2lSPqQBxhzQ+GTSfIt
	u0ovKwzDxPMm+PPWVZCQzoW3LG9RcPUmZb1aMi84ceVYr9uJJuMz7l/vXj5UIQ4P4F0H
	DNUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=YYe8tvGp1SIZxU65rkSRqE/6uxyan/LaRJhjN+ZKIPM=;
	b=pkT3nVo1Fqfj4n3KejB2lZJqtmaBmSoow7NmlyTBvX9oyAfgOP+zIETiNXWVW+oYYN
	/1B+dhJcdQ1ob9GgfLjoo/Dpq8yCeWIBNEM/WxbbX65rHmPK2kWfLVonmlXAvpsiYvAM
	2YoYFyrm3fAKTS6HQShaDLdbaOuObZEiK9JwLF6Iz0ml/JPHCYbHQKbU+5hdakfyHH2S
	OFXlwLi7eyPLOC587v2w0Z5xweZHlQJCQJx5ddlwK06LPQXwJ7FrktCW/G4RHTQKidfl
	jmawVeNQuT9lASV5GvH9XpnScMaIIdwbr33xHrU99dxvjcj2w/h2aOAlEKDpVcNJoj9U
	HQjA==
X-Gm-Message-State: APjAAAW2UWbFecWbrp27qCRUAYlRAxQ5XeOBg8jnc6kH22oeyubqQ6v2
	YcGsPuamQ3npMi9lV6RzJl6vmZsI+BxZPw==
X-Google-Smtp-Source: APXvYqwYcOj0U8rBNwWD4e44li1VU9DdoQoDAwi7s/Fi9twFk2fup1XhXVnJktxyxmA5inWXweEhBQ==
X-Received: by 2002:a37:aa88:: with SMTP id
	t130mr32810362qke.405.1582307174632; 
	Fri, 21 Feb 2020 09:46:14 -0800 (PST)
Received: from localhost.localdomain
	(CPEe8de27b71faa-CM64777d5e8820.cpe.net.cable.rogers.com.
	[174.113.11.95]) by smtp.gmail.com with ESMTPSA id
	g17sm1855153qtq.29.2020.02.21.09.46.13
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 21 Feb 2020 09:46:13 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Date: Fri, 21 Feb 2020 12:46:02 -0500
Message-Id: <e4be65a39aecd10e31991879114856c2784ecd69.1582306887.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1582306887.git.bruce.ashfield@gmail.com>
References: <cover.1582306887.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 10/10] qemu: bump default reference kernel to v5.4
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
X-List-Received-Date: Fri, 21 Feb 2020 17:46:14 -0000
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Now that the 5.4 recipes are available, we bump the default versions
to use them.

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/conf/machine/include/x86-base.inc | 2 +-
 meta/conf/machine/qemuarmv5.conf       | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/conf/machine/include/x86-base.inc b/meta/conf/machine/include/x86-base.inc
index da56cc3574..a72714711d 100644
--- a/meta/conf/machine/include/x86-base.inc
+++ b/meta/conf/machine/include/x86-base.inc
@@ -18,7 +18,7 @@ SERIAL_CONSOLES ?= "115200;ttyS0"
 # kernel-related variables
 #
 PREFERRED_PROVIDER_virtual/kernel ??= "linux-yocto"
-PREFERRED_VERSION_linux-yocto ??= "5.2%"
+PREFERRED_VERSION_linux-yocto ??= "5.4%"
 
 #
 # XSERVER subcomponents, used to build the XSERVER variable
diff --git a/meta/conf/machine/qemuarmv5.conf b/meta/conf/machine/qemuarmv5.conf
index fb4789fdac..7f72048065 100644
--- a/meta/conf/machine/qemuarmv5.conf
+++ b/meta/conf/machine/qemuarmv5.conf
@@ -17,7 +17,7 @@ QB_KERNEL_CMDLINE_APPEND = "console=ttyAMA0,115200 console=tty"
 QB_OPT_APPEND = "-show-cursor -usb -device usb-tablet"
 # Add the 'virtio-rng-pci' device otherwise the guest may run out of entropy
 QB_OPT_APPEND += "-object rng-random,filename=/dev/urandom,id=rng0 -device virtio-rng-pci,rng=rng0"
-PREFERRED_VERSION_linux-yocto ??= "5.2%"
+PREFERRED_VERSION_linux-yocto ??= "5.4%"
 QB_DTB = "${@oe.utils.version_less_or_equal('PREFERRED_VERSION_linux-yocto', '4.7', '', 'zImage-versatile-pb.dtb', d)}"
 
 KMACHINE_qemuarmv5 = "qemuarm"
-- 
2.19.1


