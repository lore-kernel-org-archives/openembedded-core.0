Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
	[209.85.221.48])
	by mail.openembedded.org (Postfix) with ESMTP id B0CDC6C5C2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Nov 2018 15:41:54 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id t3so9695345wrr.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Nov 2018 07:41:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=i6N/qXJtqjl/jHR2zeZYpMbvdshIAsHvLZrodw5ItHc=;
	b=nBV07QuwFNkhQOrNCBMJkRc8INkQIKIW8cdm65slUGAzqkQHb8+J6IRf2Y/RH7txdV
	sOQA4p9hP186H5crpSUKqoxx1Qdi+MLHzAIfdSsHD+y3SLxKs6MOVDNZCaqQwOzV2GcF
	JggLqo1vkl6DzXjf7+1dBuVvdn6f6YyMs+yl59d7ShLa74day95TK4LBDsl3wQhZ/um3
	w9OULLvMeT0M5t4neIKDjFpKGIA6OjY86bB5vngM3/rHrRXlROc2PyBf6iec+SXr5CO+
	VIT+d8rws+AGBgilHmdGNnjHRh2Gewp3HjNsURNARpKLM7pw/TEbHyQP779TLbie+1nd
	Kdng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=i6N/qXJtqjl/jHR2zeZYpMbvdshIAsHvLZrodw5ItHc=;
	b=EBQDowa68d8H2blclpqkwhGZ/qihVQWeuQhZffpQ+jEVu6v/n96LuSoy0Y7jRTnDNA
	WIc5ROmypdkTQJtlqxv9sLYHEhxy9gCKojDZKYVv5vyJ2Xhnht//sSHr1AE8tgQuyyFl
	BaQ9o9Mxt6Tdf8enC0JS8ufuR4oCeZaiw2g25FglT0nRMrrdkA/l4Z2x/++c639Yl6cZ
	QdQOfk4VhLLJYvl5VK77Hut3j+e2iHXYjgV6qU/v7yYaRBrRXf6qLvIXdafIjLZx8wbg
	WYpjt4RJ6rw8vwQbb8ukwGAYoB3CVdk0bBROE0Iyrimopquz5Xe5CK5k8FjipR/6ICDt
	TJwg==
X-Gm-Message-State: AA+aEWYiZEM4hsfxmpodlnA5smKF7kA630/VYlft8oStuPvD+OTHjRWF
	mmOS8BinmfxS4AzeK5lD+SafhC+Y
X-Google-Smtp-Source: AFSGD/Ub9scbRDFRM434Kz83KvTIfoI/iPRbixIjd+FsKvhbT3o69y/68Lhl6dy5Fa9iDeVI0+foXw==
X-Received: by 2002:adf:8342:: with SMTP id 60mr9737314wrd.212.1542901315072; 
	Thu, 22 Nov 2018 07:41:55 -0800 (PST)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	e8-v6sm3302931wmf.22.2018.11.22.07.41.54
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 22 Nov 2018 07:41:54 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 22 Nov 2018 16:41:26 +0100
Message-Id: <20181122154136.121480-6-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20181122154136.121480-1-alex.kanavin@gmail.com>
References: <20181122154136.121480-1-alex.kanavin@gmail.com>
Subject: [PATCH 06/16] gdbm: update to 1.18.1
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
X-List-Received-Date: Thu, 22 Nov 2018 15:41:55 -0000

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-support/gdbm/{gdbm_1.18.bb => gdbm_1.18.1.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/gdbm/{gdbm_1.18.bb => gdbm_1.18.1.bb} (89%)

diff --git a/meta/recipes-support/gdbm/gdbm_1.18.bb b/meta/recipes-support/gdbm/gdbm_1.18.1.bb
similarity index 89%
rename from meta/recipes-support/gdbm/gdbm_1.18.bb
rename to meta/recipes-support/gdbm/gdbm_1.18.1.bb
index aad4300952c..16ecc506cea 100644
--- a/meta/recipes-support/gdbm/gdbm_1.18.bb
+++ b/meta/recipes-support/gdbm/gdbm_1.18.1.bb
@@ -10,8 +10,8 @@ SRC_URI = "${GNU_MIRROR}/gdbm/gdbm-${PV}.tar.gz \
            file://ptest.patch \
           "
 
-SRC_URI[md5sum] = "e316f8e4a3e7e4f23955be65d54fec48"
-SRC_URI[sha256sum] = "b8822cb4769e2d759c828c06f196614936c88c141c3132b18252fe25c2b635ce"
+SRC_URI[md5sum] = "988dc82182121c7570e0cb8b4fcd5415"
+SRC_URI[sha256sum] = "86e613527e5dba544e73208f42b78b7c022d4fa5a6d5498bf18c8d6f745b91dc"
 
 inherit autotools gettext texinfo lib_package ptest
 
-- 
2.17.1


