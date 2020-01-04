Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com
	[209.85.215.169])
	by mail.openembedded.org (Postfix) with ESMTP id 659A77F844
	for <openembedded-core@lists.openembedded.org>;
	Sat,  4 Jan 2020 16:26:35 +0000 (UTC)
Received: by mail-pg1-f169.google.com with SMTP id x8so24800620pgk.8
	for <openembedded-core@lists.openembedded.org>;
	Sat, 04 Jan 2020 08:26:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=FGdQ06L+8AO2jYEi6Yk2DLFJAG/84Bb46vaODV8E2mc=;
	b=vNVT8zFHrpLeRv5lI2CUjzI8O3Lfo/hVb1NiYaERz2zvON9Vv5BWevZw7vOcpiP+4l
	9Zs5sPgRUWRwGUjOKxLNFGKvOKQz6wlcRSKiIKqpFFG+N7UhJwbBdWHr73SfqdVdGunr
	EJd2DOZ4z0DV7b/IxMoHGAbH1wyJgzIU3MmUlf7E5HIIlJWfDl7jBNDf8IQPRa4PZAXF
	nRSmvYvOkV7oDnNzlrt/9IRfe5Obh41RyUdGKe7xuKqaA8I4t12NKTntL77mIp3jxK4q
	c7386Ots6hrul/5ot1Jl6/u396WhSbAEB9DJsCyOhvw9OYnUPMKFAa9ONQ2y4hzlT/yN
	z6fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=FGdQ06L+8AO2jYEi6Yk2DLFJAG/84Bb46vaODV8E2mc=;
	b=pilZALcNsa/L1wL/YYz7DGqwPzZjcKUrGl4gBfFJi1kVUBY5N6l+Znipa09MS/JWv3
	9r90IYo1RVzrV6C0O61OqGXRSXRK0pqgPz1jpELtpWIlHbioghB8ukl+7HDYr2aAVeJe
	xAfK1xao1kGZ7HYuuI4ua+p+9OvBKIuYJqzt1WPj4MJp2hBVdWuAH76dlZumn8l/rivp
	CARXzD9HL2xcvq/snkvZrGz8Ujw1xU0DgJLxEB12IMxDxlMvkT1p/qBtkHC8uTGGyHX5
	fdDxSLtONcN7kyP4I2v8FBkL/YUzp54JDKhcm04BX40xfAVMP5FN1jsUXyCSFgq0xqcF
	t18A==
X-Gm-Message-State: APjAAAWTez3pkDxmgaOcoC6fCWU3wngvhDokynz5kECF3Gu8kdKHmpy2
	G2mZMyVxsgeYH38j9Zam+dWX0OqlQHg=
X-Google-Smtp-Source: APXvYqykpkTonFY8S97+YXkfzxSwf6HxsM0lhFa0LkgicXF+jpAyIBQ1LVm63erx/6qFC03s2D5+DA==
X-Received: by 2002:a62:7711:: with SMTP id s17mr99653210pfc.157.1578155196350;
	Sat, 04 Jan 2020 08:26:36 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:e812:6764:3882:fa62])
	by smtp.gmail.com with ESMTPSA id
	u23sm71589976pfm.29.2020.01.04.08.26.35
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sat, 04 Jan 2020 08:26:35 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat,  4 Jan 2020 08:26:06 -0800
Message-Id: <537b6578673f39deebd69ad1d171546bef967cee.1578155074.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1578155074.git.akuster808@gmail.com>
References: <cover.1578155074.git.akuster808@gmail.com>
Subject: [zeus 25/29] python3: Update to apply libgcc fix to libpython, glibc only
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
X-List-Received-Date: Sat, 04 Jan 2020 16:26:35 -0000

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Update to account for review feedback on list.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit ec788594f3f6a47687c6eb321437f2d2b58b1518)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-devtools/python/python3_3.7.6.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python3_3.7.6.bb b/meta/recipes-devtools/python/python3_3.7.6.bb
index 407c5a2bd9..b33b7028d4 100644
--- a/meta/recipes-devtools/python/python3_3.7.6.bb
+++ b/meta/recipes-devtools/python/python3_3.7.6.bb
@@ -323,7 +323,7 @@ PACKAGES += "${PN}-man"
 FILES_${PN}-man = "${datadir}/man"
 
 # See https://bugs.python.org/issue18748 and https://bugs.python.org/issue37395
-RDEPENDS_${PN} = "libgcc"
+RDEPENDS_libpython3_append_libc-glibc = " libgcc"
 RDEPENDS_${PN}-ptest = "${PN}-modules ${PN}-tests unzip bzip2 libgcc tzdata-europe coreutils sed"
 RDEPENDS_${PN}-ptest_append_libc-glibc = " locale-base-tr-tr.iso-8859-9"
 RDEPENDS_${PN}-tkinter += "${@bb.utils.contains('PACKAGECONFIG', 'tk', 'tk tk-lib', '', d)}"
-- 
2.17.1


