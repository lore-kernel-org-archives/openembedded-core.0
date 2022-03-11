Return-Path: <ralph.siemsen@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05FB5C433FE
	for <webhook@archiver.kernel.org>; Fri, 11 Mar 2022 16:59:46 +0000 (UTC)
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com
 [209.85.219.44])
 by mx.groups.io with SMTP id smtpd.web08.7896.1647017984703284278
 for <openembedded-core@lists.openembedded.org>;
 Fri, 11 Mar 2022 08:59:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=I8dU6pX7;
 spf=pass (domain: linaro.org, ip: 209.85.219.44,
 mailfrom: ralph.siemsen@linaro.org)
Received: by mail-qv1-f44.google.com with SMTP id jq9so7465563qvb.0
        for <openembedded-core@lists.openembedded.org>;
 Fri, 11 Mar 2022 08:59:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=SoJ71lWJJNWDH94E5208I8heJTm9+Jzo/d09i9xZP9s=;
        b=I8dU6pX7+HxVHhLb9PqflQpeKKBQnpxlo1FFWfJ4B1Hy/0Ly+10Jvc4iz0OLa0mJ3q
         tChZovoUFFbpnxF3C4FKKY+4ha1E/qksAQX1lPfdh99jNPkHckrs8YvQz1Xh6vgypxyw
         W/+5LKVPp1alpPhIW0A5NWiH9xd5vMdLSrsX0sGDSAGvAHfZkMKIXGhPXA07gLBsRuQs
         TK/nkq21zXzGfoONIPy0HHuRPV++aZvvJto9Cs//JCmHowAXhf/uOnvC+AcrQYHUjKmP
         +OD0qMXa+z+qXwFM5la7hOvMhTrUz3fqwU5VXf3iA/go5d/w7g6ROR7S9M1pHrV2NqR3
         2o3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=SoJ71lWJJNWDH94E5208I8heJTm9+Jzo/d09i9xZP9s=;
        b=Lw6BTMuQnaHXv1OiTUbeMCmqDeXpXs4X81z6Agg7TeRchV+KgxJYT+NPfFVGs9CYNM
         usI2aMe62R0+kQZXbK2uE6h+sFXRW9FhwcFkyonvkp0ReV9SIyFdjULuYUyll9Gr8B63
         3O2SJIMTReaBMd+XKfjsNW+FDvtEs4z4Wtr09IzK8S0nK2eucJiPUWJNl8W2nAhw/1x4
         W1blcVsLDKJERNVfgrbj39utE2MPM2VRb2ETTSDcHjtVhNQ/zNNzgKqly96j6cn/YJz/
         K6WoUeb/yBcWmzcKGlt6BI3kJJDzjYiph4vFVpKCbf0fHCJLNL5cygtrNf3oFvVGi3jc
         7FQw==
X-Gm-Message-State: AOAM531uJ68d4oGgbDRF7FF+DG8X69hKP1TTt3jdxFGCHtHz9eUa51eu
	B8qOim5f9oW2uCIQkvDEPDsoSAAE47JrhA==
X-Google-Smtp-Source: 
 ABdhPJzeIS6ncwRgaAAi9vD9sun4dGaJkwvfr3Ig67PiwaD8bchbCFjuxylDcgu9h9XDXKwmkGWOVQ==
X-Received: by 2002:a0c:fe47:0:b0:42d:f798:3da5 with SMTP id
 u7-20020a0cfe47000000b0042df7983da5mr8587947qvs.77.1647017983849;
        Fri, 11 Mar 2022 08:59:43 -0800 (PST)
Received: from maple.netwinder.org (rfs.netwinder.org. [206.248.184.2])
        by smtp.gmail.com with ESMTPSA id
 b126-20020a376784000000b0067d21404704sm4066370qkc.131.2022.03.11.08.59.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Mar 2022 08:59:43 -0800 (PST)
From: Ralph Siemsen <ralph.siemsen@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: tony.tascioglu@windriver.com,
	Ralph Siemsen <ralph.siemsen@linaro.org>
Subject: [RFC PATCH 0/2] libxml2 update
Date: Fri, 11 Mar 2022 11:58:53 -0500
Message-Id: <20220311165855.3477645-1-ralph.siemsen@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 11 Mar 2022 16:59:46 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163060

The first patch has no actual impact on generated code, so it hopefully
can go into the upcoming release. It allows "devtool upgrade" to
recognize that there is a newer version available.

The second patch is the version bump, including a CVE fix. I do not have
extensive test suite, so all I can say is that it compiles and seems to
work in some light testing. Perhaps others could help test it.

-- 
2.25.1

Ralph Siemsen (2):
  libxml2: move to gitlab.gnome.org
  libxml2: update to 2.9.13

 .../0002-Work-around-lxml-API-abuse.patch     | 213 ----------------
 .../libxml2/libxml-m4-use-pkgconfig.patch     | 229 ------------------
 .../{libxml2_2.9.12.bb => libxml2_2.9.13.bb}  |  11 +-
 3 files changed, 5 insertions(+), 448 deletions(-)
 delete mode 100644 meta/recipes-core/libxml/libxml2/0002-Work-around-lxml-API-abuse.patch
 delete mode 100644 meta/recipes-core/libxml/libxml2/libxml-m4-use-pkgconfig.patch
 rename meta/recipes-core/libxml/{libxml2_2.9.12.bb => libxml2_2.9.13.bb} (91%)

-- 
2.25.1


