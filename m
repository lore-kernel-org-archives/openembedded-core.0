Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1QcaZP-0006Xw-8c for openembedded-core@lists.openembedded.org;
	Fri, 01 Jul 2011 12:03:31 +0200
Received: from cambridge.roku.com ([81.142.160.137] helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <pb@pbcl.net>) id 1QcaVp-0002As-2Z
	for openembedded-core@lists.openembedded.org;
	Fri, 01 Jul 2011 11:59:49 +0200
From: Phil Blundell <pb@pbcl.net>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <1aa106d547c9e10d025a011922335cc3ea1bbb69.1309513694.git.dexuan.cui@intel.com>
References: <cover.1309513694.git.dexuan.cui@intel.com>
	<1aa106d547c9e10d025a011922335cc3ea1bbb69.1309513694.git.dexuan.cui@intel.com>
Organization: Phil Blundell Consulting Ltd
Date: Fri, 01 Jul 2011 10:59:48 +0100
Message-ID: <1309514388.2633.36.camel@phil-desktop>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
Subject: Re: [PATCH 1/1] busybox: bump PR to enable largefile support
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
X-List-Received-Date: Fri, 01 Jul 2011 10:03:31 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2011-07-01 at 17:53 +0800, Dexuan Cui wrote:
> In the previous commit we enable largefile setting in
> meta-yocto/conf/distro/poky.conf, so we need to re-build busybox to
> actually enable it.

I guess this would be a good case for using something like OE .dev's
DISTRO_PR.  It would be a bit sad if we end up having to bump PRs all
over the place in oe-core whenever some random layer changes its
DISTRO_FEATURES or whatever.

Also, just on a stylistic issue, it's a bit confusing to talk about "the
previous commit" if the commit in question was to a different file and
in a different repo.  If you want to refer to a specific commit it's
best to mention the actual hash and, if necessary, the repo where it can
be found.

p.




