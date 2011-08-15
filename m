Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1Qszv6-0006D3-Mn
	for openembedded-core@lists.openembedded.org;
	Mon, 15 Aug 2011 18:21:44 +0200
Received: from elite.brightsigndigital.co.uk ([81.142.160.137]
	helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1Qszqg-0004yl-N2
	for openembedded-core@lists.openembedded.org;
	Mon, 15 Aug 2011 18:17:10 +0200
From: Phil Blundell <philb@gnu.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Mon, 15 Aug 2011 17:17:09 +0100
In-Reply-To: <1313424992.6733.187.camel@phil-desktop>
References: <1313424992.6733.187.camel@phil-desktop>
X-Mailer: Evolution 3.0.2- 
Message-ID: <1313425030.6733.188.camel@phil-desktop>
Mime-Version: 1.0
Subject: Re: [PATCH] cmake.bbclass, perlnative.bbclass: arrange for cmake to find perl-native
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
X-List-Received-Date: Mon, 15 Aug 2011 16:21:44 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2011-08-15 at 17:16 +0100, Phil Blundell wrote:
> When CMake is looking for perl, it only searches in the specific directories
> that it's told about and ignores ${PATH}.  If perlnative is in use, ensure
> that the appropriate installation path is added to the list of places that
> cmake will look for perl, otherwise it won't ever be found.
> 
> Signed-off-by: Phil Blundell <philb@gnu.org>
> ---
>  meta/classes/cmake.bbclass      |    3 ++-
>  meta/classes/perlnative.bbclass |    1 +
>  2 files changed, 3 insertions(+), 1 deletions(-)

This is not very pretty, but then I guess nothing to do with cmake ever
is.  Better suggestions for how to make this work are of course welcome.

p.




