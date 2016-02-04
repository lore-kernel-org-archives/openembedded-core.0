Return-Path: <pb@pbcl.net>
Received: from hetzner.pbcl.net (mail.pbcl.net [88.198.119.4])
	by mail.openembedded.org (Postfix) with ESMTP id A27D5771B4
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Feb 2016 21:10:47 +0000 (UTC)
Received: from blundell.swaffham-prior.co.uk ([91.216.112.25] helo=e130.local)
	by hetzner.pbcl.net with esmtpsa (TLS1.2:RSA_AES_128_CBC_SHA1:128)
	(Exim 4.80) (envelope-from <pb@pbcl.net>)
	id 1aRRAr-00023x-Rw; Thu, 04 Feb 2016 22:10:46 +0100
Message-ID: <1454620237.7421.73.camel@pbcl.net>
From: Phil Blundell <pb@pbcl.net>
To: Khem Raj <raj.khem@gmail.com>
Date: Thu, 04 Feb 2016 21:10:37 +0000
In-Reply-To: <792F6F91-ECBE-46AD-BC72-ED6A199B696E@gmail.com>
References: <1454616759-20614-1-git-send-email-ricardo.neri-calderon@linux.intel.com>
	<792F6F91-ECBE-46AD-BC72-ED6A199B696E@gmail.com>
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2] udev: add runtime dependencies for udev-cache
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 04 Feb 2016 21:10:50 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Thu, 2016-02-04 at 13:01 -0800, Khem Raj wrote:
> > On Feb 4, 2016, at 12:12 PM, Ricardo Neri <ricardo.neri-calderon@linux.intel.com> wrote:
> > inherit autotools pkgconfig update-rc.d ptest
> > RDEPENDS_${PN}-ptest += "make perl python"
> > +RDEPENDS_${PN}-cache += "gzip findutils”
> 
> are they individually packaged ipks even with busybox ?
> if not then this fix is insufficient

They don't have to be individually packaged, it would suffice for
busybox to RPROVIDE them.  (But it doesn't, so I think you are correct
that the patch as it stands will break builds with busybox.)

p.



