Return-Path: <ross.burton@intel.com>
Received: from mail-we0-f178.google.com (mail-we0-f178.google.com
	[74.125.82.178])
	by mail.openembedded.org (Postfix) with ESMTP id 85A58608F7
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 May 2013 15:11:30 +0000 (UTC)
Received: by mail-we0-f178.google.com with SMTP id q56so1364918wes.37
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 May 2013 08:11:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references:x-gm-message-state;
	bh=namtxTWHPeoo7+EKIoLZPBeIZpHzYQYaCZAvAPqup6I=;
	b=pA+w+x/ldErvpUf7NlSHBtZveJRRqTUufQLzVcMvD8nY1bPQ9spnpfcaQvpYm09Qh4
	5ONJN9coI+L8oEngnrnV11L93FQ9CR4VUmdLQoXC3PWMpLTGEOnNG21uuUxz3XHo3TRn
	KM6L/8XPE+j607fKeAOSlbyA9Z4gC4+krZiKkUo2t0uCokTChHz/4eTWKiWDivJSkXQW
	/6STHyFKJerr68rSMebUwE/ISSRglFM0W/N13wyV3aytfn63R8yRpuhbXr61HzIprWjn
	6jBD76ASPnrBa3UbpCPe355ZnrpiYlpXJoqLkVSfYI8mRzFtAUMQID17d5ERk0fXMKsz
	h8Jw==
X-Received: by 10.194.235.99 with SMTP id ul3mr9975737wjc.6.1370013091250;
	Fri, 31 May 2013 08:11:31 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id ca19sm4609942wib.3.2013.05.31.08.11.29
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 31 May 2013 08:11:30 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 31 May 2013 16:08:05 +0100
Message-Id: <eb71530258ea97591ca2ce498487889df94e9a46.1370012830.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1370012830.git.ross.burton@intel.com>
References: <cover.1370012830.git.ross.burton@intel.com>
In-Reply-To: <cover.1370012830.git.ross.burton@intel.com>
References: <cover.1370012830.git.ross.burton@intel.com>
X-Gm-Message-State: ALoCoQnRgGvQXMe5BZtshpNODMp3EOX9EchG37uDpTv5xGZTd/t3bwoPkrScdipmEo7LT3JAHFTg
Subject: [PATCH 2/7] mesa: update git recipe to 9.1.3 release
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
X-List-Received-Date: Fri, 31 May 2013 15:11:30 -0000

It's not bleeding edge but it's better than the previous pre-9.1 commit.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-graphics/mesa/mesa-git.inc |    9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-graphics/mesa/mesa-git.inc b/meta/recipes-graphics/mesa/mesa-git.inc
index ee9a552..c5507ce 100644
--- a/meta/recipes-graphics/mesa/mesa-git.inc
+++ b/meta/recipes-graphics/mesa/mesa-git.inc
@@ -1,11 +1,12 @@
-# Current pre-9.1 commit
-SRCREV = "1665af3066f3d58c42e9d5b13098f13615a7672c"
-PV = "9.1~git${SRCPV}"
+# 9.1.3 commit
+SRCREV = "f32ec82a8cfcabc5b7596796f36afe7986651f02"
+PV = "9.1.3+git${SRCPV}"
 
 LIC_FILES_CHKSUM = "file://docs/license.html;md5=42d77d95cba529a3637129be87d6555d"
 
 SRC_URI = "git://anongit.freedesktop.org/git/mesa/mesa;protocol=git \
-           file://0002-cross-compile.patch \
+           file://EGL-Mutate-NativeDisplayType-depending-on-config.patch \
+           file://fix-glsl-cross.patch \
            "
 
 S = "${WORKDIR}/git"
-- 
1.7.10.4


