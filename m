Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1QgvdB-0006It-I3
	for openembedded-core@lists.openembedded.org;
	Wed, 13 Jul 2011 11:21:21 +0200
Received: from cambridge.roku.com ([81.142.160.137] helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1QgvZN-0004P8-N4
	for openembedded-core@lists.openembedded.org;
	Wed, 13 Jul 2011 11:17:25 +0200
From: Phil Blundell <philb@gnu.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Wed, 13 Jul 2011 10:17:24 +0100
In-Reply-To: <79c857d74346635be316e2bf42dc8d4224095da2.1310541680.git.sgw@linux.intel.com>
References: <cover.1310541680.git.sgw@linux.intel.com>
	<79c857d74346635be316e2bf42dc8d4224095da2.1310541680.git.sgw@linux.intel.com>
X-Mailer: Evolution 3.0.2- 
Message-ID: <1310548645.6337.218.camel@phil-desktop>
Mime-Version: 1.0
Subject: Re: [PATCH V2 02/25] shlibpackaging.bbclass: create common class
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
X-List-Received-Date: Wed, 13 Jul 2011 09:21:21 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2011-07-13 at 00:33 -0700, Saul Wold wrote:
> +RDEPENDS_lib${PN} = "${PN}"

Why do we want lib${PN} to have a hard dependency on ${PN}?  This seems
somewhat backwards to me.  

Also, if ${PN} is the one with the binaries then it will get an
auto-generated dependency back to lib${PN} anyway and it looks like this
will cause a dependency loop.

Also also, if it really is correct for lib${PN} to RDEPEND on ${PN}
then, in the general case, it probably ought to be a precisely versioned
dependency to guarantee correctness.  Individual recipes can relax that
if they want to.

p.




