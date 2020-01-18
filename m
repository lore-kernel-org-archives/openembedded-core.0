Return-Path: <raj.khem@gmail.com>
Received: from mail-pj1-f68.google.com (mail-pj1-f68.google.com
	[209.85.216.68])
	by mail.openembedded.org (Postfix) with ESMTP id 9E79E7FBDB
	for <openembedded-core@lists.openembedded.org>;
	Sat, 18 Jan 2020 19:41:23 +0000 (UTC)
Received: by mail-pj1-f68.google.com with SMTP id kx11so4760994pjb.4
	for <openembedded-core@lists.openembedded.org>;
	Sat, 18 Jan 2020 11:41:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=BuWP494aNW+Ph4a3AhwWaUf1G9MSwkJRVgOcn8bYtZs=;
	b=OXrPwFX9doIFb9ajcEr/pesgoH2HbostpWEXLtnfsY4WaYI1cBR2oGlSohbJc2E/tO
	J0SEtsZypILgSM8vaTaeRebpkAnBBvJ6YGUrUHq2sGuntNOQCIDK6KQyUSHBbUYZcbIA
	2Sj93z1vKLmpGuraOjfXro1UkJznuljkyVhWZ9hJmXtpm90lfsr49Fys11i1Coo9i+97
	GJIAuQtKMh77FuvjsQqzyLKsc++Vyt3RgfsdoZFtYREuWBD3IFovQ81sCZyAxhlLvkOg
	6WGaWEs8GlPp93QVLjhKCUceFFasVOoAVxTuinILMpW7yjnjy9/8PVgs0BaepbRnSLCe
	b14g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=BuWP494aNW+Ph4a3AhwWaUf1G9MSwkJRVgOcn8bYtZs=;
	b=fQlAg1w5/vSv1eBNfEDQdMsQZ3fU/TytxplHAw5MytBQX+342gwmINO3XqrWiDTX5C
	SQQfKi85crVMiM6SWe7TXc+CF+H/KUb5ui8LDtEYps6c78i9euxtw/TocdrWYGNur3oK
	lHo0y0nV3JPDo/lmmdAex+poJnCSd7rSn20+IEeCEbUAGoJMg1ygx+VaEdZO+pcjD7zq
	oHKzYOoNrHQazWQUyXsHmXtW3wlXI/fnJBEKAZ+PPUpJc1TNrEIbWen/oHsagjfpGU12
	6rajS55QJzAYp52iU/Sjte3mCfNQyxHuz1kixZzkFZJwWHp5gUnmguLKJBrKP8PAvTJJ
	eyZQ==
X-Gm-Message-State: APjAAAU1MGVVI89/DiL+XKfNG94IROFymBUelA1NFmZCXiaRfPdqOLKf
	ZDQZ9N4irYVGVIy8hGM5yen6J96mQ8Q=
X-Google-Smtp-Source: APXvYqxtMzvTc1ZnK5j3+mE43ENOJ43wF50QBA6gUwHWCRdRN9YiQ0wpou689JdhSYpyU5esSYuYbg==
X-Received: by 2002:a17:90a:3aaf:: with SMTP id
	b44mr14325809pjc.9.1579376484435; 
	Sat, 18 Jan 2020 11:41:24 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::cab1])
	by smtp.gmail.com with ESMTPSA id l8sm751610pjy.24.2020.01.18.11.41.23
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sat, 18 Jan 2020 11:41:24 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 18 Jan 2020 11:41:19 -0800
Message-Id: <ef32c2679f2b7706338cf790c13f3d035d2e9796.1579376298.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <cover.1579376298.git.raj.khem@gmail.com>
References: <cover.1579376298.git.raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 2/5] gcc: Enable 32bit powerpcle at multi-arch for powerpc64le
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
X-List-Received-Date: Sat, 18 Jan 2020 19:41:24 -0000
Content-Transfer-Encoding: 8bit

Even though we do not expect any legacy ( 32bit ) for LE, linux-yocto
does enable the compat code, so enable 32bit support to get that going

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/gcc/gcc-common.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/gcc/gcc-common.inc b/meta/recipes-devtools/gcc/gcc-common.inc
index 44cba287f3..3dcfdf835f 100644
--- a/meta/recipes-devtools/gcc/gcc-common.inc
+++ b/meta/recipes-devtools/gcc/gcc-common.inc
@@ -47,6 +47,7 @@ def get_gcc_multiarch_setting(bb, d):
         "i586":    "--enable-targets=all",
         "i686":    "--enable-targets=all",
         "powerpc": "--enable-targets=powerpc64",
+        "powerpc64le": "--enable-targets=powerpcle",
         "mips":    "--enable-targets=all",
         "sparc":   "--enable-targets=all",
     }
-- 
2.25.0


