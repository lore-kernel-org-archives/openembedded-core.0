Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1QpMiP-0002T9-1p
	for openembedded-core@lists.openembedded.org;
	Fri, 05 Aug 2011 17:53:37 +0200
Received: from cambridge.roku.com ([81.142.160.137] helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1QpMeA-0005iX-IL
	for openembedded-core@lists.openembedded.org;
	Fri, 05 Aug 2011 17:49:14 +0200
From: Phil Blundell <philb@gnu.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Fri, 05 Aug 2011 16:49:13 +0100
In-Reply-To: <1312559062.14274.114.camel@rex>
References: <e5fc6a2b0a315f9ade50a7f357b98068c38d49e3.1312469789.git.nitin.a.kamble@intel.com>
	<2c351319afd13acfca1283104172729925cfb696.1312469790.git.nitin.a.kamble@intel.com>
	<1312495032.3169.6.camel@lenovo.internal.reciva.com>
	<9DA5872FEF993D41B7173F58FCF6BE94DE85F4F7@orsmsx504.amr.corp.intel.com>
	<1312530654.3169.12.camel@lenovo.internal.reciva.com>
	<9DA5872FEF993D41B7173F58FCF6BE94DE85F892@orsmsx504.amr.corp.intel.com>
	<1312558899.6733.23.camel@phil-desktop>
	<1312559062.14274.114.camel@rex>
X-Mailer: Evolution 3.0.2- 
Message-ID: <1312559354.6733.25.camel@phil-desktop>
Mime-Version: 1.0
Subject: Re: [PATCH 09/10] x86 tune inc files: add x32 abi tune parameters
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
X-List-Received-Date: Fri, 05 Aug 2011 15:53:37 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2011-08-05 at 16:44 +0100, Richard Purdie wrote:
> Equally, there are several precedents for encoding ABI into TARGET_OS,
> arm-gnueabi springs to mind...
> 
> It really comes down to the formats that the various magic files accept
> and whilst its the regexps are lax on arm, they are less lax on x86 and
> I suspect the TARGET_OS path is the one of less resistance in this case.
> 
> Even so, it shouldn't be necessary to change the default TARGET_OS.

Yeah, fair enough.  I'm not terribly bothered either way about what
happens in the multilib case, but I would much prefer not to end up with
"i686-linux32" sort of things for a plain, non-multilibbed i686 build.

p.




