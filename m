Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1QSRj6-00059F-8w for openembedded-core@lists.openembedded.org;
	Fri, 03 Jun 2011 12:35:36 +0200
Received: from cambridge.roku.com ([81.142.160.137] helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <pb@pbcl.net>) id 1QSRg1-0003Y4-SL
	for openembedded-core@lists.openembedded.org;
	Fri, 03 Jun 2011 12:32:25 +0200
From: Phil Blundell <pb@pbcl.net>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <1307053596.27470.597.camel@rex>
References: <1307008107.2529.175.camel@phil-desktop>
	<1307049946.27470.589.camel@rex>
	<1307050662.4028.3.camel@lenovo.internal.reciva.com>
	<1307053596.27470.597.camel@rex>
Organization: Phil Blundell Consulting Ltd
Date: Fri, 03 Jun 2011 11:32:24 +0100
Message-ID: <1307097144.2529.248.camel@phil-desktop>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
Subject: Re: [PATCH] rpm: avoid dependency on perl and python for -native build
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
X-List-Received-Date: Fri, 03 Jun 2011 10:35:36 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2011-06-02 at 23:26 +0100, Richard Purdie wrote:
> My understanding is that if you are going to explicitly override DEPENDS
> like that you get what you say you want. We therefore likely need to do
> something like:
> 
> DEPENDS = "X Y Z ${EXTRAPERLDEPS}"
> EXTRAPERLDEPS = "perl python"
> EXTRAPERLDEPS_virtclass-native = ""

Yes, that would be neater.  As it happens I did try that first but it
didn't seem to work: for reasons which were (and remain) a bit
mysterious to me, the original EXTRAPERLDEPS were always showing up in
DEPENDS for the virtclass-native build.  I assumed at the time that
there was some ordering problem between the override being processed and
the ORIG_DEPENDS assignment in native.bbclass, but I wasn't entirely
sure what the intended semantics were and so I didn't pursue that line
of enquiry any further.

p.




