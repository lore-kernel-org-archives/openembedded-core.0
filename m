Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1ShgaF-0001jI-Oz for openembedded-core@lists.openembedded.org;
	Thu, 21 Jun 2012 14:33:59 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q5LCNEYj022153
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Jun 2012 13:23:14 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 21414-08 for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Jun 2012 13:23:10 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q5LCN6ix022147
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Jun 2012 13:23:07 +0100
Message-ID: <1340281389.1640.98.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Thu, 21 Jun 2012 13:23:09 +0100
In-Reply-To: <cover.1340191527.git.ross.burton@intel.com>
References: <cover.1340191527.git.ross.burton@intel.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 0/6] ConnMan 1.0 upgrade
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
X-List-Received-Date: Thu, 21 Jun 2012 12:34:00 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2012-06-20 at 12:26 +0100, Ross Burton wrote:
> Same as before, but I signed it all off this time.
> 
> The following changes since commit e0a70547069fe7e8a2d6bdaffc985fb172d46c31:
> 
>   perl: Allow perl to cross build and native build in a directory named "t" (2012-06-18 17:33:04 +0100)
> 
> are available in the git repository at:
>   git://git.yoctoproject.org/poky-contrib ross/connman
>   http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=ross/connman
> 
> Ross Burton (6):
>   connman: rationalise configure options
>   connman: add compat RPROVIDES for older packaging
>   connman: upgrade to 1.0
>   connman-gnome: fix build depends (Yocto #2556)
>   connman-gnome: clean up runtime dependencies
>   connman-gnome: upgrade to 0.7, which works with connman 1.0

Merged to master, thanks.

Richard



