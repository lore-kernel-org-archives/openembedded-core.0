Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 8F0B373710
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Jul 2015 21:24:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t6ALO3Dm027672; Fri, 10 Jul 2015 22:24:03 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id xIPPKwt8j387; Fri, 10 Jul 2015 22:24:03 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t6ALNlor027669
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Fri, 10 Jul 2015 22:23:58 +0100
Message-ID: <1436563427.3310.16.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Jussi Kukkonen <jussi.kukkonen@intel.com>
Date: Fri, 10 Jul 2015 22:23:47 +0100
In-Reply-To: <5946300c9c5e9e0be705a2db59c1bd03340a629a.1436427694.git.jussi.kukkonen@intel.com>
References: <52cb25bbbd0e0fc90193b412850d018828aa33da.1436427694.git.jussi.kukkonen@intel.com>
	<5946300c9c5e9e0be705a2db59c1bd03340a629a.1436427694.git.jussi.kukkonen@intel.com>
X-Mailer: Evolution 3.12.10-0ubuntu1~14.10.1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/5] xf86-input-vmmouse: Upgrade 13.0.0 -> 13.1.0
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
X-List-Received-Date: Fri, 10 Jul 2015 21:24:08 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2015-07-09 at 10:52 +0300, Jussi Kukkonen wrote:
> Remove backported patch.
> 
> Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
> -

This caused:

ERROR: QA Issue: xf86-input-vmmouse: Files/directories were installed but not shipped in any package:
  /usr/libx32/udev
  /usr/libx32/udev/rules.d
  /usr/libx32/udev/rules.d/69-xorg-vmmouse.rules
Please set FILES such that these items are packaged. Alternatively if they are unneeded, avoid installing them or delete them within do_install. [installed-vs-shipped]

https://autobuilder.yoctoproject.org/main/builders/nightly-x32/builds/385/steps/BuildImages/logs/stdio

on the nightly-x32 build. Looks like its not multilib safe. Looking at
the code, the udev directory seems to have gone from base_libdir to
libdir?

Cheers,

Richard


