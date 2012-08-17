Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1T2LUn-0003ZH-EJ for openembedded-core@lists.openembedded.org;
	Fri, 17 Aug 2012 14:17:46 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q7HC5kgv008468
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Aug 2012 13:05:46 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 07637-05 for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Aug 2012 13:05:42 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q7HC5ebA008462
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Aug 2012 13:05:41 +0100
Message-ID: <1345205139.26132.22.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Fri, 17 Aug 2012 13:05:39 +0100
In-Reply-To: <cover.1345203203.git.ross.burton@intel.com>
References: <cover.1345203203.git.ross.burton@intel.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 0/2] Remove older GTK+ versions
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
X-List-Received-Date: Fri, 17 Aug 2012 12:17:46 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2012-08-17 at 12:35 +0100, Ross Burton wrote:
> Remove the very old versions of GTK+ 2.x that we don't build.  They were
> kept for their patches, but the patches don't apply anymore because the
> relevant code has changed dramatically.
> 
> If someone still wants to use them, meta-oe is a better place for them to
> live.
> 
> Ross
> 
> The following changes since commit af847d36375aa53f0c1ee2a00c97ba9f38837d1b:
> 
>   bitbake: bitbake: build.py: Add stampdir argument to cached_mtime_noerror (2012-08-16 12:27:41 +0100)
> 
> are available in the git repository at:
> 
>   git://git.yoctoproject.org/poky-contrib ross/gtk2
> 
> for you to fetch changes up to f6cf7bda28c1ae5f9033863f70657e1970b6bdc9:
> 
>   gtk+ remove 2.16.6 (2012-08-17 12:29:59 +0100)
> 
> ----------------------------------------------------------------
> Ross Burton (2):
>       gtk+: remove 2.12.7
>       gtk+ remove 2.16.6

Merged to master, thanks.

Richard



