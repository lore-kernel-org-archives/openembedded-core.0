Return-Path: <alex.kanavin@gmail.com>
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com
	[209.85.167.50])
	by mail.openembedded.org (Postfix) with ESMTP id 98A1E7C1EC
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Jan 2019 16:27:08 +0000 (UTC)
Received: by mail-lf1-f50.google.com with SMTP id v5so8251137lfe.7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Jan 2019 08:27:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=iL9Q+Dm8LL9VHk9Jf4AooUD0ONMeaTANbLLYQRIKXfw=;
	b=cYs5BGOGiYvGHmJ4aFGljcSXienUyTm/Qn80rNIxRx1xmQFjrFW66QU2FGX108WKUG
	4X8j4C5r3dUjYmwTYfN2+HrmJGsLpRRaJAZuFXyfp25UtJ7ZqrxUWTpqldLMfPm6xjev
	dhrglqylVebCA+Of762MXgkRN+XxjBAqLHr7rHL9Yn+gvHWWG+zlG7OUZbtxXtwrjeRA
	qZ37KVDUn/wbhM6mVZ2C8ZVbx5TktGWY328e9M+ONnzhcCJFixaBqkFHBoY/TPjOztyf
	b/Xf3p/XcdifvfhOBzIWePikwWSXGzkoyxf1WPaoIHD/5+XcOmGovUvL1//guoUnUpyn
	GLkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=iL9Q+Dm8LL9VHk9Jf4AooUD0ONMeaTANbLLYQRIKXfw=;
	b=gkPddC66jeylI3C//OVR5eYOkspY7BdlpGwl5irDCLZ9Cmm1RseP76Etwt8DJKeQjB
	5o99cvit4YT9o0QPWDGdRzhwxLTOWHHUcSN/gp5t3q4Drvl8Sqa6OD1+nbQ9MGNo+zhS
	7JNK5bVnDvrpWzAIHz57LZWRfDKMmDR1lWsIIYeHDOMcQP1ajuoKpgXz9Z9SpIIF3YMS
	3zjk58TQkRq7ChFrMCzxLxHfY/8HPXoSfdBO/uqjbJClqOYCA8AZVkSSg5C0nyTGzexa
	2vD2tFuIf910lZ8kHINreZc03Yug1JkWABbk6cEq8ueIETp6H7nUVa+UcPekWP7gyos7
	6mjQ==
X-Gm-Message-State: AJcUuke/PIChavYPN3GlpW2RSxJJpXtZpkzYw45o+zkDqTld2e00T8HV
	Og5lrXEPdTpUMr7mv3ADT4Ce6r35
X-Google-Smtp-Source: ALg8bN7qfXJsIsSDFmXduguvifNlN7rov/7dip1Qcz2fsCG6AAMSrdsJhTp30hT8mBJ4ztrh4WEQ7A==
X-Received: by 2002:a19:7dc2:: with SMTP id y185mr10514240lfc.27.1547742428852;
	Thu, 17 Jan 2019 08:27:08 -0800 (PST)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id q11sm358866lfc.92.2019.01.17.08.27.07
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 17 Jan 2019 08:27:08 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 17 Jan 2019 17:26:50 +0100
Message-Id: <20190117162659.24997-2-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190117162659.24997-1-alex.kanavin@gmail.com>
References: <20190117162659.24997-1-alex.kanavin@gmail.com>
Subject: [PATCH 02/11] liburcu: upgrade 0.10.1 -> 0.10.2
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
X-List-Received-Date: Thu, 17 Jan 2019 16:27:09 -0000

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../liburcu/{liburcu_0.10.1.bb => liburcu_0.10.2.bb}          | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/liburcu/{liburcu_0.10.1.bb => liburcu_0.10.2.bb} (84%)

diff --git a/meta/recipes-support/liburcu/liburcu_0.10.1.bb b/meta/recipes-support/liburcu/liburcu_0.10.2.bb
similarity index 84%
rename from meta/recipes-support/liburcu/liburcu_0.10.1.bb
rename to meta/recipes-support/liburcu/liburcu_0.10.2.bb
index 5eb91e144b6..b4b6e2323dc 100644
--- a/meta/recipes-support/liburcu/liburcu_0.10.1.bb
+++ b/meta/recipes-support/liburcu/liburcu_0.10.2.bb
@@ -11,8 +11,8 @@ SRC_URI = "http://lttng.org/files/urcu/userspace-rcu-${PV}.tar.bz2 \
            file://Add-support-for-the-RISC-V-architecture.patch \
            "
 
-SRC_URI[md5sum] = "281a2f92fdc39c40ad6b76f6631fdbd7"
-SRC_URI[sha256sum] = "9c09220be4435dc27fcd22d291707b94b97f159e0c442fbcd60c168f8f79eb06"
+SRC_URI[md5sum] = "7c424c5183ec009d87e0f70c23e92f1b"
+SRC_URI[sha256sum] = "b3f6888daf6fe02c1f8097f4a0898e41b5fe9975e121dc792b9ddef4b17261cc"
 
 S = "${WORKDIR}/userspace-rcu-${PV}"
 inherit autotools multilib_header
-- 
2.17.1


