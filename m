Return-Path: <enrico.scholz@sigma-chemnitz.de>
X-Greylist: delayed 2065 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 18 May 2017 18:09:10 UTC
Received: from mail.cvg.de (mail.cvg.de [62.153.82.30])
	by mail.openembedded.org (Postfix) with ESMTP id 51BB177F67
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 May 2017 18:09:10 +0000 (UTC)
Received: from mail-mta-0.intern.sigma-chemnitz.de
	(mail-mta-0.intern.sigma-chemnitz.de [192.168.12.76])
	by mailout-1.intern.sigma-chemnitz.de (8.14.7/8.14.7) with ESMTP id
	v4IHYi0U021524
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=OK) for <openembedded-core@lists.openembedded.org>;
	Thu, 18 May 2017 19:34:44 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sigma-chemnitz.de;
	s=v2012061000; t=1495128884;
	bh=ZEdIVqwpjZGBWjASDpOQcupiPwpqAbCGIloxm454eR0=;
	h=From:To:Cc:Subject:Date:Message-Id:Sender;
	b=CMUmR4PLxInElrX3QDcA8slC7lp74NfhcDd3rQ7ZTbVGT5bQqOjoPskBalo8lmygc
	A00MWMDxBR9I5BqudL8gOeIeF6K5bml2+m+482BhaWScxXUHeFaxW+4HPO6Dotlf3U
	tvA1Em4q2EQ0cD8ni93+ahMyVKvlA3n+QfEzqgto=
Received: from reddoxx.intern.sigma-chemnitz.de
	(reddoxx.intern.sigma-chemnitz.de [192.168.0.193])
	by mail-mta-0.intern.sigma-chemnitz.de (8.14.7/8.14.7) with ESMTP id
	v4IHYZS0017355 for <openembedded-core@lists.openembedded.org> from
	enrico.scholz@sigma-chemnitz.de; Thu, 18 May 2017 19:34:38 +0200
Received: from mail-msa-0.intern.sigma-chemnitz.de ( [192.168.12.77]) by
	reddoxx.intern.sigma-chemnitz.de
	(Reddoxx engine) with SMTP id D79992FBDB;
	Thu, 18 May 2017 19:32:14 +0200
Received: from ensc-virt.intern.sigma-chemnitz.de
	(ensc-virt.intern.sigma-chemnitz.de [192.168.3.24])
	by mail-msa-0.intern.sigma-chemnitz.de (8.14.7/8.14.7) with ESMTP id
	v4IHYXvA017352
	(version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
	Thu, 18 May 2017 19:34:34 +0200
Received: from ensc by ensc-virt.intern.sigma-chemnitz.de with local (Exim
	4.87) (envelope-from <ensc@sigma-chemnitz.de>)
	id 1dBPJn-0007oN-R8; Thu, 18 May 2017 19:34:32 +0200
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
To: openembedded-core@lists.openembedded.org
Date: Thu, 18 May 2017 19:34:23 +0200
Message-Id: <20170518173423.28994-1-enrico.scholz@sigma-chemnitz.de>
X-Mailer: git-send-email 2.9.4
Sender: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
X-Spam-Score: -0.6
X-Spam-Tests: AWL,BAYES_00,DKIM_ADSP_ALL,RP_MATCHES_RCVD,SPF_NEUTRAL
X-Scanned-By: MIMEDefang 2.79
Cc: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Subject: [PATCH] tzcode-native: quote ${CC}
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
X-List-Received-Date: Thu, 18 May 2017 18:09:11 -0000

build fails else with

| + make -j 8 -l 6 cc=ccache gcc
| make: *** No rule to make target 'gcc'.  Stop.

Signed-off-by: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
---
 meta/recipes-extended/tzcode/tzcode-native_2017b.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/tzcode/tzcode-native_2017b.bb b/meta/recipes-extended/tzcode/tzcode-native_2017b.bb
index 2084f79..165d2c6 100644
--- a/meta/recipes-extended/tzcode/tzcode-native_2017b.bb
+++ b/meta/recipes-extended/tzcode/tzcode-native_2017b.bb
@@ -18,7 +18,7 @@ S = "${WORKDIR}"
 
 inherit native
 
-EXTRA_OEMAKE += "cc=${CC}"
+EXTRA_OEMAKE += "cc='${CC}'"
 
 do_install () {
         install -d ${D}${bindir}/
-- 
2.9.4


