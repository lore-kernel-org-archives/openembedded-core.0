Return-Path: <pb@pbcl.net>
Received: from hetzner.pbcl.net (mail.pbcl.net [88.198.119.4])
	by mail.openembedded.org (Postfix) with ESMTP id D420E6D040
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Nov 2013 22:54:30 +0000 (UTC)
Received: from blundell.swaffham-prior.co.uk ([91.216.112.25]
	helo=[192.168.114.7]) by hetzner.pbcl.net with esmtpsa
	(TLS1.0:DHE_RSA_CAMELLIA_256_CBC_SHA1:256) (Exim 4.80)
	(envelope-from <pb@pbcl.net>)
	id 1VgMqQ-0007nz-GD; Tue, 12 Nov 2013 23:54:29 +0100
Message-ID: <1384300388.3828.36.camel@x121e.pbcl.net>
From: Phil Blundell <pb@pbcl.net>
To: Saul Wold <sgw@linux.intel.com>
Date: Tue, 12 Nov 2013 23:53:08 +0000
In-Reply-To: <5282AEB6.3060706@linux.intel.com>
References: <1383954150-59537-1-git-send-email-kirgene@gmail.com>
	<5282AEB6.3060706@linux.intel.com>
Organization: Phil Blundell Consulting Ltd
X-Mailer: Evolution 3.4.4-3 
Mime-Version: 1.0
X-Spam_score: -1.0
X-Spam_score_int: -9
X-Spam_bar: -
X-Spam_report: Spam detection software,
	running on the system "hetzner.pbcl.net", has
	identified this incoming email as possible spam. The original message
	has been attached to this so you can view it (if it isn't spam) or
	label similar future email.  If you have any questions, see
	@@CONTACT_ADDRESS@@ for details.
	Content preview:  On Tue, 2013-11-12 at 14:41 -0800,
	Saul Wold wrote: > Additionally, if adding this to oe-core,
	it needs to be in it's own > patch crediting the
	orignal author / layer, I found a 1.10 version in > the meta-webos-ports,
	is this where it came from? [...] 
	Content analysis details:   (-1.0 points, 5.0 required)
	pts rule name              description
	---- ----------------------
	--------------------------------------------------
	-1.0 ALL_TRUSTED Passed through trusted hosts only via SMTP
Cc: Yevhen Kyriukha <kirgene@gmail.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] curl: build with c-ares library support.
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
X-List-Received-Date: Tue, 12 Nov 2013 22:54:31 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2013-11-12 at 14:41 -0800, Saul Wold wrote:
> Additionally, if adding this to oe-core, it needs to be in it's own 
> patch crediting the orignal author / layer, I found a 1.10 version in 
> the meta-webos-ports, is this where it came from?

There is a c-ares recipe in oe-classic which looks quite similar to this
one and I suspect that's probably where it came from (though perhaps
indirectly).

But, configuring curl to use c-ares support is not as trivial a change
as it might appear and there is a significant chance that it will cause
unforeseen (and probably unwanted) effects for at least some people.
Adding a PACKAGECONFIG option for it which defaults to off would
obviously be fine, and changing the default to be the libcurl internal
threaded resolver (which would probably fix the original complaint as
well, and doesn't require any extra recipes) might also be fine, but
enabling c-ares by default is not something that should be done
capriciously.

p.



