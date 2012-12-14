Received: from mga06.intel.com ([134.134.136.21] helo=orsmga101.jf.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TjWro-0001BE-IK
	for openembedded-core@lists.openembedded.org;
	Fri, 14 Dec 2012 16:08:22 +0100
Received: from mail-lb0-f197.google.com ([209.85.217.197])
	by mga02.intel.com with ESMTP/TLS/RC4-SHA; 14 Dec 2012 06:53:22 -0800
Received: by mail-lb0-f197.google.com with SMTP id go10so2391661lbb.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Dec 2012 06:53:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:x-received:from:to:subject:date:message-id:x-mailer
	:in-reply-to:references:x-gm-message-state;
	bh=Nf9BOR9qNkyfEDdEzPMpBYWpYfRXa/qSlGzyOHUk740=;
	b=h8fdD9Hf3nytk0gppQ/ocO4ls+ke2tbynv20uvE/i7mB94sl91Xn6w8hmzzKF4s4ix
	xY+0rsOjS5lwsRnWau12CrCmrx8g3iUO13qZJW2AAS9lzrSNHFCfncrg2QXCu6TaHMFe
	51Cp6xUnr4/8g8BjNFRNeQeNxQr6PaECkmH1FDZfdvHVdSue2y30JM9cVk493VgS4hfr
	M2QlUxZRpH5kUMIwgILvEnISw2uEO62RhMTLpG5ejDf5b5amvwPdTTV9P073Nezb8cKE
	zuGeBDgu7Kh76TWy5uePNnamxkVO40z5xZOKvena1G5BLSpHF/SgD1IJLrugLUdstv4I
	/X/w==
X-Received: by 10.180.93.3 with SMTP id cq3mr3567404wib.1.1355496800527;
	Fri, 14 Dec 2012 06:53:20 -0800 (PST)
X-Received: by 10.180.93.3 with SMTP id cq3mr3567395wib.1.1355496800470;
	Fri, 14 Dec 2012 06:53:20 -0800 (PST)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id dm3sm12612555wib.9.2012.12.14.06.53.18
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 14 Dec 2012 06:53:19 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 14 Dec 2012 14:51:24 +0000
Message-Id: <1355496684-1498-10-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10
In-Reply-To: <1355496684-1498-1-git-send-email-ross.burton@intel.com>
References: <1355496684-1498-1-git-send-email-ross.burton@intel.com>
X-Gm-Message-State: ALoCoQnLyxI9xLVvBLMN/s77qALltAQDJ39+iA6alkdwaHRaZDrL//ujjI7pIz+geQ2Kv2LkxiQ9Wo4jXLU7UldbrblwWZLEIxs7iJ30dUTf1FvkwVGSmsbPpEYaZpCjNWfqtZe2J3mYC+8FP3WNL02qBWfBJ7MHRj1O0XSQX73flsy+t7I0bd9U4GyCWPfrCRbQj2hQfGS+
Subject: [PATCH 9/9] e2fsprogs: fix out-of-tree builds
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 14 Dec 2012 15:08:31 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-devtools/e2fsprogs/e2fsprogs_1.42.1.bb |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.42.1.bb b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.42.1.bb
index 5d62ea0..b0eee3b 100644
--- a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.42.1.bb
+++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.42.1.bb
@@ -20,7 +20,7 @@ do_configure_prepend () {
 
 do_compile_prepend () {
 	find ./ -print | grep -v ./patches | xargs chmod u=rwX
-	( cd util; ${BUILD_CC} subst.c -o subst )
+	( cd ${S}/util; ${BUILD_CC} subst.c -o subst )
 }
 
 do_install () {
-- 
1.7.10



