Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id 22A3C60557
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Feb 2019 14:36:55 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id d17so18181373wre.10
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Feb 2019 06:36:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=JOfPqDJq8rR1PnZfXrbDEovakqZ6wsIikqRD5jiEse4=;
	b=FyLBd3AUkRaQ5QQ89ID+1JwsU0BWxZmFOzAifJgHWoCWNHExp102hgFHPqoi6t+kzT
	YrI1YgaGYPZuI/E95IZkOlTXuG0JXXfKnIQ+pj84QylCkk/1fCuiHPt4PdItEE0pgVxV
	sEBOrTI0f9PgcoSrG0BA8yl0n+eQeAaafZIGDGfSYnxnWcpyqH959nlVdXKI3UIOpqxN
	9WqcOAZhZzQc65DylMdztSiRS9NL7MARBWtzpR5naX4uwqZXMjXKxxBgLRuUK1ifPQby
	bFqdsXCVrj8aoBeA6A7F2j9z/47vaaXXcFKHQIXD9n3TVZaFvJbgOOlSIQ0JcPAOq4AF
	Ia9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=JOfPqDJq8rR1PnZfXrbDEovakqZ6wsIikqRD5jiEse4=;
	b=Ewdhg+0UUm84/gaE4tqA0IMPkGA7H/PpMCoMIJivqmXOM978RBGnI8j03Fck0f/f7P
	FuUwJ86cC17wgNABO0yCqgLBwlC/m0rD0zJ2IwMLcF+15J8KzmfiMb080Cp108CAb3VM
	5ohd6R+RauuM/73TPYXA5MOB+Rv08OGIc6GvVPCrb2mo9F5rOaf3/9YCx9MJgdLoF190
	L4oA9abXPwzzGrNabf556i58dADfE8QhXGBGtZvdf4FSS1XH8BEpiUJNfrCTel1dK2qP
	IE8Kt/NplrNjrOc9UgYgzq1V647ygd8LYUakDFjq/xQP/JiWeWwCM/WM3VHjSMIt0LuR
	aMpA==
X-Gm-Message-State: APjAAAWFwpwz18ZZ1ZjE0TTmGsBujEHMB9o7iWkmPjPwtd7QX3S7hlAP
	Kwykasek1sEJE0sf2p66vwAAaU2S
X-Google-Smtp-Source: APXvYqwwBNYEh+yiJk7EUVm+HKPl2eYZMMslMRH9HUwfYbjvqZO05zon2N1XxSXGqeyUi8VJ1dhrbg==
X-Received: by 2002:a5d:6810:: with SMTP id w16mr2631590wru.62.1551278215564; 
	Wed, 27 Feb 2019 06:36:55 -0800 (PST)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	y13sm12016923wrw.31.2019.02.27.06.36.54
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 27 Feb 2019 06:36:54 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 27 Feb 2019 15:36:48 +0100
Message-Id: <20190227143648.120338-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH] openssl: drop Python 2.x dependency in -ptest
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
X-List-Received-Date: Wed, 27 Feb 2019 14:36:55 -0000

It is only needed by 95-test_external_pyca_data which is
actually skipped on the target.

[YOCTO #13204]

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-connectivity/openssl/openssl_1.1.1a.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/openssl/openssl_1.1.1a.bb b/meta/recipes-connectivity/openssl/openssl_1.1.1a.bb
index 9f6e26bcf53..02fd66910ea 100644
--- a/meta/recipes-connectivity/openssl/openssl_1.1.1a.bb
+++ b/meta/recipes-connectivity/openssl/openssl_1.1.1a.bb
@@ -198,7 +198,7 @@ CONFFILES_openssl-conf = "${sysconfdir}/ssl/openssl.cnf"
 
 RRECOMMENDS_libcrypto += "openssl-conf"
 RDEPENDS_${PN}-misc = "perl"
-RDEPENDS_${PN}-ptest += "openssl-bin perl perl-modules bash python"
+RDEPENDS_${PN}-ptest += "openssl-bin perl perl-modules bash"
 
 RPROVIDES_openssl-conf = "openssl10-conf"
 RREPLACES_openssl-conf = "openssl10-conf"
-- 
2.17.1


