Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1QcfYf-0007zV-3e for openembedded-core@lists.openembedded.org;
	Fri, 01 Jul 2011 17:23:05 +0200
Received: from cambridge.roku.com ([81.142.160.137] helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <pb@pbcl.net>) id 1QcfV4-0002O5-M6
	for openembedded-core@lists.openembedded.org;
	Fri, 01 Jul 2011 17:19:22 +0200
From: Phil Blundell <pb@pbcl.net>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <469c48cf5611c9e984d8114a48e834d03c44d099.1309533254.git.richard.purdie@linuxfoundation.org>
References: <c201845df210143f3170eca54c9870f7e20be47a.1309533254.git.richard.purdie@linuxfoundation.org>
	<469c48cf5611c9e984d8114a48e834d03c44d099.1309533254.git.richard.purdie@linuxfoundation.org>
Organization: Phil Blundell Consulting Ltd
Date: Fri, 01 Jul 2011 16:19:21 +0100
Message-ID: <1309533561.2633.76.camel@phil-desktop>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
Subject: Re: [PATCH 5/6] beecrypt: Fix up packaging QA warnings
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
X-List-Received-Date: Fri, 01 Jul 2011 15:23:05 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2011-07-01 at 16:17 +0100, Richard Purdie wrote:
> +FILES_${PN} = "${sysconfdir} ${libdir}/*.so.* ${libdir}/${BPN}/*.so.*"

You can use ${SOLIBS} there...

> +FILES_${PN}-dev += "${libdir}/${BPN}/*.so ${libdir}/${BPN}/*.la

... and ${SOLIBSDEV} there.

p.




