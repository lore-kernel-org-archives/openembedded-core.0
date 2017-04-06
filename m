Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id A908A77C17
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Apr 2017 11:55:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTP id v36Btl73006246; 
	Thu, 6 Apr 2017 12:55:50 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id zAkUBHM1GYft; Thu,  6 Apr 2017 12:55:50 +0100 (BST)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	v36Bce1G003515
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Thu, 6 Apr 2017 12:38:41 +0100
Message-ID: <1491478720.17200.35.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Romain Perier <romain.perier@collabora.com>, liezhi.yang@windriver.com
Date: Thu, 06 Apr 2017 12:38:40 +0100
In-Reply-To: <20170405150521.19160-2-romain.perier@collabora.com>
References: <20170405150521.19160-1-romain.perier@collabora.com>
	<20170405150521.19160-2-romain.perier@collabora.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.1 
Mime-Version: 1.0
Cc: yocto@yoctoproject.org, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/2] logrotate: Bump to 3.11.0
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
X-List-Received-Date: Thu, 06 Apr 2017 11:55:52 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Wed, 2017-04-05 at 17:05 +0200, Romain Perier wrote:
> This commit updates the recipe to the last upstream tag. Then, as the
> tarball no longer contains the pre-generated Makefile, inherit from
> autotools
> 
> [...]

> -PACKAGECONFIG ?= "${@bb.utils.filter('DISTRO_FEATURES', 'acl
> selinux', d)}"
> +PACKAGECONFIG ?= "\
> +    ${@bb.utils.contains('DISTRO_FEATURES', 'acl', 'acl', '', d)} \
> +    ${@bb.utils.contains('DISTRO_FEATURES', 'selinux', 'selinux',
> '', d)} \
> +"

I'm not sure the above should be there, it reverts someone else's
change?

I am a little nervous of taking this at this point in the release
too...

Cheers,

Richard

