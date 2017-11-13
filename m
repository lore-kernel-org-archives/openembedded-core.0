Return-Path: <vomegaz@gmail.com>
Received: from mail-wr0-f196.google.com (mail-wr0-f196.google.com
	[209.85.128.196])
	by mail.openembedded.org (Postfix) with ESMTP id 9A812786A5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Nov 2017 19:11:59 +0000 (UTC)
Received: by mail-wr0-f196.google.com with SMTP id y42so15395653wrd.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Nov 2017 11:12:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id;
	bh=W8EwhBOApKQSHJkLTwNb9oPl+EGGYgSjwQkGkTE6D6E=;
	b=FXnazIUh0AdVX+/rRvE41S9AtCuxm9URswftN/pzfvGTfhblQybfPyklelLBHEaIZ2
	gESez79OJgNW1KjiDx9tn3GAOUTxsOZITpTmsYu5x5ZxQRxN/ogXDtc0GRkcWbDiuJPk
	OtCKvL8CWk0blmywAiMdkf73u9OYom+jHA2RLA0/AqzsFGo4BUF0AqL9QuIt8fVJirGg
	LRveDBGYhpRkrsywo2phCYNHC7SIOi5OL7d2MGMFa3x44kaOyp/MWHj3NlIsIxhX7DGL
	VCBlsTWPWfY977KDn4V1i5D9dAxOsDUtrs+2fKojthBL1LJk8093+N7goTdXF6kKdrxQ
	cHpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
	bh=W8EwhBOApKQSHJkLTwNb9oPl+EGGYgSjwQkGkTE6D6E=;
	b=aNokk4TK+N0WXLstbyUKi3IyFXgIB5xCbkUvZirICU2dv30J3kCr0Bp2oNb0M+1CO0
	S4+7NkChYLqdz6SMchuDwkhFQ6lrluafHTBGR/SG4YTBJnu8a82djXW0cAtsdmSvMs6y
	RCsFGHosgvRKrtGhCc+saW5qtsBCyLTz3WpwXUZUMvPh2pu5TdN///jvhIRrFx+Ei8Eh
	Upni+WZjR+921HBhMIOkTBrIoC/+oHfvn/o5gqZbEkZbxYMWUbMZ3VZmZ89XeYBroecc
	v0BZMdyVPpKVg5iOzVUL2og6qwJd+ZUO9CGamhlsBaPBsgEu3Jy11cFeWjNfVCHIqQpo
	bqKw==
X-Gm-Message-State: AJaThX4gLLjdFwGcuA44x9Ogw4NcEIURqnHpsSEvzIhdTuYSix1RRxtb
	DwkKgZri60jIA0ZGS76+HUgsDccw
X-Google-Smtp-Source: AGs4zMb6DjH3oR2NH1Kr8nnNydsXhPmTohzH1NWaAW0E495eJSheKh6Rnm+bH5v5JtoZNCBq6zsuOA==
X-Received: by 10.223.141.129 with SMTP id o1mr8000188wrb.95.1510600319768;
	Mon, 13 Nov 2017 11:11:59 -0800 (PST)
Received: from sgxcmp483.sigfox.io (ram31-1-82-234-79-177.fbx.proxad.net.
	[82.234.79.177]) by smtp.gmail.com with ESMTPSA id
	d12sm7599047wre.85.2017.11.13.11.11.58
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 13 Nov 2017 11:11:59 -0800 (PST)
Sender: Thomas PERROT <vomegaz@gmail.com>
From: Thomas Perrot <thomas.perrot@tupi.fr>
To: openembedded-core@lists.openembedded.org
Date: Mon, 13 Nov 2017 20:11:53 +0100
Message-Id: <20171113191153.32753-1-thomas.perrot@tupi.fr>
X-Mailer: git-send-email 2.13.6
Subject: [PATCH] toolchain-scripts: Add PYTHONHOME in sdk env script
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
X-List-Received-Date: Mon, 13 Nov 2017 19:11:59 -0000

Otherwise, the host Python environment is used instead of Python environment
provided by the SDK.

Signed-off-by: Thomas Perrot <thomas.perrot@tupi.fr>
---
 meta/classes/toolchain-scripts.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes/toolchain-scripts.bbclass b/meta/classes/toolchain-scripts.bbclass
index 9bcfe708c7..03bc652cd7 100644
--- a/meta/classes/toolchain-scripts.bbclass
+++ b/meta/classes/toolchain-scripts.bbclass
@@ -51,6 +51,7 @@ toolchain_create_sdk_env_script () {
 	echo "export OECORE_NATIVE_SYSROOT=\"$sdkpathnative\"" >> $script
 	echo 'export OECORE_TARGET_SYSROOT="$SDKTARGETSYSROOT"' >> $script
 	echo "export OECORE_ACLOCAL_OPTS=\"-I $sdkpathnative/usr/share/aclocal\"" >> $script
+	echo "export PYTHONHOME=\"$sdkpathnative$libdir\"" >> $script
 	echo 'unset command_not_found_handle' >> $script
 
 	toolchain_shared_env_script
-- 
2.13.6


