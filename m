Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1T2Jat-0000UL-8g
	for openembedded-core@lists.openembedded.org;
	Fri, 17 Aug 2012 12:15:55 +0200
Received: from elite.brightsigndigital.co.uk ([81.142.160.137]
	helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1T2JPK-0007O4-GW
	for openembedded-core@lists.openembedded.org;
	Fri, 17 Aug 2012 12:03:58 +0200
From: Phil Blundell <philb@gnu.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Fri, 17 Aug 2012 11:03:57 +0100
In-Reply-To: <1566766.76zJMGCy1b@helios>
References: <1345049073-27898-1-git-send-email-paul.eggleton@linux.intel.com>
	<1566766.76zJMGCy1b@helios>
X-Mailer: Evolution 3.0.2- 
Message-ID: <1345197838.23275.483.camel@phil-desktop>
Mime-Version: 1.0
Subject: Re: [PATCH] classes/chrpath: trigger an error if chrpath fails
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
X-List-Received-Date: Fri, 17 Aug 2012 10:15:55 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2012-08-16 at 18:13 +0100, Paul Eggleton wrote:
> Incidentally a couple of users are reporting that they are now seeing failures 
> where the rpath size is reported to be too small to contain the path we are 
> applying. I haven't seen this myself - is there some way we can increase the 
> space allowed for storing the path or is there some other issue at work here? 
> I tried to search for some information on how storage of the rpath works but 
> did not really find anything conclusive.

There's no reason chrpath couldn't be made to allocate more space for
the new rpath, it's just that the current implementation doesn't know
how to do that.  I don't think it would be especially hard to fix.

p.




