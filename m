Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-vk0-f65.google.com (mail-vk0-f65.google.com
	[209.85.213.65])
	by mail.openembedded.org (Postfix) with ESMTP id 281A260807
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 Nov 2016 19:56:42 +0000 (UTC)
Received: by mail-vk0-f65.google.com with SMTP id p9so1711789vkd.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 01 Nov 2016 12:56:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc; bh=6/yxeZhNvLdK+YIbpu/5qgqCuzFb9v7K9xBbRAeyHC4=;
	b=mLsAS/w28LujgwWABn+qtXhddntdSfqjdggCYtN2lePhXxHOFSGu+6JAxBMy+pcS3S
	dJbAwqllF5Mm6xZXzrYnIY5CWZBIuCDXqGStzkWOrs5YIhaVWk3ui0VjMxVOGLLYQLjY
	QGfBZTjvamXR6fcwddp1kjfg4avb1MqS6Gb+AVCaBbL06Xs3DKeo7T8oBBOr4d/+DP3t
	OTlHAx3DBFYVyF6adC8Ofz7HvBKeTtIavbGSzo5+1fOZde6eNhtu9nqThgrGitgEZzrh
	nZIIKQ40nVjMcehzDtsZ9gEA57pzMB/sKpoC8FpU+yc7WxTXXx+a85pUa+moyMEcjnjT
	/0Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc;
	bh=6/yxeZhNvLdK+YIbpu/5qgqCuzFb9v7K9xBbRAeyHC4=;
	b=AAzmvJ7MxVheJvuC/OQkYjD0BSZMK8Xe+Sg5cdWp4BwVY0uMLkZjnOsvteYQFZzAv6
	zUf009ijZh4JJYiMYxjg5aRK5MeKeRLxHo8CZv+IT3A+MRXfI581X/u2z5eEDs2oENrm
	lFuIPA+Eg6djJYBWpwoL07hQpYtIcMafg9trdja/VWvP7AcBb2E6HwqcpLyXYtQ2KICb
	cb7fX5CF5DeUlwe3NVh1XOpMCVnx7CiCBdXq5+ezsrwMD79rExh764qaAba0OFct6+HS
	hvpVOtzbfGl5slG/31gttKtHVRzqIY6NQ/J9f/kc78YfpvhyG+cIBja32kISjKDeV6lS
	ArsQ==
X-Gm-Message-State: ABUngve8C87gQQiuGKSbcLSnx2svicG3cGawz1pcHN/hJ0kadzuE1d+I2Wz+HfhytCRzMw==
X-Received: by 10.31.107.135 with SMTP id k7mr11014634vki.119.1478030203372;
	Tue, 01 Nov 2016 12:56:43 -0700 (PDT)
Received: from mail-vk0-f51.google.com (mail-vk0-f51.google.com.
	[209.85.213.51]) by smtp.gmail.com with ESMTPSA id
	o187sm8104968vkf.10.2016.11.01.12.56.42
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 01 Nov 2016 12:56:42 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-vk0-f51.google.com with SMTP id x186so79920143vkd.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 01 Nov 2016 12:56:42 -0700 (PDT)
X-Received: by 10.31.165.8 with SMTP id o8mr17366849vke.95.1478030202010; Tue,
	01 Nov 2016 12:56:42 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.151.16 with HTTP; Tue, 1 Nov 2016 12:56:41 -0700 (PDT)
In-Reply-To: <1478007056-16301-1-git-send-email-mike.looijmans@topic.nl>
References: <1478007056-16301-1-git-send-email-mike.looijmans@topic.nl>
Date: Tue, 1 Nov 2016 17:56:41 -0200
X-Gmail-Original-Message-ID: <CAP9ODKok5UtZy6=ZX7NUZ2=Q1W4wAt6ympZbc8_Qa9fXvH1CZA@mail.gmail.com>
Message-ID: <CAP9ODKok5UtZy6=ZX7NUZ2=Q1W4wAt6ympZbc8_Qa9fXvH1CZA@mail.gmail.com>
To: Mike Looijmans <mike.looijmans@topic.nl>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] busybox/mdev.conf: Ignore eMMC RPMB and boot block devices
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
X-List-Received-Date: Tue, 01 Nov 2016 19:56:42 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Nov 1, 2016 at 11:30 AM, Mike Looijmans <mike.looijmans@topic.nl> wrote:
> eMMC devices may report block devices like "mmcblk0rpmb" and
> "mmcblk0boot0". These are not actually block devices and any
> read/write operation on them will fail. To prevent spamming error
> messages attempting to mount them, just ignore these devices.
>
> Signed-off-by: Mike Looijmans <mike.looijmans@topic.nl>

Acked-by: Otavio Salvador <otavio@ossystems.com.br>

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

