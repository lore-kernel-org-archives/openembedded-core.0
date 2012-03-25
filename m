Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SBkZ7-0003hz-UD for openembedded-core@lists.openembedded.org;
	Sun, 25 Mar 2012 12:20:50 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q2PABnoY014894;
	Sun, 25 Mar 2012 11:11:49 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 12598-08; Sun, 25 Mar 2012 11:11:43 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q2PABd41014887
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Sun, 25 Mar 2012 11:11:40 +0100
Message-ID: <1332670298.28414.71.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Bruce Ashfield <bruce.ashfield@windriver.com>
Date: Sun, 25 Mar 2012 11:11:38 +0100
In-Reply-To: <cover.1332522200.git.bruce.ashfield@windriver.com>
References: <cover.1332522200.git.bruce.ashfield@windriver.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: openembedded-core@lists.openembedded.org, saul.wold@intel.com
Subject: Re: [PATCH 0/3] linux-libc-headers: 3.2 and linux-libc-headers-yocto movement
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
X-List-Received-Date: Sun, 25 Mar 2012 10:20:50 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2012-03-23 at 13:07 -0400, Bruce Ashfield wrote:
> Richard/Saul,
> 
> As discussed on the mailing list here is a libc-headers series. I've kept it in
> three parts so you can pick what you want (except for the minor detail of 
> needing to split patch 1/1 to keep 3.1 around if you don't want 2/3).
> 
> I've built and booted this on all the emulated targets, and have some other
> builds running against larger numbers of packages as well.
> 
> Cheers,
> 
> Bruce
> 
> The following changes since commit bb1d7fad7ff8515939f2b5f0b540b9b09604be3c:
>   Richard Purdie (1):
>         Revert "bitbake.conf/sstate.bbclass: Change PATH when installing sstate files to avoid issues"
> 
> are available in the git repository at:
> 
>   git://git.pokylinux.org/poky-contrib zedd/libc-headers-oe
>   http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=zedd/libc-headers-oe
> 
> Bruce Ashfield (3):
>   linux-libc-headers: add 3.2 headers and remove 3.1
>   linux-libc-headers: set default LINUXLIBCVERSION to 3.2
>   linux-libc-headers-yocto: remove from oe-core

Merged to master (along with the iptables fix), thanks.

Richard



