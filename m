Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
	[209.85.128.45])
	by mail.openembedded.org (Postfix) with ESMTP id 4E57F7E07F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 May 2019 14:12:07 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id 198so13475858wme.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 May 2019 07:12:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=7bJ9j593n3NTDlhsrvmCd3AwG1JEaJIQfPDmZSsy25w=;
	b=rJgG9Dsc5NQEGqHKypu7KeVp8+qS7gwe7dhsVL+8N2Qct/UFRMpBf0sUMDw/+CCost
	hJZOSPaADae6QBVEjoiz5fsBmAexMpWfahpkCPkQwAEN4Iw5yLyTTzFAKlAWhk8sTuao
	eiqqQ96LobEcN4LuqjEgMlo3P8fDnmaHS8P2S8tA8sw5zMhUMze2TghNMx2xG0tMPae2
	LA4vMLZ48HADTX/XG0iTGG9bzqL2CVDfTqHzEFOTgRe5liNGf/qKoFfZsRJNKDw4XWJx
	O0mhpygcjc6jo6dTuak2ZaZbA92FUhosTAH4pRdxZu8gLM02myZjsszJZX2SvQSKc5LS
	rALA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=7bJ9j593n3NTDlhsrvmCd3AwG1JEaJIQfPDmZSsy25w=;
	b=JnRcLItSsYI24YaE2tRS6yAFuJUqRbMcW9xUoxLDo0CUtN5sJqOJAQuLiAjG+PxC0+
	omO3+DxBH3lCxzF66HPj9mJCc2VP39Htbi7EX4lqYQ3U+L3oc1oH5SuSFMFF0/8RqR8S
	wjzIlgF69HmKsRA2F6NoeRxFk4MtnmkCDtR67dcD0cOkg/pQ/UqnNRASWGC+qZzk3gKR
	9PJHSCDZN/hNMc6HEntQq2fPamGoz6f+0POasPuyWdfnlvbtTIY748qbW/NnN92ytIzd
	9Yf+Y+gQsKZg5S9wMg/53CM/qBW0XFB7qOSQA2F47qjTyPLBEVwuwGQ/uWfhtHfyBNf9
	/vhQ==
X-Gm-Message-State: APjAAAWbpPaMaHPsdPJMnT4g5oZo7wi2jy7hNAzU6MQxI06ISDcwTz48
	XS8DWnnG5tRxrLfNy1yJ6QqSRuzP
X-Google-Smtp-Source: APXvYqypeXM4TrR+jXcoIt66gxypbsepVycgBeQj+pjHS36353nqG/Rt5e0ubsFxRd6VHc9egDwGMA==
X-Received: by 2002:a1c:2dc2:: with SMTP id t185mr6150005wmt.52.1558361527870; 
	Mon, 20 May 2019 07:12:07 -0700 (PDT)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	v5sm36242015wra.83.2019.05.20.07.12.06
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 20 May 2019 07:12:07 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 20 May 2019 16:11:19 +0200
Message-Id: <20190520141125.10805-36-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190520141125.10805-1-alex.kanavin@gmail.com>
References: <20190520141125.10805-1-alex.kanavin@gmail.com>
Subject: [PATCH 36/42] dnf: upgrade 4.2.2 -> 4.2.6
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
X-List-Received-Date: Mon, 20 May 2019 14:12:07 -0000

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-devtools/dnf/{dnf_4.2.2.bb => dnf_4.2.6.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/dnf/{dnf_4.2.2.bb => dnf_4.2.6.bb} (98%)

diff --git a/meta/recipes-devtools/dnf/dnf_4.2.2.bb b/meta/recipes-devtools/dnf/dnf_4.2.6.bb
similarity index 98%
rename from meta/recipes-devtools/dnf/dnf_4.2.2.bb
rename to meta/recipes-devtools/dnf/dnf_4.2.6.bb
index c77773332c1..769aa001707 100644
--- a/meta/recipes-devtools/dnf/dnf_4.2.2.bb
+++ b/meta/recipes-devtools/dnf/dnf_4.2.6.bb
@@ -12,7 +12,7 @@ SRC_URI = "git://github.com/rpm-software-management/dnf.git \
            file://0030-Run-python-scripts-using-env.patch \
            "
 
-SRCREV = "9947306a55271b8b7c9e2b6e3b7d582885b6045d"
+SRCREV = "30fa5051fc26f9866a271fbdb768d3c2524706d5"
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+(\.\d+)+)"
 
 S = "${WORKDIR}/git"
-- 
2.17.1


