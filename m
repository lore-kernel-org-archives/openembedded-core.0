Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1Qozgs-0004Uk-6B
	for openembedded-core@lists.openembedded.org;
	Thu, 04 Aug 2011 17:18:30 +0200
Received: from cambridge.roku.com ([81.142.160.137] helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1Qozce-0004lO-Rf
	for openembedded-core@lists.openembedded.org;
	Thu, 04 Aug 2011 17:14:08 +0200
From: Phil Blundell <philb@gnu.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Thu, 04 Aug 2011 16:14:08 +0100
In-Reply-To: <3084551.78r5ORDKhl@perseus>
References: <cover.1311807353.git.tom_rini@mentor.com>
	<d395c1bac934913af1ed7c8fc3a09601c823339b.1311807353.git.tom_rini@mentor.com>
	<1312465942.2344.743.camel@rex> <3084551.78r5ORDKhl@perseus>
X-Mailer: Evolution 3.0.2- 
Message-ID: <1312470848.6733.2.camel@phil-desktop>
Mime-Version: 1.0
Subject: Re: [PATCH 3/9] Various site files: Drop monotone
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
X-List-Received-Date: Thu, 04 Aug 2011 15:18:30 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2011-08-04 at 08:08 -0700, Khem Raj wrote:
> On Thursday, August 04, 2011 02:52:22 PM Richard Purdie wrote:
> > On Wed, 2011-07-27 at 15:56 -0700, Tom Rini wrote:
> > >  # links
> > >  ac_cv_lib_png_png_create_info_struct=${ac_cv_lib_png_png_create_info_s
> > >  truct=yes}> 
> > > -# mono
> > > -cv_mono_sizeof_sunpath=108
> > > -
> > > 
> > Isn't mono different from monotone?
> 
> yes its for mono. I think we should keep it since there are many users of mono
> from oe.dev world who would want mono in future may be from  future meta-mono  

Why couldn't the site entry just go in meta-mono too, if that's where
the recipes are living?  I don't think it makes much/any sense (for
testability reasons as much as anything else) to have a load of siteinfo
entries lying around that no oe-core recipe actually uses.

p.




