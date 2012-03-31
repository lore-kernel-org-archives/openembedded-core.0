Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SE1rV-0000ZG-VX for openembedded-core@lists.openembedded.org;
	Sat, 31 Mar 2012 19:13:14 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q2VH48ng025096
	for <openembedded-core@lists.openembedded.org>;
	Sat, 31 Mar 2012 18:04:08 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 25076-01 for <openembedded-core@lists.openembedded.org>;
	Sat, 31 Mar 2012 18:04:02 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q2VH40Kd025090
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Sat, 31 Mar 2012 18:04:01 +0100
Message-ID: <1333213440.18082.252.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Sat, 31 Mar 2012 18:04:00 +0100
In-Reply-To: <cover.1333176251.git.lianhao.lu@intel.com>
References: <cover.1333176251.git.lianhao.lu@intel.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 0/5] Misc fixings of nativesdk
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 31 Mar 2012 17:13:14 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sat, 2012-03-31 at 14:49 +0800, Lianhao Lu wrote:
> This patch serie fixed bunch of things for nativesdk recipes, including:
> 
> 1. Fixed the issue of reading in incorrect pkgdata files of do_package_write_xxx.
> 2. Avoided crosssdk tasks generating different task hashs for different MACHINE.
> 3. Dropped unnecessary target tasks for nativesdk.
> 
> The following changes since commit 627998726ca3ee2ed2510c0f666747f688d06c56:
>   Steffen Sledz (1):
>         docbook-utils-native: fix syntax problem in jw.in
> 
> are available in the git repository at:
> 
>   git://git.yoctoproject.org/poky-contrib llu/nativesdkfixing
>   http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=llu/nativesdkfixing
> 
> Lianhao Lu (5):
>   nativesdk.bbclass: Set PACKAGE_ARCHS to SDK_PACKAGE_ARCHS.
>   crosssdk.bbclass: Set TUNE_PKGARCH to SDK_PKGARCH.
>   autotools.bbclass: Drop -nativesdk dependency to lib-cross.
>   eglibc-nativesdk: Set GCC_ADDONS.
>   pkgconfig.bbclass: corrected dependency for -nativesdk.

I merged these apart from the eglibc patch which needs some small tweaks
before it goes in.

Cheers,

Richard



