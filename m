Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id 72BD36C5C2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Nov 2018 15:42:04 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id t27so1733732wra.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Nov 2018 07:42:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=f3+CQUoMc5vP77RKatPPZ0CXGqXRqv4vyxEIIf0lqHM=;
	b=T6qAVBxDVmsXxx1j7MrS+wpT861wQqeg7Yk+5vKD9scxRql/0JGiwKhXFpLfR1N6i3
	31e3j8Ap0YEEQHXl6/luXqqRW7jNjD/fy3pgMK4S1CnvNcGrOqtnt+49kuf0RFEdDkT8
	5U0AeOvf6Iyo1T1/xkfyrSezpZaTgoNhRP6YL5L0JLePUgHO4BohZHQKaAE3duWA5Mb/
	nZPw/U8xn5YHVrRpYikk6gYka9NjSlRYFs4wk8S/XBcoEzUrPRV36MhnQ7aDedWLPaYy
	TLgDQoHDo0YBD9JyGzseWaCCmnOZbkRVSBT+9M/vkjyR2Mlh0hxC02Rjhx/ngEfiZylt
	yXsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=f3+CQUoMc5vP77RKatPPZ0CXGqXRqv4vyxEIIf0lqHM=;
	b=CkcujsjdK9p62r439rYwowKl8r0bp/WVCcdF2bgENKMl4rZ1wkaN2lO1+GM8FqwK7a
	sXEsv0PCCGTSuodF3dZuSzuNbvRoXfJVbQPgeejYXW9q1Uu9j3u+1jicE9Qm4TGJFogO
	/HH9mUMmKSuMIJXOqy2Fr00xf49kRskaDooosZy9aRY+Mel8ch3Uv/d0ixi0jmK8MkNb
	9bn6rEH7Ki+V+7xezb/6FH2nA65h/5tpnYXWEKwynckrLgww/DpojQuZfuo+LokM2ozz
	yHZ1Yc8Dp8KnEozqjk9BDu6A4FkS4PMsHBXyaA3zEXu3VWuU4LZXYE8EJ2ffIqkvUuV0
	hubw==
X-Gm-Message-State: AA+aEWZSaUv+XKNPr5r+U6eF/gd6h9PFC4+/+zNSgKTXwIXITswW8XFG
	rbCaVawVl307Hy4ZWfKoeZzKZsp0
X-Google-Smtp-Source: AFSGD/W2Y4F1MDHvvAo30fswhQNk+39nLuNsws885s67xOI9A8I9wfaAHahMRSqbKbFARFnj0EK0bQ==
X-Received: by 2002:adf:9467:: with SMTP id 94mr10121740wrq.305.1542901325066; 
	Thu, 22 Nov 2018 07:42:05 -0800 (PST)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	e8-v6sm3302931wmf.22.2018.11.22.07.42.04
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 22 Nov 2018 07:42:04 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 22 Nov 2018 16:41:36 +0100
Message-Id: <20181122154136.121480-16-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20181122154136.121480-1-alex.kanavin@gmail.com>
References: <20181122154136.121480-1-alex.kanavin@gmail.com>
Subject: [PATCH 16/16] dnf: update to 4.0.9
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
X-List-Received-Date: Thu, 22 Nov 2018 15:42:04 -0000

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-devtools/dnf/{dnf_4.0.4.bb => dnf_4.0.9.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/dnf/{dnf_4.0.4.bb => dnf_4.0.9.bb} (98%)

diff --git a/meta/recipes-devtools/dnf/dnf_4.0.4.bb b/meta/recipes-devtools/dnf/dnf_4.0.9.bb
similarity index 98%
rename from meta/recipes-devtools/dnf/dnf_4.0.4.bb
rename to meta/recipes-devtools/dnf/dnf_4.0.9.bb
index 931e9eff07f..24412fd4860 100644
--- a/meta/recipes-devtools/dnf/dnf_4.0.4.bb
+++ b/meta/recipes-devtools/dnf/dnf_4.0.9.bb
@@ -12,7 +12,7 @@ SRC_URI = "git://github.com/rpm-software-management/dnf.git \
            file://0030-Run-python-scripts-using-env.patch \
            "
 
-SRCREV = "6fdf0e8cc714c92ee08bd4db9412d4c587ffafe9"
+SRCREV = "689a4c515738226f3dc85edb2035d23233ff41d8"
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+(\.\d+)+)"
 
 S = "${WORKDIR}/git"
-- 
2.17.1


