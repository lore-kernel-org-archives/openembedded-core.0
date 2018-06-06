Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f174.google.com (mail-pf0-f174.google.com
	[209.85.192.174])
	by mail.openembedded.org (Postfix) with ESMTP id F413377AA7
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Jun 2018 21:37:33 +0000 (UTC)
Received: by mail-pf0-f174.google.com with SMTP id w7-v6so3758746pfn.9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 06 Jun 2018 14:37:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=V6slMjYohlTaeryTEvHGklECwYL/9TkNQDDNpf2TWbA=;
	b=QJ1MVpNnqlb3zXIeg6fpjOMbPd48C6lj9n5YgL9IRBZkQgXUV6R4gIIziwyeY3iUDh
	VWbjw2C7yYfK6Keg+ArH0I0Ga3wSH4XPosWmO/k8HOrctQVT10lD3g/kpkDdGGDPHmCM
	LOnrdKuqS5UtrjNsG+TZD4fOrTZtklhiiPSJ6PavFRgJ7vANKdxWb1P6qeN6lVaOBOZD
	uGblGPJz7eP0ryN5HcdQS5gdNvJv+WYX13ZJyRlbcBa5f8uxVDwFf8YiyexAw1dn1kAc
	4UNBHf+WyWRraamHyc1c2yDq6hIVfVk3/McjQJmi3jukLRmI3HLHZZcmnmEmzc8smym7
	I+MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=V6slMjYohlTaeryTEvHGklECwYL/9TkNQDDNpf2TWbA=;
	b=bjSZu1fEDOf6gtOChMtFWfFPhL1zE+Wd99fCL3v2NdQ2gAU7bTZQwYtZuqO4f/tdh4
	ukK9jCErwzYFUdF1ARBCsbjUevMtQyuuuNYlyu4Rac0rCke0+hjxjA+JXXS6WoclphfW
	Aw+PTx7nopjBOIRq41MEpGcsn816ljUQG35pw0sEd42DioLHpvIJP5DKwM3bsb4S7kfq
	OHb1KOnyjn451rTozKKjlZlwWe4cxi7I1q+liWGHhaTaYotKJVaTLYViaGZ0UgFW+ZL6
	an0nZ7Biu4iG2ncry8r4ldUTWoGdJ5gq4xaoq2j0TcQdqg0j+WL1oCTFZ9i9tRNFLWsh
	AUAA==
X-Gm-Message-State: APt69E24cAwI0UkhY9NLFKhsURh3ZwaI1B1IjQQsDV0xtFEYEMORgrNd
	qgEqmZBqG3PHmQO76Xsthz9PDg==
X-Google-Smtp-Source: ADUXVKKt+4NaIHtwvP3a4xfgv17sKvpJCHRaTZG4kSuaK7YXPePr4yk95xttq+t6YdG3M/+MrzSKpg==
X-Received: by 2002:a63:3759:: with SMTP id
	g25-v6mr3974155pgn.59.1528321054797; 
	Wed, 06 Jun 2018 14:37:34 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::c68])
	by smtp.gmail.com with ESMTPSA id
	c191-v6sm30452374pfg.48.2018.06.06.14.37.33
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 06 Jun 2018 14:37:34 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  6 Jun 2018 14:37:24 -0700
Message-Id: <aa3577014ea9870fc6f4fd98b4f84b540e7c69e4.1528320772.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1528320772.git.raj.khem@gmail.com>
References: <cover.1528320772.git.raj.khem@gmail.com>
Subject: [PATCH 08/12] tcmode-default: Switch to gcc 8.0
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
X-List-Received-Date: Wed, 06 Jun 2018 21:37:34 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/conf/distro/include/tcmode-default.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/distro/include/tcmode-default.inc b/meta/conf/distro/include/tcmode-default.inc
index d85fd1e921..a1a38c2aaf 100644
--- a/meta/conf/distro/include/tcmode-default.inc
+++ b/meta/conf/distro/include/tcmode-default.inc
@@ -22,7 +22,7 @@ PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}libc-initial = "${TCLIBC}-initial"
 PREFERRED_PROVIDER_virtual/nativesdk-${SDK_PREFIX}libc-initial ?= "nativesdk-glibc-initial"
 PREFERRED_PROVIDER_virtual/gettext ??= "gettext"
 
-GCCVERSION ?= "7.%"
+GCCVERSION ?= "8.%"
 SDKGCCVERSION ?= "${GCCVERSION}"
 BINUVERSION ?= "2.30%"
 GDBVERSION ?= "8.1%"
-- 
2.17.1


