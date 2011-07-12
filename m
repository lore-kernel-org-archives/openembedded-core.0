Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1QgZoR-0005Kj-D2 for openembedded-core@lists.openembedded.org;
	Tue, 12 Jul 2011 12:03:31 +0200
Received: from cambridge.roku.com ([81.142.160.137] helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <pb@pbcl.net>) id 1QgZke-0002zT-Jx
	for openembedded-core@lists.openembedded.org;
	Tue, 12 Jul 2011 11:59:36 +0200
From: Phil Blundell <pb@pbcl.net>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Tue, 12 Jul 2011 10:59:35 +0100
In-Reply-To: <b90b7b8264c0c24d64e6e64a322c44b60bc62855.1310425837.git.sgw@linux.intel.com>
References: <cover.1310425837.git.sgw@linux.intel.com>
	<b90b7b8264c0c24d64e6e64a322c44b60bc62855.1310425837.git.sgw@linux.intel.com>
Organization: Phil Blundell Consulting Ltd
X-Mailer: Evolution 3.0.2- 
Message-ID: <1310464776.6337.190.camel@phil-desktop>
Mime-Version: 1.0
Subject: Re: [PATCH 02/26] lib_package.bbclass: add *_nonshared.a to -dev package
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
X-List-Received-Date: Tue, 12 Jul 2011 10:03:31 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2011-07-11 at 16:13 -0700, Saul Wold wrote:
> +            ${libdir}/*_nonshared.a"

Does anything other than glibc actually need that?  I see you added it
to eglibc-dev in patch 24/26, so it doesn't seem like having it here as
well is going to buy much.

p.




