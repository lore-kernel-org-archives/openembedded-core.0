Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id AEF3865D53;
	Wed, 20 Aug 2014 10:21:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	s7KALqP8016259; Wed, 20 Aug 2014 11:21:52 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id q3Nl95Z7A9xV; Wed, 20 Aug 2014 11:21:52 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	s7KALjmc016247
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Wed, 20 Aug 2014 11:21:47 +0100
Message-ID: <1408530106.1669.76.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Hongxu Jia <hongxu.jia@windriver.com>
Date: Wed, 20 Aug 2014 11:21:46 +0100
In-Reply-To: <53F45EA1.6000900@windriver.com>
References: <20140815172255.043D8505EB@opal.openembedded.org>
	<53F45EA1.6000900@windriver.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org,
	openembedded-commits@lists.openembedded.org
Subject: Re: [oe-commits] Peter A. Bigot : gcc: update compiler architecture to match gcc-runtime ( armv6, armv7a)
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
X-List-Received-Date: Wed, 20 Aug 2014 10:21:55 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2014-08-20 at 16:38 +0800, Hongxu Jia wrote:
> Hi Peter,
> 
> The commit caused building gcc-crosssdk-initial-x86_64 failed.
> ...
> Unknown CPU given in --with-arch=armv7-a.
> ...
> 
> While crosssdk, TARGET_ARCH = "${SDK_ARCH}" (set in crosssdk.bbclass)
> so the values of '--target=x86_64-wrlinuxsdk-linux --with-arch=armv7-a'
> triggered the above failure.
> 
> How about override for the 'target/cross' and not for 'crosssdk' ?

This was fixed with:

http://git.yoctoproject.org/cgit.cgi/poky/commit/?id=7095d8da4b3e1a6bc475f1cb5e6d7fedb2a76901

Cheers,

Richard


