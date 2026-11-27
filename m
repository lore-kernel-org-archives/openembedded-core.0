Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1546.1795801794183786916
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 Nov 2026 09:49:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google2 header.b=F3KlMDd/;
 spf=pass (domain: smile.fr, ip: 209.85.128.42, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4ac95761c85so65679095e9.2
        for <openembedded-core@lists.openembedded.org>; Fri, 27 Nov 2026 09:49:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google2; t=1795801792; x=1796406592; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=pn6WotQjZn73zkFLoDjjv8ff35EwZey12cyPt5VLwkg=;
        b=F3KlMDd/66DWW6wlIWROpyqbYzKEWHj3yth9J9R7Ziu2jGV65BfunrRIl6/c377JJp
         nWhoMkqRza+KBWtSa/DdxtVjM1QuCf+v4WP0YvDhK/C0/e8pwgAA5j3L787GxeJsvmUe
         nTQBFPJ3OiNvBdNQxu9af9d4PrsZrLdixKQlrLqKsp9ZYJ0MXeB3Wi3uHK8QWzcitxE2
         YXDhWIWSvZx8xwGEhZKfTPfPUrWtsXtXx6STL6IWUCLtkiwwwMJmk5fue++V7OFhXN4F
         drwhQuds/NZYAc3XNj8jFsHfVxxhau65fKgT/8TwuQbjAuV73yR+WtsSIzA+4Kw1tZ5P
         UpHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795801792; x=1796406592;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=pn6WotQjZn73zkFLoDjjv8ff35EwZey12cyPt5VLwkg=;
        b=ktCFAJGesghf/d/001BvOyHiT2+mMt2ogeih8VQ1TSuTuktBkOes6E2gNTfQK7oxJW
         IZ3kvq5CxgmiPT/safLvmgD3+GoRmYK95jvPXJJOLn2NniGcfYqefHqJZBSsEHDOBXQS
         TC9PRFpt8vAPVkzPcQJJG3gk5Lgs+PxuUTGcuoKNXecruhD2rlC9tlLrQGa2vTVh5Nu3
         JmmzI5nxFXZQC+ulLyYDlj+nKD7m9yC7GU2DKfjzDZVTriFYV+Ymv3qC/UMvB82HjIAW
         wyFR9SQcqNEtgCW7c1VZztgxtqYvgMcyclKebQtzeKJflucl+BD9g1BSuw0NNb74VNjM
         tDtQ==
X-Gm-Message-State: APuU4Z9gWAwKGU/KLLxdjY4A7iVy0ejhDcNRp1dYE+5A91TBeHGDNOsY
	WcSXHnecHIM7W3WcjT4LudttTmNg5BsbN/oJQm224KPq6TRBNoAmBbjaNW/3GpV5Lw+bVFuvgHk
	P8Flj9J0=
X-Gm-Gg: AZFdTZe+m/PRgb5eMTkrz1yTNMBdSp96b/wQBOYiV9OjW1wd9MbqE1cSIwk/+Tt2OnC
	kpIaZN4bul2iX+Ab1gG17nrHycgOIAwsWKiRwHfCZVgEThW2FTjuZY3x+eW70ZAw6KBjfpaaXm2
	JGbClS7P91Gpqw2ZczCLh6kK5ZvH3ny/xbTfSJfMHuszM6TCngVoREltm2sbjMzPY8HQf+KltLP
	Rbh3X8i9xaniKa4vvYbs/S593HdAIFSrTzfUOAYWi3VVcglKtxhYGFnCqjwNpqhbE0iMbm4f5Rz
	OQf3oDuUVAQnY8LYUMV4skgWQuPnIFaYCuN3/oJDzSjj23yLQBYG5BGao/G78ImkVdmmBCPF5Fa
	xnDuus8B/6YCsEPttb5haYEys7bNRXuy4zqiYNImYLvv/v7YUnBzyPsBdMHV/vRMlOxWMp+jF/z
	nC/blhLIWZHDM76vNIdV+LSh0jdoibyOQEiUy0clEhjXLP1aaBb8ByWgBkol6JZe9UxOadrTjWD
	XIqrVkz9pJd2B5NSW+7Hb51zJomLSnc15hOl3gerDJ7AR2+7Wkz/YFUv+3TQzoafG2yOKaAqVbv
	P1Hmevzvn7gsdNPyM6giKn5XVQzaNi0kbJnf938vhR6ZIbIvffpfRNAb0ljxB9AvJejywkIL2C4
	ZUD+ISTLa1TwxjXdkVuMdYUVjbKD0
X-Received: by 2002:a05:600c:4f0f:b0:4bb:87f4:3674 with SMTP id 5b1f17b1804b1-4bb8880ef40mr647432545e9.15.1795801792471;
        Fri, 27 Nov 2026 09:49:52 -0800 (PST)
Return-Path: <yoann.congal@smile.fr>
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab69bf630esm49374624f8f.16.2026.11.27.09.49.51
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 09:49:51 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 32/37] populate_sdk_ext: Fix locale error handling in SDK
Date: Fri, 27 Nov 2026 18:49:15 +0100
Message-ID: <cc810b98f749f5eab2e45bd1c1e6a448fa78dd38.1795798718.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1795798718.git.yoann.congal@smile.fr>
References: <cover.1795798718.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 27 Nov 2026 17:49:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251438
Content-Type: text/plain; charset="utf-8"

From: Richard Purdie <richard.purdie@linuxfoundation.org>

During automated testing we occasionally we see the error:

"ERROR: the installer requires the en_US.UTF-8 locale to be installed (but not selected), please install it first"

This is puzzling as the locale *is* installed. The use of -q with grep in
a pipeline is potentially problematic as grep can exit early and cause a
pipefail/SIGPIPE.

Tweak the code to avoid it and a few other issues (add quoting, handle the
"." correctly, match a whole line).

[YOCTO #16198]

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit f290e76eef3bd175f71414b7f78aafd0af5e0ce2)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/classes-recipe/populate_sdk_ext.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes-recipe/populate_sdk_ext.bbclass b/meta/classes-recipe/populate_sdk_ext.bbclass
index 662cc493ce7..794832888c6 100644
--- a/meta/classes-recipe/populate_sdk_ext.bbclass
+++ b/meta/classes-recipe/populate_sdk_ext.bbclass
@@ -690,7 +690,7 @@ sdk_ext_preinst() {
 	fi
         # Check setting of LC_ALL set above
 	canonicalised_locale=`echo $LC_ALL | sed 's/UTF-8/utf8/'`
-	if ! locale -a | grep -q $canonicalised_locale ; then
+	if ! locale -a | grep -Fx "$canonicalised_locale" > /dev/null ; then
 		echo "ERROR: the installer requires the $LC_ALL locale to be installed (but not selected), please install it first"
 		exit 1
 	fi
