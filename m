Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SuOJm-0000Ly-1B for openembedded-core@lists.openembedded.org;
	Thu, 26 Jul 2012 15:41:30 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q6QDTxoa021575
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Jul 2012 14:29:59 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 21192-04 for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Jul 2012 14:29:55 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q6QDTmnV021569
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Jul 2012 14:29:50 +0100
Message-ID: <1343309388.29991.31.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Thu, 26 Jul 2012 14:29:48 +0100
In-Reply-To: <alpine.DEB.2.02.1207260717280.8530@oneiric>
References: <alpine.DEB.2.02.1207260717280.8530@oneiric>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: proper way to report fetch failure?
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
X-List-Received-Date: Thu, 26 Jul 2012 13:41:30 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2012-07-26 at 07:20 -0400, Robert P. J. Day wrote:
> to stock up on tarballs, i just ran:
> 
>   $ bitbake -c fetchall world
> 
> and got:
> 
> NOTE: package kbd-1.15.2-r3: task do_fetch: Started
> WARNING: Failed to fetch URL
> http://kernel.org/pub/linux/utils/kbd/kbd-1.15.2.tar.bz2, attempting
> MIRRORS if available
> ...
> 
> and, sure enough, that current tarball is not at that location:
> 
> http://kernel.org/pub/linux/utils/kbd/
> 
> is there a proper way to report this?

Using the bugzilla?

Cheers,

Richard



