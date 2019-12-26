Return-Path: <gomonovych@gmail.com>
Received: from mail-lf1-f65.google.com (mail-lf1-f65.google.com
	[209.85.167.65])
	by mail.openembedded.org (Postfix) with ESMTP id 14A8D7D2FD
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Dec 2019 11:24:31 +0000 (UTC)
Received: by mail-lf1-f65.google.com with SMTP id i23so18328151lfo.7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Dec 2019 03:24:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=BxoupZSMRE2DTDjIRAiiuu/ngeO3LqFT1wbUZB1u1O0=;
	b=cvqUoi+l9KsF8YLPZV8hZQTNVJpOh15qUPLjIe4qqRy18MhAhmbOkfhGmxTQ0XhUnS
	HeYjFCMztgkR4bVZvZ2zoPElaDrF/Qho0ZW0bJwkSl+5BdGCZUV6D2RyZXQyseVswP+K
	2zLwfp1Jz6XA5xfeCBadD3jtmi1a2d1RbWqi9Lzh4vpTjxxCDUi0rPmt6hbO62INfENc
	vZO/bCaLdvCyo+B0+nb1+bJYrs8/yEFG/vjHIbxpu8PvdvQJDZ7a8raWpbGX4qEsfjnW
	GCXT3z12N/W1DK5I+moMeE+becm6Q0u7tPMxa7R5Q9401idpKLHJYlTXseBIDmF1Ny/z
	9DOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=BxoupZSMRE2DTDjIRAiiuu/ngeO3LqFT1wbUZB1u1O0=;
	b=qAvSR/7eFXRJw/+HJAaU7Sw753sPGOFF6GImM6kgLWmX5Q9JoB5WSbX5V+RAytpY3C
	9bq8+pS7qFMfcaW4Q1ePsDTywdkRm2wNP7jXrFlWW70jLUCe2Aa5nfDoKddtMFNbXRD8
	ZLJLUi8qcUsqjzogTghUHXTP4aCx4klomxXeNDoJoPA2nM2lf3vKmw5/CxT5iIvPG7xB
	dgairf53z4ztRsNi8nvKartOGsJ3kds0wk6F+ZMCUxrzZMhix4AckdzgDydtdrB7pEL+
	Qr4ZT8piSo5TmdBAeFP3Zr6sUfjtYlDAn8wo9PZ9yXDSCWy+nOxJo8yPNi6UNCYCJwlF
	Vefw==
X-Gm-Message-State: APjAAAVmVlX/bhn5NAHo5mHGrn+SuvRLMCHC7J8pk+B0joBJ3DGvacK+
	gJrKPHFmL3hYDsJtbBhr4oVL0BsJDmV6sw==
X-Google-Smtp-Source: APXvYqy/XHFSpSZiHPHa642fbilgs9NkD8T9Xf3MWf/eplr9+K+fNUoZU9viV1eZXP2D63vNKWiVbw==
X-Received: by 2002:ac2:599c:: with SMTP id w28mr26869616lfn.78.1577359472258; 
	Thu, 26 Dec 2019 03:24:32 -0800 (PST)
Received: from kbp1-lhp-A00636.cisco.com ([195.238.92.77])
	by smtp.gmail.com with ESMTPSA id
	a19sm12128205ljb.103.2019.12.26.03.24.31
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 26 Dec 2019 03:24:31 -0800 (PST)
From: Vasyl Gomonovych <gomonovych@gmail.com>
To: openembedded-core@lists.openembedded.org, zhe.he@windriver.com,
	ross.burton@intel.com, andrea.adami@gmail.com
Date: Thu, 26 Dec 2019 13:24:25 +0200
Message-Id: <20191226112427.9759-1-gomonovych@gmail.com>
X-Mailer: git-send-email 2.17.1
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH] kernel: Make symbol link to vmlinux.64 in boot directory
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
X-List-Received-Date: Thu, 26 Dec 2019 11:24:32 -0000

Some mips 64 bit platforms use vmlinux.64 image name
Make a symbol link to vmlinux.64 in arch/mips/boot/
---
 meta/classes/kernel.bbclass | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index ebcb79a528..750988f4e5 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -613,6 +613,9 @@ do_kernel_link_images() {
 	if [ -f ../../../vmlinuz.bin ]; then
 		ln -sf ../../../vmlinuz.bin
 	fi
+	if [ -f ../../../vmlinux.64 ]; then
+		ln -sf ../../../vmlinux.64
+	fi
 }
 addtask kernel_link_images after do_compile before do_strip
 
-- 
2.17.1


