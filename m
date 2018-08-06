Return-Path: <akuster808@gmail.com>
Received: from mail-oi0-f65.google.com (mail-oi0-f65.google.com
	[209.85.218.65])
	by mail.openembedded.org (Postfix) with ESMTP id 3A9BD77BC5
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Aug 2018 16:20:12 +0000 (UTC)
Received: by mail-oi0-f65.google.com with SMTP id y207-v6so23146894oie.13
	for <openembedded-core@lists.openembedded.org>;
	Mon, 06 Aug 2018 09:20:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=N8HAoG+9i5SPeFqyuIgDHhZt1d9WNdRLNnhalt4+igc=;
	b=rpr0GaS9YuvlThPpRoQNDiYOL6JP+chNyrgzqlgtW/HZmEuiXLU7A4lWMioTYvEUA7
	ybwoIvU0ui+btjWSR+DL9GtuwkeDFZF9j9YTyYjsPllDS2lrBUr5QxtbBoJm0IgaLmMq
	Vnqbv/SKzrUVxfwbU6/9Xl2dMv8qNT8jw5DxfETNy7qyKKEmYjgWbjMPoimbOqVThBFB
	QhPlM4oE5XKnHpnBy+FPN+zY633EjPcqaobwhr2DamnBuFmp0YDNWkrftekukuiHH6WU
	MhkylGDlxvGQZQiHRK2PT0o3H0pv0GnxY2DQ4LUog7tedzIqVET7MEEuyXV12q/9ad21
	ZyEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=N8HAoG+9i5SPeFqyuIgDHhZt1d9WNdRLNnhalt4+igc=;
	b=Xiilvk1PzCgsPOif9rIIKdAnFXePORxKn3PnsLwTfTDx/QC6/iPfzXhcaqOst4qTaz
	V2QrtR8HYDcd+lHtVakbJbigdRgbd3USTdHuA30HH8ABNNcVuABDBpjwfVh+427ea0ZH
	VxS6lUiTBOGxTwDm0ZiD2kXcY8Ugb4mHc/QPH78J6pljJuG91JQeu/kv7zwy66SwhSWO
	YNHpgliHjOEffh0zFsk6mBee1qNigIn6ZXk7F1+eWkr3IcYDpmb+TfujjZAN6OchSfs2
	JZ6i+tIkcXpkUEqXqJah5YapOE8UKN4H42XLbj9qm5aOEadc5B9Zq21u0MsmQi/4BLUY
	PhxQ==
X-Gm-Message-State: AOUpUlFdk7E7p3mUp2bVk3wMd8BcTN3eWCdNW2TfHl/+zmUh3GL19HgY
	u2+zFcTPF28dh7vMcnvenLdf8Uq3
X-Google-Smtp-Source: AAOMgpfN9FpzdZ38jQLmOMrLeUvUGrkhqwhnXmM8V/cSlv2AtnhJi9F7j2w+7Ln+BvKrwdKAE4MpFw==
X-Received: by 2002:aca:3d56:: with SMTP id
	k83-v6mr14497020oia.166.1533572413316; 
	Mon, 06 Aug 2018 09:20:13 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:c33:ac25:fc33:9f90:b6d1])
	by smtp.gmail.com with ESMTPSA id
	p132-v6sm11896374oia.31.2018.08.06.09.20.12
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 06 Aug 2018 09:20:12 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: akuster808@gmail.com,
	openembedded-core@lists.openembedded.org
Date: Mon,  6 Aug 2018 09:20:03 -0700
Message-Id: <1533572407-3066-4-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1533572407-3066-1-git-send-email-akuster808@gmail.com>
References: <1533572407-3066-1-git-send-email-akuster808@gmail.com>
Subject: [PATCH 4/8] linux-yocto-rt/4.4: update to 4.4.141
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
X-List-Received-Date: Mon, 06 Aug 2018 16:20:12 -0000

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb
index 97538e2..f61a479 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipPackage("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "d5efeeeb928a0111fc187fd1e8d03d2e4e35d4a0"
-SRCREV_meta ?= "b149d14ccae8349ab33e101f6af233a12f4b17ba"
+SRCREV_machine ?= "68a7377ccf81ae642a9f95042fd1a44e3fc61587"
+SRCREV_meta ?= "b41a36ffe53f73c86a0f3672d32b5ebec59ab15e"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.4.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.4;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "4.4.113"
+LINUX_VERSION ?= "4.4.141"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
-- 
2.7.4


