Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1TJMeA-00058N-HD
	for openembedded-core@lists.openembedded.org;
	Wed, 03 Oct 2012 12:57:46 +0200
Received: from elite.brightsigndigital.co.uk ([81.142.160.137]
	helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>)
	id 1TJMRd-0004rM-73; Wed, 03 Oct 2012 12:44:49 +0200
From: Phil Blundell <philb@gnu.org>
To: Martin Jansa <martin.jansa@gmail.com>
Date: Wed, 03 Oct 2012 11:44:48 +0100
In-Reply-To: <20121003103141.GA21043@jama.jama.net>
References: <1349259854.32611.106.camel@phil-desktop>
	<20121003103141.GA21043@jama.jama.net>
X-Mailer: Evolution 3.0.2- 
Message-ID: <1349261089.32611.115.camel@phil-desktop>
Mime-Version: 1.0
Cc: oe-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] insane: detect and warn about relocations in .text
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 03 Oct 2012 10:57:46 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2012-10-03 at 12:31 +0200, Martin Jansa wrote:
> On Wed, Oct 03, 2012 at 11:24:12AM +0100, Phil Blundell wrote:
> > Signed-off-by: Phil Blundell <pb@pbcl.net>
> 
> Can you add a bit longer description of possible issues with relocations
> in .text? So that people seeing this issue will know how dangerous it is
> for them?
> 
> From my understanding (after reading
> http://www.gentoo.org/proj/en/hardened/pic-fix-guide.xml) it's mostly
> performance issue?

Yes, that's correct.  It basically falls into the same sort of category
as useless-rpaths; the binary will still work, but there will be some
adverse impact on performance and memory usage.  

Historically, the most common cause of DT_TEXTREL was accidentally
linking non-PIC code into a DSO.  Recent versions of the linker will
flatly refuse to do this on at least some architectures, though, so
hopefully this problem will just go away over time.

p.




