Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f196.google.com (mail-pf0-f196.google.com
	[209.85.192.196])
	by mail.openembedded.org (Postfix) with ESMTP id D721B780C3
	for <openembedded-core@lists.openembedded.org>;
	Sat,  8 Jul 2017 13:34:40 +0000 (UTC)
Received: by mail-pf0-f196.google.com with SMTP id q85so8249559pfq.2
	for <openembedded-core@lists.openembedded.org>;
	Sat, 08 Jul 2017 06:34:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=9vjVN0LOj/b+M8BvjHyqYTkC5GClHoTjiDhwra1N6sQ=;
	b=QEmZOlWzhUySMREjxu2AJbor84cR7yg2h4XhkkEUnySGgFsqtkxZDNRTcSgWrKGShh
	aathmR6pW68SlzEtrsVnuEIjrn8bBQpTCRau0rEdluIfjx+CqxqbEXoDQ0m64DdYUfhx
	HhaYGVeuLKiWDAo+fGU0BvGvJg07I1Yhd+XemX0mz9cWkJOmC/x/nhJA05UA6Ry4b6UZ
	Lyv+sApNYjmImdj3pEXQcWcCha1RGul4spAtv3NULfO+xB7QMfUXVAVL8nMIzkWmV5wd
	dNXa8P6EyLz6phzkzVP3buJHiSsqcl5/uhhvJbOZU1SGM0bPrYtlbZ0QmaK4vc3fg0QO
	mR3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=9vjVN0LOj/b+M8BvjHyqYTkC5GClHoTjiDhwra1N6sQ=;
	b=pYkySaMu0ci/RdronxDuWeHVJcN1rNzYu0rDZWURX+VHcniTpnNLh7KlcD6XtSEW/5
	xFe0ZjCLOw8deJ9xtzuQRsaKRiAvx8MTpqd8x17XqaiszygwkWDaPQoUZwh5CkAAU89K
	HVohgvDSMc8c776SyhZL2Jx1yohU1JVw8G92y6TtkRzEZ4ErI/gKwPpuSJpCvDKAsi75
	Q7cWU/GXhCf0cOkpkESl5vyRiTubxiKk8fywPSRKperO+kIKbGhr+p9HMtNN5HvMpTpf
	//vWiP1a9KY2C3ct8097HJGcDpAK+/02vUXqUapGbX3Ft0a2Zg07kKrwFiCPFmVv5Elu
	h4vA==
X-Gm-Message-State: AIVw111r9jPNPNjyEEe9CtzalFgdZIyjnOHKE6mTUAIB5m+DiktnzrXG
	tpcjGpaT2OAT9Tot
X-Received: by 10.98.160.133 with SMTP id p5mr36180158pfl.226.1499520881697;
	Sat, 08 Jul 2017 06:34:41 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::7028])
	by smtp.gmail.com with ESMTPSA id
	i27sm15575561pfi.82.2017.07.08.06.34.40
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 08 Jul 2017 06:34:40 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat,  8 Jul 2017 06:34:22 -0700
Message-Id: <0bb8d53926f0d5d1bfcd47f9462983ca82ea0e17.1499520469.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.13.2
In-Reply-To: <cover.1499520469.git.raj.khem@gmail.com>
References: <cover.1499520469.git.raj.khem@gmail.com>
Subject: [PATCH 03/10] glibc: Enable obsoleted nsl
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
X-List-Received-Date: Sat, 08 Jul 2017 13:34:41 -0000

libnsl has been obsoleted in 2.26 and will be removed in future
until them we enable it

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/glibc/glibc_2.25.90.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/glibc/glibc_2.25.90.bb b/meta/recipes-core/glibc/glibc_2.25.90.bb
index ed924e9f0d..62ade4afb9 100644
--- a/meta/recipes-core/glibc/glibc_2.25.90.bb
+++ b/meta/recipes-core/glibc/glibc_2.25.90.bb
@@ -75,6 +75,7 @@ EXTRA_OECONF = "--enable-kernel=${OLDEST_KERNEL} \
                 --with-headers=${STAGING_INCDIR} \
                 --without-selinux \
                 --enable-obsolete-rpc \
+                --enable-obsolete-nsl \
                 --enable-tunables \
                 --enable-bind-now \
                 --enable-stack-protector=strong \
-- 
2.13.2


