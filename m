Return-Path: <armccurdy@gmail.com>
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com
	[209.85.210.173])
	by mail.openembedded.org (Postfix) with ESMTP id 5649D7F2AD
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Sep 2019 19:24:44 +0000 (UTC)
Received: by mail-pf1-f173.google.com with SMTP id y72so490226pfb.12
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Sep 2019 12:24:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=eMs1nfzkgeUl+0RWoBo9saKrHxZ6Bm893I59luSePw0=;
	b=ST04A2aHX0fky0v4ao0hcOvDCmDnSoh1uaGEk7F/hbLG+2G/FjeB/jGTbnd9SsQWNX
	JSGocsonTyoFYQeSqwJ5WqNu1BA8OKdYwymnnN96GdfOY8nwATmomJDIs/9aYP7aHICl
	xOYf4HRR3alvdIlL66AnVH4Jk+80D/WJiyF/f7slvHrcQdDw4yi4sV2izsiaX+pGrkby
	xFzvPOZ8eWOzoPxKKa2zNdJQY3s8QKiYrKPl3KAzloRNDpC6Y90YMkphOylBCjD9jKbd
	jqC1ZOTe3DYijp4JwcnOF/iYdYZrKXpQROrdIjiKxKydO4g5LTd3mh+hXfO6qdxtwuH8
	Jqsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=eMs1nfzkgeUl+0RWoBo9saKrHxZ6Bm893I59luSePw0=;
	b=Jnn+1N5m3TKh9AaKy7PT6ThhMe4CKz/56fwUvD8/d6KHIaHOqIqiickKkD6u2sfEZI
	HQ+RfwK1HnhnSU5YjeimMIXSNQP+6Y3TKi164Y1Uqybs4SN7jyXxcxlk0GUewCsA/6ZT
	5G34WRYSEryRA2xH6dLPjkVqkLQ8BZ4wK1cEseJc4ryZkg7QGXUlLOu+uefTmkoJJnPC
	rD+tvPMykFw+aOZRxLZQRATMkDN1lgwJpc/noSxeugb6oL6mZC892QEHT2qnJMEf1QfA
	qkfEdgDgUFSl5aon5elY9Ia+576RxwQdnPdUNNLPL41NA4iYbciGHuMCgwhEJ/rpcZzy
	NYxA==
X-Gm-Message-State: APjAAAXAD/j1APLHgdQEov3466H5gyi9RFQPyx1jnlTLhYMqQFwwCy/6
	m+5SioQb4SNDGFt7SWdrK1s6G1zh
X-Google-Smtp-Source: APXvYqwlB2p7XOAVb6BF+JESkjTz1r/w0uvs9pfL37U5yKVYMBXLoX+R3fbMIm+MfLUxfIhbmAFIgg==
X-Received: by 2002:a65:4286:: with SMTP id j6mr733522pgp.218.1568661885240;
	Mon, 16 Sep 2019 12:24:45 -0700 (PDT)
Received: from localhost.localdomain ([4.16.80.121])
	by smtp.gmail.com with ESMTPSA id d7sm5490494pfr.7.2019.09.16.12.24.44
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 16 Sep 2019 12:24:44 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 16 Sep 2019 12:24:28 -0700
Message-Id: <20190916192429.27294-7-armccurdy@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190916192429.27294-1-armccurdy@gmail.com>
References: <20190916192429.27294-1-armccurdy@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 7/8] initscripts: enable alignment.sh init script for big endian ARM
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
X-List-Received-Date: Mon, 16 Sep 2019 19:24:44 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 .../initscripts/initscripts-1.0/{arm => }/alignment.sh           | 0
 meta/recipes-core/initscripts/initscripts_1.0.bb                 | 1 +
 2 files changed, 1 insertion(+)
 rename meta/recipes-core/initscripts/initscripts-1.0/{arm => }/alignment.sh (100%)

diff --git a/meta/recipes-core/initscripts/initscripts-1.0/arm/alignment.sh b/meta/recipes-core/initscripts/initscripts-1.0/alignment.sh
similarity index 100%
rename from meta/recipes-core/initscripts/initscripts-1.0/arm/alignment.sh
rename to meta/recipes-core/initscripts/initscripts-1.0/alignment.sh
diff --git a/meta/recipes-core/initscripts/initscripts_1.0.bb b/meta/recipes-core/initscripts/initscripts_1.0.bb
index 91eea4b8c2..1a59b82fbf 100644
--- a/meta/recipes-core/initscripts/initscripts_1.0.bb
+++ b/meta/recipes-core/initscripts/initscripts_1.0.bb
@@ -40,6 +40,7 @@ SRC_URI = "file://functions \
 S = "${WORKDIR}"
 
 SRC_URI_append_arm = " file://alignment.sh"
+SRC_URI_append_armeb = " file://alignment.sh"
 
 KERNEL_VERSION = ""
 
-- 
2.23.0


