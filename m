Return-Path: <naresh.bhat@linaro.org>
Received: from mail-yk0-f179.google.com (mail-yk0-f179.google.com
	[209.85.160.179])
	by mail.openembedded.org (Postfix) with ESMTP id 9552F6013D
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Mar 2015 15:46:40 +0000 (UTC)
Received: by ykbq200 with SMTP id q200so17109337ykb.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 03 Mar 2015 07:46:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=61JwvtiXqcqy4lA3NeCYELUqovqwOscLlrdoNcFXYDg=;
	b=gJGD/aohX3tfb9DrgiPCrzUskF23pB5Y9GWNL9VVj8403zKgvNc+rVvo67eKk8eyvk
	gZm+wnV3ZhCI/P9ISwxIE4Y8YYGFONwqRVy1nbu1qpGDIwvVd7B3qYrkf1fXaugikRxe
	6jXKRNvY5CglwgxVzi4vxAhUM1ATvOLN6mNKm4OzcHPxdkGx12A8+I0DoDgm7JY2ubaN
	8U8fPh53R3yp1l+5/R4FxEri9vpoAIMke0IH5kdzoXlcSXHdeOGxzhwysKlzYOXgUI6/
	g5yf+8193oAvK4NPaKW8BJjCTUaaTL7VdBEy/L/PaG8ftZKVj5CM73mf4VF93SgTJvxD
	BN1A==
X-Gm-Message-State: ALoCoQlk/hi9J069MskXWnoQ6WdMNuTL93PfmJJRbSW9sLj+Y9V5v6u67p+aXHvEXkSwCWa4M5bv
X-Received: by 10.236.36.102 with SMTP id v66mr31771094yha.81.1425397601269;
	Tue, 03 Mar 2015 07:46:41 -0800 (PST)
Received: from Latitude-E6430.caveonetworks.com ([111.93.218.67])
	by mx.google.com with ESMTPSA id n22sm831796yho.1.2015.03.03.07.46.38
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 03 Mar 2015 07:46:40 -0800 (PST)
From: Naresh Bhat <naresh.bhat@linaro.org>
To: openembedded-core@lists.openembedded.org
Date: Tue,  3 Mar 2015 21:16:20 +0530
Message-Id: <1425397584-5154-1-git-send-email-naresh.bhat@linaro.org>
X-Mailer: git-send-email 1.7.9.5
Subject: [OE-core Yocto PATCH 0/4] aarch64 changes for meta layer
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
X-List-Received-Date: Tue, 03 Mar 2015 15:46:44 -0000

Hi,

I am adding the support of aarch64 to LUV OS Distribution project. 
The luv-yocto project is based on poky distribution.  

https://01.org/linux-uefi-validation

While adding support I find that these are the few meta layer changes,
which I have been asked to upstream. If we merge these changes into 
openembedded-core it will be more helpful to maintain the minimum set
patches at dependency projects like luv-yocto.  

Please let me know your feedback on these set of changes.

Thanks and Regards
-Naresh Bhat

Naresh Bhat (4):
  grub-efi: Add to support to install grubaa64 efi
  bootimg: Add support to install Image
  bootimg: Skip build iso image for aarch64
  grub: Update grub git recipe

 meta/classes/bootimg.bbclass      |   16 ++++++++++--
 meta/classes/grub-efi.bbclass     |    3 +++
 meta/recipes-bsp/grub/grub_git.bb |   51 ++++++++++++++++++++++++++++++++-----
 3 files changed, 62 insertions(+), 8 deletions(-)

-- 
1.7.9.5


