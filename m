Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QU349-0002Hx-Lx for openembedded-core@lists.openembedded.org;
	Tue, 07 Jun 2011 22:39:57 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p57KabLI023309
	for <openembedded-core@lists.openembedded.org>;
	Tue, 7 Jun 2011 21:36:37 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 23121-05 for <openembedded-core@lists.openembedded.org>;
	Tue,  7 Jun 2011 21:36:33 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p57KaViQ023302
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 7 Jun 2011 21:36:31 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <1307439362.2529.4741.camel@phil-desktop>
References: <1307102133.2529.260.camel@phil-desktop>
	<1307439362.2529.4741.camel@phil-desktop>
Date: Tue, 07 Jun 2011 21:36:27 +0100
Message-ID: <1307478987.15712.60.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH] uclibc: remove PACKAGE_ARCH, fix compilation on i586
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
X-List-Received-Date: Tue, 07 Jun 2011 20:39:57 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2011-06-07 at 10:36 +0100, Phil Blundell wrote:
> Ping?

I'm not against this move at all but before this patch merges we should
really have a cleanup which removes the *.machine configuration files
from the uclibc recipe directory along with all the machine specific
overrides that are in use instead making them arch specific.

Any volunteers?

Cheers,

Richard


> p.
> 
> On Fri, 2011-06-03 at 12:55 +0100, Phil Blundell wrote:
> > There is no good reason for uclibc to be machine specific.  Remove local
> > assignment to PACKAGE_ARCH so that it gets the default target
> > architecture and bump PR for that change.
> > 
> > See http://lists.linuxtogo.org/pipermail/openembedded-core/2011-May/003064.html
> > 
> > Also replace a chunk of anonymous python with a COMPATIBLE_HOST
> > declaration.
> > 
> > Signed-off-by: Phil Blundell <philb@gnu.org>
> 
> 
> 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core




