Return-Path: <akuster808@gmail.com>
Received: from mail-it1-f182.google.com (mail-it1-f182.google.com
	[209.85.166.182])
	by mail.openembedded.org (Postfix) with ESMTP id 58A206D5B1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Apr 2019 12:42:08 +0000 (UTC)
Received: by mail-it1-f182.google.com with SMTP id f22so17937178ita.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Apr 2019 05:42:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id;
	bh=StUiBrxZv2i8CA6eHW8MROza8I70d7Sc/ScGFAtJs9c=;
	b=aOK1maORqP+xbt8a7epHEWbGTrb2M8k468aq9nT7Nj/Qc3Vndmhx0i9CcgSg4rpX+D
	xWwX8pbmOZUvzavNg8F+CEnOwPtomWtxt0sXUjGl/8ADuxjmF3V3om4+ZmsE/K23e3XP
	cOSFw0frykYe/wVPxdJ4IEB9ghxJeZhQ9F8ILC+tMGneDetZI/PAEMiKldnrgNwOZgKV
	GVnyBvtKAE+EeBMXdmGfLEe2D9U+XE8v88fbC6CI9IfvAzYBlmwcKYeNRVH9Gl4PaeCN
	3eqCSybQU1pvHWqvcZ5IQAdhQ1gZU8NxHKsM/QOKJjCV+pRLEzZgOWp7XQt9oyB5rdKo
	sSdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=StUiBrxZv2i8CA6eHW8MROza8I70d7Sc/ScGFAtJs9c=;
	b=kAQ+hSsc1yOGBswUUKoc7kprvPW+Om++r1D6AK4AkOi6bdBE1APFUvcpbIOERKr2O9
	8uui8H2I2x+wrbCq0Q04/ihEEv9nsPocK913qwS37VOQuu3tKC9+qq9Z5PkfobrPLqTA
	hUcns47cagGkFwG37HcggZx5MGISQ2BD4uNTCgAzQRXFAwgGsvRmGGpsqCQqxER3A7vp
	OhRZ2Wt7zq7grhaKQ6gvIQrvl9XZyk3hZDyhUYpnnqQ4UQ//Qd7r3gY2Vr9BG7NzI8yd
	AxzJz7gevJhh+O300a/swbV5U11Y4ggTC1uab6ktkGrDEKF0+7DnJXvGEBJogXAAK6Ye
	37Fw==
X-Gm-Message-State: APjAAAX70hzuHLECnbUwMryqVAwEgoB1ff833pBJQHMYtfa/1oFsXt5h
	L2AUlg2pRT7WQZDPIzZK7aO2HSeU
X-Google-Smtp-Source: APXvYqwVmdjW5UhdI9wbrDkmaMDqgoNU/Fd561/yb+YS/WQfYRTjrDOvIJwLU746CigcU17xFXmEFA==
X-Received: by 2002:a24:68d:: with SMTP id 135mr13565986itv.53.1555936929321; 
	Mon, 22 Apr 2019 05:42:09 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	(75-163-235-80.clsp.qwest.net. [75.163.235.80])
	by smtp.gmail.com with ESMTPSA id
	h133sm6173634itb.34.2019.04.22.05.42.08
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 22 Apr 2019 05:42:08 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 22 Apr 2019 06:41:52 -0600
Message-Id: <1555936919-19078-1-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [QA][PATCH 0/7] Manual test cleanup
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
X-List-Received-Date: Mon, 22 Apr 2019 12:42:08 -0000

This moves some maunal tests to runtime. Delete others 
being run in runtime.

Armin Kuster (7):
  manual tests migrate to selftest
  manual qa/oe-core: remove packageconfig flag tests
  manual qa/bsp-qemu: remove rpm tests already done in runtime
  manual qa/bsp-qemu: remove KVM enabled which is already done in
    selftest runqemu
  manual/bsp-qemu: drop xserver test
  manual/bsp-qemu: remove connmand test done in runtime test
  manual sdk: remove this manual sdk test

 meta/lib/oeqa/manual/bsp-qemu.json        | 142 ------------------------------
 meta/lib/oeqa/manual/oe-core.json         |  36 +-------
 meta/lib/oeqa/manual/sdk.json             |  32 -------
 meta/lib/oeqa/selftest/cases/oescripts.py |  89 +++++++++++++++++++
 4 files changed, 90 insertions(+), 209 deletions(-)
 delete mode 100644 meta/lib/oeqa/manual/sdk.json

-- 
2.7.4


