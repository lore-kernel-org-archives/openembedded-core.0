Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1QzAfN-0003n7-L5
	for openembedded-core@lists.openembedded.org;
	Thu, 01 Sep 2011 19:03:01 +0200
Received: from elite.brightsigndigital.co.uk ([81.142.160.137]
	helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1QzAae-0006g5-7a
	for openembedded-core@lists.openembedded.org;
	Thu, 01 Sep 2011 18:58:08 +0200
From: Phil Blundell <philb@gnu.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Thu, 01 Sep 2011 17:58:07 +0100
In-Reply-To: <4E5FB8AC.1070007@windriver.com>
References: <cover.1306865217.git.scott.a.garman@intel.com>
	<7826575ce92090c4460c7d016e0b06441f84cff7.1306865217.git.scott.a.garman@intel.com>
	<1314895291.19905.197.camel@phil-desktop>
	<4E5FB8AC.1070007@windriver.com>
X-Mailer: Evolution 3.0.2- 
Message-ID: <1314896288.19905.199.camel@phil-desktop>
Mime-Version: 1.0
Subject: Re: [PATCH 2/7] shadow: add a -native recipe with customized utilities
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
X-List-Received-Date: Thu, 01 Sep 2011 17:03:01 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2011-09-01 at 11:54 -0500, Mark Hatle wrote:
> What is it depending on for the target?  Is the shadow-utils or something now
> required?  That doesn't seem to make sense to me -- other then we need a
> passwd/group/shadow/gshadow file to work with.  As long as something can provide
> those, we should be ok.

I haven't investigated in detail, but the code from useradd.bbclass
says:

# base-passwd-cross provides the default passwd and group files in the
# target sysroot, and shadow -native and -sysroot provide the utilities
# and support files needed to add and modify user and group accounts
DEPENDS_append = " base-passwd shadow-native shadow-sysroot"
RDEPENDS_${USERADDPN}_append = " base-passwd shadow"

And, I guess, if you want to support online package management then it
does make some sense to have the shadow utils there.  But I don't
need/want that in my configuration.

p.




