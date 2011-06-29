Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1Qby0G-0006rQ-Ud for openembedded-core@lists.openembedded.org;
	Wed, 29 Jun 2011 18:52:41 +0200
Received: from cambridge.roku.com ([81.142.160.137] helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <pb@pbcl.net>)
	id 1Qbxwi-0001Gk-HS; Wed, 29 Jun 2011 18:49:00 +0200
From: Phil Blundell <pb@pbcl.net>
To: Saul Wold <sgw@linux.intel.com>
In-Reply-To: <4E0B353A.2020504@linux.intel.com>
References: <cover.1309305731.git.sgw@linux.intel.com>
	<8ef199fe606464ce6bdfef2329607c037ecdbc61.1309305731.git.sgw@linux.intel.com>
	<1309346750.2551.18.camel@phil-desktop>
	<4E0B353A.2020504@linux.intel.com>
Organization: Phil Blundell Consulting Ltd
Date: Wed, 29 Jun 2011 17:48:53 +0100
Message-ID: <1309366133.2551.83.camel@phil-desktop>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] multiple recipes converted to -staticdev packages
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
X-List-Received-Date: Wed, 29 Jun 2011 16:52:41 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2011-06-29 at 07:22 -0700, Saul Wold wrote:
> On 06/29/2011 04:25 AM, Phil Blundell wrote:
> > On Tue, 2011-06-28 at 17:07 -0700, Saul Wold wrote:
> >> +staticdev_libs = "${libdir}/*.a ${base_libdir}/*.a"
> >> +FILES_${PN}-staticdev = "${@oe_filter_out('lib.*_nonshared.a', '${staticdev_libs}', d)}"
> >
> > Does that actually work?  I wouldn't have expected the pattern to get
> > globbed early enough for the oe_filter_out to have any effect.
> >
> Yes it does, I have tested it.

That's interesting.  Do you know where the glob is taking place?  I
thought it didn't happen until after FILES was expanded and split inside
populate_packages.

p.




