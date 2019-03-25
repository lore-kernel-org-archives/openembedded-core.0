Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-it1-f194.google.com (mail-it1-f194.google.com
	[209.85.166.194])
	by mail.openembedded.org (Postfix) with ESMTP id 2612A7CFDF
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Mar 2019 03:11:59 +0000 (UTC)
Received: by mail-it1-f194.google.com with SMTP id w18so11840826itj.4
	for <openembedded-core@lists.openembedded.org>;
	Sun, 24 Mar 2019 20:12:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=5tCkjlAtLDczTOcZa+XfNjnIP58aZQowIDTeO2JxSBw=;
	b=kEYojaiA1lNPl9UkUMNkloqLavZk3SMlcUDGR6NyWkXRzepGvXRQ2OteJX8Lze/j4E
	sdNBW9IfrZqiymj7UdOaPoP5QQWP5dTl+vh/x+xHtsNxTkc94YbKvyIFPxls484jts4Q
	GEqAZCkn/x+vKnyvg7hT3Mr2tvlRkyrEY71g2rhowPsNUEAK3aSRCOQdrOjmgffHLaKX
	2HOW4cOfNpHy9md81Ic9t27PkcI5jUV/tbi91dDnx1vqe7zx37J42yMyauamRaX6GR8R
	uOgDkX+NX1WeXyUBTA/Lc27VP0O5ekLUXJOKL97kLyJY+LV4gdGxjdWXtTLOD+7rfIgb
	TGOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=5tCkjlAtLDczTOcZa+XfNjnIP58aZQowIDTeO2JxSBw=;
	b=P0GrdXnF6HCi9Kry32hpjKX/3aGVrjCFTFSUJ22ehe4Anwb3oVFQ8+SGdDdVj5iRqi
	RUpSDraBy9sqmKD6Ps3/m7t/5quwPh6iDGrbHOs3xO3S2bYxhyqcatrgs5mXiWIo4Aoi
	MSd2ilSeSPncej0ns6o9mY/xe25p+blsgUpknFwyhXo5olShl1vhVtw3qzP1dvvAJxZ9
	J5q+1SrjajnwQo1BN/MrXLm7mrzuuMqzskVCUD1bGLem4VGDY7qqcIz2VsYYyy5GqhTK
	LZIx8Xd75jHYmfuXvMHLP3asV7aSxFceMq7bScHLnYcYFSHulLAb3c/HbSJkbgsk04V1
	Tu6w==
X-Gm-Message-State: APjAAAWd68lZFg8+ChJuEWMgWcYV+FpWdYjQRsHAQT/PfQbHL+Dxh4Of
	bGL2ICDXUbZ/C2h0pMLo31E=
X-Google-Smtp-Source: APXvYqw85p86HQtrAnaVhbr45o8mLRWqRwjQg43/ERXlNrdFse/JMnYGQPY4jZ2Iyc3Ub6L+bm8M+g==
X-Received: by 2002:a05:660c:490:: with SMTP id
	a16mr6443241itk.141.1553483519618; 
	Sun, 24 Mar 2019 20:11:59 -0700 (PDT)
Received: from localhost.localdomain
	(CPEe8de27b71faa-CM64777d5e8820.cpe.net.cable.rogers.com.
	[174.116.254.195])
	by smtp.gmail.com with ESMTPSA id l8sm5443416itl.26.2019.03.24.20.11.58
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 24 Mar 2019 20:11:58 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Date: Sun, 24 Mar 2019 23:11:49 -0400
Message-Id: <cover.1553483380.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/8] linux-yocto: consolidated pull request
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
X-List-Received-Date: Mon, 25 Mar 2019 03:11:59 -0000
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Hi all,

Here is the latest consolidated pull request of the changes I've collected
during M2/M3.

I was able to build and boot all architectures with these changes, and there's
nothing out of the ordinary in this series. But of course, I'm sure someone,
somewhere will find a combination that I wasn't able to test :D

Cheers,

Bruce

The following changes since commit 753e2a0ede4449917c75353b57f13bbafe70fac8:

  build-appliance-image: Update to master head revision (2019-03-19 23:56:29 +0000)

are available in the Git repository at:

  git://git.pokylinux.org/poky-contrib zedd/kernel
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel

Bruce Ashfield (8):
  linux-yocto: sound: Re-enable ENS1370 support
  linux-yocto: pinctrl config change for cannonlake
  linux-yocto/4.19: integrate arm systemtap fix
  linux-yocto/4.19: update to v4.19.30
  linux-yocto/5.0: update to v5.0.3
  linux-yocto-rt: import 5.0 -rt patches
  linux-yocto/5.0: x86/resctrl: Rename INTEL_RDT to RESCTRL
  linux-yocto-rt/4.19: update to -rt16

 .../linux/linux-yocto-rt_4.19.bb              |  6 +-
 .../linux/linux-yocto-rt_5.0.bb               |  6 +-
 .../linux/linux-yocto-tiny_4.19.bb            |  8 +--
 .../linux/linux-yocto-tiny_5.0.bb             |  8 +--
 ...0001-arm-Makefile-Fix-systemtap-4.19.patch | 62 -------------------
 meta/recipes-kernel/linux/linux-yocto_4.19.bb | 22 +++----
 meta/recipes-kernel/linux/linux-yocto_5.0.bb  | 20 +++---
 7 files changed, 35 insertions(+), 97 deletions(-)
 delete mode 100644 meta/recipes-kernel/linux/linux-yocto/0001-arm-Makefile-Fix-systemtap-4.19.patch

-- 
2.19.1


