Return-Path: <ygl@koumoul.net>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id B68EF73163
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Apr 2016 13:51:30 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id r12so3189411wme.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Apr 2016 06:51:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=koumoul.net; s=dkim;
	h=sender:from:to:cc:subject:date:message-id;
	bh=QOA/fEVCgOM2FRgbcVL+XBGcJEPAstjQ1xVdamegWgo=;
	b=XcgDtrHmzk8leiFJc1peBSfCKCVmCnp+U74kk4vL5Taaj/JqS8/XHUwkKPwcu8VErK
	F2jsIdlHNVUiPDptaRAMZHpSBRoTfrXzwOpLykr06ST2+hRSEbVJWVxHg+ZkcRgcwA7O
	L7qZR6jnZIo9w5a8LUep99+CMXVQRCssigmpA=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=iot-bzh.20150623.gappssmtp.com; s=20150623;
	h=sender:from:to:cc:subject:date:message-id;
	bh=QOA/fEVCgOM2FRgbcVL+XBGcJEPAstjQ1xVdamegWgo=;
	b=BzLzK+OUf6H+d4KJOd2/kAYDc2oJ/tq3dCfr4TRHW+r9urkm/YZwm3zNvNIIrc31/m
	aScSAbpzAluoGG6erucZP5RuAZlaoc9Q48h/Hqfk/U88o4DSrcbRgvl7g8k4hu1u0dPm
	bYWubH80w2k0K5QM/krpC46Hoarxz5Ui4Q2NpQp9mz61W4SJrK6/BSftFU69jUdcSGIA
	MabxLLS7suLxgnR2ZapXt+dB4GxnnQ8ZZ8umV3Jct7EJtnaB9zJFFRkOmCI3bi3ohpdw
	m06JWk3B2I/PhDqPnjC5xAusU/mgpizoIIfMm62nRN5K0PIgYwOdhGvOYJcWQ3fR7E9V
	szBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
	bh=QOA/fEVCgOM2FRgbcVL+XBGcJEPAstjQ1xVdamegWgo=;
	b=UUXxHqhcj4gqMhEZNi6zvBYH/+a2zFnkyedqPrLTP1vjZCDFlDnkhwFxmlr9/IcYhV
	aIKI6VNAHIPamyn/09c3lqZef7LfK3x/TQnw8faUKwkFp2/rwkJfEC6aulnX8YTSQ6ii
	CoBIbzHFjQq+zZkNfKLJoTFP/IwTNRMzk2rWu9dE+lLSdvM5h/3Q5y6BTs3/KjPBVHWY
	C9oe0ssNCtawi8lALzi9CYKOrZAZkJd8cL8S2+ClvOLTd9+KZRTKX0qVTJCmAfX9C0gw
	Q6Fs91J5peFZv6Yh/hC1T18y6fB3MSdQ5OmKXgoPXAYIUCsbB+6SpkNEPHQaOnTx/jYF
	dReQ==
X-Gm-Message-State: AOPr4FUk+Rm3d0pXnvwSQsV6oVzxvlD4/Tx46FIhBnRMAPLIFg1gRguCcpXFervIcYTe2g==
X-Received: by 10.194.71.171 with SMTP id w11mr10237742wju.36.1461160290730;
	Wed, 20 Apr 2016 06:51:30 -0700 (PDT)
Received: from pollux.vannes.iot (pat35-3-82-245-140-164.fbx.proxad.net.
	[82.245.140.164])
	by smtp.gmail.com with ESMTPSA id w3sm5770581wjt.0.2016.04.20.06.51.29
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 20 Apr 2016 06:51:29 -0700 (PDT)
Sender: "Yannick Gicquel [ IoT.bzh ]" <ygl@koumoul.net>
From: Yannick Gicquel <yannick.gicquel@iot.bzh>
To: openembedded-core@lists.openembedded.org
Date: Wed, 20 Apr 2016 15:50:35 +0200
Message-Id: <1461160239-7799-1-git-send-email-yannick.gicquel@iot.bzh>
X-Mailer: git-send-email 1.9.1
Subject: [RFC][PATCH v2 0/4] U-Boot verified boot basic support
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
X-List-Received-Date: Wed, 20 Apr 2016 13:51:31 -0000

Changes since v1:
  * Uses a class uboot-sign.bbclass file instead of include file.
  * 'assemble_dtb' task removed and replace by do_install_prepend function
    for u-boot recipe.

Yannick Gicquel (4):
  u-boot: basic support of dtb append for verified boot
  u-boot: deploy u-boot-nodtb and dtb files
  kernel: fitimage: support device tree compiler options
  kernel: fitimage: basic support for fitimage signature

 meta/classes/kernel-fitimage.bbclass | 52 +++++++++++++++++++++++--
 meta/classes/uboot-sign.bbclass      | 75 ++++++++++++++++++++++++++++++++++++
 meta/recipes-bsp/u-boot/u-boot.inc   |  2 +-
 3 files changed, 125 insertions(+), 4 deletions(-)
 create mode 100644 meta/classes/uboot-sign.bbclass

-- 
1.9.1


