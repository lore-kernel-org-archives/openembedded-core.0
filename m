Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yk0-f171.google.com (unknown [209.85.160.171])
	by mail.openembedded.org (Postfix) with ESMTP id 822E76B389
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 May 2014 18:27:59 +0000 (UTC)
Received: by mail-yk0-f171.google.com with SMTP id 142so3150693ykq.16
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 May 2014 11:28:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:organization; bh=d1IWE3sFrZ8ljjJoouOK0ZOSpJKPBHslt2VplsrrRH4=;
	b=j2WPFUgeUlif/mDqD4QAZPZLMG5h94fRDVpaPleWOwlv5vQshvNw08NAZC9Ubt0dlx
	qX7K16Mg9v+RytiWnLaUpn6jDvhBin2+BXgmuLwVzH019W49gXE7ZXiWUhFvfJR/TGTo
	HMHm9RYv3CD0bsvRcrUNK5lGO6BabbJ2b9r83HMrpap3lFBEkW0rGFzfhm/KXhsa1HYs
	9FnFs5pjhit7PZuKuav0Zyo0ecKfjzA63t6kOVjiPHOEq65umL8byz/YopBeZi49cXCw
	FPrwhJ2fOuioACge2eGB9nqP7zoGmbWQTwvVO4qQbAZGebEzW3kiJAFoL4KnusoqdrzR
	5fSg==
X-Received: by 10.236.201.108 with SMTP id a72mr66523586yho.9.1400783280001;
	Thu, 22 May 2014 11:28:00 -0700 (PDT)
Received: from nano.lab.ossystems.com.br ([177.194.208.225])
	by mx.google.com with ESMTPSA id t32sm813985yhp.48.2014.05.22.11.27.57
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 22 May 2014 11:27:58 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
Received: by nano.lab.ossystems.com.br (Postfix, from userid 1000)
	id D2C8D1B13ADB9; Thu, 22 May 2014 15:27:54 -0300 (BRT)
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Thu, 22 May 2014 15:27:50 -0300
Message-Id: <1400783274-7258-3-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.0.0.rc2
In-Reply-To: <1400783274-7258-1-git-send-email-otavio@ossystems.com.br>
References: <1400783274-7258-1-git-send-email-otavio@ossystems.com.br>
Organization: O.S. Systems Software LTDA.
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: [daisy-backport][PATCH 2/6] cryptodev-linux: move to recipes-kernel to be shared with module and tests
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
X-List-Received-Date: Thu, 22 May 2014 18:28:01 -0000

From: Denys Dmytriyenko <denys@ti.com>

(From OE-Core rev: e7aace7658fabe41839a3ec1b596bf28c6a4c02e)

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../openssl => recipes-kernel/cryptodev}/cryptodev-linux_1.6.bb           | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename meta/{recipes-connectivity/openssl => recipes-kernel/cryptodev}/cryptodev-linux_1.6.bb (100%)

diff --git a/meta/recipes-connectivity/openssl/cryptodev-linux_1.6.bb b/meta/recipes-kernel/cryptodev/cryptodev-linux_1.6.bb
similarity index 100%
rename from meta/recipes-connectivity/openssl/cryptodev-linux_1.6.bb
rename to meta/recipes-kernel/cryptodev/cryptodev-linux_1.6.bb
-- 
2.0.0.rc2


