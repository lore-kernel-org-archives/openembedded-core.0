Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	by mail.openembedded.org (Postfix) with ESMTP id BEDBD7BF29
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Dec 2018 12:03:39 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id y139so2366396wmc.5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Dec 2018 04:03:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=IRQp03/dmlf3xcoIEt7M5TzMA4ohWKbrOsZZeJtHJDY=;
	b=XhGaE2XtdzjINRxszZETOLmpw329sS55vg4wYBl1W9Pbh1x+f9U7twffcFBSm+Bb33
	Hp0tZrB7vpk1BVl5dCXZ2eY4G19pFctqhzMQmbUKbgx88B4DqTVXNDx7pc2EZiBdKyTu
	hB4WfbQ49JCPyVkQRSSSlChG2ORS0dKdmPJeI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=IRQp03/dmlf3xcoIEt7M5TzMA4ohWKbrOsZZeJtHJDY=;
	b=CqafzRBWcMhjOWmFgQxOuEzyFEw5omF+jrlCOsG2AKQZ01NBU713Rg99Lm0rcJzW2n
	lGdFu5jZcge84KaAALhzyDwjy02/AqxC0d/Q7bI1A0gGQagXf8Lr/VSlNY/QnCzaFHR0
	QHK1BXcPQ0intKSbPpLy2ow/0isvplks9gyzYztUvjLgsifKbDRqy+OhdRnZithMSY0F
	imSG8trBWNdm9T449Xw+h1gCysKefjZUay01KOXeaciaPZtx1nzZMdJM+fIlERrdlWfe
	YBXDxGa+2d+6Ix7RBHYbtmg6F2Z/oU7subds7iKuqHcsN6YHIkBt1EN6zSZEGt7LWPR4
	tQhg==
X-Gm-Message-State: AA+aEWbAIJXy31jBw9/DCwtfUCP9ajn3vDubH2ieF6LKrhuffZPmJs6T
	/FLTBfQpFLTETJ0cdB8EVN7Uxhki4HE9sw==
X-Google-Smtp-Source: AFSGD/WVvXTezEjq7fnkNQinPU13jbczarFjXAgwclQRgXVW+uXR1wb2HmrMEwdCyDmozpitDW8i6w==
X-Received: by 2002:a7b:c852:: with SMTP id c18mr2810017wml.49.1545134620258; 
	Tue, 18 Dec 2018 04:03:40 -0800 (PST)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	10sm1684156wmy.40.2018.12.18.04.03.39
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 18 Dec 2018 04:03:39 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Tue, 18 Dec 2018 12:03:33 +0000
Message-Id: <20181218120337.25019-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20181218120337.25019-1-richard.purdie@linuxfoundation.org>
References: <20181218120337.25019-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Subject: [PATCH 2/6] oeqa/selftest/distrodata: Drop now unneeded distrodata inherit
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
X-List-Received-Date: Tue, 18 Dec 2018 12:03:40 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/selftest/cases/distrodata.py | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/cases/distrodata.py b/meta/lib/oeqa/selftest/cases/distrodata.py
index 824e29e01b5..248bc7c6a21 100644
--- a/meta/lib/oeqa/selftest/cases/distrodata.py
+++ b/meta/lib/oeqa/selftest/cases/distrodata.py
@@ -16,7 +16,6 @@ class Distrodata(OESelftestTestCase):
         Product:     oe-core
         Author:      Alexander Kanavin <alex.kanavin@gmail.com>
         """
-        feature = 'INHERIT += "distrodata"\n'
         feature += 'LICENSE_FLAGS_WHITELIST += " commercial"\n'
         self.write_config(feature)
 
-- 
2.19.1


