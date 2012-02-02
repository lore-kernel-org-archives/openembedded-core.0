Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1Rt1Yz-0003rw-Qy for openembedded-core@lists.openembedded.org;
	Thu, 02 Feb 2012 19:39:18 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q12IVJOp010659;
	Thu, 2 Feb 2012 18:31:19 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 10190-04; Thu,  2 Feb 2012 18:31:15 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q12IVAK0010652
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Thu, 2 Feb 2012 18:31:11 GMT
Message-ID: <1328207476.3895.11.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Thu, 02 Feb 2012 18:31:16 +0000
In-Reply-To: <1328081524-29957-1-git-send-email-koen@dominion.thruhere.net>
References: <1328081524-29957-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: Koen Kooi <koen@dominion.thruhere.net>, Peter Tworek <tworaz666@gmail.com>
Subject: Re: [PATCH] gconf.bbclass: Add proper RDEPENDS to packages with gconf postinststep.
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
X-List-Received-Date: Thu, 02 Feb 2012 18:39:19 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2012-02-01 at 08:32 +0100, Koen Kooi wrote:
> From: Peter Tworek <tworaz666@gmail.com>
> 
> Right now gconf bbclass adds both postinst and prerm steps, but it does
> not ensure that packages involved have gconf in RDEPENDS. This can lead
> to a situation where postinst/prerm steps fail because gconftool-2 is
> not installed.
> 
> Signed-off-by: Peter Tworek <tworaz666@gmail.com>
> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
> ---
>  meta/classes/gconf.bbclass |    3 +++
>  1 files changed, 3 insertions(+), 0 deletions(-)

Merged to master, thanks.

Richard



