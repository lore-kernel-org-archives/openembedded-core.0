Return-Path: <armccurdy@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id E35587017D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Mar 2016 17:19:44 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id p65so553517wmp.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Mar 2016 10:19:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=v6VxIXI8JdsCK2jYD52IdRIK27YLlC+GROLRGFJh6+8=;
	b=F16FTV5mhU+Yt3jBHJ89WvlO4ER/ZaCq4/3ZPJAB4KNiLPhr8e5AxjaFeGiM/PNs/G
	AJej2hw05CJ/s/X3JyR+ZOzK47XhCgR2nW/BK+KOqLwlWJpkCjNgckBaORYfXnVH2HuU
	LqK7nOYC+RNj/joqfGxM5kmH+fpyd0IdQ8fcelhkYFojuoc/APXfjuqu4a24D4IO1IK9
	+N9AE0VPPZk536bYEaLXBsIwB7SfREZG2Odp645R9+pDY3iOoaeyOEj4CeHeEMi/YlUG
	akFeCULS96ryvoztWOU+n3k9xK32SL4lk2ftdmXQ30+fcpfaJwcrofiHx9iahMtsC29o
	BjCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=v6VxIXI8JdsCK2jYD52IdRIK27YLlC+GROLRGFJh6+8=;
	b=Gw8GtuU8Sq23Od3TrbFb1hD+bqNsu06F3qQ0w4HG//4EFgsottp7q3aKL2KfLWOLK/
	KuLb+fg8Y6QhNzqai1iDF+Ot+RiOgsnThBfksYcdi+cPvxUYn/0wSxWZv11x074K67fA
	SqncdsRrZnYnCXAbcAMWQjuK8aZErFPUTtSyaGIih7JmIo4mY9rEcxCv7e7RytFg2vZP
	XOX+l3//w/n4JdUZN+38Q6k8KowckZsW37dC1NBTcuy0c4hD7lfgNrXGIoYqvlH+P4G8
	dLQhcTxdOs88dqZPhAebyZHRwC30mFzwuH/s37QHPiysiC8hN8c0Nl0Vaz0h14/HcnNU
	xADw==
X-Gm-Message-State: AD7BkJKpeUf+2jrSv3GIGtkjA30WEQFg+28HKwR7X2xi6oUk/a7lRo6sgqKjXzYDXNVh+A==
X-Received: by 10.194.60.145 with SMTP id h17mr11850077wjr.47.1458235185554;
	Thu, 17 Mar 2016 10:19:45 -0700 (PDT)
Received: from localhost.localdomain
	(LPuteaux-656-1-252-235.w82-127.abo.wanadoo.fr. [82.127.113.235])
	by smtp.gmail.com with ESMTPSA id
	e25sm31066139wmi.21.2016.03.17.10.19.44
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 17 Mar 2016 10:19:44 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 17 Mar 2016 10:19:26 -0700
Message-Id: <1458235169-9267-6-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1458235169-9267-1-git-send-email-armccurdy@gmail.com>
References: <1458235169-9267-1-git-send-email-armccurdy@gmail.com>
Subject: [PATCH 5/8] qemuarm64.conf: don't clear MACHINE_FEATURES
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
X-List-Received-Date: Thu, 17 Mar 2016 17:19:45 -0000

Accept the default MACHINE_FEATURES from qemu.inc (qemuarm64
shouldn't need to be a special case).

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/conf/machine/qemuarm64.conf | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta/conf/machine/qemuarm64.conf b/meta/conf/machine/qemuarm64.conf
index 8459d0f..f59fb15 100644
--- a/meta/conf/machine/qemuarm64.conf
+++ b/meta/conf/machine/qemuarm64.conf
@@ -5,8 +5,6 @@
 require conf/machine/include/arm/arch-armv8.inc
 require conf/machine/include/qemu.inc
 
-MACHINE_FEATURES = ""
-
 KERNEL_IMAGETYPE = "Image"
 
 SERIAL_CONSOLES = "38400;ttyAMA0 38400;hvc0"
-- 
1.9.1


