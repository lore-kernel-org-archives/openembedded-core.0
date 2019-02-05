Return-Path: <bkylerussell@gmail.com>
Received: from mail-it1-f194.google.com (mail-it1-f194.google.com
	[209.85.166.194])
	by mail.openembedded.org (Postfix) with ESMTP id 5291A6006E
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Feb 2019 14:41:43 +0000 (UTC)
Received: by mail-it1-f194.google.com with SMTP id h193so8682079ita.5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 05 Feb 2019 06:41:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=d06hhWxLg898/PH5jBLz+XEq42ri9AU8OH2Q/8Sk59M=;
	b=AAef8XT3+6OKA/09zrhHk9Fzv3jqsCcE8ZZqSALKn3tKSpkE1aGSmMduNgoIRnvuUB
	q+vGSCERgr3vqSx4lBHQPLdrh5tnsYzkxksavxCYqfYJDVBQF6WA6XuhE/hcjE2+NY87
	uhwagc09zA/CpQPooUmv+QVViqhk7xsUrO8lmxQS/YTjjdFM4F3QYfKrPc5n8dYqCdek
	LSkX+KBqWiEXW+f1VtimytjLPkoNvukU0vEvyjHEazJfDiSXOl256jmoc2U3BkHjFhAU
	TqFykCzhwCffbCm+f2vRf6kxSCn/urZNg+xAAOwMlVn9zUVucZdbAvqovTY2cLvayliS
	e2bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=d06hhWxLg898/PH5jBLz+XEq42ri9AU8OH2Q/8Sk59M=;
	b=JK4M+sIffCnxzdliW8Go/zs/DdNXJUrfyP9VLy+jzQb0e9TeoDXpq1t6L9VZROWH0O
	VKWKC25YmaP7CXm45V+6rVCv+x40EhSE3nAd/cwN4vRULyAReUx9l+Apy9lQa9tGjd2v
	XJPK5BEfLNfKIo0MXHtD5eJIfT9gRjGyVFzqiPcIwAm+fDT8CrFwaJLCox61+jufaOit
	9mNtWEhXR+BPEkUUdivRosBW+0CHyWYTQWEUN4zEiki+auPkM7MAnSIatFw3t0XCYDmg
	sdz3sYe46G2eaTDzJWYkkNmPsBoRsNqXlL1QvWBiXlX/LOoqFQL0py2Oq9Gcl9Ydhzfu
	yy1w==
X-Gm-Message-State: AHQUAuYyjkfL4gKfKMxsEWUwmSLSRJPu3t/Y5ECJRUEKEFLW60nE19Xg
	Y5Yh8oJ8AKmEylnTcisj8QPUusSW
X-Google-Smtp-Source: AHgI3IZJF/1ugqF6URQx9Xqsa5UXXjHtJIBKCASYMHTfTCT4SmSLi/dDSlqY07YWcizE3N0dvQbNBg==
X-Received: by 2002:a24:d902:: with SMTP id p2mr2475070itg.112.1549377704068; 
	Tue, 05 Feb 2019 06:41:44 -0800 (PST)
Received: from napoli.dhcp.lexmark.com ([192.146.101.90])
	by smtp.gmail.com with ESMTPSA id
	k18sm1471879ioa.39.2019.02.05.06.41.43
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 05 Feb 2019 06:41:43 -0800 (PST)
From: Kyle Russell <bkylerussell@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  5 Feb 2019 09:41:19 -0500
Message-Id: <20190205144119.4235-1-bkylerussell@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH] libxml-namespacesupport-perl: extend nativesdk
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
X-List-Received-Date: Tue, 05 Feb 2019 14:41:43 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Kyle Russell <bkylerussell@gmail.com>
---
 meta/recipes-extended/perl/libxml-namespacesupport-perl_1.12.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/perl/libxml-namespacesupport-perl_1.12.bb b/meta/recipes-extended/perl/libxml-namespacesupport-perl_1.12.bb
index fa9f9954bb..57c407e0f8 100644
--- a/meta/recipes-extended/perl/libxml-namespacesupport-perl_1.12.bb
+++ b/meta/recipes-extended/perl/libxml-namespacesupport-perl_1.12.bb
@@ -23,5 +23,5 @@ inherit cpan ptest-perl
 
 RDEPENDS_${PN}-ptest += "perl-module-test-more"
 
-BBCLASSEXTEND="native"
+BBCLASSEXTEND="native nativesdk"
 
-- 
2.20.1


