Return-Path: <naresh.bhat@linaro.org>
Received: from mail-pd0-f173.google.com (mail-pd0-f173.google.com
	[209.85.192.173])
	by mail.openembedded.org (Postfix) with ESMTP id E09A560034
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Mar 2015 11:27:22 +0000 (UTC)
Received: by pdbni2 with SMTP id ni2so40572853pdb.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Mar 2015 04:27:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=0FOuap2yZuUIgJjXb2ylsfBi3I1L/EJi5lrUWMoEZTI=;
	b=efB3EPlfDiKqdMRF/CCfIk+zAFNke3KiXwoo7XYOWScquKMIIMKRgahBMkDZxd9+h7
	tlSJ7UpPOalSWuzzZdSDq5R5gUmbsyNWQvNIgHLJqnUrjgu5dprNReffl4DUuJLhHqPS
	22nseRfr0TJCSUyfvSMocsyVa6kjcGEZhMli9zbDcwfyPm4eFFrVjySrxmOlioC/XVxJ
	Dix5onGr7zx3oJpxJd5+Q18jr1Y2L4fE+mEWrFB5N+XlTn481ejv3ZR6YLXOurBysV9s
	+9b5OCamyatsgd+P2H0XCUCLocRTnUtH+hnm6e1cIO1Zo+rG69455BnxYJZT3cuQJo40
	qo/w==
X-Gm-Message-State: ALoCoQngtTX+eB8vO2WYns2xzSfWDIFbIA/mSgtJMOd1bTb4U4cO4GbvRrgOuknUHTuHoA+giuw2
X-Received: by 10.70.91.131 with SMTP id ce3mr151487656pdb.30.1426678043773;
	Wed, 18 Mar 2015 04:27:23 -0700 (PDT)
Received: from Latitude-E6430.domain.name ([119.82.123.224])
	by mx.google.com with ESMTPSA id x1sm27111518pdr.17.2015.03.18.04.27.20
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 18 Mar 2015 04:27:22 -0700 (PDT)
From: Naresh Bhat <naresh.bhat@linaro.org>
To: openembedded-core@lists.openembedded.org
Date: Wed, 18 Mar 2015 16:57:04 +0530
Message-Id: <1426678029-19516-1-git-send-email-naresh.bhat@linaro.org>
X-Mailer: git-send-email 1.7.9.5
Cc: matt.fleming@intel.com
Subject: [OE-core v2 PATCH 0/5] aarch64 changes for meta layer
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
X-List-Received-Date: Wed, 18 Mar 2015 11:27:24 -0000

I am adding the support of aarch64 to LUV OS Distribution project.
The luv-yocto project is based on poky distribution.

https://01.org/linux-uefi-validation

While adding support I find that these are the few meta layer changes,
which I have been asked to upstream. If we merge these changes into
openembedded-core it will be more helpful to maintain the minimum set
patches at dependency projects like luv-yocto.

Changes since V0:[RFC series]
- grub: grub-efi: bootimg: Include all the chages suggested by Bernhard Reutner-Fischer
- grub: Add grub recipe changes suggested by Burton Ross

Changes since V1:
- grub: More documentation on grub recipe and remove CACHED_CONFIGUREVARS as suggested by Richard Purdie 
- bootimg: Add NOISO as suggested by Bernhard Reutner-Fischer
- syslinux: Impliment as suggested by Richard Purdie

-Naresh

Naresh Bhat (5):
  bootimg: Add support to install Image
  syslinux: Remove bootimg dependency on aarch64
  bootimg: Skip iso image build on aarch64
  grub-efi: Add to support to install grubaa64 efi
  grub: Update grub git recipe

 meta/classes/bootimg.bbclass      |   12 ++++++++--
 meta/classes/grub-efi.bbclass     |   17 +++++++++-----
 meta/classes/syslinux.bbclass     |    5 +++-
 meta/recipes-bsp/grub/grub_git.bb |   47 +++++++++++++++++++++++++++++++------
 4 files changed, 65 insertions(+), 16 deletions(-)

-- 
1.7.9.5


