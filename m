Return-Path: <armccurdy@gmail.com>
Received: from mail-pg0-f65.google.com (mail-pg0-f65.google.com [74.125.83.65])
	by mail.openembedded.org (Postfix) with ESMTP id 2647B7894D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Mar 2018 02:42:37 +0000 (UTC)
Received: by mail-pg0-f65.google.com with SMTP id m24so1430762pgv.8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Mar 2018 19:42:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=kTeuejkIzWTBGdvhNO0/AAK7PAh2RF1jUoao8M1FHUU=;
	b=GuUkFSjKFmZjNdFeVzbsJwEeQLgzuGNkv3my5Lhwc5zOVwMcbeDkqObdTbc1r1J9Rp
	m+VzPqoyOgpswD19OiTAPb1BahT/pC6W997lqanqr8MfINSd5eFOidVAQiGeQabfqA39
	aci/qJbYzpT+9OfrGi2Sol58AB4sCsOz0TZ29tfKb9HD3WYFX88GofJFX965edKX5Tot
	6/HvNhLcha+8Fy0D/H980km57jjhqwrW5dEEpqP1jHOySPXDs44NjjFOBKVN5o5GduFt
	xujehIXJ5sg77TrNMdO+lBQse3+4jZoFXNlaukAFbJiSosB+x83jokR/YkY4YlvF8pt0
	ltCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=kTeuejkIzWTBGdvhNO0/AAK7PAh2RF1jUoao8M1FHUU=;
	b=eHW6VoyuSMD9YF7iVy4JujxEnfBl327a0g6Hj+LKmPNU/20sF6nrmjMQtnb/u2EeMo
	qvn7NhpS3RZ7ATf8ABdCSN6XDAbamIUfPOL/M1Mlj0NFhxiA5ScNbNrQeNWsoGScKp6D
	aLEL8XdAom4sJnRxfe+YzbG1J0MB8Q3n35IsydTR2d7A5GvwsZ0gp4WtPQrJnrhok9WC
	rXUIfgCX9KhpTdcFPqYF88YkBTaSB2oVagI0c/F6KOGZuPoFIiw6sUT0b2s9Ks9PF1T0
	M0Ewo35dA/0aGd1TDaqVgULsCt5/ejjgYpOpNRLM6ergu9oN8hvhDSrJWrCZnls6ICCf
	rrmg==
X-Gm-Message-State: AElRT7Eag8twI/23bAcjSpeItdAs3Zc/GCNCo1OcJO0KAYbQhzLYP23A
	D+ZbM788YKfNewXJqXGWc8J9Nw==
X-Google-Smtp-Source: AG47ELtj3Z93FPn7IDOKhNy+fHZrjhGHeGR5j6LdABiujGbG4khn7V+PCiljyfa5pg1bWtmDOQWC0A==
X-Received: by 10.98.66.89 with SMTP id p86mr15491726pfa.228.1521600158751;
	Tue, 20 Mar 2018 19:42:38 -0700 (PDT)
Received: from e6520.cablelabs.com ([4.16.80.121])
	by smtp.gmail.com with ESMTPSA id
	12sm6172559pfr.108.2018.03.20.19.42.37
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 20 Mar 2018 19:42:37 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 20 Mar 2018 19:42:24 -0700
Message-Id: <1521600149-3894-2-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1521600149-3894-1-git-send-email-armccurdy@gmail.com>
References: <1521600149-3894-1-git-send-email-armccurdy@gmail.com>
Subject: [daisy][PATCH 1/6] dtc: old SRC_URI died, changing to new working one
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
X-List-Received-Date: Wed, 21 Mar 2018 02:42:38 -0000

From: Krzysztof Sywula <krzysztof.m.sywula@intel.com>

Signed-off-by: Krzysztof Sywula <krzysztof.m.sywula@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 131a17f014e6373dae526cc927588ccc0fedc38d)
Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/recipes-kernel/dtc/dtc.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/dtc/dtc.inc b/meta/recipes-kernel/dtc/dtc.inc
index 3eca25f..3edba45 100644
--- a/meta/recipes-kernel/dtc/dtc.inc
+++ b/meta/recipes-kernel/dtc/dtc.inc
@@ -6,7 +6,7 @@ DEPENDS = "flex-native bison-native"
 
 inherit autotools-brokensep
 
-SRC_URI = "git://www.jdl.com/software/dtc.git \
+SRC_URI = "git://git.kernel.org/pub/scm/utils/dtc/dtc.git \
            file://make_install.patch \
 	  "
 
-- 
1.9.1


