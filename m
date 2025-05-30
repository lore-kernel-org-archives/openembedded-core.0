Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5712C5B55A
	for <webhook@archiver.kernel.org>; Fri, 30 May 2025 11:38:35 +0000 (UTC)
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
 by mx.groups.io with SMTP id smtpd.web10.4133.1748605111135908206
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 May 2025 04:38:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=aBMlSzHX;
 spf=pass (domain: linaro.org, ip: 209.85.167.51, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-54acc0cd458so2463565e87.0
        for <openembedded-core@lists.openembedded.org>; Fri, 30 May 2025 04:38:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748605109; x=1749209909; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5ZgnfNgk1d50UXfggC4xfzDpN2MVKZ499dDNvFRONco=;
        b=aBMlSzHXnAEF2HEIdRDtbOCF3qEO47ypm8uQPncKwaB7VXF0N36O18FB+vjvN8sxLt
         oobG91DA4mAXVdF2qOIhlV4qHvlqmtbG+Imy/Nhdi91tefNCYVya+e9KXoONTxK4Ldnr
         k+hJexSqNhcPLp12u6xgv1yn1ZjfW0cQb0S6mBaSS/4YhrahJ/VtSoRcKUcJTwtA8LSe
         5NhAqAZ2DJtGhr5bCEAr1o8yBFlqhyNo5yUXr4rPIC8pQN/Sg+hVw1inJXvcUe4HksW3
         xBHPlMp2NRKboWJ5P9zTzMtOgn1LUbUo94BsS5kjR2UmskWnar+Bs1LElJUWFLfOYJCE
         IUWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748605109; x=1749209909;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5ZgnfNgk1d50UXfggC4xfzDpN2MVKZ499dDNvFRONco=;
        b=uKVEOErPc0zz2rr3VrTB5p7AdwBPILNU6BbCzQ5htp1hzdFSs2S0SOQlqXTuh8dpOF
         N0xzNVbAbScSRJwnBKA0vDM1hJCSLkG8KiXz1bpOxtL3Cdq22qmofPOwspBTOjwbdzSk
         sKizpbrT08wuWLnlctWrvptZmOS2ZRLJ0RKZrC0DDuk8Kw+caSbaG5IccLwsorRxXH6f
         t8tkYlzKcZcUHDWKdtixFBYJA9kkhCQ2/5LuBQjlFxUZDUS8whIXDegTZa0tpyH/RZaN
         kMsNGyjZRxGJLla3p1jSsQNb8M1mdM7wY5ECcMTrtgJA5GCHElezKUj3851eMX0kwJZX
         81Kw==
X-Gm-Message-State: AOJu0YyrbKWsJoJFkfNhqAZ7dt7VZfH9q8lJXdmLUa8O19PzUcC+8sr3
	u20YurFZyuprU92N+Cq+Tjx5anY9gMDUeK2CDJ7q4a8Yxwlscz1Hg4qGzVRIx8/7Uaky2VV8sEm
	hNKr/i0k=
X-Gm-Gg: ASbGncsEiZQj32lRBeyjdcUSWRq9L73mEOLGgGd3icPv//Xe4YS2rd5VChAPDZFnUH/
	nFu9qnbShozZYPxoUX5ZbpODnIDXKspi3yvBxrr+3gjiWVsGyif7bC4zkKDMkt7VFCO54sG153O
	QWBZss5wNqmUYvPDp8vHQuV5ifN4wLwp4bbMKkpvSNXT92IW7NfeFjoPfYA0/PF+6XlpulSAw8B
	EpJhL72kxtAZBWYaaRMBlQqK48w7us3fOX9wpm0iv2iVo2Dudim/vKVp6Lao584ercEJu1Onxfq
	uww/zyMVB7Gp3EH/5aD9QdWG3HFkVvM5Xkx7S6XnucMqfYZ/m/I2kanIaExCUP0Cd1OKXarkYUP
	gEJoEYhFrWqAX5V/Vmk7+GJsBRT9EOLrPk5JXZ7A=
X-Google-Smtp-Source: AGHT+IHDOgki2t5qGY81hKxX0+EoJLhhxKLBcLYYE6xwxZdYSzkWiw0XlDgfcUlUOvYFUCPZCpFytg==
X-Received: by 2002:a05:6512:3dac:b0:553:2ca4:39e2 with SMTP id 2adb3069b0e04-5533b93a607mr882476e87.52.1748605109228;
        Fri, 30 May 2025 04:38:29 -0700 (PDT)
Received: from localhost.localdomain (87-100-218-141.bb.dnainternet.fi. [87.100.218.141])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553379378f7sm676469e87.244.2025.05.30.04.38.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 May 2025 04:38:28 -0700 (PDT)
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: [PATCH v7 4/5] image_types_wic.bbclass: capture verbose wic output by default
Date: Fri, 30 May 2025 14:37:44 +0300
Message-ID: <20250530113745.778397-4-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250530113745.778397-1-mikko.rapeli@linaro.org>
References: <20250530113745.778397-1-mikko.rapeli@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 30 May 2025 11:38:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217500

Call wic with --debug to capture logs from wic internals
so that it's clear which partitions get created and which
files get copied where. wic plugins contain for example
race conditions which don't install files at all and thus
images fail to boot and it's not possible to debug these without
something in wic task logs.

As an example core-image-initramfs-boot do_image_wic
log is now 576 lines which is not excessive but very
important when debugging problems, especially race
conditions which are only hit in some builds in CI.

With all issues I have to deal within wic, I always
need to apply this change before I get to see any
details what wic and its plugins are doing. Thus I
strongly believe this verbose outuput should be the
default.

Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
---
 meta/classes-recipe/image_types_wic.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

v7: no changes

v6: no changes but this change helped to resolve issues in v5 series

v5: no changes, v4 caused pseudo aborts on autobuilder
    but these are likely fixed now after path inclusion list changes

v4: https://lists.openembedded.org/g/openembedded-core/message/215221

v3: https://lists.openembedded.org/g/openembedded-core/message/214360

diff --git a/meta/classes-recipe/image_types_wic.bbclass b/meta/classes-recipe/image_types_wic.bbclass
index a64beda95e5f..7c6a6f2e2307 100644
--- a/meta/classes-recipe/image_types_wic.bbclass
+++ b/meta/classes-recipe/image_types_wic.bbclass
@@ -72,7 +72,7 @@ IMAGE_CMD:wic () {
 	if [ -z "$wks" ]; then
 		bbfatal "No kickstart files from WKS_FILES were found: ${WKS_FILES}. Please set WKS_FILE or WKS_FILES appropriately."
 	fi
-	BUILDDIR="${TOPDIR}" PSEUDO_UNLOAD=1 wic create "$wks" --vars "${STAGING_DIR}/${MACHINE}/imgdata/" -e "${IMAGE_BASENAME}" -o "$build_wic/" -w "$tmp_wic" ${WIC_CREATE_EXTRA_ARGS}
+	BUILDDIR="${TOPDIR}" PSEUDO_UNLOAD=1 wic create --debug "$wks" --vars "${STAGING_DIR}/${MACHINE}/imgdata/" -e "${IMAGE_BASENAME}" -o "$build_wic/" -w "$tmp_wic" ${WIC_CREATE_EXTRA_ARGS}
 
 	# look to see if the user specifies a custom imager
 	IMAGER=direct
-- 
2.43.0


