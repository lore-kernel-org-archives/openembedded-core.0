Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1QWTB5-00059s-NI for openembedded-core@lists.openembedded.org;
	Tue, 14 Jun 2011 14:57:07 +0200
Received: from cambridge.roku.com ([81.142.160.137] helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <pb@pbcl.net>) id 1QWT7o-0004Ep-OD
	for openembedded-core@lists.openembedded.org;
	Tue, 14 Jun 2011 14:53:44 +0200
From: Phil Blundell <pb@pbcl.net>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <42c945e9af04b3e9733253b1186abe13bc80bde7.1307947593.git.sgw@linux.intel.com>
References: <cover.1307947593.git.sgw@linux.intel.com>
	<42c945e9af04b3e9733253b1186abe13bc80bde7.1307947593.git.sgw@linux.intel.com>
Organization: Phil Blundell Consulting Ltd
Date: Tue, 14 Jun 2011 13:53:43 +0100
Message-ID: <1308056023.25285.258.camel@phil-desktop>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
Subject: Re: [*RFC CONSOLIDATED PULL RFC* 03/23] git: restore the dependency on perl-native
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
X-List-Received-Date: Tue, 14 Jun 2011 12:57:07 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sun, 2011-06-12 at 23:54 -0700, Saul Wold wrote:
> -inherit autotools
> +inherit autotools perlnative

This broke the tree for me.  Now I get:

NOTE: Out of date cache found, rebuilding...
ERROR: Could not inherit file
classes/perlnative.bbclass###########################################
| ETA:  00:00:03
ERROR: Command execution failed: Exited with 1

Am I meant to have perlnative.bbclass somewhere?  It isn't in
meta/classes.

p.




