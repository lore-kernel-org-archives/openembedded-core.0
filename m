Return-Path: <just.another.mariano@gmail.com>
Received: from mail-oi1-f195.google.com (mail-oi1-f195.google.com
	[209.85.167.195])
	by mail.openembedded.org (Postfix) with ESMTP id 266907BD72
	for <openembedded-core@lists.openembedded.org>;
	Sun, 19 May 2019 21:21:38 +0000 (UTC)
Received: by mail-oi1-f195.google.com with SMTP id 203so8567516oid.13
	for <openembedded-core@lists.openembedded.org>;
	Sun, 19 May 2019 14:21:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=nMOTncl3MLtLforAkiCRcErqQn8JXDb4x1h+l3GCYr8=;
	b=dFZYHE2JLOE+uJQJw6tuyPuuMFgfJ/bvLUKP2LGXJ1cCm2Sd4eTwoo4yS1ZpTiHZO8
	ElbjxjXMnFQbrgOzET2z8QHJOeC5M4L6z9hBna9RCSmcl/0CC42Ic+4kusPczdtf8hiG
	whlp9NF2ZxXzJIkhWeEdrghvhtkRfXOh0HMAdE+XmgUDBTPNU4gDkBf7qZApRC4S08HC
	DEcEk1cVoVA5LxfRhMsO/9XErT3Vnnf33BiYiqAHkVpeTohaLM0cx7SVmL1DWsZLI3uz
	zu2samw1Ft72987FTHlncMISKpFSsk7phLKw8j2ypMC86rvkYRNBjBxdOZdn8bawVyJ5
	DIZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=nMOTncl3MLtLforAkiCRcErqQn8JXDb4x1h+l3GCYr8=;
	b=B3xH9ZA/hzdDRCKdQjPMlj5TBKMty2X7P1h2fohJ6grRXoV8oc8h05VOTSX24pBUe8
	J3MFKLhyHD0s8dEoJYkYmRzwDrPrAwzBLMtf71muYda3dRAvcmp1ZC11yCbijw7o7itt
	iJNaNjRHkKwr/i4UlyKB49UEfvKxiPXmzhpoi2dpDwRBBH9h4UTAi6zseR2DVBNdzaAx
	pD2UpHyMp95bqED0oE2q1uUJUTLIEs3AGFSu/X6DYrwBqdICJ/fCFW13aMYfy0EndXLE
	CgkmBnbMjRf8X1gE/1u1jdHbc+4vDsxvbfKJW20mJD/vlGXpGeWU3CuBPuAcxf4zW37R
	TM5Q==
X-Gm-Message-State: APjAAAU9Vc7O6CWqXR5Y5Bom1w7HuBQcnV5NFq9nsquEjdpGROqFzKcn
	XsWQ0Glkp3YSZmdF5e9AhTKnbPBh
X-Google-Smtp-Source: APXvYqwIsqksgLSoEr4YXqFdSGUgOf6j+qkqeo/f9sfgE8Z/r65zyYuvahnd9cVzQ25gDUAOiEZIkQ==
X-Received: by 2002:aca:dac3:: with SMTP id r186mr20668064oig.94.1558300899916;
	Sun, 19 May 2019 14:21:39 -0700 (PDT)
Received: from ultima.ninicasiopea.net
	([2605:a601:43d5:f700:215:17ff:fe90:1065])
	by smtp.googlemail.com with ESMTPSA id
	z20sm5292939otm.33.2019.05.19.14.21.38
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 19 May 2019 14:21:39 -0700 (PDT)
From: =?UTF-8?q?Mariano=20L=C3=B3pez?= <just.another.mariano@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 19 May 2019 16:21:18 -0500
Message-Id: <c7d776cebebd9bf2c28d43aad3fd911101283572.1558300553.git.just.another.mariano@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <cover.1558300553.git.just.another.mariano@gmail.com>
References: <cover.1558300553.git.just.another.mariano@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] util-linux: Add missing ptest dependencies
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
X-List-Received-Date: Sun, 19 May 2019 21:21:39 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

There are some missing dependencies for the util-linux-ptest package
that causes inconsistencies in the package tests run in different images.

The kernel module in RRECOMMENDS is not build at this time, it needs
more testing and check if the configuration change can be part of the
yocto-kernel-cache repository.

Signed-off-by: Mariano López <just.another.mariano@gmail.com>
---
 meta/recipes-core/util-linux/util-linux.inc | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-core/util-linux/util-linux.inc
index 34255a2dec..6dfbe0b683 100644
--- a/meta/recipes-core/util-linux/util-linux.inc
+++ b/meta/recipes-core/util-linux/util-linux.inc
@@ -142,7 +142,8 @@ RDEPENDS_${PN}_class-nativesdk = ""
 RPROVIDES_${PN}-dev = "${PN}-libblkid-dev ${PN}-libmount-dev ${PN}-libuuid-dev"
 
 RDEPENDS_${PN}-bash-completion += "${PN}-lsblk"
-RDEPENDS_${PN}-ptest = "bash grep coreutils which btrfs-tools ${PN} sed"
+RDEPENDS_${PN}-ptest = "bash bc btrfs-tools coreutils e2fsprogs grep iproute2 kmod mdadm ${PN} procps sed socat which xz"
+RRECOMMENDS_${PN}-ptest = "kernel-module-scsi-debug"
 RDEPENDS_${PN}-swaponoff = "${PN}-swapon ${PN}-swapoff"
 ALLOW_EMPTY_${PN}-swaponoff = "1"
 
-- 
2.21.0


