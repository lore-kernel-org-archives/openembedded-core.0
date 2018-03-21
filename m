Return-Path: <armccurdy@gmail.com>
Received: from mail-pf0-f196.google.com (mail-pf0-f196.google.com
	[209.85.192.196])
	by mail.openembedded.org (Postfix) with ESMTP id 7AD0278966
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Mar 2018 02:42:40 +0000 (UTC)
Received: by mail-pf0-f196.google.com with SMTP id h11so1463526pfn.4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Mar 2018 19:42:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=JwTA1a0Hl48lJUMMVDAw9rysxGSN05BsA0aQWndQqWw=;
	b=biEfGF1/M09yGc0qwN+uwbhQN5PyqZKSC49vW1jZW8kYz5vedLXpGbSDDdhIVAxspz
	ixlZuzteTtiwc34Jr/9TQVrrAs1TsCEppfoAsakWnIQ2tBTI2QBQDR6766la9o99QS3k
	p32bWWMUgy0wxL+3nao6fzgS7MQqDelCM/VXHT72Dw+RQ6vntMuio7D9H91ynvGK00pc
	5Tz8t1frCSfNnhP3mXjye/wgqC0+N8/H8iROe79Vjahzu9cP1wXmAQXIGkZSk4vWAoUH
	jIdqLD/gh2vjTwlbIk3rK8dicaVxguxaOxPhptRZ3e6gRUuaiJPzTjv1dGyCqkTFIAMQ
	BD+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=JwTA1a0Hl48lJUMMVDAw9rysxGSN05BsA0aQWndQqWw=;
	b=PXsYg/Piglx2sUIfx4Z7SUATCd3U7GQPZIMIjDWash77qwUkLQB4dQk84q8RQqRAbh
	VdMuwOcH4ZyCYx41Et4/j2pveD2fRsNMQcIU3nmp0sZzhZvDwkOfF+1VQ4kQaYRWGczP
	eIFTCelD1jfqeFpIJ1FpeNCfNxJlQKaZXNJatELLlIKJfTLH8ZIlYxCNtaC9251ihuXl
	InezIcEleWqSIVuXn352owfpZxjOsdrLtTUUjuvBxizoBN1d8BWHi5dTQSMC1aiDLuUt
	OTYV5o/bi1ZNcBwsAaagPcaZXTAE+p62GZsVeVlPA3iG59NuJ1vpnK4h9q7U9t9ZqKyz
	kMZg==
X-Gm-Message-State: AElRT7F0pKeDeg9NR8USifqgesWSjDkIsyNlBmYoFGcQvjw573l8U21p
	rDczd1/yUholsKh5YmrL780MwQ==
X-Google-Smtp-Source: AG47ELskUvU35+4mkyrXoqLYizVSS3L53p/W6aCMPos2JT53m/DSgKKgt6mhWQXEckEKWffIkevrfQ==
X-Received: by 10.98.213.9 with SMTP id d9mr8933506pfg.234.1521600161530;
	Tue, 20 Mar 2018 19:42:41 -0700 (PDT)
Received: from e6520.cablelabs.com ([4.16.80.121])
	by smtp.gmail.com with ESMTPSA id
	12sm6172559pfr.108.2018.03.20.19.42.40
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 20 Mar 2018 19:42:40 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 20 Mar 2018 19:42:25 -0700
Message-Id: <1521600149-3894-3-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1521600149-3894-1-git-send-email-armccurdy@gmail.com>
References: <1521600149-3894-1-git-send-email-armccurdy@gmail.com>
Subject: [daisy][PATCH 2/6] kernel.bbclass: Remove bashism
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
X-List-Received-Date: Wed, 21 Mar 2018 02:42:40 -0000

From: Khem Raj <raj.khem@gmail.com>

Fixes build on systems using dash for default shell e.g.

errors like

run.do_strip.25842: [[: not found
| readelf: Error: Unable to read in 0x37 bytes of section headers
| readelf: Error: Not an ELF file - it has the wrong magic bytes at the start

Change-Id: I29cac15be44a02d75a3d6889b6ae9b2e19bf46af
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Ross Burton <ross.burton@intel.com>
(cherry picked from commit 6956ffdc6e9879e32360b6ee3a3d286618807485)
Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/classes/kernel.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index 922752b..049f86b 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -391,7 +391,7 @@ python split_kernel_packages () {
 
 do_strip() {
 	if [ -n "${KERNEL_IMAGE_STRIP_EXTRA_SECTIONS}" ]; then
-		if [[ "${KERNEL_IMAGETYPE}" != "vmlinux" ]]; then
+		if [ "${KERNEL_IMAGETYPE}" != "vmlinux" ]; then
 			bbwarn "image type will not be stripped (not supported): ${KERNEL_IMAGETYPE}"
 			return
 		fi
-- 
1.9.1


