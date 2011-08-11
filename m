Received: from gate.crashing.org ([63.228.1.57]
	ident=[U2FsdGVkX18m/eq0zj80QOLyPsTx5nIR/UL2GjoSM5c=])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <galak@kernel.crashing.org>) id 1QrYFu-0002zr-L3
	for openembedded-core@lists.openembedded.org;
	Thu, 11 Aug 2011 18:37:15 +0200
Received: from [IPv6:::1] (localhost.localdomain [127.0.0.1])
	by gate.crashing.org (8.14.1/8.13.8) with ESMTP id p7BGWeBd002812
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Aug 2011 11:32:41 -0500
Mime-Version: 1.0 (Apple Message framework v1084)
From: Kumar Gala <galak@kernel.crashing.org>
In-Reply-To: <2e92fd3be5dcbf911a1fdbb3667ae4d273203e56.1313079549.git.sgw@linux.intel.com>
Date: Thu, 11 Aug 2011 11:32:42 -0500
Message-Id: <46DF68A2-CC5D-438E-B9BC-B4CB664380E5@kernel.crashing.org>
References: <cover.1313079549.git.sgw@linux.intel.com>
	<2e92fd3be5dcbf911a1fdbb3667ae4d273203e56.1313079549.git.sgw@linux.intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1084)
Subject: Re: [CONSOLIDATED PULL 09/10] gcc: move --enable-target-optspace workaround to just gcc-4.5.1
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
X-List-Received-Date: Thu, 11 Aug 2011 16:37:15 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit


On Aug 11, 2011, at 11:29 AM, Saul Wold wrote:

> From: Kumar Gala <galak@kernel.crashing.org>
> 
> For ppc we disable '--enable-target-optspace' because of a bug in gcc
> 4.5.x.  gcc 4.6.x fixes this issue so no need to do this.
> 
> Signed-off-by: Kumar Gala <galak@kernel.crashing.org>
> 
> [Change PR Bumps to apply patch]
> 
> Signed-off-by: Saul Wold <sgw@linux.intel.com>
> ---
> meta/recipes-devtools/gcc/gcc-4.5.1.inc            |   10 +++++++++-
> meta/recipes-devtools/gcc/gcc-4.6.inc              |    2 +-
> meta/recipes-devtools/gcc/gcc-configure-common.inc |    7 +------
> 3 files changed, 11 insertions(+), 8 deletions(-)

drop, this its currently broken.

- k


