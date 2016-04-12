Return-Path: <armccurdy@gmail.com>
Received: from mail-ig0-f173.google.com (mail-ig0-f173.google.com
	[209.85.213.173])
	by mail.openembedded.org (Postfix) with ESMTP id 27F6B65CBB
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Apr 2016 00:28:35 +0000 (UTC)
Received: by mail-ig0-f173.google.com with SMTP id ui10so6046134igc.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Apr 2016 17:28:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=XPuByMRbyMxbJAgmxQLwauVKrbiYnOMHN8Pv2Ctm3eg=;
	b=yBnZW3b0u80FkkkOlVMaVCbFX2jw7YSUTka1Pv9DF8NiJfaLuQWvi/EDijuNhmqfC6
	RcnCwEY4Lr7e0HiArO6rLUFczNIgxZz5RNoxwHRFWbjsg9UWRO7TDZByim9GAFODojYc
	Lure7c79YMVKCtKXEdzqup/xMy8fdDK+KovcgOGsfC4IVRWI339mvKI5Ug8EKddz2/zb
	Il7VRMZhb/3CH9tPxk9D79fQ4soX0R+QWS/8DSXzuT9pyo776Fs/pcQvfLmPHXZUQILl
	6y3owz079Ys28oXy4j3F15o6BUmKT9AzT04NmE7hcdewYjJHrWX43F35ialQUSyENFpC
	14FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=XPuByMRbyMxbJAgmxQLwauVKrbiYnOMHN8Pv2Ctm3eg=;
	b=LYskvhgwix5asOiQkdRLWXxgVorykFO9E8PjGaQ7oBvyJkt15oQ2rOvH/mSmy/rA+6
	8jnDV4A3ZioAf3EtQTKFB0d4jM6JV8YcyFMD2K3JoF4qPBeKdg5GyTg6fiSKF7UVaUCV
	olSlH4Uw8611ruAAcIyV8v5q/nccbO0MtCt4ey90wbhh4nA5IZ3rfCu2+CaXXHIenLg3
	k0tDXvQSfGOUjr5g83LDDxIlGfEqB8mw+K//NYiWcBUSYhIcCGDgitnrpIjz4wGLH6+y
	LAfKhXMaqcPYZLWt13kmU3CoTD091W89v2I04MkxpayBnsW3kLIsjMHHfp5bLjldR0cC
	AQLQ==
X-Gm-Message-State: AOPr4FWFqnzlzc3NrQ1LhonLHiLAF8YOBIB9OkfiMOgdmuPt3hlovyg1AHm7bVwfG+FdJg==
X-Received: by 10.50.131.164 with SMTP id on4mr4350425igb.97.1460420916349;
	Mon, 11 Apr 2016 17:28:36 -0700 (PDT)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id
	j34sm18580510ioo.20.2016.04.11.17.28.34
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 11 Apr 2016 17:28:35 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 11 Apr 2016 17:28:26 -0700
Message-Id: <1460420908-16890-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH 0/2] pbzip2: fix rebuild issues
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
X-List-Received-Date: Tue, 12 Apr 2016 00:28:37 -0000

Andre McCurdy (2):
  pbzip2: fix LIC_FILES_CHKSUM following 1.1.12 -> 1.1.13 upgrade
  pbzip2: don't skip do_configure

 meta/recipes-extended/pbzip2/pbzip2_1.1.13.bb | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

-- 
1.9.1


