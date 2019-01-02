Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com
	[209.85.215.193])
	by mail.openembedded.org (Postfix) with ESMTP id EC9D76BAAB
	for <openembedded-core@lists.openembedded.org>;
	Wed,  2 Jan 2019 16:36:18 +0000 (UTC)
Received: by mail-pg1-f193.google.com with SMTP id m1so14793694pgq.8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 02 Jan 2019 08:36:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=0XP7E9vN0SbdvBAqKiiHAX75sny7y0N7mj1TPs1lSi8=;
	b=oJK7O59WPNIozDR4ciCPEh95XpBFkiJsruDhi2aVCiI1FmS6V7RK/6qUaH5dfz7k10
	IypoVdQV5WvmS/NMjQMO63Mx1g5dwDoQpyl9yeYE08Rv289nE4T703JGYfC+Bsp72/WO
	ML5GrIP0SAM7NnwWiko3fdgHHgVPz5YJQM7ncdxjfzWsXbuooZUc2IDhylSutpAXl6p3
	Y/Y5qicStOxG99LKAzKyobVzgnev5HR/v8TdhIx1+ma1ZjIZWN+uBO3yLLqJVIVJXwPm
	ifAJ7Fa1dcZkMTPBaT6JIb0prlXT9W3bjzbWQuPzjN0nfmj3bKYG02dxhaJMmID3CFyL
	iZDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=0XP7E9vN0SbdvBAqKiiHAX75sny7y0N7mj1TPs1lSi8=;
	b=kewannOhKFKxa9JmvKOLUguKeS4jU6MR3ilHm6+9v2y2mA59bajTWcTnAaOmIqmT60
	hrBXqoV7W/k5B5ldsBcnJ8klr3WkHtJbmE7HkeRgWRajWTipJwpy5yQVQX9ocVptXQQ0
	yiMXSKYawWwD/XVY0OaHF7rKrCGlKoo3FChZMmTC7XhEc+dXaM3pIVI8Iol1mGylV6E/
	opFq4cb/FMERCjue13p7jozPlz0a41zHhZVp1U2yuvTohBuWe4cCNqmqzgZlKoGWZtXh
	x3KGI84EMUp7IXN1o+iPujxsH9oWqstUzTbMz/cysQGuSwoVNwgGYpSOwziT3JyP6S/B
	Romw==
X-Gm-Message-State: AJcUukeX/5u+YadA8JBfLhBLOW9WGTxmBoFfk91Lrz7JMZuB61SomZSg
	BzgD1YJMvKC9lQSyA5MQNYg=
X-Google-Smtp-Source: ALg8bN7cXvhtMMbbNGNd8mAWxehV0l6vd2bkpJTqRA6zJbx4mxfG32cLYaPrG58WPTiCUIVbpHcQyw==
X-Received: by 2002:a62:6503:: with SMTP id z3mr43871970pfb.169.1546446979968; 
	Wed, 02 Jan 2019 08:36:19 -0800 (PST)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:c33:b176:14d6:5577:24f])
	by smtp.gmail.com with ESMTPSA id
	v89sm62973472pfj.164.2019.01.02.08.36.18
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 02 Jan 2019 08:36:19 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: akuster808@gmail.com,
	openembedded-core@lists.openembedded.org
Date: Wed,  2 Jan 2019 08:36:11 -0800
Message-Id: <1546446977-27510-2-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1546446977-27510-1-git-send-email-akuster808@gmail.com>
References: <1546446977-27510-1-git-send-email-akuster808@gmail.com>
Subject: [PATCH 2/8] curl: update to 7.63
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
X-List-Received-Date: Wed, 02 Jan 2019 16:36:19 -0000

 Changes:

    curl: add %{stderr} and %{stdout} for --write-out
    curl: add undocumented option --dump-module-paths for win32
    setopt: add CURLOPT_CURLU

For full list of changes see:
https://curl.haxx.se/changes.html

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-support/curl/{curl_7.62.0.bb => curl_7.63.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/curl/{curl_7.62.0.bb => curl_7.63.0.bb} (95%)

diff --git a/meta/recipes-support/curl/curl_7.62.0.bb b/meta/recipes-support/curl/curl_7.63.0.bb
similarity index 95%
rename from meta/recipes-support/curl/curl_7.62.0.bb
rename to meta/recipes-support/curl/curl_7.63.0.bb
index 4229fa3..f7557a2 100644
--- a/meta/recipes-support/curl/curl_7.62.0.bb
+++ b/meta/recipes-support/curl/curl_7.63.0.bb
@@ -9,8 +9,8 @@ SRC_URI = "http://curl.haxx.se/download/curl-${PV}.tar.bz2 \
            file://0001-replace-krb5-config-with-pkg-config.patch \
 "
 
-SRC_URI[md5sum] = "7adf426f80c68bbdd04d44b9bc171d61"
-SRC_URI[sha256sum] = "7802c54076500be500b171fde786258579d60547a3a35b8c5a23d8c88e8f9620"
+SRC_URI[md5sum] = "0a6c1e993bd5102bc52fc89900542644"
+SRC_URI[sha256sum] = "9bab7ed4ecff77020a312d84cc5fb7eb02d58419d218f267477a724a17fd8dd8"
 
 CVE_PRODUCT = "curl libcurl"
 inherit autotools pkgconfig binconfig multilib_header
-- 
2.7.4


