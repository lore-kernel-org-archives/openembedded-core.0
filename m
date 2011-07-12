Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1Qgdbl-00008K-JO for openembedded-core@lists.openembedded.org;
	Tue, 12 Jul 2011 16:06:41 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p6CE2Whs020905;
	Tue, 12 Jul 2011 15:02:32 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 20598-06; Tue, 12 Jul 2011 15:02:28 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p6CE2Nfv020899
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Tue, 12 Jul 2011 15:02:23 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: celston@katalix.com, Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <1310386455.10512.185.camel@desktop.home>
References: <1309432228.7987.14.camel@desktop.home>
	<4E0D0333.8080706@linux.intel.com>	<1309511209.7987.42.camel@desktop.home>
	<1309512008.2633.14.camel@phil-desktop>
	<4E14E0C7.6040604@linux.intel.com>
	<1310374426.10512.3.camel@desktop.home>
	<1310374822.6337.150.camel@phil-desktop>
	<1310386455.10512.185.camel@desktop.home>
Date: Tue, 12 Jul 2011 15:02:22 +0100
Message-ID: <1310479342.20015.1055.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH] Add support for BAD_RECOMMENDATIONS to rootfs_ipk
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
X-List-Received-Date: Tue, 12 Jul 2011 14:06:41 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2011-07-11 at 13:14 +0100, Chris Elston wrote:
> As discussed on IRC on 30/06/11, this patch adds support for
> BAD_RECOMMENDATIONS to rootfs_ipk, which is a list of packages NOT to
> install if suggested or recommended by a recipe.  Taken from
> http://thread.gmane.org/gmane.comp.handhelds.openembedded/30417.  
> 
> Note that current support for this in oe.dev may also be broken,
> depending on the version of opkg in use.
> 
> Signed-off-by: Chris Elston <celston@katalix.com>

Merged to master, thanks.

Richard



