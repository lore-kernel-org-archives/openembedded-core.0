Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-io1-f68.google.com (mail-io1-f68.google.com
	[209.85.166.68])
	by mail.openembedded.org (Postfix) with ESMTP id BBBFC7C85F
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Mar 2019 05:34:28 +0000 (UTC)
Received: by mail-io1-f68.google.com with SMTP id y13so18622285iop.11
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Feb 2019 21:34:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=jvDJDn4EB4oymOFT/E32CASQrHqkE8Nv42PVCc+H3WU=;
	b=Oixvc9q4hUa3QwwT/A0vK9T2anjHvyPsthdDPIRWKCjxVbBoNF3Rlpmd2ZkeD2xmE3
	lk1qvRJFiO9tLON+rEMb7osY8sn0xUPyhQoCtCt7tI0vmbbyxktvIkf4gNJ2Ua+bVm6f
	Tzm2iv34+NG+PkZ7fAvizJHlvXNwYMr48L4bJMagPPE5BXzpPhIXaQbOV7q5ci+rnb1/
	VKhk7l6D2umVgOBIAbgDdCQofSO+wr1tI6dH8/pj4YOoczmzJ3ENWPMwXgckZgkoA5O2
	byv/HYp6B3SCmNe8fDrPnInQm9/MwLvnNWvRGSkDzXqdFutW3sj/pHbXx8vHZ+4Kzyo6
	I+ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=jvDJDn4EB4oymOFT/E32CASQrHqkE8Nv42PVCc+H3WU=;
	b=bNxk8eY9uXDDN1OyqRzvD9mo79dEXHTGvvwpqjE4OR+s3TT8sSzTf7m98n3KHIUW8Y
	IVecPFHvcOjo2FD0fmIehrSZvep9/we4lnzpLZtEx+6tzGNreN5o2ZUfWNOqBO17sKNo
	I0Flhurv+Lj494xPH51h9Jdqh12pvqu7gKzeimTX8ja/pIwh6Za/Wy198PuVmdGB4ai1
	YjdTxSwfbZGPENlEREw0JskPZC6xS/pLBeOXfTbfVI1NLGTpHwJLnLYVpgeM4MXPbFl2
	zc77vUHQYnNK0bVjP0jC2QV7Oc9NKDnDDBtkSVgQa6fJ0k6uiAJJXOGIapdHq1m+kFbO
	VGew==
X-Gm-Message-State: APjAAAXQ6SLq1hxfW5SHSLMdgn+uhGJHZoxp32uWcUA9wYwGWHPhlCLV
	xU/+xAB/+bpoc22ElOAzWII=
X-Google-Smtp-Source: APXvYqz2WBh3VmX/wOqldttSU/1fhPLaxv33mnLjoIHkcR0f9AMVzTp9slnOPjRwrUem0+IeEHHeKw==
X-Received: by 2002:a6b:ef02:: with SMTP id k2mr1573723ioh.95.1551418469276;
	Thu, 28 Feb 2019 21:34:29 -0800 (PST)
Received: from localhost.localdomain
	(CPEe8de27b71faa-CM64777d5e8820.cpe.net.cable.rogers.com.
	[174.116.254.195])
	by smtp.gmail.com with ESMTPSA id k77sm3935110itb.7.2019.02.28.21.34.28
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 28 Feb 2019 21:34:28 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Date: Fri,  1 Mar 2019 00:34:22 -0500
Message-Id: <cover.1551418113.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/4] linux-yocto: consolidated pull request
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
X-List-Received-Date: Fri, 01 Mar 2019 05:34:29 -0000
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Hi all,

Here's my latest consolidated pull request.

These two changes are routine cleanups/tidying of configs that are no longer
valid in the supported kernels:

  linux-yocto: netfilter: Enable CONFIG_NETFILTER_XT_TARGET_LOG
  linux-yocto/4.19: configuration cleanups

This change are the integration of the qemuarm* graphics support from John
Mason, along with a change that I made to map qemuarm -> qemuarma15 for the
4.19 kernel. This KMACHINE mapping allows us to test the switch to qemuarma15
as the default quemuarm without impacting any other branches or users of the
4.19 linux-yocto kernel.

  linux-yocto: qemuarm|qemuarm64: graphics support

And finally, we have an objtool -> kernel shared dir fix that was posted
some time ago, and has recently been reported as breaking exernal module
builds.

  kernel: add objtool to shared workdir when CONFIG_UNWINDER_ORC is set

I grabbed the change, tweaked it a bit and it tests fine here, so I've
included it in my series.

Cheers,

Bruce

The following changes since commit 4d275d97b6c572fe11668ac16d2c77c018340c7c:

  perl: apply a native-only patch only to -native (2019-02-28 17:49:40 +0000)

are available in the Git repository at:

  git://git.pokylinux.org/poky-contrib zedd/kernel
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel

Bruce Ashfield (3):
  linux-yocto: netfilter: Enable CONFIG_NETFILTER_XT_TARGET_LOG
  linux-yocto/4.19: configuration cleanups
  linux-yocto: qemuarm|qemuarm64: graphics support

Justin Bronder (1):
  kernel: add objtool to shared workdir when CONFIG_UNWINDER_ORC is set

 meta/classes/kernel.bbclass                        | 9 +++++++++
 meta/recipes-kernel/linux/linux-yocto-rt_4.19.bb   | 2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_4.19.bb | 2 +-
 meta/recipes-kernel/linux/linux-yocto_4.19.bb      | 5 ++++-
 4 files changed, 15 insertions(+), 3 deletions(-)

-- 
2.19.1


