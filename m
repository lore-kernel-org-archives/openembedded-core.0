Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1TgBWK-0004mJ-0j for openembedded-core@lists.openembedded.org;
	Wed, 05 Dec 2012 10:44:01 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id qB59TZ7O015669;
	Wed, 5 Dec 2012 09:29:35 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 15595-01; Wed,  5 Dec 2012 09:29:31 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id qB59TSvr015662
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO);
	Wed, 5 Dec 2012 09:29:29 GMT
Message-ID: <1354699758.25268.86.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Yi Qingliang <niqingliang2003@gmail.com>
Date: Wed, 05 Dec 2012 09:29:18 +0000
In-Reply-To: <1370507.95j740KEpU@yiqingliang-pc>
References: <1370507.95j740KEpU@yiqingliang-pc>
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: openembedded-core@lists.openembedded.org
Subject: Re: why recompile gcc-cross/eglibc when update linux package?
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
X-List-Received-Date: Wed, 05 Dec 2012 09:44:01 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2012-12-05 at 10:16 +0000, Yi Qingliang wrote:
> I update the kernel from 3.6.6 to 3.6.9, and recompile it: bitbake linux
> 
> but it will recompile eglibc/gcc-cross first, so long time:( why?
> the eglibc will use kernel header? if so, understand.
> but what about gcc-cross?

Did you change linux-libc-headers or the kernel itself?

If you change the libc-headers, gcc-cross will rebuild since it depends
on eglibc and as you mention, eglibc depends on the headers.

Changing the target kernel recipe shouldn't rebuild any of those.

Cheers,

Richard



