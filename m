Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RRPZp-0002rF-La for openembedded-core@lists.openembedded.org;
	Fri, 18 Nov 2011 15:38:12 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pAIEVWeL030745
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Nov 2011 14:31:33 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 30490-06 for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Nov 2011 14:31:27 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pAIEVQHS030739
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Nov 2011 14:31:26 GMT
Message-ID: <1321626691.15352.20.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Fri, 18 Nov 2011 14:31:31 +0000
In-Reply-To: <cover.1321470758.git.nitin.a.kamble@intel.com>
References: <cover.1321470758.git.nitin.a.kamble@intel.com>
X-Mailer: Evolution 3.2.1- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 0/8] Recipe upgrades and an x32 fix
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
X-List-Received-Date: Fri, 18 Nov 2011 14:38:12 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2011-11-16 at 11:14 -0800, nitin.a.kamble@intel.com wrote:
> From: Nitin A Kamble <nitin.a.kamble@intel.com>
> 
> The following changes since commit 217a90f2ab02ec3c4e9653b528d7b584f6e37a42:
> 
>   sanity.bbclass: No need to check for cvs any more (2011-11-16 17:32:46 +0000)
> 
> are available in the git repository at:
>   git://git.pokylinux.org/poky-contrib nitin/work
>   http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=nitin/work
> 
> Nitin A Kamble (8):
>   libpcre: upgrade from 8.12 to 8.20
>   mpfr: upgrade from 3.0.1 to 3.1.0
>   btrfs-tools: update to the latest git commit
>   libtool: upgrade from 2.4 to 2.4.2
>   tcl: upgrade from 8.5.10 to 8.5.11
>   python-gst: upgrade from 0.10.21 to 0.10.22
>   update distro tracking recipe information
>   insane.bbclass: avoid errors for x32 kernel

I merged these to master with the exception of the libtool one. We need
to come up with a definitive set of changes as you, Khem and I all have
libtool patches pending.

Cheers,

Richard



