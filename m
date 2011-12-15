Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1Rb8dI-0000Sv-Ku
	for openembedded-core@lists.openembedded.org;
	Thu, 15 Dec 2011 11:33:48 +0100
Received: from elite.brightsigndigital.co.uk ([81.142.160.137]
	helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1Rb8Wb-0004My-0n
	for openembedded-core@lists.openembedded.org;
	Thu, 15 Dec 2011 11:26:53 +0100
From: Phil Blundell <philb@gnu.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Thu, 15 Dec 2011 10:26:51 +0000
In-Reply-To: <b52e93fb176d552e1334088af964dfbd38c0007d.1323911699.git.sgw@linux.intel.com>
References: <cover.1323911699.git.sgw@linux.intel.com>
	<b52e93fb176d552e1334088af964dfbd38c0007d.1323911699.git.sgw@linux.intel.com>
X-Mailer: Evolution 3.0.2- 
Message-ID: <1323944813.24417.197.camel@phil-desktop>
Mime-Version: 1.0
Subject: Re: [PATCH 7/7] perl: add .pl, pm, pod, sh files to SSTATE_SCANE_FILES
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
X-List-Received-Date: Thu, 15 Dec 2011 10:33:48 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2011-12-14 at 17:50 -0800, Saul Wold wrote:
> Signed-off-by: Saul Wold <sgw@linux.intel.com>
> ---
>  meta/recipes-devtools/perl/perl_5.14.2.bb |    5 ++++-
>  1 files changed, 4 insertions(+), 1 deletions(-)

This commit message is very terse.  What is SSTATE_SCAN[E]_FILES and why
do we want these things in it?

> +SSTATE_SCAN_FILES += "*.pm *.pod *.h *.pl *.sh"

p.





