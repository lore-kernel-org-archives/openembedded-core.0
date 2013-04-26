Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1UVk7Y-0008Jg-0r for openembedded-core@lists.openembedded.org;
	Fri, 26 Apr 2013 16:59:34 +0200
Received: from cpc6-cmbg17-2-0-cust487.5-4.cable.virginmedia.com
	([86.30.57.232] helo=[172.30.1.45])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1UVjqM-0006LS-Uz; Fri, 26 Apr 2013 16:41:47 +0200
Message-ID: <1366987306.14512.117.camel@phil-desktop.brightsign>
From: Phil Blundell <pb@pbcl.net>
To: Mark Hatle <mark.hatle@windriver.com>
Date: Fri, 26 Apr 2013 15:41:46 +0100
In-Reply-To: <517A91BA.7030200@windriver.com>
References: <1349169606.32611.73.camel@phil-desktop>
	<1349176346.15753.139.camel@ted>
	<1349176541.32611.80.camel@phil-desktop>
	<1349177925.15753.140.camel@ted>
	<1366888374.14512.78.camel@phil-desktop.brightsign>
	<517933DC.9080809@windriver.com>
	<1366984657.14512.108.camel@phil-desktop.brightsign>
	<517A8C41.20202@windriver.com>
	<1366986469.14512.116.camel@phil-desktop.brightsign>
	<517A91BA.7030200@windriver.com>
X-Mailer: Evolution 3.4.4-1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] rootfs_ipk, image: Add debug capture support
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
X-List-Received-Date: Fri, 26 Apr 2013 15:00:00 -0000
X-List-Received-Date: Fri, 26 Apr 2013 15:00:00 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2013-04-26 at 09:39 -0500, Mark Hatle wrote:
> On 4/26/13 9:27 AM, Phil Blundell wrote:
> > On Fri, 2013-04-26 at 09:16 -0500, Mark Hatle wrote:
> >> The alternative of course is to crease special -dbg packages for the two
> >> conflicting items.  I.e. foo-dbg, foo-sulogin-dbg, bar-dbg and bar-sulogin-dbg...
> >
> > Yeah, indeed, that's what I suggested in my original email.  At the time
> > I thought that would be hard to arrange (in the general case), but
> > having given it some further consideration perhaps it isn't all that bad
> > after all.
> 
> I certainly wouldn't be against an enhancement that tries to match up the 
> binaries to their debug and create suitably named -dbg packages.  The only 
> tricky part is what to do with the associated sources?  Since those are not 
> arranged according to binaries, but generally for the whole recipe.

The sources can stay where they are, in ${PN}-dbg.  There won't be any
conflict there because the installed files are already namespaced by
recipe.

p.




