Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49672C7EE31
	for <webhook@archiver.kernel.org>; Fri, 26 May 2023 02:29:51 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web11.107.1685068184343302256
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 May 2023 19:29:44 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=tZHHdS4Z;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.178, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-1afa6afcf4fso2666845ad.0
        for <openembedded-core@lists.openembedded.org>; Thu, 25 May 2023 19:29:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1685068183; x=1687660183;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YGD0SwMU/VFzuL4G1TIFxDd6etE5DC6hvDXNJTtVoYI=;
        b=tZHHdS4Zkxey5K1a859BM/ihS1RcE1lhY8Knm/IFX8T1fXKcnkYm+CvBr8UO27Q28G
         oWs/4qLXFXdpigtsuifNVbt+TazL5rFQIzeDrThl5DY0klHDe8utrm8lrl0KkaOuc4ID
         AQlW6bQp19Arfpa4X0Qr6PcWexn1xQmNpMdNVLgUs/qd9TncHAZD4hvby5J9pXc+WzKH
         S4TpJmhji3lfIKaa+DGZGleOOAIdHZE4+MhrWZecXG1/WJ2Ig8I36jgx6OYy94rW/nOl
         uufrxvYkO3OZkCkVrHuqi9k5v5ySg0KsU3P2cyUROxH+fjV0yW2F7jx4Rt6UaalNGjUj
         FXMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685068183; x=1687660183;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YGD0SwMU/VFzuL4G1TIFxDd6etE5DC6hvDXNJTtVoYI=;
        b=SEXGeHxZusl5SOADJI065vWeOskjihnko1253rw+Edj/hsQqn++3vt/7BINNaG7OqI
         DS0m+qndvC8/7VbF8rBe3SzVFdwpFImDks1NunrRmRK4SkJwt6raUSxZp1aob2RorupB
         094GQTt2HdY4ukfuUAI27/s64gUHJd02XVP2I6ndqWFd+ghQojJ/GOsCTMLTvb0+5YOw
         xHI3lvkVYcaOdppJsR/BWs9eR2PLdXyYIJ6t9DuSdk3A1EEqFlhKD4vEMQii3m3tX4lB
         /3w3DURA8rNBeeH+PyoTfV8H/eGglp1j+cy3ZRSaxbzDwZNbuIlidHeqKlqxCrhmbZmJ
         bCXA==
X-Gm-Message-State: AC+VfDzI/W8mwQeZmJvaCQiLIBVN5jTFCkWmjQEg/6wP7vUYAh7XzMOn
	Oe1qH2zfHMRBF2EzwHaFbFyxKsYs6QMjQZtA1XQ=
X-Google-Smtp-Source: ACHHUZ5z9mkdlAQOZL2INcikrDKTYGoWK59GFfLdfQetfRkecI3KPwk+Js/WHVzfVA7OCc+NuDTmJw==
X-Received: by 2002:a17:902:6bc4:b0:1aa:cddd:57d8 with SMTP id m4-20020a1709026bc400b001aacddd57d8mr772549plt.30.1685068183431;
        Thu, 25 May 2023 19:29:43 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id t13-20020a170902b20d00b0019ee045a2b3sm2023794plr.308.2023.05.25.19.29.42
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 May 2023 19:29:43 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 12/21] maintainers.inc: Fix email address typo
Date: Thu, 25 May 2023 16:29:00 -1000
Message-Id: <c8837fecf62cbd103103c66c576dac55301cdc1a.1685068004.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1685068004.git.steve@sakoman.com>
References: <cover.1685068004.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 26 May 2023 02:29:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181744

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 2a86ca028980b501e386f6bb8293a094fd77f97b)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/conf/distro/include/maintainers.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index 4778b1e5e6..207d889acd 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -280,7 +280,7 @@ RECIPE_MAINTAINER:pn-intltool = "Alexander Kanavin <alex.kanavin@gmail.com>"
 RECIPE_MAINTAINER:pn-iproute2 = "Changhyeok Bae <changhyeok.bae@gmail.com>"
 RECIPE_MAINTAINER:pn-iptables = "Changhyeok Bae <changhyeok.bae@gmail.com>"
 RECIPE_MAINTAINER:pn-iputils = "Changhyeok Bae <changhyeok.bae@gmail.com>"
-RECIPE_MAINTAINER:pn-iso-codes = "Wang Mingyu <wangmy@cn.ujitsu.com>"
+RECIPE_MAINTAINER:pn-iso-codes = "Wang Mingyu <wangmy@cn.fujitsu.com>"
 RECIPE_MAINTAINER:pn-itstool = "Andreas Müller <schnitzeltony@gmail.com>"
 RECIPE_MAINTAINER:pn-iw = "Changhyeok Bae <changhyeok.bae@gmail.com>"
 RECIPE_MAINTAINER:pn-libjpeg-turbo = "Anuj Mittal <anuj.mittal@intel.com>"
-- 
2.34.1


