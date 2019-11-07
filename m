Return-Path: <ross.burton@intel.com>
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	by mail.openembedded.org (Postfix) with ESMTP id 00E057F362
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Nov 2019 23:58:36 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id a17so5285867wmb.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 07 Nov 2019 15:58:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=y3iep86Qcweh/aFhsq5uTjF6EMW4sHAmwGgSliHnfu8=;
	b=e+vhQkrhcTjx1gwu6DO44aOeuJa9cxL02evKrCAdqt9TO+Tuqhr2UcWHf+Zf8z/40g
	N91Ya1ke64yoxLqL+rIi0Zcb3DODh02G6IU6fXBAlpAZFHlAfhWCL9QvOeXj+z/vPJ2F
	sEEVUDACFtzofDBJNhAik1SNPDeTK9uXXKvIkwqAmtjJ1q6HKT2Y2YrFSRQWcradta1/
	NscoMtPJAYSg00TrQarkKRX8tSQWeeOKMKj59EcUJ9mf5ajlsI/sJV9uPFe3C00GhJqd
	Y7x2/yQtHY3izamIYpng/IqXauzpBhByFdl693OZcryegZxzBX7/9co1YctuG2nQVOSF
	rA5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=y3iep86Qcweh/aFhsq5uTjF6EMW4sHAmwGgSliHnfu8=;
	b=dB0AygqS6fQDYPxgGmIhOQ6cttTlUuMVxPuaxXfJ+U6z/IsYsrd+9npsNXdBMwWzyA
	vjUxwyrinGFf8kfY7L9AFZtkeZvPpgoJID2a3T2T28g0AYjXbBvbqsyFic8cuUO5TJD0
	XmamBtI1chrz3LODv7Z5fyT36uQFUOD6Onq0oVN45CfJUtZL7UN/TxJPq3HgU4eoj1n/
	p197ZH/A+jiU7GOCUQFm84+tb25tvKLgcevlFARvliB1dpM1Cb3qU7oHBniNAE5qB49s
	GbqS9wxrbROtnZLOhjIMbzyuOozgH45tS92FB5T1MYiLvx/S+Jjsvszl3JBvEqcBHCzk
	mccA==
X-Gm-Message-State: APjAAAVtJsK0ER9WkY9U7pBocoRv1+3c90HdzlGcI0izLqo/VUeMPOWl
	Vfs+D6UqrRnIAnqbloHKAcaon+gq2r0=
X-Google-Smtp-Source: APXvYqx6acb6p1A8vW8IeGzNhwPNFyDMpQatk29kyN8AqpU1Vk7p1An/hvbhe2Qf/HqfxHjfNcs9Qg==
X-Received: by 2002:a7b:c308:: with SMTP id k8mr5200803wmj.32.1573171116792;
	Thu, 07 Nov 2019 15:58:36 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	f13sm3702821wrq.96.2019.11.07.15.58.36
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 07 Nov 2019 15:58:36 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  7 Nov 2019 23:58:28 +0000
Message-Id: <20191107235830.26644-3-ross.burton@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191107235830.26644-1-ross.burton@intel.com>
References: <20191107235830.26644-1-ross.burton@intel.com>
MIME-Version: 1.0
Subject: [PATCH 3/5] ovmf: unify DEPENDS
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
X-List-Received-Date: Thu, 07 Nov 2019 23:58:37 -0000
Content-Transfer-Encoding: 8bit

Instead of depending on iasl-native, depend on ovmf-native as iasl was merged
into that recipe some time ago.

bc-native doesn't appear to be a build requirement anymore, and for clarity
merge two overridden DEPENDS into a single DEPENDS.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-core/ovmf/ovmf_git.bb | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/meta/recipes-core/ovmf/ovmf_git.bb b/meta/recipes-core/ovmf/ovmf_git.bb
index 3b5a05e51e6..ff2b2a530ad 100644
--- a/meta/recipes-core/ovmf/ovmf_git.bb
+++ b/meta/recipes-core/ovmf/ovmf_git.bb
@@ -29,10 +29,7 @@ PARALLEL_MAKE = ""
 
 S = "${WORKDIR}/git"
 
-DEPENDS_class-native="util-linux-native iasl-native"
-DEPENDS_class-target="ovmf-native bc-native"
-
-DEPENDS_append = " nasm-native"
+DEPENDS = "nasm-native acpica-native ovmf-native util-linux-native"
 
 EDK_TOOLS_DIR="edk2_basetools"
 
-- 
2.20.1


