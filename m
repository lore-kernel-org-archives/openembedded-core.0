Return-Path: <mcfrisk@kapsi.fi>
X-Greylist: delayed 1987 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 26 Mar 2018 12:31:34 UTC
Received: from mail.kapsi.fi (mail.kapsi.fi [91.232.154.25])
	by mail.openembedded.org (Postfix) with ESMTP id 4D61278531
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Mar 2018 12:31:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
	s=20161220; 
	h=Subject:References:In-Reply-To:Message-Id:Date:Cc:To:From;
	bh=Ku17XfSpHRVgsKxEJR6qRgzNl43kKS6sBXrjrd5KPyA=; 
	b=fNqsQwJddJxRl57xpe5WhpyMZJ1UOHp2dT9B/CxwdiKiipcV2W7YSK8Yied+UcKLkKnj6fEZbuR1QDXlzV+Tk5+xm/7dxqkHPo6wklhMxzuxofpGU5LAT0ncTeVnRt3XhlO8qg4LVcOtVwcZaxwzj2oF1kdk37Tw99XjxcwlXxGc7L+Qr9i+2PwOyxs0dv/s6Ft+tyVpwxLDjRnI/NFJiWrJRL4aE3yHohlON3lN6SkQL3Ui/zNdkOPayHko60lahWhrxAcXXBa174e5wWoXtGfSrSb2fO2JH27Ovb9Nsn4M/3LZaMq+lCGdOKdzK0ZYLYLE2NF/vFpdcKYkef9uVw==;
Received: from [91.232.154.11] (helo=lakka.kapsi.fi)
	by mail.kapsi.fi with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.84_2) (envelope-from <mcfrisk@kapsi.fi>)
	id 1f0Qlk-0000At-7k; Mon, 26 Mar 2018 14:58:33 +0300
Received: from mcfrisk by lakka.kapsi.fi with local (Exim 4.84_2)
	(envelope-from <mcfrisk@lakka.kapsi.fi>)
	id 1f0QlQ-0004h9-5t; Mon, 26 Mar 2018 14:58:12 +0300
From: Mikko Rapeli <mikko.rapeli@bmw.de>
To: openembedded-core@lists.openembedded.org
Date: Mon, 26 Mar 2018 14:57:59 +0300
Message-Id: <1522065479-15840-3-git-send-email-mikko.rapeli@bmw.de>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1522065479-15840-1-git-send-email-mikko.rapeli@bmw.de>
References: <1522065479-15840-1-git-send-email-mikko.rapeli@bmw.de>
X-SA-Exim-Connect-IP: 91.232.154.11
X-SA-Exim-Mail-From: mcfrisk@kapsi.fi
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on mail
X-Spam-Level: **
X-Spam-Status: No, score=2.6 required=5.0 tests=BAYES_50,
	HEADER_FROM_DIFFERENT_DOMAINS,RDNS_NONE,SPF_NEUTRAL autolearn=no
	autolearn_force=no version=3.4.0
X-SA-Exim-Version: 4.2.1 (built Mon, 26 Dec 2011 16:24:06 +0000)
X-SA-Exim-Scanned: Yes (on mail.kapsi.fi)
Subject: [PATCH 3/3] mirrors.bbclass: change Debian anonscm to salsa
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
X-List-Received-Date: Mon, 26 Mar 2018 12:31:35 -0000

Debian anonscm service in Alioth is shutdown and thus
fetching sources fails.

https://wiki.debian.org/Alioth

"Alioth is broken, and there is nobody around to fix it. Don't ask the remaining people who give it life support to implement fixes and changes. It is being replaced by a cocktail of ?GitLab (see Salsa), read-only repos and keep-alive mechanisms. See below for more information."

https://wiki.debian.org/Salsa

"What is Salsa?

Salsa is the name of a collaborative development server for Debian based on the gitlab software. Salsa is supposed to provide the necessary tools for package maintainers, packaging teams and other Debian related individuals and groups for collaborative development.

What is the status of Salsa?

After various discussions about the future of Alioth, the Alioth Sprint in August 2017 gave birth to the initial setup of the the upcoming Salsa service. The productive weekend resulted in a working prototype and was launched as a beta in December 2017. It left its beta status in January 2018."

Signed-off-by: Mikko Rapeli <mikko.rapeli@bmw.de>
---
 meta/classes/mirrors.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/mirrors.bbclass b/meta/classes/mirrors.bbclass
index 766f1cb..b331afc 100644
--- a/meta/classes/mirrors.bbclass
+++ b/meta/classes/mirrors.bbclass
@@ -67,7 +67,7 @@ ${CPAN_MIRROR}  http://search.cpan.org/CPAN/ \n \
 # where git native protocol fetches may fail due to local firewall rules, etc.
 
 MIRRORS += "\
-git://anonscm.debian.org/.*   git://anonscm.debian.org/git/PATH;protocol=https \n \
+git://salsa.debian.org/.*     git://salsa.debian.org/PATH;protocol=https \n \
 git://git.gnome.org/.*        git://git.gnome.org/browse/PATH;protocol=https \n \
 git://git.savannah.gnu.org/.* git://git.savannah.gnu.org/git/PATH;protocol=https \n \
 git://git.yoctoproject.org/.* git://git.yoctoproject.org/git/PATH;protocol=https \n \
-- 
1.9.1


