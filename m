Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QSSx5-0006QE-EJ for openembedded-core@lists.openembedded.org;
	Fri, 03 Jun 2011 13:54:07 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p53BotLf004483
	for <openembedded-core@lists.openembedded.org>;
	Fri, 3 Jun 2011 12:50:55 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 04140-06 for <openembedded-core@lists.openembedded.org>;
	Fri,  3 Jun 2011 12:50:51 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p53Bojqm004477
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 3 Jun 2011 12:50:49 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <1307100750.2529.257.camel@phil-desktop>
References: <cover.1307083232.git.kai.kang@windriver.com>
	<1307100750.2529.257.camel@phil-desktop>
Date: Fri, 03 Jun 2011 12:50:23 +0100
Message-ID: <1307101823.5715.25.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 0/1] eglibc: enable eglibc configurability V2
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
X-List-Received-Date: Fri, 03 Jun 2011 11:54:07 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2011-06-03 at 12:32 +0100, Phil Blundell wrote:
> On Fri, 2011-06-03 at 14:47 +0800, Kang Kai wrote:
> > If want to disable locale-code charsets or locales, you have to uncomment
> > PACKAGE_NO_GCONV = 1
> > Because without this, it fails on package_do_split_gconvs in libc-package.bbclass
> 
> Can we not just fix libc-package.bbclass to stop it failing in that
> situation?  It seems a bit sad to require an extra "flip this switch to
> make it work" kind of variable.

That was my point in the earlier email :)

Cheers,

Richard



