Return-Path: <raj.khem@gmail.com>
Received: from mail-pl0-f68.google.com (mail-pl0-f68.google.com
	[209.85.160.68])
	by mail.openembedded.org (Postfix) with ESMTP id 904FC789BD
	for <openembedded-core@lists.openembedded.org>;
	Fri,  2 Mar 2018 17:53:03 +0000 (UTC)
Received: by mail-pl0-f68.google.com with SMTP id m22-v6so2584086pls.5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 02 Mar 2018 09:53:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=PDLNi6pNVYNU1gOZo9numrl3LBi+GvUB1SmRiHEF0lY=;
	b=lGrVR9hbaoYfyz6eZloDmn9X8vPwgCtJemDUsgclY3jh9/rNnM24TqjB24LW+fAtNa
	nkK0IHj545FlZR1RuK86CWFkulNWg/UgN1DFndSrcHjqx2p5sfBun4jDQp5O21Wb0Nse
	wll07lVkc9+sDyLw/MrGerqYGj/8BU9qOSRpEp/nlBFSdeJl7667BbrHHYnBunZ+eq9F
	cI0ipPdrSOKgy2H0HI/5Ezzn+OU3Q6YDk9RWe2H5HGkYVQhWxMU0Xzju7TOXF7cxM2TE
	65pmlyAkDTH/THBY+7AHbXxrAyVMgrmDcL4arsAnoKkA+AZSjmTSFrvCu8PLZPqknk8c
	P9/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=PDLNi6pNVYNU1gOZo9numrl3LBi+GvUB1SmRiHEF0lY=;
	b=t0UuZg5ZwBSEdBdpMBgFEzsorbDUFKnfMTIEasRTrYAJCqWUXsE53zmzpnCMr0Ew10
	12jj3dTn/sa0Qd8AMTD7ud46A09Paj5sOmi3vGq4pxvyY8KBk9kCcL6sUDTdm16bwFlE
	jj4rihlEyAXvH3HQFuKWLoU8IV9ltpzC8CZS12zibvSrYZnOK3wNm2gEt7rgDASn8OBo
	Jz9DUOgZZBv+b4eOpTMCJf7yJCvDaDKF5XD58Gk4UD/Au+aGrPWm+Hgy9WwXFiP42OBj
	423k9ObdTNBoZDO7f9npayI//ETfc9ogMZw7dzhcA64ZV8ReCvhQ5BPt+JI7r5FVA5CM
	0QuA==
X-Gm-Message-State: APf1xPAyIE6ZaPwlZfyXa8r2kV4NNZ4ZoYE4FAKNcPelUvDGaqceSe1X
	GueV/tD6GRJ7ShVDaGRTNbIH1g==
X-Google-Smtp-Source: AG47ELuSeBk4isxS56LgqdCwHlZy8cJ8XhGgapBKpwEPyz0Pw6hmRGchbuqTgVootU3HrkwLjs0SDw==
X-Received: by 2002:a17:902:a584:: with SMTP id
	az4-v6mr6141062plb.20.1520013184888; 
	Fri, 02 Mar 2018 09:53:04 -0800 (PST)
Received: from localhost.localdomain ([2601:646:8880:466c:6245:cbff:fe64:591])
	by smtp.gmail.com with ESMTPSA id
	a28sm13329196pfe.70.2018.03.02.09.53.03
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 02 Mar 2018 09:53:04 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  2 Mar 2018 09:52:54 -0800
Message-Id: <20180302175256.29044-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.16.2
In-Reply-To: <20180302175256.29044-1-raj.khem@gmail.com>
References: <20180302175256.29044-1-raj.khem@gmail.com>
Subject: [PATCH 2/4] musl: Rename files/ directory to musl/
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
X-List-Received-Date: Fri, 02 Mar 2018 17:53:03 -0000

Since it holds musl specific patches, name it so

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../0001-Make-dynamic-linker-a-relative-symlink-to-libc.patch             | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename meta/recipes-core/musl/{files => musl}/0001-Make-dynamic-linker-a-relative-symlink-to-libc.patch (100%)

diff --git a/meta/recipes-core/musl/files/0001-Make-dynamic-linker-a-relative-symlink-to-libc.patch b/meta/recipes-core/musl/musl/0001-Make-dynamic-linker-a-relative-symlink-to-libc.patch
similarity index 100%
rename from meta/recipes-core/musl/files/0001-Make-dynamic-linker-a-relative-symlink-to-libc.patch
rename to meta/recipes-core/musl/musl/0001-Make-dynamic-linker-a-relative-symlink-to-libc.patch
-- 
2.16.2


