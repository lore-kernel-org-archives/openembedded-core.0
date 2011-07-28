Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1QmNHX-0003G3-8y
	for openembedded-core@lists.openembedded.org;
	Thu, 28 Jul 2011 11:53:32 +0200
Received: from cambridge.roku.com ([81.142.160.137] helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1QmNDS-00030P-4K
	for openembedded-core@lists.openembedded.org;
	Thu, 28 Jul 2011 11:49:18 +0200
From: Phil Blundell <philb@gnu.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Thu, 28 Jul 2011 10:49:17 +0100
In-Reply-To: <1311846297-30202-1-git-send-email-koen@dominion.thruhere.net>
References: <1311846297-30202-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: Evolution 3.0.2- 
Message-ID: <1311846558.30326.420.camel@phil-desktop>
Mime-Version: 1.0
Subject: Re: [PATCHv2] gst-plugins: partially sync packaging with OE .dev
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
X-List-Received-Date: Thu, 28 Jul 2011 09:53:32 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2011-07-28 at 11:44 +0200, Koen Kooi wrote:
> +ALLOW_EMPTY = "1"

Is that necessary?  You seem to be setting ALLOW_EMPTY_${PN}-meta=1 in
your python code anyway.

p.




