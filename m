Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-it1-f196.google.com (mail-it1-f196.google.com
	[209.85.166.196])
	by mail.openembedded.org (Postfix) with ESMTP id BCEAA7E40F
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 May 2019 12:44:45 +0000 (UTC)
Received: by mail-it1-f196.google.com with SMTP id m3so9614561itl.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 May 2019 05:44:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=Ub/yEnnL4VKVYDKpxH6pXLcfssR/66OblL5/SJne1LI=;
	b=GQfJFzivKc95yUli+1X67lUy7/3XggDoPVR9IKMc8eYc4RN1T0oIkWSCT2srSzhAsm
	I/64lPnCL4YbfhGhEVAC+8mA+DDMlv+gtWRoLc89wQ66fiDGdQkzv6MxxG6O6uXNdVUV
	7XDoiXhVq4TiWcM+j5v0jc65rATtWhdX/oHzoFvm/9ZRNowO6DzBaW3sRN3d/ooCFAwm
	gFHrSaK683HCEKkuWw1XDI81wldfESWAVGRJ2eUE4afp1ftp63HVHB1+aE7M3Ok6Xju8
	3imEyxbAw2G/E1mANvAnkN1Ph47bybBFhXYbaBrC3nTBNFdP9mlNXCwA4yqR12U9v5g0
	5JWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=Ub/yEnnL4VKVYDKpxH6pXLcfssR/66OblL5/SJne1LI=;
	b=K8mxKZuXugNk29mJ7FCJuMj8LjA4DxOsxMfQ+AEdmeZF3LssqDgJ28OKO6cfKdOUee
	2+Zb+O1ngRbYQo0z4KRUGFTzegymAswgR/ejfWrbULpcG0bs1YFlWR1Y8cr592pzjvw1
	UGPsMgQQvYyy9eI6LGmOFJj7k5B1ci3eRMrUmjYuLL1nR2OaMt5QmOgOMnKEQyVWEwYi
	pyntirLqbH8ZUb2Us9d5Xngh6SlyTQi6CYNAh7+SKpiopgN/iXIXHTVKS894nbxilTwP
	I5BKiyuqusslWFvG2lPEnzOXue5SjHneEmacp0vEsKILYqWD02OgMHP31Rykoem9N5L5
	F+vA==
X-Gm-Message-State: APjAAAUjmMMSOrzZWTb3LdY7uUveajvSRX3nMkplYPP2Y8rfVykn01qk
	KmHy5gNdYTfVePw8nbZBPVf7dgD++JI=
X-Google-Smtp-Source: APXvYqx68lG5K7PLgOxJdoHjI2ok7ijtLNJI/JmZJV+iSLMTKHNBoO2LJSXAw+9SGBVf8MhtlCHoog==
X-Received: by 2002:a24:9792:: with SMTP id k140mr2660710ite.43.1559220286280; 
	Thu, 30 May 2019 05:44:46 -0700 (PDT)
Received: from localhost.localdomain
	(CPEe8de27b71faa-CM64777d5e8820.cpe.net.cable.rogers.com.
	[174.112.251.208]) by smtp.gmail.com with ESMTPSA id
	s70sm1034266itb.16.2019.05.30.05.44.45
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 30 May 2019 05:44:45 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Date: Thu, 30 May 2019 08:44:34 -0400
Message-Id: <cover.1559220004.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/9] linux-yocto: consolidated pull request
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
X-List-Received-Date: Thu, 30 May 2019 12:44:45 -0000
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Hi all,

Here's the latest round of -stable and -dev bumps for linux-yocto. Looking at
the timing, v5.2 could be the new reference kernel introduced in the next
release, so I gave it some extra test cycles while doing this update.

Also note that I updated 4.9, 4.4 and other non-master kernels with -stable
updates. So if you are using linux-yocto as a reference, you can manually bump
your SRCREVs to pickup those chnages.

The only non-uprev in this series is the one kernel packaging tweak to grab
a new artifact introduced with the 5.2 kernel. It is packaged along side the
other module outputs, and won't add signficant size or time to anyone's feeds.
(and it is safe for older kernels as well, I tested just to be sure).

Cheers,

Bruce

The following changes since commit 08445c4c3cb76ed82c98ae672b8e891f64653cdc:

  uninative-tarball: Use xz compression and SDK_ARCHIVE_CMD (2019-05-29 12:54:12 +0100)

are available in the Git repository at:

  git://git.pokylinux.org/poky-contrib zedd/kernel
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel

Bruce Ashfield (9):
  linux-yocto/5.0: update to v5.0.13
  linux-yocto/4.19: update to v4.19.40
  linux-yocto/5.0: update to v5.0.17
  linux-yocto/4.19: update to v4.19.44
  kernel: package modules.builtin.modinfo
  linux-yocto-dev: bump to v5.2-rc
  linux-yocto-rt/5.0: update to -rt9
  linux-yocto/5.0: update to v5.0.19
  linux-yocto-rt/5.0: update to -rt11

 meta/classes/kernel.bbclass                   |  2 +-
 meta/recipes-kernel/linux/linux-yocto-dev.bb  |  2 +-
 .../linux/linux-yocto-rt_4.19.bb              |  6 +++---
 .../linux/linux-yocto-rt_5.0.bb               |  6 +++---
 .../linux/linux-yocto-tiny_4.19.bb            |  8 ++++----
 .../linux/linux-yocto-tiny_5.0.bb             |  8 ++++----
 meta/recipes-kernel/linux/linux-yocto_4.19.bb | 20 +++++++++----------
 meta/recipes-kernel/linux/linux-yocto_5.0.bb  | 20 +++++++++----------
 8 files changed, 36 insertions(+), 36 deletions(-)

-- 
2.19.1


