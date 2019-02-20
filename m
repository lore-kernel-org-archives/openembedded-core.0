Return-Path: <fabio.berton@ossystems.com.br>
Received: from mail-qt1-f195.google.com (mail-qt1-f195.google.com
	[209.85.160.195])
	by mail.openembedded.org (Postfix) with ESMTP id E6AAD7CA93
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Feb 2019 12:15:59 +0000 (UTC)
Received: by mail-qt1-f195.google.com with SMTP id p48so26876735qtk.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Feb 2019 04:16:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:organization:content-transfer-encoding;
	bh=3P2/SjtZWGEUUDTzV6ayVYubGa/bFvS0qPB03gK1HMI=;
	b=KWBxmpgMEUYr6F5Fb3N8lV2ThfIHW9fvRIWMmsVCYxvWLylIAJ1K86QyIod61R10lX
	F7kkv6KmvdTlx2s3vR+bjK8tz8T6LdAPxTcBAdsv/whCj1/fH90M8LPu4uoSfD9J/WYI
	7LlW57YMasEPYhbUtvZ47Ge88T5a5fhjtQsrdVbo9LeXwMkQGWCapgJwW1LlW1YEkyv/
	ps9KnNWgbMzs9Jo2MHJiph7ERfvG0/Tv1rpfXINiPzGU1CDuQCilmnB39DMowr8QL/fO
	ztBESFp3scdqYmTnoPML6DSkQR0Z6jvLNDcz6FvXtwAgyUCp7HBQaRTeaez1BJpIDaIh
	yZrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:organization:content-transfer-encoding;
	bh=3P2/SjtZWGEUUDTzV6ayVYubGa/bFvS0qPB03gK1HMI=;
	b=CqsNKzkq6j4MCcEPzVjOXviXHyIrJ78snnlNUeiZ1QDMV57W25yRh9ix7tQG1otL4w
	RcemIvpI9C3oBrahGploGQEbPK9jDnfbCs7jwWQY1PnxBTVAml9rtXjvr7pu+p5SVlVc
	7E5m3K/mqqs99awOlZhvHFz3X+1wi122B0wlMyrB55BJGqYOXjI3ZzzvGic0y+ZTgGoB
	lS4AWVwO7EA3UfI+e94QfkiMWeSYGkf+/i7jPqvpLW8w1sk6J5dkw7s+lV0VHodY0D3O
	/qlEQLkWhol5gk9nil3Ym5wh+j7jwSJp8BK2oc/FglI/5qAAVOAx2Gr/2/AcieUjGCEq
	x0AA==
X-Gm-Message-State: AHQUAuYREuReU9ZoJPL5MFwmtAmMgFzA7VRIM+EdzwS0GYD/RjpfitUw
	ea4MHup/G8Wp1wP/5u4S6EhVUcmhyEtm7Q==
X-Google-Smtp-Source: AHgI3IYGPbJynOQR2mCA5R4N6MvzGZ8NLIHmcbfJAFswdLgZ6OEmUMUNU799gwcy99MMbMyCfcbDXg==
X-Received: by 2002:a0c:b6d2:: with SMTP id h18mr12064315qve.216.1550664960679;
	Wed, 20 Feb 2019 04:16:00 -0800 (PST)
Received: from centrium.lab.ossystems ([177.194.204.148])
	by smtp.gmail.com with ESMTPSA id
	z190sm10839681qkb.9.2019.02.20.04.15.59
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 20 Feb 2019 04:15:59 -0800 (PST)
From: Fabio Berton <fabio.berton@ossystems.com.br>
To: openembedded-core@lists.openembedded.org
Date: Wed, 20 Feb 2019 09:15:44 -0300
Message-Id: <20190220121544.9462-3-fabio.berton@ossystems.com.br>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190220121544.9462-1-fabio.berton@ossystems.com.br>
References: <20190220121544.9462-1-fabio.berton@ossystems.com.br>
MIME-Version: 1.0
Organization: O.S. Systems Software LTDA.
Subject: [PATCH v3 3/3] mesa: Add opengl to native and nativesdk PACKAGECONFIG
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
X-List-Received-Date: Wed, 20 Feb 2019 12:16:00 -0000
Content-Transfer-Encoding: 8bit

Allow the use of opengl for native and nativesdk packages.

Based on https://patchwork.openembedded.org/patch/158748/

Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>
---
 meta/recipes-graphics/mesa/mesa.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index 4c902b8156..58009d77ab 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -49,8 +49,8 @@ PACKAGECONFIG_class-target ??= "${@bb.utils.filter('DISTRO_FEATURES', 'wayland v
                    ${@bb.utils.contains('DISTRO_FEATURES', 'x11 opengl', 'x11 dri3', '', d)} \
                    ${@bb.utils.contains('DISTRO_FEATURES', 'x11 vulkan', 'dri3', '', d)} \
 		   "
-PACKAGECONFIG_class-native ?= "gbm dri egl"
-PACKAGECONFIG_class-nativesdk ?= "gbm dri egl"
+PACKAGECONFIG_class-native ?= "gbm dri egl opengl"
+PACKAGECONFIG_class-nativesdk ?= "gbm dri egl opengl"
 
 # "gbm" requires "dri", "opengl"
 PACKAGECONFIG[gbm] = "--enable-gbm,--disable-gbm"
-- 
2.20.1


