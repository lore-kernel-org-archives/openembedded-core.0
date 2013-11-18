Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 7E62C6D433
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Nov 2013 12:31:28 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	rAICVNNU030052; Mon, 18 Nov 2013 12:31:23 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 0c3bllQm6Bp1; Mon, 18 Nov 2013 12:31:23 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	rAICVIC0030049
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Mon, 18 Nov 2013 12:31:20 GMT
Message-ID: <1384777875.6460.228.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Martin Jansa <martin.jansa@gmail.com>
Date: Mon, 18 Nov 2013 12:31:15 +0000
In-Reply-To: <1384696338-5390-1-git-send-email-Martin.Jansa@gmail.com>
References: <1383307932-4041-1-git-send-email-Martin.Jansa@gmail.com>
	<1384696338-5390-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: Evolution 3.6.4-0ubuntu1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/7] allarch: Always inhibit default dependencies and set empty TARGET_PREFIX
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
X-List-Received-Date: Mon, 18 Nov 2013 12:31:30 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sun, 2013-11-17 at 14:52 +0100, Martin Jansa wrote:
> * typical case where we inherit allarch and override PACKAGE_ARCH
>   are packagegroup recipes, but those need default dependencies
>   inhibited even when they are MACHINE_ARCH or TUNE_PKGARCH.
>   I don't know about any recipe which inherits allarch and needs
>   default dependencies.

The code there was added to allow the allarch class to be enabled or
disabled. I don't remember exactly why we needed to do that however it
was added for a reason and making part of it unconditional again will
probably break whyever we made it optional :(.

I can understand how you came to this conclusion though. Which cases is
this causing problems for?

> * set empty TARGET_PREFIX
>   This has a bit weird reason caused by unsupported setup where
>   external-toolchain is used in some DISTRO only for some MACHINEs
>   and internal is used for other MACHINEs.
>   Because external-toolchain usually comes with different TARGET_PREFIX
>   it was causing allarch recipes to have different signatures even
>   when they don't use toolchain at all.
>   Empty TARGET_PREFIX also helps to find allarch recipes which still
>   have default dependency on e.g. virtual/${TARGET_PREFIX}gcc.

This seems ok, I'd have taken it if it was a separate patch.

Cheers,

Richard


