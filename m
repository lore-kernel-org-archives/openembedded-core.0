Return-Path: <armccurdy@gmail.com>
Received: from mail-ig0-f171.google.com (mail-ig0-f171.google.com
	[209.85.213.171])
	by mail.openembedded.org (Postfix) with ESMTP id 5A22B6013D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Jul 2015 01:58:20 +0000 (UTC)
Received: by iggf3 with SMTP id f3so3229211igg.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Jul 2015 18:58:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=V3hG0aBzuzMS9WLXeGdb9jJP1Eqd7gIWPAcQd5J5NUI=;
	b=Ewm82wsRVg7kZLdK0UTZ5bQACTjsU5OAo0s9eK2spj9ngx8tObN2Gw3giickM376BX
	RpLnfIqeY6/YYv9607TjBxK6vBMNmg4ov4a5215kguoUaoZ12vC7Wa91FLr+cosVf3Nw
	kAQMgj0ryng1fNeXFDCbR/Yn6/kfN+7FnYN6uL2iuKNLmpIArnHyTqOEJaZV+tttUYiG
	1geQ3i3tRMUANmb2n9Qwch2sSFrJfADaMZ74qnXSKtSr7AL4xjqBIXsBq8naTU0y4C04
	DEx3UDwgINmat8gLbe3xxR3heaotu8eL3NsyfbqR7z23B8xxQbsBnui/To573r989cl/
	e4zg==
X-Received: by 10.50.30.196 with SMTP id u4mr1214633igh.11.1437011900747;
	Wed, 15 Jul 2015 18:58:20 -0700 (PDT)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id x4sm4042784iod.26.2015.07.15.18.58.19
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 15 Jul 2015 18:58:20 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 15 Jul 2015 18:58:05 -0700
Message-Id: <1437011888-12736-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH 0/3] libcap: minor tweaks and fixes
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
X-List-Received-Date: Thu, 16 Jul 2015 01:58:22 -0000

Andre McCurdy (3):
  libcap: always link apps dynamically
  libcap: avoid losing default Large File Support CFLAGS
  libcap: control attr PACKAGECONFIG option via xattr DISTRO feature

 meta/recipes-support/libcap/libcap_2.24.bb | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

-- 
1.9.1


