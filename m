Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 192D660043
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Mar 2017 16:41:14 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id x124so5024687wmf.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Mar 2017 09:41:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=rGRh0VVKo9eIscuLbbpocDLyJzBRb/bipRs3qjD5rUg=;
	b=Jx1bX5AsNGQLf3HL230jBvfFMekGofWh0966ixR/S3HDhE7UQSDF+0oZ4YZrPha+TQ
	JGtvhH4R2cTIqjs5XAmTGw5tvY1FT10D3IPKi2pKAKeU3Uck3pjcIeO3hSlonDvBoioj
	y+/l0EZSEjFvkgm20vVSVv2PEhe+d95kGhtyMI4+YRopIk2w3Bf4L4MPaCzAxhRIl0w4
	DtaJA/9Eu8VNV/GyiqkCudZq0Hvax6DV0PZPK405idOXdEzTNLZ6H6fPOp3ac67rl6EX
	dOK6XgfuBYbF4V0KngEfQMNkrm9QopQSknXe7W+HVlc4o63AYAYcsLeQ582eyivsocNY
	7XXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=rGRh0VVKo9eIscuLbbpocDLyJzBRb/bipRs3qjD5rUg=;
	b=hCvrMWUIqUhXDnGPwd6aJ1WRc4fLM7i6qb6bbv94c7sq7MxAfUEOSO2w1UWOzf8nKI
	NWVDm2NF661kxwV7iBe9Iw6Jn3VB7tPO9sOuI3/9prOLculWhvhgvN5NNEM0lWdtxkkj
	V2HgyIAMDnTjM3xtUX/jTzsvrJuqILp62L5LRm+APYj92k7VhEIIMOMbUVOgdOP6SjGb
	bKeTw5ZU3yiLgVOHqRvh+nQ+Ss1uSaPj+dO9Cda9FAWYfkpYxo+Nk+Bbn7hBGrwWjVtc
	dO0ndtxiLuH1N/YjJja3QsD8zrl65N8mM5Pv1/I4nckq0mTVhm9Zrs1Jmmqpuylu7oR4
	vwXg==
X-Gm-Message-State: AFeK/H1JgqpJNKsjRTXj3/w7SFU2VcNXkL31o9jd1zTq8VcfMkKMc8wzDz7CT+CWn/b4Gg==
X-Received: by 10.28.132.20 with SMTP id g20mr10372969wmd.68.1489682475319;
	Thu, 16 Mar 2017 09:41:15 -0700 (PDT)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	s18sm4920199wmb.18.2017.03.16.09.41.14
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 16 Mar 2017 09:41:14 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 16 Mar 2017 17:41:13 +0100
Message-Id: <20170316164113.15951-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.12.0
Subject: [PATCH] bitbake.conf: Add few more binaries to HOSTTOOLS_NONFATAL
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
X-List-Received-Date: Thu, 16 Mar 2017 16:41:16 -0000

* add: join nl size yes zcat

join    - netcf               - http://errors.yoctoproject.org/Errors/Details/135208/
join    - fontforge           - http://errors.yoctoproject.org/Errors/Details/135209/
nl      - dash                - http://errors.yoctoproject.org/Errors/Details/135215/
nl      - klibc               - http://errors.yoctoproject.org/Errors/Details/135198/
size    - iptraf              - http://errors.yoctoproject.org/Errors/Details/135204/
yes     - libnet-ssleay-perl  - http://errors.yoctoproject.org/Errors/Details/135197/
zcat    - scsirastools        - http://errors.yoctoproject.org/Errors/Details/135205/

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/conf/bitbake.conf | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 0de8a74c43..e1ebeb7bca 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -471,6 +471,9 @@ HOSTTOOLS += "ps stty ip ssh scp ping vi"
 # Link to these if present
 HOSTTOOLS_NONFATAL += "ccache pip3 ld.bfd ld.gold gcc-ar gpg sftp nc"
 
+# Temporary add few more detected in bitbake world
+HOSTTOOLS_NONFATAL += "join nl size yes zcat"
+
 CCACHE ??= ""
 # Disable ccache explicitly if CCACHE is null since gcc may be a symlink
 # of ccache some distributions (e.g., Fedora 17).
-- 
2.12.0


