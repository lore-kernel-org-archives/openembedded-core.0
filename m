Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1QRljq-0007ty-FJ for openembedded-core@lists.openembedded.org;
	Wed, 01 Jun 2011 15:45:34 +0200
Received: from cambridge.roku.com ([81.142.160.137] helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <pb@pbcl.net>) id 1QRlgo-0001fy-6P
	for openembedded-core@lists.openembedded.org;
	Wed, 01 Jun 2011 15:42:26 +0200
From: Phil Blundell <pb@pbcl.net>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <4DE631D3.9070703@ge.com>
References: <cover.1306865217.git.scott.a.garman@intel.com>
	<7826575ce92090c4460c7d016e0b06441f84cff7.1306865217.git.scott.a.garman@intel.com>
	<1306921632.2529.18.camel@phil-desktop>  <4DE631D3.9070703@ge.com>
Organization: Phil Blundell Consulting Ltd
Date: Wed, 01 Jun 2011 14:42:25 +0100
Message-ID: <1306935745.2529.91.camel@phil-desktop>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
Subject: Re: [PATCH 2/7] shadow: add a -native recipe with customized utilities
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
X-List-Received-Date: Wed, 01 Jun 2011 13:45:34 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2011-06-01 at 13:34 +0100, Martyn Welch wrote:
> On 01/06/11 10:47, Phil Blundell wrote:
> > On Tue, 2011-05-31 at 12:53 -0700, Scott Garman wrote:
> >> This adds a -native recipe for the shadow utilities.
> >>
> >> The custom --root option allows the the following utilities to be
> >> run within a chroot when invoked under pseudo:
> > 
> > Rather than patching the code for all these utilities, can't you just
> > wrap them in a call to chroot(8)?  That is, make useradd.bbclass do:
> > 
> > eval $PSEUDO chroot ${STAGING_DIR_TARGET} useradd ...
> > 
> > rather than the existing
> > 
> > eval $PSEUDO useradd --root ${STAGING_DIR_TARGET} ...
> > 
> > ?
> > 
> 
> You'd need root privileges to use chroot wouldn't you? I'm assuming you
> wouldn't with the existing.

Doesn't $PSEUDO sort that out?  The --root option that Scott has patched
into all the utilities seems to just end up calling chroot(2) anyway so
you would need root privileges at that point.  That said, I'm not
entirely au fait with pseudo so I might well be misunderstanding how it
works.

p.




