Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1U2LFi-00033K-I0 for openembedded-core@lists.openembedded.org;
	Mon, 04 Feb 2013 13:34:27 +0100
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r14CNibM000537; Mon, 4 Feb 2013 12:23:45 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id ZD3A7YUm+3A8; Mon,  4 Feb 2013 12:23:43 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r14CNde1000517
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Mon, 4 Feb 2013 12:23:41 GMT
Message-ID: <1359980304.14071.154.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Martin Jansa <martin.jansa@gmail.com>
Date: Mon, 04 Feb 2013 12:18:24 +0000
In-Reply-To: <1359971830-17441-1-git-send-email-Martin.Jansa@gmail.com>
References: <1359971830-17441-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: Evolution 3.6.2-0ubuntu0.1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] qemu.inc: depend on qemu-native only with runqemu DISTRO_FEATURE
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 04 Feb 2013 12:34:28 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2013-02-04 at 10:57 +0100, Martin Jansa wrote:
> * qemu images are usefull even without qemu installed on build machine.
>   Some people are building on one machine, but then downloading images
>   somewhere else to test them.
> * use new "runqemu" DISTRO_FEATURE and BACKFILL it so the behavior stays
>   the same, unless disabled by DISTRO_FEATURES_BACKFILL_CONSIDERED

Using DISTRO_FEATURES for this is nasty since if you change this item,
the sstate cache is invalidated. Its really a build configuration level
thing, not a distro feature...

So whilst I appreciate the reasoning for it, I don't think its the right
approach and we'll need to find another one.

Cheers,

Richard



