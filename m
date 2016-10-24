Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wm0-f52.google.com (mail-wm0-f52.google.com [74.125.82.52])
	by mail.openembedded.org (Postfix) with ESMTP id 29E2E6067C
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Oct 2016 17:49:20 +0000 (UTC)
Received: by mail-wm0-f52.google.com with SMTP id f193so18358819wmg.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Oct 2016 10:49:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=pWiKCPOaQGtxlX+Op2jtQWU+f0lbqfrKDCHjYYkJNB4=;
	b=j390KFvrXdaVvRpzKr7Fa1YKRpJPFx3jXapvAzCRnZI2IZ1j8DZaI/UAgPCfHIsODI
	LZDIv+GrbfVZoF9R4krjWnxznlo54pe7w38Khsq5DbY+7vMuQW3QTQEDwioW6LUaxcRK
	XYTaR463kxyIgiqu5ITu3Ps53YRVnGFznhP7IGZ4upNqOYE27iK8o2EPHamVC2LE47wE
	LTC1IQM5l23QXtmfH0bxn3h88o4dGmlrkpKWdqMtYv9tMemm3/PJ3zEH/6b3gzb2Qahw
	+qTNSHwWVMxzEqqXmT5ktIolFrXMKil0hVQcLTZNOtOOTqj55oUsJqz1Tf50mz7cCrYx
	zRgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=pWiKCPOaQGtxlX+Op2jtQWU+f0lbqfrKDCHjYYkJNB4=;
	b=X+VtXlDjJLNQIXdtrLdJoQIXqXTYl4jT4UWRkXEysb1e43bE0+mD9+TR4+d8YK5XeQ
	dY7/R9gV90VH5VxFaGkdmvM+dT4r9xBMu3nyFq2AkrRWSgf10nVZTyjym7LhNQO6H710
	eugVHwFTWrXWrygWUmK5fs3mct7vbWfs1NLKJSEMCGYK4bkQw6zJ5hV32/r5yOASMdpc
	AFs2q1IXkc5CifATUBt3yJ8X0Orn5iykSnDAJ9dWrJCryWRyCfhcQJHQG8bJ3eZIcjT3
	RKmWbSTyiywWir++Wr197k4iPhsySko615dZhikYI3SUJ8auPSiJcKA4tTwI4H7Wbjfy
	lTTQ==
X-Gm-Message-State: ABUngvf0+KJ7HvAK4vQwPwwAIPML7yEM/mGmd0kj5Da6DVqne+6vAqmoU2GS72ZPZJMnZA==
X-Received: by 10.194.94.39 with SMTP id cz7mr14798406wjb.141.1477331361613;
	Mon, 24 Oct 2016 10:49:21 -0700 (PDT)
Received: from localhost.localdomain (p5B0A3D70.dip0.t-ipconnect.de.
	[91.10.61.112]) by smtp.googlemail.com with ESMTPSA id
	e5sm15952078wma.10.2016.10.24.10.49.20
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 24 Oct 2016 10:49:20 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 24 Oct 2016 19:49:07 +0200
Message-Id: <1477331349-3389-1-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.5.5
MIME-Version: 1.0
Subject: [PATCH v2 0/2] update libsdl2 and taglib
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
X-List-Received-Date: Mon, 24 Oct 2016 17:49:22 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

v1 -> v2: descritions changed as suggested by Alexander Kanavin

Andreas Müller (2):
  libsdl2: update to 2.0.5
  taglib: update to 1.11

 ...-sysroot-path-so-that-make-finds-our-wayl.patch | 32 ++++++++++++
 ...ideo-make-it-compatible-with-wayland-1.10.patch | 57 ----------------------
 .../libsdl2/{libsdl2_2.0.4.bb => libsdl2_2.0.5.bb} | 14 +++---
 .../taglib/{taglib_1.9.1.bb => taglib_1.11.bb}     |  7 ++-
 4 files changed, 45 insertions(+), 65 deletions(-)
 create mode 100644 meta/recipes-graphics/libsdl2/libsdl2/0001-prepend-our-sysroot-path-so-that-make-finds-our-wayl.patch
 delete mode 100644 meta/recipes-graphics/libsdl2/libsdl2/0001-src-video-make-it-compatible-with-wayland-1.10.patch
 rename meta/recipes-graphics/libsdl2/{libsdl2_2.0.4.bb => libsdl2_2.0.5.bb} (86%)
 rename meta/recipes-support/taglib/{taglib_1.9.1.bb => taglib_1.11.bb} (74%)

-- 
2.5.5


