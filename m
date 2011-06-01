Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1QRrie-0007Ki-L9 for openembedded-core@lists.openembedded.org;
	Wed, 01 Jun 2011 22:08:44 +0200
Received: from blundell.swaffham-prior.co.uk ([91.216.112.25]
	helo=[192.168.114.3])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <pb@pbcl.net>) id 1QRrfc-0001uB-2Q
	for openembedded-core@lists.openembedded.org;
	Wed, 01 Jun 2011 22:05:36 +0200
From: Phil Blundell <pb@pbcl.net>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <4DE69582.2090508@mentor.com>
References: <cover.1306931844.git.dexuan.cui@intel.com>
	<4DE67440.1020405@mentor.com> <1306950977.27470.461.camel@rex>
	<4DE69582.2090508@mentor.com>
Date: Wed, 01 Jun 2011 21:05:29 +0100
Message-ID: <1306958729.3119.3.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
Subject: Re: [RFC v1 PATCH 00/16] populate perl-native into its own	directory
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
X-List-Received-Date: Wed, 01 Jun 2011 20:08:44 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2011-06-01 at 12:39 -0700, Tom Rini wrote:
> Maybe race isn't quite the right word.  But recipe A depends on
> lib$something-perl-native, and brings in perl-native.  It also checks
> for perl in its auto-foo and finds our perl.  It now also uses our perl
> when it wants a host perl and all of the potential bad things happen, yes?

What are the circumstances in which it would want a host perl?  I don't
quite understand the issue here.  Surely anything that the host perl can
do, perl-native plus some combination of libfoo-perl-native can also do,
right?

p.





