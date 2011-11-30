Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RVmM1-0000KB-9f for openembedded-core@lists.openembedded.org;
	Wed, 30 Nov 2011 16:45:49 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pAUFd91C001130
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Nov 2011 15:39:09 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 00935-02 for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Nov 2011 15:39:04 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pAUFd1OM001124
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Nov 2011 15:39:01 GMT
Message-ID: <1322667550.17484.0.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Wed, 30 Nov 2011 15:39:10 +0000
In-Reply-To: <cover.1322549636.git.Martin.Jansa@gmail.com>
References: <cover.1322549636.git.Martin.Jansa@gmail.com>
X-Mailer: Evolution 3.2.1- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [oe-core 00/10] Small fixes
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
X-List-Received-Date: Wed, 30 Nov 2011 15:45:49 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2011-11-29 at 07:55 +0100, Martin Jansa wrote:
> The following changes since commit 2864ff6a4b3c3f9b3bbb6d2597243cc5d3715939:
> 
>   getVar/setVar cleanups (2011-11-26 22:42:00 +0000)
> 
> are available in the git repository at:
>   git://git.openembedded.org/openembedded-core-contrib jansa/pull2
>   http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=jansa/pull2
> 
> Denis 'GNUtoo' Carikli (1):
>   libical: add version 0.47
> 
> Martin Jansa (9):
>   tinylogin: use u-a for getty so we can provide /sbin/getty from
>     util-linux-agetty too
>   util-linux: use u-a to provide /sbin/getty from util-linux-agetty
>   mingetty: use u-a to provide /sbin/getty (also provided by
>     util-linux-agetty and tinylogin)
>   cronie: use useradd.bbclass instead of hardcoded groupadd calls
>   ppp-dialin: use useradd.bbclass instead of hardcoded adduser/deluser
>     calls
>   libical: drop older version 0.46
>   libid3tag: add gperf to DEPENDS
>   gst-plugins-ugly: bump PR to rebuild after libid3tag fix
>   gconf: add polkit to DEPENDS

I took these with the exception of the gconf change which I know there
is an updated patch for.

Cheers,

Richard



