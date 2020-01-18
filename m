Return-Path: <raj.khem@gmail.com>
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com
	[209.85.214.180])
	by mail.openembedded.org (Postfix) with ESMTP id 80FF87FBCD
	for <openembedded-core@lists.openembedded.org>;
	Sat, 18 Jan 2020 19:41:24 +0000 (UTC)
Received: by mail-pl1-f180.google.com with SMTP id g6so11347900plt.2
	for <openembedded-core@lists.openembedded.org>;
	Sat, 18 Jan 2020 11:41:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=O4ORGJD2qzGPqQ+A3AOIfP33vbuqMWm6ceK7j1+4wU8=;
	b=poMY3RPgxLG6dDjAxq/+eKmHMQMYKr4nwUilQ9Hyg/jiHDEx1zioPyOvNJhd9KPhTz
	/a6bGcOBahipJoQx5Qej3lMxmkjNyO6veA0/YVp9fMmeMEpHacY1Tsl4zTDBCiLTtLUV
	jkutGMClmfeUTPOKCbq/GXulzqPetpvoOKaFOwRRYO6q5+b4BvIrgE1vZBwl8Yb4QuAD
	m3ykGPvTdPKLWW+mN7FwMfSHpqsglcB0CXnKFrlHobx84iK/JVwsrNaJV3HzvCY8DtZP
	8eYk0hf0g+QZ+P1Q/NnsTGwwkNo05ob8bG5t8GT/q+yGq/vgUuvP17TcL9FdcI48qAJN
	WIEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=O4ORGJD2qzGPqQ+A3AOIfP33vbuqMWm6ceK7j1+4wU8=;
	b=rfT2jn0jQZc0W+L6wByTl76UpRzdBXaU95nJzeJMtvBhpMADNE6wYwGjwj9E2FCWIP
	42FbDRE+ft7TNtgGoIbEjUc0AVbEYjiTjg47EZYc2fxXqhWByhYnzkHoCGYck9BAH4tV
	sgcKErSk8xFhR5A6cHoqfV3pOZ2++KFGt8EaV6exolQLTHIMETT2D+larFOqicdV9Qa7
	0Z7eN/3iwRLP50cOB+gxgK10go1gR+cldZNA88F4JTjoyxLUUPmiwb8AglBpRShiAVcv
	9RGuTixydaDxdBGklRZkeVMP7MMUnCRFoscXBkOPR+9Nv7ZsG27bqOP82ek5avYap/qF
	8cgw==
X-Gm-Message-State: APjAAAWuyhsv/Jr/RBhKSUkGmRtJDoWLNgOKCdDlRFXGn24DtN0NXi/T
	2DNeiIqjGJ3/mJhsDUqFA+QxajEG0yI=
X-Google-Smtp-Source: APXvYqwRKArFBooVaTqXL/C14MB8wAgXqaxNx59KL+AwpYbfqVtJFyjzS4Zlq413TEjC9TWpJjH2AQ==
X-Received: by 2002:a17:90a:628c:: with SMTP id
	d12mr14000155pjj.59.1579376485133; 
	Sat, 18 Jan 2020 11:41:25 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::cab1])
	by smtp.gmail.com with ESMTPSA id l8sm751610pjy.24.2020.01.18.11.41.24
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sat, 18 Jan 2020 11:41:24 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 18 Jan 2020 11:41:20 -0800
Message-Id: <7c6c1fc5d64dd35306b30e5be58d0a825d78b179.1579376298.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <cover.1579376298.git.raj.khem@gmail.com>
References: <cover.1579376298.git.raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 3/5] openssl: Add powerpc64 LE support
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

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-connectivity/openssl/openssl_1.1.1d.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-connectivity/openssl/openssl_1.1.1d.bb b/meta/recipes-connectivity/openssl/openssl_1.1.1d.bb
index 458ae7daf4..7fd0f9a269 100644
--- a/meta/recipes-connectivity/openssl/openssl_1.1.1d.bb
+++ b/meta/recipes-connectivity/openssl/openssl_1.1.1d.bb
@@ -102,6 +102,9 @@ do_configure () {
 	linux-powerpc64)
 		target=linux-ppc64
 		;;
+	linux-powerpc64le)
+		target=linux-ppc64le
+		;;
 	linux-riscv32)
 		target=linux-generic32
 		;;
-- 
2.25.0


