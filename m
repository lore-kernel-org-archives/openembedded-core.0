Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1UORoP-00036J-Sx for openembedded-core@lists.openembedded.org;
	Sat, 06 Apr 2013 14:01:38 +0200
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r36BtALA023407; Sat, 6 Apr 2013 12:55:10 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 1je-8rNptX42; Sat,  6 Apr 2013 12:55:10 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r36Bt52m023400
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Sat, 6 Apr 2013 12:55:08 +0100
Message-ID: <1365248649.6526.202.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Martin Jansa <martin.jansa@gmail.com>
Date: Sat, 06 Apr 2013 12:44:09 +0100
In-Reply-To: <CA+chaQfjyRzcCewTaro50-0aSFxNts51m9jUcZPZrdfm-gDHUw@mail.gmail.com>
References: <1365181591-6728-1-git-send-email-ross.burton@intel.com>
	<5BDCDCEF-35EC-4641-962B-DFBAE1570201@dominion.thruhere.net>
	<CA+chaQfjyRzcCewTaro50-0aSFxNts51m9jUcZPZrdfm-gDHUw@mail.gmail.com>
X-Mailer: Evolution 3.6.2-0ubuntu0.1 
Mime-Version: 1.0
Cc: Koen Kooi <koen@dominion.thruhere.net>, Patches,
	the oe-core layer <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] linux-firmware: make the main package depend on all sub-packages
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
X-List-Received-Date: Sat, 06 Apr 2013 12:01:43 -0000
X-List-Received-Date: Sat, 06 Apr 2013 12:01:43 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sat, 2013-04-06 at 12:36 +0200, Martin Jansa wrote:
> And also staging firmware files just once to resolve
>
> > WARNING: The recipe linux-firmware is trying to install files into a
> shared area when those files already exist. Those files are:
>
> when building linux-firmware after kernel was built and vice-versa.

What is the point in staging firmware files at all? There is probably a
small space/performance gain to be had there...

Cheers,

Richard




