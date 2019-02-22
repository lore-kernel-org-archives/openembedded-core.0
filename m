Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id F17CC7CBE5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Feb 2019 14:33:58 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id w17so2576673wrn.12
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Feb 2019 06:34:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=SJP4DWLGnNq33eOnd4m3y56YH3zNcTOmAhzBsYa67zk=;
	b=OiMbKvZcS19XqvfPVZBa5KUpTW/jbL40NbtENlyR5HKYmugXy7aDBEVicPUki8JJ/0
	/Ae3zMZ/WwsJau0c3Ma+V5RE0AQ6AVMHGhHpjhZoWt7qK4Out7xwBT6L5oDcoARV4tO5
	GNboY3v5EGWTNF8NAEb0JmkVSTFrujpaLDd53vL8XsYf3lgnLdjVszwbrYYmFqsyRMnH
	AU6AkcYKav6MywVA18ofsvY2UMmx4HTw4Ur6p+FsWlZBAtNBA/HBWgjocFQRjdJuVsvd
	m5NGNBalrMC8FtzSi3PEPI/VdD8MlAovrB7yUfRLSVhNYHY2pngrUQW53vJSetjW4NLc
	yaCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=SJP4DWLGnNq33eOnd4m3y56YH3zNcTOmAhzBsYa67zk=;
	b=CoQFRPif4Z/V6wHi+YJo5FAhU5MZJyO+BPblBC/RdgOMHT1kuuK4nYN/aDJSkW6CdX
	LAKaSio2X1rUOkEnqSUpUPkdvWXuPnkq9fxKFtXRgTUQ/BqDYYBDEA2D1txwTg6NMvb1
	SQD8nHKUEvpom2jcWoKvaaZ/9K2Q/gJR8Eake7MOQlIv7e5PJlV2Y53A3RsJdmi72NAK
	yKb7RRjDhl4fDkN5D/ytS6M7pkiESJzq0jTEm/w8QPRRauxTsNOdZch7+UqDl3kTvGao
	Ai86eaod4w+0RTRkaaFedyroZ0A8NwONzX+LOG6xOu4axiiajpY2hn4OYLUVZhX3qZO6
	7FWQ==
X-Gm-Message-State: AHQUAuY5UTWsZTLLKDCtXEtTf3Ho4Y4X+o/sLs3tdE/eaxX4xq+h4I+l
	Nmcp6Igg5gfiAfsIaOIltUU05Z78
X-Google-Smtp-Source: AHgI3IbPy1+nlYfMQnTxk8SBRjnXz71zBbqj8GlFEiFqu/7q74/rdzs0ghRYymvceBqRvSyh/An/eQ==
X-Received: by 2002:a5d:498a:: with SMTP id r10mr3351585wrq.188.1550846039377; 
	Fri, 22 Feb 2019 06:33:59 -0800 (PST)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id p1sm2085184wrx.50.2019.02.22.06.33.58
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 22 Feb 2019 06:33:58 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 22 Feb 2019 15:33:40 +0100
Message-Id: <0127d33905240d139e666488a57e25c45424e2bf.1550845989.git.alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1550845989.git.alex.kanavin@gmail.com>
References: <cover.1550845989.git.alex.kanavin@gmail.com>
Subject: [PATCH 05/12] qemu: remove support for building against host sdl
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
X-List-Received-Date: Fri, 22 Feb 2019 14:33:59 -0000

This hasn't been the default for a long time (as some distros don't
support it), and with gtk+ being the new default shouldn't
be needed at all.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-devtools/qemu/qemu.inc | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index 07f78058e7b..dccf9dcb00c 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -39,14 +39,6 @@ export LIBTOOL="${HOST_SYS}-libtool"
 
 B = "${WORKDIR}/build"
 
-do_configure_prepend_class-native() {
-	# Append build host pkg-config paths for native target since the host may provide sdl
-	BHOST_PKGCONFIG_PATH=$(PATH=/usr/bin:/bin pkg-config --variable pc_path pkg-config || echo "")
-	if [ ! -z "$BHOST_PKGCONFIG_PATH" ]; then
-		export PKG_CONFIG_PATH=$PKG_CONFIG_PATH:$BHOST_PKGCONFIG_PATH
-	fi
-}
-
 do_configure() {
     ${S}/configure ${EXTRA_OECONF}
 }
-- 
2.17.1


