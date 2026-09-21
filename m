Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7BE32C982E1
	for <webhook@archiver.kernel.org>; Mon, 21 Sep 2026 07:07:21 +0000 (UTC)
Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.43883.1789974436803155026
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Sep 2026 00:07:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=RFOss4lW;
 spf=pass (domain: linuxfoundation.org, ip: 74.125.225.140, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912d3920so17506855e9.1
        for <openembedded-core@lists.openembedded.org>; Mon, 21 Sep 2026 00:07:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1789974435; x=1790579235; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Hhvqeb2mVTomndsbxTZ9S8Sp/JTrNKN/ohukG48mnRk=;
        b=RFOss4lW7jf4AEvkug7zOWqZnmUPUoHFSKYiWBMDQb/TVCbBNXNXPfS1pUQag7/sC7
         Ky7GWXSYGybqHak5FPAjmk+p9eDfHiWrNYzw4koPiPAeyui4fJeMdPlRFqrDTuDWgiTQ
         8+lsQso/VSNJHPQ1ZRbxFAg9wWlJSWIXi9sK8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789974435; x=1790579235;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Hhvqeb2mVTomndsbxTZ9S8Sp/JTrNKN/ohukG48mnRk=;
        b=bgOKm/oKfoK97lFk2L3L6dEhy/3pZqD/1mJwtYpZuXcqG+MJElfQI92NzP03W+6wF1
         I0oXZ3MRBoioFY83lYF1+lWvFixA896kV/N4VlHJIc7T8PUIexozw8t9dPyX0Pi1Ozk0
         CzusilASePJoNxHFwqW/6tyvtwwTZmX5IuwkQnNTMNgt2c0lFhFO76kYma8xhWCYTcJr
         6QtOHOWRnyFNWAyxH+RN8y1aTcqyBFE+oWH2Z0ML1yl2yCZUFnBcwthtDTs1Nj5K1g0y
         mP3/d8xM66ImF6XUG6ncrz8xJ0KdK47yqpkpLUvC7RN1jBW/7X1wDUHWA2ztUtUODUIq
         2Z1Q==
X-Gm-Message-State: AFuF++kXFDx2OvcKlGdMR3bDozSjLIJm6uPMjig/QG/ixxaK0rbaGhxI
	HH6Qi+Gz9Ro9xq8NvOMIa4yKCZWOFS+orX81MUWMC+Uht1OyWvHFbbvw2lKMwHq3oJH3K+3zBxI
	epzkmdwM=
X-Gm-Gg: AYBFou3Zqe/s3aZ7Xx1iNPJqrkITR7rHTs9f/Z5fMyMpvi+KhNPwjz8v6qQrXe9ZymM
	Td8wrigRmTznCCqIJDyAGYOj4NWZsZfFAFwY9ZCdmyqP9JDDrzc7gTudl+XnJ+1yTi8/ZI1pv7U
	jxyHHpPoCUuHmnq3SQ/YvRZdPKqryLWKmz7op/6esWhVlbgd54spepiN0if9zFHtv+nRkpEwcyN
	/eYe8Es63grEK5hpmeiaK89sbdCdb+aZly4zXSrf7u2SWW/zIUmH2Xk7yne8+yiYh93VlpAxRpt
	FRTooKWo2vz+ATWcReuOV/tft2MMcDUJ9qU8bwPwAZ0wdzrsod3BADQG7tLbgXxSghBTJoS2K/t
	4kHi3iOnay1GcdYLpZbexA+drrakDWRAisWBgorMda7L0L1KmOHryeZX4drETx5UpkelfHAFi3f
	7fa2v6sKbC6kTdOstyJrzZZe3K1+F5DlKpqK9RrFsk/be7ZpUw/DX56XhYVVRdhnzQSpZQoLf+o
	gB9bgjERe57WgV/K0NhRAS5qX8=
X-Received: by 2002:a05:600c:4712:b0:49d:34:420d with SMTP id 5b1f17b1804b1-49fc573621emr132079385e9.20.1789974434866;
        Mon, 21 Sep 2026 00:07:14 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:481d:998f:15fb:95da])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fc5755c40sm276492915e9.3.2026.09.21.00.07.14
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 00:07:14 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 13/20] python3-pdm-build-locked: upgrade 0.3.7 -> 0.3.8
Date: Mon, 21 Sep 2026 08:06:49 +0100
Message-ID: <20260921070656.521680-13-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260921070656.521680-1-richard.purdie@linuxfoundation.org>
References: <20260921070656.521680-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 21 Sep 2026 07:07:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246300

Bug-fixes:
  Abort build when a locked dependency conflicts with declared requirements

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 ...-build-locked_0.3.7.bb => python3-pdm-build-locked_0.3.8.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-pdm-build-locked_0.3.7.bb => python3-pdm-build-locked_0.3.8.bb} (78%)

diff --git a/meta/recipes-devtools/python/python3-pdm-build-locked_0.3.7.bb b/meta/recipes-devtools/python/python3-pdm-build-locked_0.3.8.bb
similarity index 78%
rename from meta/recipes-devtools/python/python3-pdm-build-locked_0.3.7.bb
rename to meta/recipes-devtools/python/python3-pdm-build-locked_0.3.8.bb
index 8189bc7e56b..2b707a0a93b 100644
--- a/meta/recipes-devtools/python/python3-pdm-build-locked_0.3.7.bb
+++ b/meta/recipes-devtools/python/python3-pdm-build-locked_0.3.8.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/pdm-project/pdm-build-locked"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=19382cdf9c143df4f00b9caa0b60c75a"
 
-SRC_URI[sha256sum] = "53428268284125532413434ebfeb8e7a287525516cc5a0a055d63ba63b207165"
+SRC_URI[sha256sum] = "c2a608b288ed08618228880c2e6d6a616049c25eeb71786d06d1061d129764ba"
 
 inherit pypi python_pdm
 

