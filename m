Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1S8aAY-0000xp-9y for openembedded-core@lists.openembedded.org;
	Fri, 16 Mar 2012 17:38:22 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q2GGTYsa005104
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Mar 2012 16:29:34 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 04815-02 for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Mar 2012 16:29:30 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q2GGTPi1005097
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Mar 2012 16:29:25 GMT
Message-ID: <1331915365.18586.203.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Fri, 16 Mar 2012 16:29:25 +0000
In-Reply-To: <4F635AE7.50602@windriver.com>
References: <1331905468.18586.182.camel@ted> <4F635AE7.50602@windriver.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH] directfb: Fix RPATH warnings
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
X-List-Received-Date: Fri, 16 Mar 2012 16:38:22 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2012-03-16 at 10:23 -0500, Mark Hatle wrote:
> On 3/16/12 8:44 AM, Richard Purdie wrote:
> > Fix configure not to remove variables which trigger the unneccessary rpaths to get
> > encoded. Also take the opportunity to clean up the patches directory.
> 
> ...
> 
> Was the dont-use-linux-config.patch not being used or something?  I'm a bit 
> confused as to why it was removed.  It appears from the contents that it is 
> still relevant for 8xx and 403GCX processors.  (Mind you, we don't actually 
> support either of these in oe-core currently.. the 403GCX is likely completely 
> dead, from a historical perspective, but I still see the occasionaly 8xx part.)

The patch was not being applied by the recipe and was unused.

Cheers,

Richard



