Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1QeOI8-0005uD-8j for openembedded-core@lists.openembedded.org;
	Wed, 06 Jul 2011 11:21:08 +0200
Received: from cambridge.roku.com ([81.142.160.137] helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <pb@pbcl.net>) id 1QeOES-000487-Cw
	for openembedded-core@lists.openembedded.org;
	Wed, 06 Jul 2011 11:17:20 +0200
From: Phil Blundell <pb@pbcl.net>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Wed, 06 Jul 2011 10:17:19 +0100
In-Reply-To: <1e134055b8c00dd2f93a40a50cf69377c7b325c0.1309906154.git.richard.purdie@linuxfoundation.org>
References: <696f00b67217242f3a372d070c2473f8ced639ed.1309906154.git.richard.purdie@linuxfoundation.org>
	<1e134055b8c00dd2f93a40a50cf69377c7b325c0.1309906154.git.richard.purdie@linuxfoundation.org>
Organization: Phil Blundell Consulting Ltd
X-Mailer: Evolution 3.0.2- 
Message-ID: <1309943840.6337.7.camel@phil-desktop>
Mime-Version: 1.0
Subject: Re: [PATCH 13/17] apt: Package unpackaged files
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
X-List-Received-Date: Wed, 06 Jul 2011 09:21:08 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2011-07-05 at 23:51 +0100, Richard Purdie wrote:
> -FILES_${PN}-dev = "${libdir}/libapt*.so"
> +FILES_${PN}-dev = "${libdir}/libapt*.so ${includedir}"

Is there a reason why the default FILES from bitbake.conf wouldn't work
there?  It looks like both the above would be included.

p.




