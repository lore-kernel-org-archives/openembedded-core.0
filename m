Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1SuTZK-00080K-Cc
	for openembedded-core@lists.openembedded.org;
	Thu, 26 Jul 2012 21:17:54 +0200
Received: from blundell.swaffham-prior.co.uk ([91.216.112.25]
	helo=[192.168.114.6])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1SuTOD-0007kd-Kc
	for openembedded-core@lists.openembedded.org;
	Thu, 26 Jul 2012 21:06:25 +0200
Message-ID: <1343329482.4470.58.camel@x121e.pbcl.net>
From: Phil Blundell <philb@gnu.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Thu, 26 Jul 2012 20:04:42 +0100
In-Reply-To: <53dbda715b2463385ddc70e489d299026f260d3b.1343199345.git.Xin.Ouyang@windriver.com>
References: <cover.1343199345.git.Xin.Ouyang@windriver.com>
	<53dbda715b2463385ddc70e489d299026f260d3b.1343199345.git.Xin.Ouyang@windriver.com>
X-Mailer: Evolution 3.4.3-1 
Mime-Version: 1.0
Subject: Re: [PATCH 1/1] mtools: add glibc-gconv-* to RDEPENDS/RRECOMMENDS
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
X-List-Received-Date: Thu, 26 Jul 2012 19:17:54 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2012-07-25 at 15:02 +0800, xin.ouyang@windriver.com wrote:
> +RDEPENDS_${PN} = "glibc-gconv-ibm850"

That will make mtools unbuildable for non-glibc configurations.  Is this
intended?

p.




