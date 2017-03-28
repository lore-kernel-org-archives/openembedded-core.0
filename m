Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 63ECF6069D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Mar 2017 07:53:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTP id v2S7ripw001999; 
	Tue, 28 Mar 2017 08:53:44 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 0beyXwnFPDVH; Tue, 28 Mar 2017 08:53:44 +0100 (BST)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v2S7reZV001992
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Tue, 28 Mar 2017 08:53:41 +0100
Message-ID: <1490687620.13980.273.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Ross Burton <ross.burton@intel.com>,
	openembedded-core@lists.openembedded.org
Date: Tue, 28 Mar 2017 08:53:40 +0100
In-Reply-To: <1490628365-5428-1-git-send-email-ross.burton@intel.com>
References: <1490628365-5428-1-git-send-email-ross.burton@intel.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.1 
Mime-Version: 1.0
Subject: Re: [PATCH 1/2] boost: build context and coroutine on ARM
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
X-List-Received-Date: Tue, 28 Mar 2017 07:53:48 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Mon, 2017-03-27 at 16:26 +0100, Ross Burton wrote:
> With the right flags to the build, the context library can be built
> on ARM.
> 
> [ YOCTO #11253 ]
> 
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>  meta/recipes-support/boost/boost.inc | 11 ++++++++---
>  1 file changed, 8 insertions(+), 3 deletions(-)

Sorry, but:

https://autobuilder.yocto.io/builders/nightly-arm/builds/270
https://autobuilder.yocto.io/builders/nightly-arm-lsb/builds/218

Cheers,

Richard

