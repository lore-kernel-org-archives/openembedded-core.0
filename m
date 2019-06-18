Return-Path: <just.another.mariano@gmail.com>
Received: from mail-io1-f65.google.com (mail-io1-f65.google.com
	[209.85.166.65])
	by mail.openembedded.org (Postfix) with ESMTP id 49A637E8A7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Jun 2019 20:10:37 +0000 (UTC)
Received: by mail-io1-f65.google.com with SMTP id i10so32679757iol.13
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Jun 2019 13:10:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=/u3xHy1RuYJK1eG6j1TAsOY/av0fntbO346HFDqk0I8=;
	b=s+AHYD0ivJvfasZ6nZOwkEVTLqn7IWzs5xAcKrl8+JJfaQQ0acbWkhHoFel9oQokoX
	EyJ3c9W7tOCth+GLLImhPV6PCPj5ormhNch31SHyu+XMJcY03sXhoYZZ/yfVScdCV9n7
	YrvW8h8NIFw67lSp9s6y66ikmS9XbFA1KnIEgOFD5pcAHhfqYPQFYWwwapFDv4s1oxeX
	hDJkJnGdbwelNwEsKVY43Ts2L5Vw2kEnviXvpape2gMleAoc7Jx4WcZxWFpGx2qBD39C
	1gA73hB8xQUp6RTku9AWB7jL5e5mbjPzE22fA/3eR7cpB6kgi4ilh2LNw61E24q0Vpww
	2Xiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=/u3xHy1RuYJK1eG6j1TAsOY/av0fntbO346HFDqk0I8=;
	b=YvVLZ8OYdyAOuDjv/L3E9cCRlAvEk2wpwDmdguf5kAz3QwOK6iXvoB39K8Jljpv75/
	oEclz7x8UmLWLCveLYfSziOhgrMg9TwNuW93vCKM+CH8J5uZiOCR9Yt3duUxiOMEcM88
	hbPi4vp1B5oPEGwtJWV7kC/5oZla+ESv6ec22c/6IZ5Bz3llq1xZi3WYRII7KnpigIsh
	XkA+Z7GrFafF9xKeXaGaUtTShg758v6Va0WrZug7ZcYG6g9uASc3nEV2Uo6UmFhL78z/
	YaKu3YFej4uHqp3ypQXcEApTfjL80d4dP+7wQHK1Rgd5AZgQZFVSLwXifHMtikgf5I+8
	/xZw==
X-Gm-Message-State: APjAAAWE95jOH07Wu5d7eN5N7p6mbszNpMilG43zi5QhROo97Iozhh8L
	HZT1xuX/W98yZHGGIIfR7wQeDmrk
X-Google-Smtp-Source: APXvYqxc39Iq57A2mShZzjv0MJ0ezOO4AUsN/CRE2CX4HSQMquNP1JQlydgXNZwuaMj9kpYTiy/4Xg==
X-Received: by 2002:a02:b914:: with SMTP id v20mr69139518jan.83.1560888638198; 
	Tue, 18 Jun 2019 13:10:38 -0700 (PDT)
Received: from ultima.ninicasiopea.net
	([2605:a601:43d5:f700:215:17ff:fe90:1065])
	by smtp.googlemail.com with ESMTPSA id
	u187sm28751871iod.37.2019.06.18.13.10.37
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 18 Jun 2019 13:10:37 -0700 (PDT)
From: =?UTF-8?q?Mariano=20L=C3=B3pez?= <just.another.mariano@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 18 Jun 2019 15:10:31 -0500
Message-Id: <cover.1560888312.git.just.another.mariano@gmail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Subject: [PATCH 0/1] linux-yocto: Add SCSI support when ptest is in DISTRO_FEATURES
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
X-List-Received-Date: Tue, 18 Jun 2019 20:10:37 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Some architectures have SCSI support disabled by default and trying to
build the scsi_debug module will throw a warning, for a missing
dependency, when building the kernel. This patch will enable SCSI
support for all architectures when ptest is listed in the
DISTRO_FEATURES.

The following changes since commit 111b7173fee69fe8b01ec2fa6999713841326537:

  dev-manual: Fixed grammar issue. (2019-06-18 11:29:23 +0100)

are available in the Git repository at:

  git://github.com/justanotherboy/poky bug13301p3
  https://github.com/justanotherboy/poky/tree/bug13301p3

Mariano López (1):
  linux-yocto: Add SCSI support when ptest is in DISTRO_FEATURES

 meta/recipes-kernel/linux/linux-yocto-rt_4.19.bb | 5 ++++-
 meta/recipes-kernel/linux/linux-yocto-rt_5.0.bb  | 5 ++++-
 meta/recipes-kernel/linux/linux-yocto_4.19.bb    | 5 ++++-
 meta/recipes-kernel/linux/linux-yocto_5.0.bb     | 5 ++++-
 4 files changed, 16 insertions(+), 4 deletions(-)

-- 
2.21.0


