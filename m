Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1UPWMY-0004a3-O1 for openembedded-core@lists.openembedded.org;
	Tue, 09 Apr 2013 13:05:29 +0200
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r39Ax46d004029; Tue, 9 Apr 2013 11:59:04 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id OZi0-oNXmM2v; Tue,  9 Apr 2013 11:59:04 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r39Awv1Y004020
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Tue, 9 Apr 2013 11:59:00 +0100
Message-ID: <1365504465.12407.71.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: David Hirst <hirst689@gmail.com>
Date: Tue, 09 Apr 2013 11:47:45 +0100
In-Reply-To: <CAHu+ux0pWKar5pRvsdqkPXq2E2A4+oBRmMqO8W7=h-iX2iKh9w@mail.gmail.com>
References: <CAHu+ux0pWKar5pRvsdqkPXq2E2A4+oBRmMqO8W7=h-iX2iKh9w@mail.gmail.com>
X-Mailer: Evolution 3.6.2-0ubuntu0.1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: Achiving My OE environment
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
X-List-Received-Date: Tue, 09 Apr 2013 11:05:32 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2013-04-09 at 06:16 -0400, David Hirst wrote:
> I am trying to achive (svn or tar ball) my whole oe_layersetup
> directory structure.
> However I seem to have problems when I check it out or untar it on a
> different machine.
> It does not seems to build correctly. I set up the paths to the build
> tools and use /conf/setenv
> to set up other paths.
> It seems impossible to build everything correctly without going
> through a comlete installation of the oe-layersetup form the git clone
> and setup script. Does anyone have experiance with this? and have some
> advice?

You need to ensure that:

a) The machine you extract this archive onto has the same distro and
installed package as the one you originally built upon
b) That you extract it to the same path

I would note that:

a) If you don't use the same distro, files can move around, library
versions change and so on. It may work or it may not. We support fresh
builds in this configuration and installs via sstate and some kind of
compatibility matrix but not direct copying.
b) We support relocation of the system using sstate, not by copying.

Cheers,

Richard






