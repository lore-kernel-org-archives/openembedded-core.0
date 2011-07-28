Received: from gate.crashing.org ([63.228.1.57]
	ident=[U2FsdGVkX19pbGKhCpvPHJlNppDzSri9iUoOgn3bIwE=])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <galak@kernel.crashing.org>) id 1QmReI-0001e8-3Q
	for openembedded-core@lists.openembedded.org;
	Thu, 28 Jul 2011 16:33:18 +0200
Received: from [IPv6:::1] (localhost.localdomain [127.0.0.1])
	by gate.crashing.org (8.14.1/8.13.8) with ESMTP id p6SESo0Y002655
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Jul 2011 09:28:53 -0500
Mime-Version: 1.0 (Apple Message framework v1084)
From: Kumar Gala <galak@kernel.crashing.org>
In-Reply-To: <24425d51a79827cadfb9dd114fdba45a92aea1ab.1311862525.git.paul.eggleton@linux.intel.com>
Date: Thu, 28 Jul 2011 09:28:51 -0500
Message-Id: <F0CAFB87-B615-4444-826E-C76B12A0C9FA@kernel.crashing.org>
References: <cover.1311862525.git.paul.eggleton@linux.intel.com>
	<24425d51a79827cadfb9dd114fdba45a92aea1ab.1311862525.git.paul.eggleton@linux.intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1084)
Subject: Re: [PATCH 1/1] bitbake.conf: remove PACKAGE_EXTRA_ARCHS_tune-XXX default
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
X-List-Received-Date: Thu, 28 Jul 2011 14:33:18 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit


On Jul 28, 2011, at 9:18 AM, Paul Eggleton wrote:

> Because of the way BitBake handles ??= under certain circumstances, this
> default setting ends up stepping all over the real setting from the arch
> include file. Since virtually all arch include files or tune files define
> a real value for this we shouldn't need to have a default (or it needs to
> be done in a different way).
> 
> Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
> ---
> meta/conf/bitbake.conf |    1 -
> 1 files changed, 0 insertions(+), 1 deletions(-)

Acked-by: Kumar Gala <galak@kernel.crashing.org>

- k


