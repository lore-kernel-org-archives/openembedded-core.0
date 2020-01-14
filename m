Return-Path: <anibal.limon@linaro.org>
Received: from mail-oi1-f193.google.com (mail-oi1-f193.google.com
	[209.85.167.193])
	by mail.openembedded.org (Postfix) with ESMTP id 91F2D7FBD7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Jan 2020 16:20:25 +0000 (UTC)
Received: by mail-oi1-f193.google.com with SMTP id p125so12319827oif.10
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Jan 2020 08:20:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=t3xOnK4hDVzMoGbRF4yOeopVLp2HInIp6tUy7Bn7oUo=;
	b=Jd+RxE2suB5WbUtoaQzAeo9JVCSxntm+uHhWVHPpBMZ7E/6yK+JOGXYAEkjMN505qF
	xw7upkHEI1twlPY5485idpEemA0S0cVxUkHR/P83vCao1rOY6TQKpzkVQnuD3Vq+toCv
	crhuUScM+GNGkbKbOOBssOnlVOElYRW6EWbB5kzcK8CzWAbNPXk2HYeAc85Q/zbARkx9
	SmUxv/TapxlkfHtfzejLP/4DjnvqMnQloyNIHYnj/fBArdhOgGn5aF5HRpn3JbcsGOz1
	qltVgck/CIEhNDPUkFmaXagLZZt58HaEfGFh0RugGIr2G4u3q6CRXIwviQa+WUDKFzne
	2m3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=t3xOnK4hDVzMoGbRF4yOeopVLp2HInIp6tUy7Bn7oUo=;
	b=gSVh+YjlkKci6yj2P5kXoSd1iHInDlWdiB4d8WUspqHoKLCVAcHAT5t7AcMDLdr5am
	3RDBltUUx2JHN3o+0UzWgYUizHUTWgDaLmMbozjXqMEZkSME8tNXurPlsRsLjYwmb8iS
	o9PjPK+ugkscsYPIHZfcwfsdO5pyXHBpNOof4aH2JVXMUMbXiJ0FCT5MUhLflL93BmEZ
	1VTkV8oE1IZjYBsvo8ycVKajdlCZJbWHWlPvowCkYQn6RVGet/9Ld7sWeS3d7fZQB92Q
	FXOc4KVX/j0zAyOcUVsQNdXSwZIMuQWBLltlJRqxlMUvXJnpKvfRDGt16wMMhB8lTwrL
	kY7A==
X-Gm-Message-State: APjAAAXVS+5e+EyAQGgZwMvXgeeekrfx/n0q0SS3vmovG+GAHrZ8laY+
	SDr/Sgc/TXzjEsqa5kXEkiPhDUhsrY0=
X-Google-Smtp-Source: APXvYqwyWZRAxWQ+PZzxzmosMMEQ9nn5Ngt+d0+YpFffrMK/lF8vYb4Qfy46pTL1lIqaRvko6zvl/g==
X-Received: by 2002:aca:1204:: with SMTP id 4mr17530271ois.143.1579018826032; 
	Tue, 14 Jan 2020 08:20:26 -0800 (PST)
Received: from blackbox.rga.ip ([2806:109f:4:fe82:908a:c7ff:fe6a:e9f5])
	by smtp.gmail.com with ESMTPSA id i6sm4686059oie.12.2020.01.14.08.20.25
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 14 Jan 2020 08:20:25 -0800 (PST)
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linaro.org>
To: openembedded-core@lists.openembedded.org
Date: Tue, 14 Jan 2020 10:20:23 -0600
Message-Id: <20200114162023.71342-1-anibal.limon@linaro.org>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Subject: [PATCHv2] meta/recipes-graphics/waffle: Add python3 dependency
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
X-List-Received-Date: Tue, 14 Jan 2020 16:20:25 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The python3native.bbclass set PYTHON_{LIBRARY, INCLUDE_DIR} pointing to
python target build, a patch was add to use target _sysconfigdata too [1]
but is not available without python3 dependency.

Fixes waffle build when trying to find _sysconfigdata module,

...
| Program python3 found: YES (/home/anibal.limon/linaro/oe-rpb-master/build-410c/tmp-rpb-glibc/work/aarch64-linaro-linux/waffle/1.6.0-r0/recipe-sysroot-native/usr/bin/python3-native/python3)
|
| meson.build:36:0: ERROR: <ExternalProgram 'python3' -> ['/home/anibal.limon/linaro/oe-rpb-master/build-410c/tmp-rpb-glibc/work/aarch64-linaro-linux/waffle/1.6.0-r0/recipe-sysroot-native/usr/bin/python3-native/python3']> is not a valid python or it is missing setuptools
|
| A full log can be found at /home/anibal.limon/linaro/oe-rpb-master/build-410c/tmp-rpb-glibc/work/aarch64-linaro-linux/waffle/1.6.0-r0/build/meson-logs/meson-log.txt
| WARNING: exit code 1 from a shell command.
...

[1] http://git.openembedded.org/openembedded-core/commit/?id=02714c105426b0d687620913c1a7401b386428b6

Signed-off-by: Aníbal Limón <anibal.limon@linaro.org>
---
 meta/recipes-graphics/waffle/waffle_1.6.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-graphics/waffle/waffle_1.6.0.bb b/meta/recipes-graphics/waffle/waffle_1.6.0.bb
index 52cb1df899..a620295978 100644
--- a/meta/recipes-graphics/waffle/waffle_1.6.0.bb
+++ b/meta/recipes-graphics/waffle/waffle_1.6.0.bb
@@ -11,6 +11,8 @@ UPSTREAM_CHECK_URI = "http://www.waffle-gl.org/releases.html"
 
 inherit meson features_check lib_package bash-completion
 
+DEPENDS_append = " python3"
+
 # This should be overridden per-machine to reflect the capabilities of the GL
 # stack.
 PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'glx x11-egl', '', d)} \
-- 
2.24.1


