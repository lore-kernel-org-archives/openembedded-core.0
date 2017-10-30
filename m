Return-Path: <oecore.mailinglist@gmail.com>
Received: from mail-wr0-f193.google.com (mail-wr0-f193.google.com
	[209.85.128.193])
	by mail.openembedded.org (Postfix) with ESMTP id 4054271CB3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Oct 2017 14:42:09 +0000 (UTC)
Received: by mail-wr0-f193.google.com with SMTP id y9so12843869wrb.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Oct 2017 07:42:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:from:message-id:date:user-agent:mime-version
	:content-language:content-transfer-encoding;
	bh=AVwecwbBo5fhHc8pj0E2EREuImzwEbqMYnykCwLsMmA=;
	b=tJwOsA8vVue7mwsXZ5ydZX7YwcafkZtQd3bdkhJweCOo1UCF1k6A40uQZylJZU/6ZC
	HhuKpM4wn53iULjQR+3fLb3UeEHHdP7FByQM5zQfIDf7ai9EXZcqxoIpu+1kKAFVoBfI
	b1/zX9C0SLNr1Pi7AqzaHno1cciOFLb63wV0PUa6x4qzHiT06qcUsZukGMxgeu0sWyyc
	vXR+m+4XyJ7k5WEmwFuop4smvKU7GZ+yoL5zVm/lrcvn71TxoHmV1Fev9pMZXnIuMqlR
	lespLiirsRJQz8LVpDcpSoXBsDlGJqDnsb+WUUohwSvQXJmHUg0ITAsnfzjZD36LgdW/
	crkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:from:message-id:date:user-agent
	:mime-version:content-language:content-transfer-encoding;
	bh=AVwecwbBo5fhHc8pj0E2EREuImzwEbqMYnykCwLsMmA=;
	b=TQhfSLOImQyefUG1747t5kcQ5jfiJMjCBxrOo5hddYThv0wiHFWWJGTqDdTW/vuRB8
	JecWL1wWrlWNQWHXy1QX++M0oWSzI2cSUCnvuTC/IRW9DMPUkFPI3Y3/yKmnKUH6kKl8
	e0v7QeYOZEc+IIrOtZa7JvSxV4V1G6tB8yTBMErnT6OsSujF+AsFuRLywo8b+bu5ihqD
	LZhYiz/4KL1XNffowaFDAPlgscUdpRkkACeJBLqSjMrtqXDSmyaCL38/26QIO3HKEOGw
	7JTvXF/+BxSPij5uTNxiOcX3Xk8fJ8Lr8oE7W7hL/DPBxIY4d4nfsZ9+ACPuOKzjtSDa
	fswg==
X-Gm-Message-State: AMCzsaUOAwq438gACgYqfgbAFDXLTlVuErJGvcqPx0+EtS3EGV2mk4pc
	wYQXX5fHGUq3zunbMsyvQ5k=
X-Google-Smtp-Source: ABhQp+RyvEInNQi31gMlWBvghanDebfeK2ryAKOIsfu5HKl/g/1VTxelxN7wgPzuzEaHCBSobgFNtA==
X-Received: by 10.223.166.181 with SMTP id t50mr7665228wrc.251.1509374530247; 
	Mon, 30 Oct 2017 07:42:10 -0700 (PDT)
Received: from [192.168.42.50] (ppp-2-86-162-66.home.otenet.gr. [2.86.162.66])
	by smtp.gmail.com with ESMTPSA id
	b81sm2508647wmb.6.2017.10.30.07.42.09
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 30 Oct 2017 07:42:09 -0700 (PDT)
To: openembedded-core@lists.openembedded.org
From: Robert Berger <oecore.mailinglist@gmail.com>
Message-ID: <2e5ae597-e0c1-6caf-c8b4-33f0a7f75890@gmail.com>
Date: Mon, 30 Oct 2017 16:42:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
MIME-Version: 1.0
Subject: [PATCH] poky: LICENSE in packagegroup makes no sense - removed
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
X-List-Received-Date: Mon, 30 Oct 2017 14:42:10 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit


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


