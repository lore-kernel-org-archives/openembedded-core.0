Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-qk1-f194.google.com (mail-qk1-f194.google.com
	[209.85.222.194])
	by mail.openembedded.org (Postfix) with ESMTP id 1464C605F2
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Feb 2020 23:12:57 +0000 (UTC)
Received: by mail-qk1-f194.google.com with SMTP id x82so3684473qkb.8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 05 Feb 2020 15:12:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=HOIc125nWwQDT8a6mGG7GnH8QjvmY/ntQbI8TPT2IT8=;
	b=OOagzB1Bdly74cX8nknt69uwcSyiY+5PxQqdo3suifAkLei89t9E5C5a1MIp08OSIQ
	OsAx6H+l+jMIBARCJEQNhQykD+UR2Ver3rL5Wl/oDeItNBpsskj6xKM2ZRszp3usuDTQ
	KBt1akwYT99HSvp+JgR5YvgDbV0hr6KrQaNyy+r1gkMkqK7GBRB5U/pFGtKOD3Bls8FS
	PScQUbzv8nzcQzSDn56c4ruhy77ZVID4jnM9LSLRMjXL4nPIPkQscE+G1jb3lpgc05Xm
	p7JASEW7G7e128b9GfysHoure3g/Qd6QW+EtDHyWDFmwGc6/ItE3Xla5gt0FsyAMh116
	EILQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=HOIc125nWwQDT8a6mGG7GnH8QjvmY/ntQbI8TPT2IT8=;
	b=FTJmUFH05FeZqUIaOMxaEPqmTVqRG/I7L4o5Itm+dLNkHkrBjtIszlP99rnmJ8bp0j
	BcLptzwUMI63Nbs3uHyW3nE5d+DNyo7xP4aT2Z2DSwsmCidXwW6jDEzQUCnp+D4R9Iko
	GDjsBYsberJTj0QXRSIKLh5mjqEy/lJf2YhxbYeHBiN+WDZ87Q+vs4fthB23QoWds2YD
	qO2VOt6Z1uE3fvOk4oVqoRKZqhSbB5sevDpPODChbzL4HHUzX3Uic4gvKrJ2rW3ZX2+q
	cVc8p4JGZ3vXxia4KDlx9HGAKfUwa58ukZynyPlBTBZjSqk02MzZor3ayplLiUsmrRND
	+nuw==
X-Gm-Message-State: APjAAAUUhwv54Lne/Wp+4jSyxJM/Ib0sW0XljkRlaIo7LkLwdNYvPBHD
	zNPF5LO3AobEV6cP9phX2CaxGN3NM4qR0w==
X-Google-Smtp-Source: APXvYqxWNvO76YSUroY5VUZdSw5nVbe++T2goIgdIjnRfmN7baJuTIVq5L+uj4Bfc3vcxKivvgmHFw==
X-Received: by 2002:ae9:f80d:: with SMTP id x13mr144037qkh.226.1580944378859; 
	Wed, 05 Feb 2020 15:12:58 -0800 (PST)
Received: from localhost.localdomain
	(CPEe8de27b71faa-CM64777d5e8820.cpe.net.cable.rogers.com.
	[174.113.11.95])
	by smtp.gmail.com with ESMTPSA id o17sm696332qtj.80.2020.02.05.15.12.57
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 05 Feb 2020 15:12:58 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Date: Wed,  5 Feb 2020 18:12:46 -0500
Message-Id: <b82f5e5c3a6271a7ea5d868bcb6a25099a7f7dc6.1580944129.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1580944129.git.bruce.ashfield@gmail.com>
References: <cover.1580944129.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 5/9] kernel-yocto: Drop setting of unused variables in do_kernel_metadata
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
X-List-Received-Date: Wed, 05 Feb 2020 23:12:58 -0000
Content-Transfer-Encoding: 8bit

From: Paul Barker <pbarker@konsulko.com>

The machine_branch and machine_srcrev variables were set but not used in
do_kernel_metadata.

Signed-off-by: Paul Barker <pbarker@konsulko.com>
Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/classes/kernel-yocto.bbclass | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/meta/classes/kernel-yocto.bbclass b/meta/classes/kernel-yocto.bbclass
index a0362f6acb..9a4d2864eb 100644
--- a/meta/classes/kernel-yocto.bbclass
+++ b/meta/classes/kernel-yocto.bbclass
@@ -99,13 +99,6 @@ do_kernel_metadata() {
 		fi
 	fi
 
-	machine_branch="${@ get_machine_branch(d, "${KBRANCH}" )}"
-	machine_srcrev="${SRCREV_machine}"
-	if [ -z "${machine_srcrev}" ]; then
-		# fallback to SRCREV if a non machine_meta tree is being built
-		machine_srcrev="${SRCREV}"
-	fi
-
 	# In a similar manner to the kernel itself:
 	#
 	#   defconfig: $(obj)/conf
-- 
2.19.1


