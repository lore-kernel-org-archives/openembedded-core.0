Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-io1-f68.google.com (mail-io1-f68.google.com
	[209.85.166.68])
	by mail.openembedded.org (Postfix) with ESMTP id C69637D8C0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Apr 2019 03:19:06 +0000 (UTC)
Received: by mail-io1-f68.google.com with SMTP id s7so13338410iom.12
	for <openembedded-core@lists.openembedded.org>;
	Sun, 14 Apr 2019 20:19:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=p9JNFi1dEGuHOvuRZ7ir5uVZHJY/U9P7MnsXQWT59Vk=;
	b=hiEpzq8T7KQr69uBFuUrO6rjzlFzSE5u/UIzda1fGMcEe8aObiDZtOeRfqy1HYkwdh
	lO8tevhOVLXaWKOxcvEkEGw8OsFbOaQApL9R5k6JDjQXyjgxpP+54jRnQgGhJQqfQGb8
	ncedF3U3xr/BgMeHddhs6rCLDvD81V6GhFVORhH1lRfWm2JYsFFIWmRf9k/tX6byobYl
	+hXF6MqCqba+Vz3m4H3XU4fOkOGVEIRm24U9M6gRzUv5b2MKVYBVGdp/YBSXssvh2c+A
	+NPpE33P1iYxH7eYSBt6yYsvHVhCUIOHFIWPMwYbdA9hNM8fvF14PF6EmQC54UoJLr+t
	zMNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=p9JNFi1dEGuHOvuRZ7ir5uVZHJY/U9P7MnsXQWT59Vk=;
	b=iJ2tWuffas68HJ3Q5IsDOyC2HtODephojKKZ1jrd9lADpx5+giCG0usfbljWIiizsE
	Tzym0/MW54UuUzIsfasVK+RIEx1a+EnNxmLGJxTic4GOiHO3N6/17qSj33dW0RuX1N4f
	XETlwFNk1PQ8zgRvZXD8+jArY5nmnbYF/NWwCnAm5cmXf75RAJblKDP021P8O0R7BVNu
	mxIg9hyDgPykmCqD8ca6Sqml7C0pv37ZBed+JvjEnOb3ZEIS9Nhsv9neP6VVLJBnLLNf
	LUk6JJtH4Vy506r3QdinqnYnlB7xD01NQvtOmshl9Mlx6MsY5e7yDSB+O4OWQEaMrhwi
	kS9g==
X-Gm-Message-State: APjAAAVep6lHaGkOIwXMtEcqPAcDynSxN0sxzbtBcHmjlRMIAxEjTTJO
	TLv4u9fnI6plUAyhWqBFpBJ3u/HiewI=
X-Google-Smtp-Source: APXvYqxQssHumPr6KRc1G7yvu2SgC86AxPk07k6Fh+uOttps4/vUwuWt+12z/0cKIVqmCzKEm1xm/Q==
X-Received: by 2002:a6b:4e13:: with SMTP id c19mr8214888iob.96.1555298347581; 
	Sun, 14 Apr 2019 20:19:07 -0700 (PDT)
Received: from localhost.localdomain
	(CPEe8de27b71faa-CM64777d5e8820.cpe.net.cable.rogers.com.
	[174.112.251.208]) by smtp.gmail.com with ESMTPSA id
	w184sm7490357ita.9.2019.04.14.20.19.06
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 14 Apr 2019 20:19:06 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Date: Sun, 14 Apr 2019 23:19:01 -0400
Message-Id: <cover.1555298211.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/4] linux-yocto: consolidated pull request (-stable updates)
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
X-List-Received-Date: Mon, 15 Apr 2019 03:19:07 -0000
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Richard,

Here's what may be the last round of -stable updates, and some preempt-rt
fixes for the two active kernels for the release. Nothing particularly
exiciting or earth shattering here.

I was able to build and boot on qemu*.

Cheers,

Bruce

The following changes since commit ffac131f1f03dd26ff65dd32918e940350e5e305:

  bitbake: poky.ent: Removed "ECLIPSE" entity variables. (2019-04-12 23:01:26 +0100)

are available in the Git repository at:

  git://git.pokylinux.org/poky-contrib zedd/kernel
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel

Bruce Ashfield (4):
  linux-yocto/5.0: update to v5.0.5
  linux-yocto-rt: update to 5.0.5-rt3
  linux-yocto/5.0: update to v5.0.7
  linux-yocto/4.19: update to v4.19.34

 .../linux/linux-yocto-rt_4.19.bb              |  6 +++---
 .../linux/linux-yocto-rt_5.0.bb               |  6 +++---
 .../linux/linux-yocto-tiny_4.19.bb            |  8 ++++----
 .../linux/linux-yocto-tiny_5.0.bb             |  8 ++++----
 meta/recipes-kernel/linux/linux-yocto_4.19.bb | 20 +++++++++----------
 meta/recipes-kernel/linux/linux-yocto_5.0.bb  | 20 +++++++++----------
 6 files changed, 34 insertions(+), 34 deletions(-)

-- 
2.19.1


