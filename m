Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id DA3CC73DA5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 May 2015 10:40:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t4FAeHhT023611; Fri, 15 May 2015 11:40:46 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id UTotxMhff80D; Fri, 15 May 2015 11:40:46 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t4FAeX26023638
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Fri, 15 May 2015 11:40:44 +0100
Message-ID: <1431686433.18723.22.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>
Date: Fri, 15 May 2015 11:40:33 +0100
In-Reply-To: <1431414393.30971.109.camel@linuxfoundation.org>
References: <1431268136-6968-1-git-send-email-akuster808@gmail.com>
	<CAMKF1spdFnLWipG86g52MGfTEohRkketU6qCj+cTQcJC-o2rCQ@mail.gmail.com>
	<1431295383.30971.25.camel@linuxfoundation.org>
	<1431414393.30971.109.camel@linuxfoundation.org>
X-Mailer: Evolution 3.12.10-0ubuntu1~14.10.1 
Mime-Version: 1.0
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] rpm: fix build issue with gcc5
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
X-List-Received-Date: Fri, 15 May 2015 10:40:51 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2015-05-12 at 08:06 +0100, Richard Purdie wrote:
> With the gcc patch I've posted applied:
> 
> http://errors.yoctoproject.org/Errors/Search/?items=10&query=5fd0b7c163f4f3312bea9bd3246a6bd67a8da594&limit=100
> 
> so down to 57 errors. There are a few themes:
> 
> * linux-yocto 3.14 gcc5 issues
> * meta-fsl-ppc and metafsl-arm gcc5 issues, particularly kernel
> * poky-lsb issues with the security flags and gcc5
> * x32 failed with a race of some kind in glibc, suspect transient
> * gcc-target has a packaging issue which fails builds (have patch)
> 
> The good news is that the various ppc issues are fixed including the rpm
> one from this series.

Latest run:

http://errors.yoctoproject.org/Errors/Search/?items=10&query=a2fbb1b6b6e564b3f9d40550c0b408978f420039&limit=100

with 37 errors. 

* linux-yocto 3.14 gcc5 issues
* meta-fsl-ppc and meta-fsl-arm gcc5 issues, particularly kernel
* poky-lsb issues with the security flags and gcc5 (elfutils, 
  coreutils, iptables, openssl on edgerouter)
* qemuarm doesn't boot
* u-boot with beaglebone

linux-yocto 3.14 is the next thing we need to clean up to have the most
impact, qemuarm not booting is the most worrying.

Cheers,

Richard




