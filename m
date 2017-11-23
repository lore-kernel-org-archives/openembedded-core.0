Return-Path: <akuster808@gmail.com>
Received: from mail-pl0-f66.google.com (mail-pl0-f66.google.com
	[209.85.160.66])
	by mail.openembedded.org (Postfix) with ESMTP id 5E6047836D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Nov 2017 03:52:18 +0000 (UTC)
Received: by mail-pl0-f66.google.com with SMTP id 62so1956471plc.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Nov 2017 19:52:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id;
	bh=+KtI4u3QPpIm9LALyGehUA5UzbHG5d99CSUkjT4w4yI=;
	b=F4IZ6CkYQFQXqwKubabBw4YOj72S/Sbi/pv7iFBHWdkaw1ZuaPZ/2T8RvOsGAUOi7H
	6P4E7w3w+7U2VPu+Cp8Q4BFiNGF2dTuUYAYdC6QaiowsoEM/wcSUlNytGNxZlf2PE9JC
	BHw2QOXxbuN56px89/Nr7iJstCp+Qc3UXJyPBwTr5KethQ8nbYSf3RGAadmweP6Z6tln
	ela4jhr1Hw6kPIkkqPXP7+xr9VjL6137ti4/xkF9G5s6uqMbQuyUsZWlRuBjqyvHvOVR
	4zxWLEAC8AbhLkMUbGm/JMIghzpDufI7cLau0Gun4qaQHRfPDJmd27M0CFkmpQMp3K20
	287Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=+KtI4u3QPpIm9LALyGehUA5UzbHG5d99CSUkjT4w4yI=;
	b=fHstmd3YPT784AUGPQA2xpX6/0UnGrrM3AuuBl9pyP+9W2U/VdAc3tMtYUMtKyZ+cM
	T28zrI/HzlnnYoVjmTR4UI5z6yTnsCF461IPNBACv6/DnAtawTs9dgNj4su/8sjDp8Yp
	adCQhg9MfPQtbxOnyW9qx7ccpw27oZO28Ls5z79NU7qjsK4leNq0+9yZtjrK3z/Ggekt
	oxXkPdF1GFPsLNGA/CYWMf3KwAcKs2sI9kFzgjLmdVGSrte13eB14XirJ7k0+YCGIHUm
	5CPeNZKgx++5ODELuIfFCciAgfpSs7slQatdi7LyoXPkInrWZ7J2JDQAcNz+M4qlkR7W
	zKqA==
X-Gm-Message-State: AJaThX62jk/2CCAI4jh1c11AUspJtfq7XINh0zQlpSqqgT7LvvUC1T2D
	BDyJ49xfa/AktdrlgFYvX2eK1w==
X-Google-Smtp-Source: AGs4zMZbX1CNGFGayIMkAG8Gar4JRLWWPpkCQFY/sJ5SfFTxN0eqRLqNCcw8IzsqJriBmNHAWhLG+A==
X-Received: by 10.84.231.129 with SMTP id g1mr23061376plk.188.1511409139701;
	Wed, 22 Nov 2017 19:52:19 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4001:9ea0:844b:1cda:e660:cce8])
	by smtp.gmail.com with ESMTPSA id
	n2sm25625481pgv.69.2017.11.22.19.52.18
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 22 Nov 2017 19:52:19 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: akuster@mvista.com,
	openembedded-core@lists.openembedded.org
Date: Wed, 22 Nov 2017 19:52:14 -0800
Message-Id: <1511409137-30823-1-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH 0/3] Several Glibc security fixes
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
X-List-Received-Date: Thu, 23 Nov 2017 03:52:18 -0000

The pending 2.27 update does not need these. Only apply if that update is delayed too long.

affects glibc < 2.27

This will hit stable/Rocko-next shortly

Armin Kuster (3):
  glibc: Security fix CVE-2017-15670
  glibc: Security fix CVE-2017-15671
  glibc: Security fix for CVE-2017-15804

 meta/recipes-core/glibc/glibc/CVE-2017-15670.patch |  61 ++++++
 meta/recipes-core/glibc/glibc/CVE-2017-15671.patch | 215 +++++++++++++++++++++
 meta/recipes-core/glibc/glibc/CVE-2017-15804.patch | 111 +++++++++++
 meta/recipes-core/glibc/glibc_2.26.bb              |   3 +
 4 files changed, 390 insertions(+)
 create mode 100644 meta/recipes-core/glibc/glibc/CVE-2017-15670.patch
 create mode 100644 meta/recipes-core/glibc/glibc/CVE-2017-15671.patch
 create mode 100644 meta/recipes-core/glibc/glibc/CVE-2017-15804.patch

-- 
2.7.4


