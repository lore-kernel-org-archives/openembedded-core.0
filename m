Return-Path: <pascal.bach@siemens.com>
X-Greylist: delayed 1293 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 15 Jun 2016 12:52:57 UTC
Received: from lizzard.sbs.de (lizzard.sbs.de [194.138.37.39])
	by mail.openembedded.org (Postfix) with ESMTP id 4F049606BF
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Jun 2016 12:52:57 +0000 (UTC)
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by lizzard.sbs.de (8.15.2/8.15.2) with ESMTPS id u5FCVOAq006867
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Jun 2016 14:31:24 +0200
Received: from [139.16.77.141] (MD1FZU9C.ww002.siemens.net [139.16.77.141])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTPS id u5FCVNDP014383
	(version=TLSv1.2 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Jun 2016 14:31:24 +0200
To: openembedded-core@lists.openembedded.org
From: Pascal Bach <pascal.bach@siemens.com>
Message-ID: <57614A9B.3090602@siemens.com>
Date: Wed, 15 Jun 2016 14:31:23 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:38.0) Gecko/20100101
	Thunderbird/38.7.2
MIME-Version: 1.0
Subject: qemuppc kernel doesn't build with GCC 4.9 on korgoth
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
X-List-Received-Date: Wed, 15 Jun 2016 12:53:00 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

Hi

I tried to build qemuppc on the latest korgoth branch using the GCC 4.9.3 from OE-core.

The problem is that i get an error when trying to build the kernel.
I was able to trace the issue back to this commit:
https://github.com/openembedded/openembedded-core/commit/7a51776a830167e43cbd185505f62f328704e271

And i can confirm that removing TARGET_CC_KERNEL_ARCH = "-mno-spe" from qemuppc.conf makes it work again.

The question is how to best solve this?
Do the changes for GCC 5.3.0 that done in the commit mentioned above also need to be applied to 4.9?
Or is it just not supported to build qemuppc with GCC 4.9?

Thanks for your help

Pascal


