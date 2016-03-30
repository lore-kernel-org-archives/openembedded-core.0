Return-Path: <armccurdy@gmail.com>
Received: from mail-ig0-f181.google.com (mail-ig0-f181.google.com
	[209.85.213.181])
	by mail.openembedded.org (Postfix) with ESMTP id E61DC60125
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Mar 2016 20:08:36 +0000 (UTC)
Received: by mail-ig0-f181.google.com with SMTP id sy18so43789574igc.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Mar 2016 13:08:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=h9HrLXobkoCLktuogEByUBytZWNQjTSNmf2KsUJ+mGo=;
	b=mNUqX6iF2jLADj1ASEOPjWL0ZVXrisvwcH90B36v3aMQC8k6Ng6QUBZo8WPL9YYfhs
	VSKbyfKyeaVbY9AWEWtIEKt5cx1Yqrst6ktaunKEpSAS8fsRRWZUEKBOTj1ngrt9nh4b
	4tc4L28QEzbyDtUYSTvlDwaS5X3lqUvjhEr455HIHl9JSHKaal64HrF2XfcImt48OuJw
	AKsp/zNx/zXbjNmu/g9bXiyhcJiWen5CaoTy1na6cKrIiTZabEmWK2hevjfTEZxY2Cat
	hZCHlirEnAzpo82kcvXFAPmY/3h8qCZ+0OApvqqijvgj+IRYrfG0rnl/tK4JjIYxsKTI
	IwZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=h9HrLXobkoCLktuogEByUBytZWNQjTSNmf2KsUJ+mGo=;
	b=j85eAI/tlI3V9K44EESFzDdlAdrJNIdQXfg4cJ67Neis1UooCoPiHt5KN4xKPH4HGm
	PTtzVzjrGn3dYw3eovN5oWo2/COqVrnTEK7OeXEiEDzM0nbsS97pvhfu4ztbO8lsGYiT
	k1z7ib51ceHeT/n+DKUyGUVkSmK5JRIIUkCpy0bUOw4qYhM69ZOo2s0sF1Ni7t70FHhv
	92SASQXfwKLcw8Rj/N03K/2cqKnHpMUDM8rA5ojeLV083C6U6fxIzcSxAdqhAAT9mGZw
	AcdOberk6pEU6jKfXLTB9USmYAq+76uzNUF6L03vXl3UP9wxuwX11uW4TXJU4ZwzxujP
	sICw==
X-Gm-Message-State: AD7BkJJnE+pL9PGrVuPDuhCZpE6UhCAmDUtjxxE3fIySZAmG9wR1FK4/QyDsE6PRkdKP3A==
X-Received: by 10.50.8.101 with SMTP id q5mr23610817iga.22.1459368516797;
	Wed, 30 Mar 2016 13:08:36 -0700 (PDT)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id
	qb1sm2407294igb.19.2016.03.30.13.08.35
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 30 Mar 2016 13:08:35 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 30 Mar 2016 13:08:30 -0700
Message-Id: <1459368510-29566-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH] default-distrovars.inc: remove gnutls + libtasn1 from LGPLv2_WHITELIST_GPL-3.0
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
X-List-Received-Date: Wed, 30 Mar 2016 20:08:38 -0000

With the modern license handling code, gnutls and libtasn1 are both
buildable in distros which blacklist GPL-3.0 without needing to be
explicitly whitelisted (since they both provide at least one non
GPLv3 package).

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/conf/distro/include/default-distrovars.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/distro/include/default-distrovars.inc b/meta/conf/distro/include/default-distrovars.inc
index ce42bde..9779bfb 100644
--- a/meta/conf/distro/include/default-distrovars.inc
+++ b/meta/conf/distro/include/default-distrovars.inc
@@ -26,7 +26,7 @@ IMAGE_FEATURES ?= ""
 # directly part of the distribution. 
 HOSTTOOLS_WHITELIST_GPL-3.0 ?= ""
 WHITELIST_GPL-3.0 ?= ""
-LGPLv2_WHITELIST_GPL-3.0 ?= "libassuan gnutls libtasn1 libidn"
+LGPLv2_WHITELIST_GPL-3.0 ?= "libassuan libidn"
 
 COMMERCIAL_AUDIO_PLUGINS ?= ""
 # COMMERCIAL_AUDIO_PLUGINS ?= "gst-plugins-ugly-mad gst-plugins-ugly-mpegaudioparse"
-- 
1.9.1


