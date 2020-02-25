Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	by mail.openembedded.org (Postfix) with ESMTP id D6A5C616B9
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Feb 2020 18:54:11 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id i10so1719538wmd.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Feb 2020 10:54:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=WHEL5vhARJmrcEgHa3CRGUct2CRZmBvpDB4+bXmmJJI=;
	b=kPTRxw3K9iAzfw+NA6q6menasbYy8DITDckBSk7c65ZjSukxi0NkzyXmXohJVxG0uZ
	q0NJP57OQR4sYRLf6Rt+jAr16yrtbnSnpGys8Em+fVMJRLYFkiLXnR1Yoo52ZZwmF/kP
	9aeyfHBIAqz/6zandxbS1UksR5vg65fpdpwvkYXeqe+tcK4R7t2sQvVPQd20Ye+6vQuk
	3E0O1T6oLFq/P02mB6JD2S8ykN0sm/TEiQW0VoXqNaPc4w1ovWuPXQ0cv48Gzt8V8mlS
	i9zXDZhZr4FVF+egqGquWti2muCQPX2HFm1Qi99JvpuAKjxuImAVTqAJoZUib5nDjddP
	ZKFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=WHEL5vhARJmrcEgHa3CRGUct2CRZmBvpDB4+bXmmJJI=;
	b=HLguwvrUFNR9PcMYOmzeXBAoLXHrh9e2ZvS4Job8d6i0mju0cBRyNHxdGftkjM0Bah
	+dlvJN3Mzlwctxpctb4IgJ+ImEd/ycywk9FlGh3s1zI9ptbbnjeV5pfpw+Jx++G/Ga4+
	eESv3L9fhwtn+S3KeBfd4S/Gw5bqaHIo7zEYUaanNMF1fUo97BNSekVt3A0v+1uYtNbg
	KENUS29azrrPNGn0qer/tm6sGik4aErEVwWTZwo4IlHiYiRwVM57DxSq897ruLL2YJle
	Dpi+8GabG0vfx15WwKPY1Cu9CYNK5EyQgDfI4P+AvRohylXbZdl078IH1t/v1De0tUBe
	q0Jg==
X-Gm-Message-State: APjAAAXzbBw4J/o3UMNbJxvofC4nYM1Gboz4aWkV5qpOJW/Dqv5tBAIF
	fq13oWJOe4AMD/hwk9bUy7SryKdQ
X-Google-Smtp-Source: APXvYqwjwVkrvVbjo9vamnH8Xa+ZLzdwGkDZJNFrBB9l4FmFjKnLx2BgYz3oLzGS55ioPWXaoe3XKw==
X-Received: by 2002:a05:600c:23cd:: with SMTP id
	p13mr608647wmb.28.1582656852259; 
	Tue, 25 Feb 2020 10:54:12 -0800 (PST)
Received: from linux-f9zs.site ([2a02:2450:1011:56f:238d:84be:b349:9184])
	by smtp.gmail.com with ESMTPSA id
	g7sm25730756wrq.21.2020.02.25.10.54.11
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 25 Feb 2020 10:54:11 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 25 Feb 2020 19:53:31 +0100
Message-Id: <20200225185335.19326-8-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200225185335.19326-1-alex.kanavin@gmail.com>
References: <20200225185335.19326-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 08/12] gnutls: upgrade 3.6.11.1 -> 3.6.12
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
X-List-Received-Date: Tue, 25 Feb 2020 18:54:12 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../gnutls/{gnutls_3.6.11.1.bb => gnutls_3.6.12.bb}           | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/gnutls/{gnutls_3.6.11.1.bb => gnutls_3.6.12.bb} (93%)

diff --git a/meta/recipes-support/gnutls/gnutls_3.6.11.1.bb b/meta/recipes-support/gnutls/gnutls_3.6.12.bb
similarity index 93%
rename from meta/recipes-support/gnutls/gnutls_3.6.11.1.bb
rename to meta/recipes-support/gnutls/gnutls_3.6.12.bb
index 5b05364c25..f1eeebc807 100644
--- a/meta/recipes-support/gnutls/gnutls_3.6.11.1.bb
+++ b/meta/recipes-support/gnutls/gnutls_3.6.12.bb
@@ -21,8 +21,8 @@ SRC_URI = "https://www.gnupg.org/ftp/gcrypt/gnutls/v${SHRT_VER}/gnutls-${PV}.tar
            file://arm_eabi.patch \
 "
 
-SRC_URI[md5sum] = "3670ee0b0d95b3dee185eff2dc910ee7"
-SRC_URI[sha256sum] = "fbba12f3db9a55dbf027e14111755817ec44b57eabec3e8089aac8ac6f533cf8"
+SRC_URI[md5sum] = "a23900f14980a467bdce3a0fd31dfa18"
+SRC_URI[sha256sum] = "bfacf16e342949ffd977a9232556092c47164bd26e166736cf3459a870506c4b"
 
 inherit autotools texinfo pkgconfig gettext lib_package gtk-doc
 
-- 
2.25.0


