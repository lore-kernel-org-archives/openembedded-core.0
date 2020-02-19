Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
	[209.85.128.43])
	by mail.openembedded.org (Postfix) with ESMTP id D08E361475
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Feb 2020 19:48:25 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id a6so2000336wme.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Feb 2020 11:48:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=rlcGy3tdNg8j7VYXbTGfAqtVa9RkH/M5hMH2LCmHO5I=;
	b=UITNkHgR4kLO9YKaPdxZ4vLCCZLuiw9D/mqT8a8Z+lodqUNy0W8RUSnhC/arbB7JK4
	t3YgAFPFhI80XASFNy4nzkymFrvWD4iNEsg7N7P6ZUGabGEKlsWcRA2Qq1q7rVorxWF8
	+sFEbs/MpTa/7lgU+NQwZF3DD2gsw5YSW25exhbr2Bvm5nJ8YTNN77EUMz6o2IwJRGNf
	kRlt5COaSIpUUv+YkmWJHji9SvGUIg1mBQtW0Cv29o/HrEbUxo3gfkD26HxYe8bCyyA8
	57WWu4s0EnC/mfws12ZgE3dNyNz4XCRyv0XQB4mb4GkT9RGDlGGcHewcdrBo5oYzZaQL
	v1gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=rlcGy3tdNg8j7VYXbTGfAqtVa9RkH/M5hMH2LCmHO5I=;
	b=U4ueAIQVbJACDJ8ATNZN/wvpK70s200ahJSh/8Cn264XYKNeEuvC3l/d3qrldRd5OG
	rmhrhUrjuj3qR5Sfzbt/wQ4fYdWdhSQzLvutcpli+gWJCJ5+XAb2VAEh0ccNEt5N9OyE
	ZBnbianY0Sh0JXJ8YIB+UE+4Hut1qFopRj8haU+RvgNHgsHTMGcAv3AKpxSlPnduF/JN
	VJ/624Uirt3pKJr/iHh/Z3NOzMNpGQKH/L34qsVbwg6WLnE/Q4FtDIKJTGO3GgdArpSw
	DJVlx1+kIhXL9mfIP9q7hBq4+wZukhaICv65XIdnWef5zoFgnKiKSB4Zg0GXWqAaHFWQ
	XJOw==
X-Gm-Message-State: APjAAAUO5ku0ZKlQ/ZJtegmD1ekPVjMgAEoBxSi0E+oQ5tco7SE9MLk8
	3aCpZ71qUw1OhVN1/o0LmkopFNaX
X-Google-Smtp-Source: APXvYqx7y8/tgApH09u2xt6vOZblYs5k0vjpYo2a7RAWWXB+xXR7q0Sul+w96hBScsJhjRhg+ElY1g==
X-Received: by 2002:a7b:c651:: with SMTP id q17mr12275888wmk.5.1582141706391; 
	Wed, 19 Feb 2020 11:48:26 -0800 (PST)
Received: from linux-f9zs.site ([2a02:2450:1011:56f:238d:84be:b349:9184])
	by smtp.gmail.com with ESMTPSA id
	y185sm1204049wmg.2.2020.02.19.11.48.25
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 19 Feb 2020 11:48:25 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 19 Feb 2020 20:47:51 +0100
Message-Id: <20200219194752.7967-12-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200219194752.7967-1-alex.kanavin@gmail.com>
References: <20200219194752.7967-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 12/13] vala: upgrade 0.46.5 -> 0.46.6
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
X-List-Received-Date: Wed, 19 Feb 2020 19:48:26 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-devtools/vala/{vala_0.46.5.bb => vala_0.46.6.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/vala/{vala_0.46.5.bb => vala_0.46.6.bb} (57%)

diff --git a/meta/recipes-devtools/vala/vala_0.46.5.bb b/meta/recipes-devtools/vala/vala_0.46.6.bb
similarity index 57%
rename from meta/recipes-devtools/vala/vala_0.46.5.bb
rename to meta/recipes-devtools/vala/vala_0.46.6.bb
index 9233d109dd..66f620384c 100644
--- a/meta/recipes-devtools/vala/vala_0.46.5.bb
+++ b/meta/recipes-devtools/vala/vala_0.46.6.bb
@@ -4,5 +4,5 @@ SRC_URI += "file://0001-git-version-gen-don-t-append-dirty-if-we-re-not-in-g.pat
            file://0001-vapigen.m4-use-PKG_CONFIG_SYSROOT_DIR.patch \
            "
 
-SRC_URI[md5sum] = "a0a2eb8babb72c1b4e81c4f1b98429df"
-SRC_URI[sha256sum] = "1a7847d2599d902c805a58b95b72b69e64c0223c2f6220163998a7ab4b42db1d"
+SRC_URI[md5sum] = "d9af125648505503b139ebc2d2c9eee5"
+SRC_URI[sha256sum] = "ef31649932872f094971d46453b21c60a41661670f98afa334062425b4aec47a"
-- 
2.25.0


