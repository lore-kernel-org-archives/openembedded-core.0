Return-Path: <maciej.borzecki@rndity.com>
Received: from mail-lf0-f45.google.com (mail-lf0-f45.google.com
	[209.85.215.45])
	by mail.openembedded.org (Postfix) with ESMTP id 07EEC6E5FC
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Mar 2017 12:44:45 +0000 (UTC)
Received: by mail-lf0-f45.google.com with SMTP id z15so19687431lfd.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Mar 2017 05:44:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=rndity-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=NnPbflwj6xaFRPAu7OmaIvt3niVRPQt7TdYnnqRoghs=;
	b=zH5N7VhdMlaZbYQBI8IZ9Vm23tjWEHvfPFKVryjiKvauN7W/rtLUZ7ZUopeijSgzYw
	nAXS9oyVjoI1qsQfZ6JY8gBD0y9oEPPlFI1FikomtZ5D8Q3GbusY52wdJksu2JsIJq3w
	IlwXAxs+MzN4vy4v0/gemXQg3nNpLEeTxwRRoYpkZ9t2WuAl8U/vl8JyzxviGCR0GZdF
	EJa2Y3TYqyGzr6lMsh5JdJ6osqh3rOEvNScOJYW+aa0tBXQqZfSgjT9fa9qxskFS0txH
	Z3Q86xHjFmeLSS2dqHxlSsRRd1Q27ZXjysapjCNO1/9s5Ho7IitNmA/TEZSIPf9i7QLT
	RELA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=NnPbflwj6xaFRPAu7OmaIvt3niVRPQt7TdYnnqRoghs=;
	b=RfxwHLtU6jbWcI2QS3C+Kgu1f4zIUeHny+zbqyJbPYO/5XdmDAWWWMPV7i6Esw5Q9D
	bQ2A/fbufmEmUztEzgSCJmiqpUEEykSAafr8Dc1nTfoKSRpgrKQb7utDLqeNYkhqTnUr
	FagOnxzSiF+PmtZemiE+BYAzfejHJGa64OAh19cs3mNKSDYZixeY5eAs4UnPDqp57V4X
	7n3wqbIvCNBl70KhRVlLoQbs+e1fRj5e1b6gjw9OWEjcIOSXD9IeFfiGdPJegAVNLDTB
	Zq89EM52W2CfwtXa2ihRnL2UGPUOd8DsB/137jONfG+Hdr7+HJ94I2/CnhEWbkHc8Zcr
	HQ4w==
X-Gm-Message-State: AFeK/H03s8F7p1cEh4SYW7iVUTDIpvyt1GSAsXc16TrQnBBuMAXj4e7v4tN6edvZ/n48Rw==
X-Received: by 10.46.20.28 with SMTP id u28mr2924620ljd.11.1489668286760;
	Thu, 16 Mar 2017 05:44:46 -0700 (PDT)
Received: from localhost.localdomain (staticline-31-182-60-238.toya.net.pl.
	[31.182.60.238])
	by smtp.gmail.com with ESMTPSA id n20sm893148lfb.53.2017.03.16.05.44.45
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 16 Mar 2017 05:44:46 -0700 (PDT)
From: Maciej Borzecki <maciej.borzecki@rndity.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 16 Mar 2017 13:44:32 +0100
Message-Id: <1b6937bb34669d81fd370eedf72b621ade65c7ea.1489668133.git.maciej.borzecki@rndity.com>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <cover.1489668133.git.maciej.borzecki@rndity.com>
References: <cover.1489668133.git.maciej.borzecki@rndity.com>
In-Reply-To: <cover.1489668133.git.maciej.borzecki@rndity.com>
References: <cover.1489668133.git.maciej.borzecki@rndity.com>
Cc: Maciek Borzecki <maciek.borzecki@gmail.com>
Subject: [PATCH v3 1/5] selftest: wictestdisk: machine agnostic WKS for use with selftest
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
X-List-Received-Date: Thu, 16 Mar 2017 12:44:46 -0000

Add a kickstart for an image that is not limited to use on x86 compatible
machines. This allows us to run more wic tests on non-x86 architectures.

Signed-off-by: Maciej Borzecki <maciej.borzecki@rndity.com>
---
 meta-selftest/wic/wictestdisk.wks | 7 +++++++
 1 file changed, 7 insertions(+)
 create mode 100644 meta-selftest/wic/wictestdisk.wks

diff --git a/meta-selftest/wic/wictestdisk.wks b/meta-selftest/wic/wictestdisk.wks
new file mode 100644
index 0000000000000000000000000000000000000000..d4de24d83097dab2851dbf5f2b6884679de7c77c
--- /dev/null
+++ b/meta-selftest/wic/wictestdisk.wks
@@ -0,0 +1,7 @@
+# short-description: image for use in machine agnostic wic test cases
+
+# /boot is intentionally an empty partition
+part /boot --ondisk sda --label boot --active --align 1024 --size 16
+part / --source rootfs --ondisk sda --fstype=ext4 --label platform --align 1024 --use-uuid
+
+# bootloader is intentionally left out
-- 
2.9.3


