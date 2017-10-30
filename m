Return-Path: <oecore.mailinglist@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 02B6B65CC6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Oct 2017 17:05:35 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id b9so17886019wmh.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Oct 2017 10:05:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:from:message-id:date:user-agent:mime-version
	:content-language:content-transfer-encoding;
	bh=pcbZX06H+TECxXd1gAQP/Nw9hCiKtcgsc9aBMCxAkK4=;
	b=SxaQuoocB7Ycq6UzRzoiv5GmDHEjyhd6hUYYoWkx2OkqsepDWTyORf6wqyeZCdbTb8
	t+GJSdhM66Vbrm8Pp2ozf6n2ppQw55gRxUbf1peseotIzch35FGPndBgPiXXDrpPq0Nc
	TzEn/O1SQoJmdQnZEI8J0CIljNMmPw1dONsL3/PLjeZV4kB/bnJ2IqYMTgZwzQEcc8xJ
	2VCAu4ywdRjQsJj9oA3OuAoNmnFTllCBnT1gy9G+ba8+f6G1Ap+Wo0bgPFzUz0I5zmDi
	7QohvJqeIjBrG99BR8HkCYGA5HMXjj4K7/HQVgBwHvTlezCgdwa2dHyDMn/JM9pqK2g5
	NmJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:from:message-id:date:user-agent
	:mime-version:content-language:content-transfer-encoding;
	bh=pcbZX06H+TECxXd1gAQP/Nw9hCiKtcgsc9aBMCxAkK4=;
	b=Xwx35n5nk+nz2dG7ORn7GxpUQRdSDmJvOZiMibTMcdv7+Yvj/VgsHcCAxbfXPwH5fZ
	0TMSdEKlShYWWbSpuE9Ngop74S70KXofvuFOc9piUnThqrIB9+0nVkmpM9KsO8HXE1fE
	YrgGEuPuDJD0LAPUsnYt690/FTdtWOZKbyRjwfkdV/UdGYCGPzue426k2zDBMxunYa0z
	vFI7e+l0B19qeuaUII7mBaCQMGtSTtNpBI1hx2akvPjL/gkUgyd0ivn1Vc5ckIXM8wxT
	0KQVwOk+JU6QrAQ0dY6u3tvwC74LNkTEv7HxU2LgzZwWlXKM1lCNdDuScpupdMZ3Ch6n
	jkxQ==
X-Gm-Message-State: AMCzsaX/5nOtqc5BU1Y+gnP3dxjMS3N+FGYuen+vbWoctXT5QdU0wWGY
	e6fcSpfqJbDyGDfoPE31DIs=
X-Google-Smtp-Source: ABhQp+RGSG8Ub0Ml+eOrbH0f+eF3OWEqXaw/zbHF8Z/XvsMkl1/++WET9MQPqVk2r66Th71XKGZy9g==
X-Received: by 10.28.160.23 with SMTP id j23mr4890292wme.125.1509383136952;
	Mon, 30 Oct 2017 10:05:36 -0700 (PDT)
Received: from [192.168.42.50] (ppp-2-86-162-66.home.otenet.gr. [2.86.162.66])
	by smtp.gmail.com with ESMTPSA id
	d129sm3000065wmf.34.2017.10.30.10.05.35
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 30 Oct 2017 10:05:36 -0700 (PDT)
To: openembedded-core@lists.openembedded.org
From: Robert Berger <oecore.mailinglist@gmail.com>
Message-ID: <4edfeaa2-6f07-27eb-1294-65b1cc1aefa1@gmail.com>
Date: Mon, 30 Oct 2017 19:05:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
MIME-Version: 1.0
Subject: [PATCH v2] nativesdk-packagegroup-sdk-host: remove redundant LICENSE
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
X-List-Received-Date: Mon, 30 Oct 2017 17:05:36 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit


*) packagegroup class sets a default value for LICENSE
*) usually packagegroups don't contain a LICENSE
    and if they do it's many times a copy/paste and doesn't
    reflect the license of the packages included in the
    packagegroup

Signed-off-by: Robert Berger <robert.berger@ReliableEmbeddedSystems.com>
---
  meta/recipes-core/packagegroups/nativesdk-packagegroup-sdk-host.bb | 1 -
  1 file changed, 1 deletion(-)

diff --git 
a/meta/recipes-core/packagegroups/nativesdk-packagegroup-sdk-host.bb 
b/meta/recipes-core/packagegroups/nativesdk-packagegroup-sdk-host.bb
index 2ca6392..aee4a03 100644
--- a/meta/recipes-core/packagegroups/nativesdk-packagegroup-sdk-host.bb
+++ b/meta/recipes-core/packagegroups/nativesdk-packagegroup-sdk-host.bb
@@ -4,7 +4,6 @@
   SUMMARY = "Host packages for the standalone SDK or external toolchain"
  PR = "r12"
-LICENSE = "MIT"
   inherit packagegroup nativesdk
  -- 2.7.4


