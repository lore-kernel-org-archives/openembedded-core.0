Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1QZ62b-0002f6-DU for openembedded-core@lists.openembedded.org;
	Tue, 21 Jun 2011 20:51:13 +0200
Received: from blundell.swaffham-prior.co.uk ([91.216.112.25]
	helo=[192.168.114.3])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <pb@pbcl.net>) id 1QZ5zC-0002nZ-6F
	for openembedded-core@lists.openembedded.org;
	Tue, 21 Jun 2011 20:47:42 +0200
From: Phil Blundell <pb@pbcl.net>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <dae7eb36362cc224e70938d345ddfbd672ad0d61.1308680000.git.anders@chargestorm.se>
References: <cover.1308680000.git.anders@chargestorm.se>
	<dae7eb36362cc224e70938d345ddfbd672ad0d61.1308680000.git.anders@chargestorm.se>
Date: Tue, 21 Jun 2011 19:47:35 +0100
Message-ID: <1308682055.3083.13.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
Subject: Re: [RFC PATCH 1/5] Remove support for building 2.4 kernels
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
X-List-Received-Date: Tue, 21 Jun 2011 18:51:13 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2011-06-21 at 20:18 +0200, Anders Darander wrote:
> Signed-off-by: Anders Darander <anders@chargestorm.se>
> ---
>  meta/classes/kernel.bbclass      |   22 +++++++---------------
>  meta/classes/module-base.bbclass |    2 +-
>  2 files changed, 8 insertions(+), 16 deletions(-)

This patch looks basically fine but it has quite a lot of extraneous
whitespace changes.  Could you try to filter those out in future, or
submit them as a separate patch?

p.




