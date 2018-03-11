Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 655A778921
	for <openembedded-core@lists.openembedded.org>;
	Sun, 11 Mar 2018 00:43:00 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id 188so9937318wme.1
	for <openembedded-core@lists.openembedded.org>;
	Sat, 10 Mar 2018 16:43:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=C+cY05Lv5BfKRdKMxs/liLXfLdDdlw134aV4aP4RWtw=;
	b=psLfEJ4+AzCDTxtxy/uDKgzF904/PRliWKBXoMKzzjVe3Xb8++P+n6s9LbG5671dX8
	UEKhwegEbWxJ0Fc36dWW8+k35it6hKYivCIPCHFrhpWDj3K6QZNdqpbrqheIhuIoDUZZ
	9SKu9CwGt8kmrxox7gZ9AS7hoElCt6yupf4mUxqeQ/TtEAV/h1fIHweWfrrYsXBLZ1q9
	lBorCKIuME6alKL4g0OIeb7tgg0m/Yt6B9HLBSTV6k5ol8xxh0kv1sh2t7KIOPckGUVh
	mp6n4O97Sq6X2MG23+dPqjktrIGvEyb8DnVOqvfDO+qycstycwQBROyYb+ZVxgyIBm61
	GW/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=C+cY05Lv5BfKRdKMxs/liLXfLdDdlw134aV4aP4RWtw=;
	b=GNFbeFY3VdTK+5FKq2LZjkRlUXiPuBnH15v6ZKirFpZXqgx6B+qjbMQROr+pBqibxE
	ZgZM7OxEuW3t1/ueiWK+5yI+VSi9UebXrPg0SL6UDiz15gQMDAjooCid5UlkDVCMlh7W
	PZIO98patbU42B72DJ9KpJ1u6XLdyxrr7tdr/aHIg78ZHHxvmGOYq40uR542ZVjVIa35
	cJHqJUNYLoIrVc+BkvJKJZYDWY2GQIrzfLnrDd3JQH7+D//n+S+6E5I0JlEgTvWu4PPj
	T/jI8Ir0iHCfwhpeOHEmnpVqqgQxT7cl5+csUWWiIUO/hoVCbhcPxCAJjAFZQ9so4Hmw
	qEpA==
X-Gm-Message-State: AElRT7FSxy3U/udfTEZ7T8ywQzrFAotWh4PbBDVb7ZUf91zZQPsRxIqS
	CBDW4pwXVTu3HctmMFv2/Tw=
X-Google-Smtp-Source: AG47ELtdz9SqucnQIRu/Nt3kQdWuwiIcbOaVO1aDVuD/VnXK0KA/rPVcRmibLmhHDy42/lPX5458Lw==
X-Received: by 10.28.116.17 with SMTP id p17mr2231585wmc.137.1520728981467;
	Sat, 10 Mar 2018 16:43:01 -0800 (PST)
Received: from localhost ([217.30.68.212])
	by smtp.gmail.com with ESMTPSA id c1sm4095317wre.27.2018.03.10.16.43.00
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sat, 10 Mar 2018 16:43:00 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: Armin Kuster <akuster808@gmail.com>,
	openembedded-core@lists.openembedded.org
Date: Sun, 11 Mar 2018 00:42:52 +0000
Message-Id: <0571cdcf26fe657c0a4be428dcc2abd031648b09.1520728803.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.15.1
In-Reply-To: <cover.1520728803.git.Martin.Jansa@gmail.com>
References: <cover.1520728803.git.Martin.Jansa@gmail.com>
Subject: [pyro][PATCH 1/6] gcc-runtime: Disable libitm on riscv
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
X-List-Received-Date: Sun, 11 Mar 2018 00:43:00 -0000

From: Khem Raj <raj.khem@gmail.com>

Cherry-picked from oe-core master 21caa8bcda93ce67ef58548f7b85d0569d13d0b9

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-devtools/gcc/gcc-runtime.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/gcc/gcc-runtime.inc b/meta/recipes-devtools/gcc/gcc-runtime.inc
index 0dc405c591..b84baacb45 100644
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
2.15.1


