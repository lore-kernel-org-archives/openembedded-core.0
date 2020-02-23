Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	by mail.openembedded.org (Postfix) with ESMTP id C3EA0616F4
	for <openembedded-core@lists.openembedded.org>;
	Sun, 23 Feb 2020 10:55:15 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id a5so6161039wmb.0
	for <openembedded-core@lists.openembedded.org>;
	Sun, 23 Feb 2020 02:55:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=YtlI6qRPZmAWFlwEeqmeacBImGM4qyKE+Z3DSlpNvZ0=;
	b=JDzWIWLG3VR3H1U5eMURnV8Y6g7ssrPJ5cK56pEb8DZO0rLIIL2ayinacOReTLb28Z
	4ZRg9MsCtWJggT3UK10MwxWq2LJ7rFRpx7UiL9jX6rcWLokdgC/aUtNcfnBPn9he+G+W
	refo9bxa58/mv/poDro/VrrIshIPWuRkNIqDc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=YtlI6qRPZmAWFlwEeqmeacBImGM4qyKE+Z3DSlpNvZ0=;
	b=KYsI5owNOFlOceXkmOsX9WyeTHSMVu4rKHuBKHd6oVQUT7GjVpf5wG7fY+SjWgSVYl
	oAUkOiBh5RhbtsIVAhak0qK4sYMFv6xUHyKphixH+yzeBhdf1WZz6XKYACUab79aJtzj
	nkpjwWivcl84ey67rgv+DdRoKUSdLtjDyP6Swjvx0fkndqV4Se9/UYgAy4UCqaqGDinO
	R5IoMDyaXS2F0cOj6C3BJ7PIAGcACHpa0ZXHZtmTnKrqq2ExPwrxEfbN2SYzakmXXZaz
	6nxN75YMMRk40zP7YU8n3Sq7utLgIyJdIXVX8p2WSvGGd8xo9gxL4mCJ1F5ohSLMIn7b
	mzpw==
X-Gm-Message-State: APjAAAVhcNZZYNAo4xV4pRB3ryrW7ZkVXAzxqRQb0TE082ZBy80sI8Wz
	+48B3C48QvHa+ij+eFhh5NIqiJINlkA=
X-Google-Smtp-Source: APXvYqywxKniAMOL3on/1OEqW6StjmKDTUpJAEFoeWDIW1YIafG5KfaG3RErJAL65bsTMJmp5nKQSg==
X-Received: by 2002:a1c:a74d:: with SMTP id q74mr15548568wme.152.1582455316052;
	Sun, 23 Feb 2020 02:55:16 -0800 (PST)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	v1sm6286810wrp.16.2020.02.23.02.55.15
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 23 Feb 2020 02:55:15 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Sun, 23 Feb 2020 10:55:13 +0000
Message-Id: <20200223105513.285315-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200223105513.285315-1-richard.purdie@linuxfoundation.org>
References: <20200223105513.285315-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Subject: [PATCH 2/2] package_ipk: Add missing variables to the task hash
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
X-List-Received-Date: Sun, 23 Feb 2020 10:55:16 -0000
Content-Transfer-Encoding: 8bit

Several variables used by the task are not included in the hash, as highlighted
by recent changes to MAINTAINERS not causing rebuilds. Fix this.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/package_ipk.bbclass | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/classes/package_ipk.bbclass b/meta/classes/package_ipk.bbclass
index 25d1ab725ad..c008559e4ab 100644
--- a/meta/classes/package_ipk.bbclass
+++ b/meta/classes/package_ipk.bbclass
@@ -237,6 +237,10 @@ def ipk_write_pkg(pkg, d):
         cleanupcontrol(root)
         bb.utils.unlockfile(lf)
 
+# Have to list any variables referenced as X_<pkg> that aren't in pkgdata here
+IPKEXTRAVARS = "PRIORITY MAINTAINER PACKAGE_ARCH HOMEPAGE"
+ipk_write_pkg[vardeps] += "${@gen_packagevar(d, 'IPKEXTRAVARS')}"
+
 # Otherwise allarch packages may change depending on override configuration
 ipk_write_pkg[vardepsexclude] = "OVERRIDES"
 
-- 
2.25.0


