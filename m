Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f65.google.com (mail-pg0-f65.google.com [74.125.83.65])
	by mail.openembedded.org (Postfix) with ESMTP id 349E1780E4
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Oct 2017 00:51:03 +0000 (UTC)
Received: by mail-pg0-f65.google.com with SMTP id i195so8478321pgd.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 05 Oct 2017 17:51:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=XqTY7NZGkO4geo3MbjulmP7E7RHF6+bhGh1ibVjdYiw=;
	b=LTDfKVtVDuYWGra6lYoq9DaS0nBNEJ+RZB3ry82INuix0gx+8Sya0VmAGdOpp1RFog
	oZvz1zT6HPGVwm6Vg3zCofx7VBeM2R27IXPxSybVRrtwyj+yQ8YzBqTLNpuC2ZtNbjj/
	bggAw5sUv74aTBYSblxCVGGeWMfY1O3t3jBthQurLWMFpgKA5CBahP/fYk11s0yH+tA8
	kUbm3iUXY9udvBCqVuJVe6H1ItfmkSvCZ2vCjttgiJLfMp5vaK538ImyQIBGTHMJyHcY
	K7nX/hGH6Y8FgZRJPIpXZDKA8OIC9d9E72+lF9D+n8ZiR4Fq6DutrNbP0aJ8xDLpbvXw
	qaTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=XqTY7NZGkO4geo3MbjulmP7E7RHF6+bhGh1ibVjdYiw=;
	b=hIjZioekv95t5id+IM5BkUk8incbg5eIY3Q1zefM1pJGCpO9YjqY9qiYh4/jn/9eMj
	zOr2ysuS0LjwXMm3hqh/sg7NXADOS2PGR88jbARjTmXe0BNw/oqrcbgKhsOM8YoogdAN
	lzDDkzw0Mm5F0iM7RuNrdzIkTvYgMjEgPOzomYoQLeQqJf8R7Q+6xMDVpGCTCDM3VTEZ
	muXaFRLRt5KH1OGMk8PTW2Q0/Sy8AJdOvD/Ywtb/gtB0qu2pLc5ctq4tEfJxbKoCGTDJ
	rujkA+tVlrnIAtAXthhZFkt8mkHVUGb9HOQm4HjOQ8XZYySnUpb/RrsO04rfwn9molkU
	/ATw==
X-Gm-Message-State: AMCzsaXI3S4rtpBo+e2H0vQXMwnpwCUYs24ZlOGFI4gCjzIMLerrWW8q
	5yz6lcx5pjoMWpafuU5/rRjOog==
X-Google-Smtp-Source: AOwi7QCEvGUtzLzlPM/IL41/NWZ1LliE8D6+kWsg1aqyJMpnotFhxbm2gXfwZrvvq8Ag3muGqyfzxA==
X-Received: by 10.84.236.74 with SMTP id h10mr390751pln.315.1507251065218;
	Thu, 05 Oct 2017 17:51:05 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::1f76])
	by smtp.gmail.com with ESMTPSA id o128sm259308pga.5.2017.10.05.17.51.04
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 05 Oct 2017 17:51:04 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  5 Oct 2017 17:50:47 -0700
Message-Id: <42e0f32bced9a1a9933a856732c68497324eb0ff.1507250774.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.14.2
In-Reply-To: <cover.1507250774.git.raj.khem@gmail.com>
References: <cover.1507250774.git.raj.khem@gmail.com>
Subject: [PATCH 08/10] gcc-runtime: Disable libitm on riscv
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
X-List-Received-Date: Fri, 06 Oct 2017 00:51:04 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/gcc/gcc-runtime.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/gcc/gcc-runtime.inc b/meta/recipes-devtools/gcc/gcc-runtime.inc
index ee08529a5f..d3d4bd36a8 100644
--- a/meta/recipes-devtools/gcc/gcc-runtime.inc
+++ b/meta/recipes-devtools/gcc/gcc-runtime.inc
@@ -20,6 +20,8 @@ RUNTIMELIBITM = "libitm"
 RUNTIMELIBITM_mipsarch = ""
 RUNTIMELIBITM_nios2 = ""
 RUNTIMELIBITM_microblaze = ""
+RUNTIMELIBITM_riscv32 = ""
+RUNTIMELIBITM_riscv64 = ""
 
 RUNTIMETARGET = "libssp libstdc++-v3 libgomp libatomic ${RUNTIMELIBITM} \
     ${@bb.utils.contains_any('FORTRAN', [',fortran',',f77'], 'libquadmath', '', d)} \
-- 
2.14.2


