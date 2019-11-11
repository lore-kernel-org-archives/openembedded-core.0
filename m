Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com
	[209.85.214.169])
	by mail.openembedded.org (Postfix) with ESMTP id 9C0477FA48
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Nov 2019 18:30:10 +0000 (UTC)
Received: by mail-pl1-f169.google.com with SMTP id l4so8097425plt.13
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Nov 2019 10:30:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=Xpw+6a7b+ZWsOQ4dSSMnGDtZIuvfEaSDqkxaL1fT29o=;
	b=Ott2IbK+3ZJg0dl4bhaPjKJpavRxa1bTHzRnS6K+bR1nYN9FknLTTgYCQdQnW5EVgl
	C0m0VRFyxyutg5C3Uk5e64Tr23KtIi4AcTsYaoHaGL0cdKNMS/CnglFyLq2Oiw49yuXk
	8Z7GnO3Ueez0uxts6UKXnrropKOQASYJ/WzzqamwlX5Y4+wuIHahaoJ476KQYLLcxfWF
	+1OwxyzjHeKpHePs4PTShIF1hbYPPpdSmKd0Tn1IgNPV4LBX+oSXcuIKG76tWs2kDYo/
	tk6Rx0dGXMxLFEdbI/+dXzqNgBEx42tEUiYdS+PkkrZrUx4wABodHLTjmD3IGiIvBjRi
	r2LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=Xpw+6a7b+ZWsOQ4dSSMnGDtZIuvfEaSDqkxaL1fT29o=;
	b=E0we5L+nMHCsfIwEJEK9BcWUVggAFHjTEGl88jQrGqUBvFXuD96mNUvLwWvEyxqrcE
	ZJRy2O/1yLFxWA0+wgyQ8heod77OlZL8HJ2JqOaszDzpfgMHoV+imEtDMWt5jRIuwIsh
	e4Z3SP7xACdVPkxZgPuE3ewdcKsacA1gso55hriDFsqnanHAT8+f2cBmoYju00UDiC5T
	puux32tMToIYwNYs3htMf0Wk9jMtwx+Xr4djo6KxmjwCNCsNanqM4f6/fuAKWY7ZoSzr
	KbKjvi247cLyhpcndyFv84aBCi1yE78K5W14q+vowurzHOfqoPHE4VMHADpoB0DKKsKF
	F2fw==
X-Gm-Message-State: APjAAAW1KRHzfq5WTlQ72rmkhg3wMIg2Nl+2xmtbi0kRIj2vt1C9yupW
	Z7M8L3gX+V600djYpBWLdtBAgBFG
X-Google-Smtp-Source: APXvYqy/vDky9PAjsD/lKZGL3Nsmba4FEPRWWiKYqnpL1y4qUz9byfPRcAqUvOMdsf+gckaoxbw48A==
X-Received: by 2002:a17:902:758a:: with SMTP id
	j10mr28194254pll.29.1573497011575; 
	Mon, 11 Nov 2019 10:30:11 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:604a:b703:29ca:5c7d])
	by smtp.gmail.com with ESMTPSA id
	l62sm17731698pgl.24.2019.11.11.10.30.10
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 11 Nov 2019 10:30:11 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 11 Nov 2019 10:29:45 -0800
Message-Id: <4668ac8c2600fe5698f030ed1e8cba69c0989a2c.1573496794.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1573496794.git.akuster808@gmail.com>
References: <cover.1573496794.git.akuster808@gmail.com>
Subject: [zeus 03/21] file: run test suite when building natively
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
X-List-Received-Date: Mon, 11 Nov 2019 18:30:10 -0000

From: Ross Burton <ross.burton@intel.com>

As we apply the same patches to native and target builds of file, we can verify
that the patches are not breaking by executing the test suite during the build
of file-native.

Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-devtools/file/file_5.37.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-devtools/file/file_5.37.bb b/meta/recipes-devtools/file/file_5.37.bb
index 509b6ce..60fc661 100644
--- a/meta/recipes-devtools/file/file_5.37.bb
+++ b/meta/recipes-devtools/file/file_5.37.bb
@@ -32,6 +32,10 @@ EXTRA_OEMAKE_append_class-nativesdk = "-e FILE_COMPILE=${STAGING_BINDIR_NATIVE}/
 
 FILES_${PN} += "${datadir}/misc/*.mgc"
 
+do_compile_append_class-native() {
+	oe_runmake check
+}
+
 do_install_append_class-native() {
 	create_cmdline_wrapper ${D}/${bindir}/file \
 		--magic-file ${datadir}/misc/magic.mgc
-- 
2.7.4


