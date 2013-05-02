Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1UXrVx-0001a7-9M for openembedded-core@lists.openembedded.org;
	Thu, 02 May 2013 13:17:29 +0200
Received: from cpc6-cmbg17-2-0-cust487.5-4.cable.virginmedia.com
	([86.30.57.232] helo=[172.30.1.45])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1UXrEf-0000Hv-Nj; Thu, 02 May 2013 12:59:37 +0200
Message-ID: <1367492376.14512.239.camel@phil-desktop.brightsign>
From: Phil Blundell <pb@pbcl.net>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Date: Thu, 02 May 2013 11:59:36 +0100
In-Reply-To: <1572577.Dfl22j8Qhu@helios>
References: <1360157122-5181-1-git-send-email-Martin.Jansa@gmail.com>
	<1367489790.14512.235.camel@phil-desktop.brightsign>
	<1572577.Dfl22j8Qhu@helios>
X-Mailer: Evolution 3.4.4-1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] insane.bbclass: Add missing R* variables to pkgvarcheck
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
X-List-Received-Date: Thu, 02 May 2013 11:17:29 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2013-05-02 at 11:36 +0100, Paul Eggleton wrote:
> On Thursday 02 May 2013 11:16:30 Phil Blundell wrote:
> > On Wed, 2013-02-06 at 14:25 +0100, Martin Jansa wrote:
> > > * check also RSUGGESTS, RCONFLICTS, RPROVIDES, RREPLACES
> > 
> > These are already checked by recipe_sanity.bbclass.  There's probably no
> > need to check them again here.
> 
> recipe_sanity.bbclass doesn't get used by default - I guess you are enabling 
> it explicitly?

Yeah, or rather, it's used by default in meta-micro.

> I wonder if we should either (a) move all the recipe checks to 
> recipe_sanity.bbclass and enable it by default, or (b) move any currently 
> there and not covered by insane.bbclass to insane.bbclass and delete 
> recipe_sanity.bbclass.

Either of those sounds reasonable enough to me.  I think the original
concept was that recipe_sanity was for errors that you could identify
statically at recipe parse time, and insane.bbclass was for checks
against the output artifacts (that you could only do after compiling and
packaging) but that line does seem to have gotten a bit blurred over
time.

p.




