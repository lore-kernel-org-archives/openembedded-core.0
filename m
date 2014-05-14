Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yh0-f43.google.com (unknown [209.85.213.43])
	by mail.openembedded.org (Postfix) with ESMTP id 7B4E166100
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 May 2014 20:30:37 +0000 (UTC)
Received: by mail-yh0-f43.google.com with SMTP id v1so2199426yhn.30
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 May 2014 13:30:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:subject:date:message-id:in-reply-to:references
	:organization; bh=d1IWE3sFrZ8ljjJoouOK0ZOSpJKPBHslt2VplsrrRH4=;
	b=h2RSfLs12Z6NTPZwLyVy59Hi6V6TmMOouhSL322VkFplAMKYkDBOGzfRKfw3bcCx8P
	xSiEqpOviuKuF7MYEhmHCnfLL4hgszikIjQcupebEo8uW+CSfFbO9rentrZKBYHnNTWD
	EdcIcPr2l0LMUTRVmgkHW+WaS+9OojwVONC7kp0ST7OazqHcYr411xB8FEW5tjQVraCT
	VXjZk9fNFsrNUZ0jOVUB1q6thWKvE1qePk3o954K1ddjjYeaLKbTL2zEq9IdpEn0VWjP
	1vVZy4XuQUFNaGUeMXA/bg9V6qdCJ5NG9+qAPjjovpQCARt1A2rr76L3MyNDkXxFD3+u
	0cEg==
X-Received: by 10.236.200.67 with SMTP id y43mr8638193yhn.77.1400099438980;
	Wed, 14 May 2014 13:30:38 -0700 (PDT)
Received: from nano.lab.ossystems.com.br ([177.194.208.225])
	by mx.google.com with ESMTPSA id d62sm4145839yhq.2.2014.05.14.13.30.36
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 14 May 2014 13:30:37 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
Received: by nano.lab.ossystems.com.br (Postfix, from userid 1000)
	id 1E22F1ACE5DA2; Wed, 14 May 2014 17:30:34 -0300 (BRT)
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Wed, 14 May 2014 17:30:32 -0300
Message-Id: <1400099434-22527-2-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.0.0.rc2
In-Reply-To: <1400099434-22527-1-git-send-email-otavio@ossystems.com.br>
References: <1400099434-22527-1-git-send-email-otavio@ossystems.com.br>
Organization: O.S. Systems Software LTDA.
Subject: [daisy][PATCH 2/4] cryptodev-linux: move to recipes-kernel to be shared with module and tests
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
X-List-Received-Date: Wed, 14 May 2014 20:30:38 -0000

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


