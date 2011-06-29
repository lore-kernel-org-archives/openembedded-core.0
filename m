Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1QbukY-0002wx-2c for openembedded-core@lists.openembedded.org;
	Wed, 29 Jun 2011 15:24:14 +0200
Received: from cambridge.roku.com ([81.142.160.137] helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <pb@pbcl.net>) id 1Qbuh0-0001B8-0N
	for openembedded-core@lists.openembedded.org;
	Wed, 29 Jun 2011 15:20:34 +0200
From: Phil Blundell <pb@pbcl.net>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <c572d4f39bc61df11a8e5a344b88c7b3fe8e476f.1309352791.git.dexuan.cui@intel.com>
References: <cover.1309352791.git.dexuan.cui@intel.com>
	<c572d4f39bc61df11a8e5a344b88c7b3fe8e476f.1309352791.git.dexuan.cui@intel.com>
Organization: Phil Blundell Consulting Ltd
Date: Wed, 29 Jun 2011 14:20:32 +0100
Message-ID: <1309353632.2551.32.camel@phil-desktop>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
Subject: Re: [PATCH 1/3] grub: add -fno-reorder-functions into STAGE2_COMPILE
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
X-List-Received-Date: Wed, 29 Jun 2011 13:24:14 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2011-06-29 at 21:09 +0800, Dexuan Cui wrote:
> +This turned out to be a gcc's bug. See
> +https://bugs.gentoo.org/show_bug.cgi?id=360513
> +http://gcc.gnu.org/bugzilla/show_bug.cgi?id=39333
> +
> +Upstream gcc seems uninterested in the bug, so at present we can disable the
> +option as a workaround. Thanks Ryan Hill for the investigation and the
> +workaround patch.

I'm not sure it's fair to say that upstream gcc is uninterested.  It
doesn't appear that anybody has been willing or able to produce a
testcase which will allow the gcc people to debug the problem. 

p.




