Return-Path: <alex.kanavin@gmail.com>
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com
	[209.85.208.181])
	by mail.openembedded.org (Postfix) with ESMTP id 8D5007D136
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Mar 2019 14:09:35 +0000 (UTC)
Received: by mail-lj1-f181.google.com with SMTP id q66so14541872ljq.7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Mar 2019 07:09:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=HTDy1ZIqXUfR9GBON/mQzhb3nz0r51GisQMIv+XhlWE=;
	b=O/z+CPlqvKVCxnkEEqUMRImyEYxG4rlt7H2flHYLgNrG3OP4wgndFd/r8Qxjq8IGa8
	1p4P2aq2kH21go93MuNM4ZewwpgwEHYZfRHe98BM8wobbSG5xtJl5Qn9IFDehW7o6hrt
	nXdVB/s65yN0ZBhWT7sdG6V6R2qMLEoKLgTHRqx9TirSlabTALyYSE3lDs6mgrXqTkZs
	w8cWzYOYqlADOBou2gwHCozenLNrXXztno1hADWum+TdWfZm1Tq7QwA4XltpWVnq14yx
	yWIsOZmYPyWbDQmfmEsvHKvrPHk+2npilAFcWCcUD90/lQVb9O1AAsIItLuGS7o0W+oM
	WaQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=HTDy1ZIqXUfR9GBON/mQzhb3nz0r51GisQMIv+XhlWE=;
	b=fXDNQ+k8cMoWM80UaLebued+B9CS8PAuNyzRJKPQLB1tKgsZaS3OAswMCDONN1KlWJ
	lqWWt7QCqiH7EAtNPkSTPLDMH4djNnOKmN/q/6A0sOFROxlWz1EQ/Jwj2buaYMs/FHNJ
	5a71EYpmLlFJWSwA142Y9kfAECU8ZPxm8wvde08jhR36qcpMGsU/fvj/FuuPCwJr6rCM
	mEf8CU8mB1vFE8uyr8WMiRh29uSKdhsWWhZ9U85dQ6daI9duWr6gmq98/ausmWkKzuQY
	Y2/jNF3ZJskh3PPbkdjby1IQbRvAu5nu+Ke7+CvywXR1QpGpRY9ZPAJnq+v6nRyX1isE
	j4qQ==
X-Gm-Message-State: APjAAAWpBaz7zFy/0W4W5NtGXi61gdTnTBeA/ZEuQg4iLCm1d4tMQhMC
	iG/L5BiwieSJZp6AnanvIYNA6Ybm
X-Google-Smtp-Source: APXvYqyxhGeOT1PfxoSYdJkIqVayfvQ61UYZ+XvtlZW1HAveZ3Nww4TvsW7JC/WBzxZe+6e0YqHPRw==
X-Received: by 2002:a2e:9e9a:: with SMTP id f26mr19483926ljk.67.1553695776015; 
	Wed, 27 Mar 2019 07:09:36 -0700 (PDT)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id 1sm4704382ljw.56.2019.03.27.07.09.34
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 27 Mar 2019 07:09:35 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 27 Mar 2019 15:09:22 +0100
Message-Id: <20190327140922.109867-8-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190327140922.109867-1-alex.kanavin@gmail.com>
References: <20190327140922.109867-1-alex.kanavin@gmail.com>
Subject: [PATCH 8/8] sysprof: drop obsolete no-update reason
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
X-List-Received-Date: Wed, 27 Mar 2019 14:09:36 -0000

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-kernel/sysprof/sysprof_3.30.2.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/recipes-kernel/sysprof/sysprof_3.30.2.bb b/meta/recipes-kernel/sysprof/sysprof_3.30.2.bb
index 27f37f808e8..24e49cb0d58 100644
--- a/meta/recipes-kernel/sysprof/sysprof_3.30.2.bb
+++ b/meta/recipes-kernel/sysprof/sysprof_3.30.2.bb
@@ -15,7 +15,6 @@ SRC_URI += " \
            file://define-NT_GNU_BUILD_ID.patch \
            file://0001-Do-not-build-anything-in-help-as-it-requires-itstool.patch \
            "
-RECIPE_NO_UPDATE_REASON = "Waiting for resolution of https://bugzilla.gnome.org/show_bug.cgi?id=794625"
 
 PACKAGECONFIG ?= "${@bb.utils.contains_any('DISTRO_FEATURES', '${GTK3DISTROFEATURES}', 'gtk', '', d)}"
 PACKAGECONFIG[gtk] = "-Denable_gtk=true,-Denable_gtk=false,gtk+3"
-- 
2.17.1


