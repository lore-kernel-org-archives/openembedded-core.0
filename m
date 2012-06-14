Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1SfCup-0001xq-HJ
	for openembedded-core@lists.openembedded.org;
	Thu, 14 Jun 2012 18:28:59 +0200
Received: from elite.brightsigndigital.co.uk ([81.142.160.137]
	helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1SfCka-0007AG-AF
	for openembedded-core@lists.openembedded.org;
	Thu, 14 Jun 2012 18:18:24 +0200
From: Phil Blundell <philb@gnu.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Thu, 14 Jun 2012 17:18:23 +0100
In-Reply-To: <31c81258425b08340416818f8ad50d5adf1515ba.1339689908.git.ross.burton@intel.com>
References: <cover.1339689908.git.ross.burton@intel.com>
	<31c81258425b08340416818f8ad50d5adf1515ba.1339689908.git.ross.burton@intel.com>
X-Mailer: Evolution 3.0.2- 
Message-ID: <1339690704.14857.102.camel@phil-desktop>
Mime-Version: 1.0
Subject: Re: [PATCH 1/2] connman: upgrade to 1.0
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
X-List-Received-Date: Thu, 14 Jun 2012 16:28:59 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2012-06-14 at 17:11 +0100, Ross Burton wrote:
> Drop all upstreamed or irrelevant patches, remove unused configure arguments,
> and add compatibility rprovides for what used to be plugins but are now
> integrated into the core.
> 
> Signed-off-by: Ross Burton <ross.burton@intel.com>

[...]

> -    --enable-client \
> -    --enable-fake \
> -    --disable-ntpd \
> +    --disable-client \

Why did --enable-client change to --disable?

p.




