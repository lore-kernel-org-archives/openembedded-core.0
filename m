Return-Path: <ross.burton@intel.com>
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
	[209.85.221.48])
	by mail.openembedded.org (Postfix) with ESMTP id 00D3C7C5C8
	for <openembedded-core@lists.openembedded.org>;
	Fri,  4 Oct 2019 00:22:13 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id l3so4812596wru.7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 03 Oct 2019 17:22:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=cwOLrf5KRHEfueFpUUZ3Rm7NSTQKNqSiYYTn0NojiZc=;
	b=J9wjIdU+n71C0dbzhxpy9gYzsk8qDv85JVKckgJ8YTOG68guOQTvV0cTA93criOSAq
	T+ziqFhm15yUL2e1GZdbuMaftdiZ14gs2XcYrQJd29sFnk0DF48GAGZyGNsOpHr7ROZO
	Pru29tFvH7laRcnzCXjrEL9T2aLrsC47fouQI6JuZ8OUSCuYD1KWKdZVRwNDRbrk2YAW
	Kic4RNqGJsc81Yny0Q7q4uYB1ba9gcsywVo8ef+RtFzZpb3EJMwVc+Kpq57In8bSu03E
	bTUm9uaXbo7pPcx01V6RjBCAB/gKV2M3tlK5pchzCpsffuUeRPQpRP2EgzcWEfx/EE8q
	c7iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=cwOLrf5KRHEfueFpUUZ3Rm7NSTQKNqSiYYTn0NojiZc=;
	b=R4cjQFxaQwVUlq825iieT5QMu0izs8O+3+at+NkTEJ4sv5kAa8yxWRKoFSzHtfA/mL
	odOly4dCNR2jBQFQgUdFTtnBsU/zSdCPt/awebVVaPusaySsHqi8xit006cKls4wnJgs
	XhIjsvVNozsYe1VJK8pRkeZlld6iFESEukOKdnpi4ytdWVCcz+BIyM4if1n+0ya5krwL
	nN6tDglv7MMIja6m668hWAuYNH5rgJe8P13Ir9XLF+zD332v/gWank2rm63RJgYvTWh7
	+BlL/qGbvjC2wu1jKO02njc1sSiQp/V659jGrQFGlmi1aQ0LB6h8fA/tdjFFet0YxSqm
	yeDw==
X-Gm-Message-State: APjAAAUL4bhq2THiLLPiXUcS6b9VvNoS7sBnX1sv8KY9B5GTcpXAjjZN
	4e2fCWcw/1xIT7IOM1NtoqXTwBKZt4A=
X-Google-Smtp-Source: APXvYqy11hjVuYR5LpBaNO4NyrTNN8uly5AELniZimZT8Cd4No7cHPbh3UrDKmCAeOwyqn0KV8v+Pg==
X-Received: by 2002:adf:fa86:: with SMTP id h6mr9044171wrr.152.1570148534511; 
	Thu, 03 Oct 2019 17:22:14 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	r27sm8194246wrc.55.2019.10.03.17.22.12
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 03 Oct 2019 17:22:13 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  4 Oct 2019 01:22:10 +0100
Message-Id: <20191004002210.2095-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH] meson: fix RDEPENDS
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
X-List-Received-Date: Fri, 04 Oct 2019 00:22:15 -0000
Content-Transfer-Encoding: 8bit

Meson needs python3-pkg-resources to work to add to RDEPENDS.

Remove python3-core as this is automatically pulled in by python3-modules.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-devtools/meson/meson.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/meson/meson.inc b/meta/recipes-devtools/meson/meson.inc
index 6de109de7fd..c775489d5f6 100644
--- a/meta/recipes-devtools/meson/meson.inc
+++ b/meta/recipes-devtools/meson/meson.inc
@@ -29,6 +29,6 @@ UPSTREAM_CHECK_URI = "https://github.com/mesonbuild/meson/releases"
 
 inherit setuptools3
 
-RDEPENDS_${PN} = "ninja python3-core python3-modules"
+RDEPENDS_${PN} = "ninja python3-modules python3-pkg-resources"
 
 FILES_${PN} += "${datadir}/polkit-1"
-- 
2.20.1


