Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RtLdY-0004XR-HB for openembedded-core@lists.openembedded.org;
	Fri, 03 Feb 2012 17:05:20 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q13FvOGu021881
	for <openembedded-core@lists.openembedded.org>;
	Fri, 3 Feb 2012 15:57:24 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 21673-02 for <openembedded-core@lists.openembedded.org>;
	Fri,  3 Feb 2012 15:57:20 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q13FvILu021875
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 3 Feb 2012 15:57:19 GMT
Message-ID: <1328284640.3895.118.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Fri, 03 Feb 2012 15:57:20 +0000
In-Reply-To: <cover.1328139407.git.nitin.a.kamble@intel.com>
References: <cover.1328139407.git.nitin.a.kamble@intel.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [patch-v2 0/7] Various recipe upgrades
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
X-List-Received-Date: Fri, 03 Feb 2012 16:05:21 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2012-02-01 at 15:40 -0800, nitin.a.kamble@intel.com wrote:
> From: Nitin A Kamble <nitin.a.kamble@intel.com>
> 
> Just upgrades. And some cleanups as per comments on v1 pull request.
> 
> Nitin
> 
> The following changes since commit 8d4d9a15c4947e55ed217c6035e76fcff724e544:
> 
>   package bbclass: allow per package PRIVATE_LIBS (2012-02-01 15:15:15 +0000)
> 
> are available in the git repository at:
>   git://git.pokylinux.org/poky-contrib nitin/upgrades
>   http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=nitin/upgrades
> 
> Nitin A Kamble (7):
>   byacc: upggrade from 20111219 to 20120115
>   gmp: upgrade from 5.0.2 to 5.0.3
>   gdb: upgrade from 7.3.1 to 7.4
>   quilt: upgrade from 0.50 to 0.51
>   python-dbus: upgrade from 0.84.0 to 1.0.0
>   bdwgc: change the PV
>   distro_tracking: update for current upgrades

Merged to master, thanks (with the exception of bdwgc which was dropped)

Cheers,

Richard



