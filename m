Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 0003D60FC6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 May 2013 21:42:09 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r4TLjstj024734; Wed, 29 May 2013 22:45:59 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id EPRgBziK5Zko; Wed, 29 May 2013 22:45:54 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r4TLioLs024686
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Wed, 29 May 2013 22:44:52 +0100
Message-ID: <1369863624.14887.247.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Date: Wed, 29 May 2013 22:40:24 +0100
In-Reply-To: <cover.1369839249.git.pkj@axis.com>
References: <cover.1369839249.git.pkj@axis.com>
X-Mailer: Evolution 3.6.4-0ubuntu1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/4] Fixes for makedevs
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
X-List-Received-Date: Wed, 29 May 2013 21:42:10 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2013-05-29 at 16:55 +0200, Peter Kjellerstedt wrote:
> When I wanted to create devices from a package I stumbled upon a couple
> of problems with the makedevs program. Most notable was that it failed
> to set the correct uid/gid for devices created as part of a block (i.e.,
> with a count > 0).
> 
> The following changes since commit efb8a460d2a977dbd481a0650fba8eb637c65bec:
> 
>   package.bbclass: Fix sources contents (2013-05-14 08:52:47 +0300)
> 
> are available in the git repository at:
> 
>   git://git.yoctoproject.org/poky-contrib pkj/makedevs
>   http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=pkj/makedevs
> 
> Peter Kjellerstedt (4):
>   makedevs: Create blocks of devices with the correct uid/gid
>   makedevs: Correct the device number calculation for blocks of devices
>   makedevs: Make the mode number readable in debug messages
>   makedevs: Avoid unnecessary timestamp calculation

These look good to me but could you push a branch with signed-off-by
lines in the commits please?

Cheers,

Richard


