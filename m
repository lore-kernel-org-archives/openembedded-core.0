Received: from mail-gg0-f172.google.com ([209.85.161.172])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1U09zv-0002EU-2B
	for openembedded-core@lists.openembedded.org;
	Tue, 29 Jan 2013 13:09:07 +0100
Received: by mail-gg0-f172.google.com with SMTP id f4so27879ggn.31
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Jan 2013 03:53:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:sender:from:to:cc:subject:date:message-id:x-mailer;
	bh=osoQIKTm6ctFdcdYqlxRtT5LzawLBAdVMpHJT84HBb8=;
	b=IAqk8P0fA86hT6S4t/v5+LB/4V4KbkYVLaXiYcKuB/QWHT2qVhZ+PCfUkgUSZgNU32
	3FvBKvl4uZgG7eeL0Qix/xnLgluYtd4WMk71bTKJLYBoeuWxRKv/UUUlp6pmgE2frwJg
	XertGqkKr/2IfIUAc4Cr3GCaW70FI2lF8tt+hjwxpDwvt18zrjgEBMEuG2VhMcf+WZG7
	r7nP1olvb8auFLgEhp8AndnVlR28FykbpmUuzEDLctX4cOnG0DRm5tYrfFDlTK/bvp36
	V8cZQZ0EMI8bTAXMmlR8VGHfHv95Y3X/hnkVdXNAwlQdhtpUyGaJXy07WBgDuAQhvFxA
	bi7A==
X-Received: by 10.236.145.38 with SMTP id o26mr643589yhj.89.1359460406870;
	Tue, 29 Jan 2013 03:53:26 -0800 (PST)
Received: from nano.lab.ossystems.com.br ([177.35.66.48])
	by mx.google.com with ESMTPS id z6sm7037801anh.13.2013.01.29.03.53.24
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 29 Jan 2013 03:53:26 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-core@lists.openembedded.org
Date: Tue, 29 Jan 2013 09:57:44 -0200
Message-Id: <1359460667-26291-1-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.8.1
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH v2 0/3] Improve DRI handling support flexibility
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 29 Jan 2013 12:09:07 -0000

There're some processors which provide binary blobs for DRI and GPU
support which need to be build in BSP; to avoid some dirt and ugly
hacks in BSP we ought to be flexible.

We splitted the glx and dri PACKAGECONFIG options and added a
virtual/dri provider so BSP can override it, if need.

Otavio Salvador (3):
  mesa: Add virtual/dri provides
  xserver-xorg: Split 'glx' and 'dri' PACKAGECONFIG options
  default-providers.inc: Set 'virtual/dri' as default for 'mesa-dri'

 meta/conf/distro/include/default-providers.inc      |  1 +
 meta/recipes-graphics/mesa/mesa-common.inc          |  4 ++--
 meta/recipes-graphics/xorg-xserver/xserver-xorg.inc | 13 ++++++++-----
 3 files changed, 11 insertions(+), 7 deletions(-)

-- 
1.8.1



