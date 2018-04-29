Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f196.google.com (mail-pf0-f196.google.com
	[209.85.192.196])
	by mail.openembedded.org (Postfix) with ESMTP id D3B08745C1
	for <openembedded-core@lists.openembedded.org>;
	Sun, 29 Apr 2018 19:36:37 +0000 (UTC)
Received: by mail-pf0-f196.google.com with SMTP id j5so5136671pfh.2
	for <openembedded-core@lists.openembedded.org>;
	Sun, 29 Apr 2018 12:36:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=21Ps+SPJ0/+LJh4UIt/AY9S2kYB49U5eugpfpW4byLM=;
	b=bImeFbBq0m2mjGzdKZ8prdoL3uccqjLNPy1opJLOiiBlB0xYmV+1YDUhVnyN0iPgPf
	xqSRTm4CX/1awNAOsodz3+B9qdkG+YvKis6pVWFFVWQ7cfb4+DLEU/1n+x7EVsW6vdLq
	a5tLU37YFxRWL64atbNzNKdBPL9bbhAjzqeNY5mUoRigvVkLr68bs/qUvBO6njBK3Fh6
	fLdesnHS1Qp2l6iuLwdEEE8G6UPvz4Jywhb7nJyghB0Al2ZvlcXyf56QK8CEseEmrraX
	U5ioO3sZFIMfU/Jlie1asy2odxM0e5aAD0Op/SJvunqGkkBmgaKOO3rIUNxik8Og+C8K
	I32g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=21Ps+SPJ0/+LJh4UIt/AY9S2kYB49U5eugpfpW4byLM=;
	b=X4g13DkR+r0M7sIykQPNdR7yvwgxGGJzuEo0iNr6UF6A4Wdg3vD3aAbJSR6jQorQIh
	4P6wZihqwXQjhB2ptshYXY8k0d6wagATyuNJ+LgHfefNm3FrWWNGQBqcE5k5XtpxfD9Y
	i21obkiRnBOrujX/E9+NuG0/NG/Avp5xLkIbfvYMcZBdIZuFLdW6PozouBqOI1MGko2/
	q9yiLwlYPxIHh/QB56Pc2IILYyXGsObPubNnx2a5GduLlUPLuGoc8pjD+UIXg+04pANv
	CDMc3oeOtMAeS52wvjW+6/a9mubpvbz0BfC2uV+p/y2XL3aEyb9HVDCs2Mp3kSUHxZkj
	Y4ew==
X-Gm-Message-State: ALQs6tBVf8QNpdn7BbVDnjgAPj0E3yqpfo1dCI9uS23THMbOpAQ1o1Nm
	tfJrg9xgO/0BVNhed5PCHNtGew==
X-Google-Smtp-Source: AB8JxZqEPzQWnaKzXTxg/Z1aMijiYqQRd9/ZTtmvsH/AaJ0gKfQE7/QQ9GO7S47G69YMYSrYcuATaQ==
X-Received: by 2002:a17:902:24e:: with SMTP id
	72-v6mr9749662plc.87.1525030598778; 
	Sun, 29 Apr 2018 12:36:38 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8880:466c::ddd5])
	by smtp.gmail.com with ESMTPSA id
	125sm11960737pfc.145.2018.04.29.12.36.37
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 29 Apr 2018 12:36:37 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 29 Apr 2018 12:36:05 -0700
Message-Id: <803bffaa378aa4a5c78c6cf5e13ee407628fa524.1525029885.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <cover.1525029885.git.raj.khem@gmail.com>
References: <cover.1525029885.git.raj.khem@gmail.com>
Subject: [PATCH 18/24] tcp-wrapper: Use external libnsl
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
X-List-Received-Date: Sun, 29 Apr 2018 19:36:38 -0000

We dropped in-tree obsoleted libnsl from glibc

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb b/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb
index 3ece8c3012..0f50674653 100644
--- a/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb
+++ b/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb
@@ -8,6 +8,7 @@ LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://DISCLAIMER;md5=071bd69cb78b18888ea5e3da5c3127fa"
 PR ="r10"
 
+DEPENDS += "libnsl2"
 
 PACKAGES = "${PN}-dbg libwrap libwrap-doc libwrap-dev libwrap-staticdev ${PN} ${PN}-doc"
 FILES_libwrap = "${base_libdir}/lib*${SOLIBS}"
@@ -67,7 +68,6 @@ EXTRA_OEMAKE = "'CC=${CC}' \
                 'KILL_OPT=-DKILL_IP_OPTIONS' \
                 'UMASK=-DDAEMON_UMASK=022' \
                 'NETGROUP=${EXTRA_OEMAKE_NETGROUP}' \
-                'LIBS=-lnsl' \
                 'ARFLAGS=rv' \
                 'AUX_OBJ=weak_symbols.o' \
                 'TLI=' \
-- 
2.17.0


