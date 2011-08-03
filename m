Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1Qok6C-0005fL-GJ for openembedded-core@lists.openembedded.org;
	Thu, 04 Aug 2011 00:39:36 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p73MZDhn029498;
	Wed, 3 Aug 2011 23:35:13 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 28830-03; Wed,  3 Aug 2011 23:35:09 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p73MZ7VV029488
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Wed, 3 Aug 2011 23:35:08 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <D9C996B9-65E0-4373-90F5-5B5286E05444@kernel.crashing.org>
References: <1311858624-3686-1-git-send-email-galak@kernel.crashing.org>
	<37BC502A-3FEA-4059-85FB-F6A3F401C3F9@kernel.crashing.org>
	<4E3985C8.9070000@linux.intel.com>
	<D9C996B9-65E0-4373-90F5-5B5286E05444@kernel.crashing.org>
Date: Wed, 03 Aug 2011 23:34:48 +0100
Message-ID: <1312410888.2344.718.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH] scripts/oe-buildenv-internal: Add SOCKS5_{USER, PASSWD} to BB_ENV_EXTRAWHITE
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
X-List-Received-Date: Wed, 03 Aug 2011 22:39:36 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2011-08-03 at 14:41 -0500, Kumar Gala wrote:
> On Aug 3, 2011, at 12:30 PM, Saul Wold wrote:
> 
> > On 08/03/2011 10:00 AM, Kumar Gala wrote:
> >> 
> >> On Jul 28, 2011, at 8:10 AM, Kumar Gala wrote:
> >> 
> >>> If a SOCKS5 gateway is needed for a proxy access like git it might also
> >>> require authentication to the proxy via a password and username.  Adding
> >>> SOCKS5_USER&  SOCKS5_PASSWD to BB_ENV_EXTRAWHITE allow for automation
> >>> of the authentication request to occur when something like a git fetch
> >>> is going through the proxy.
> >>> 
> >>> Signed-off-by: Kumar Gala<galak@kernel.crashing.org>
> >>> ---
> >>> * Fixes issue with a git fetch request failing to get pass a firewall
> >>> 
> >>> scripts/oe-buildenv-internal |    2 +-
> >>> 1 files changed, 1 insertions(+), 1 deletions(-)
> >>> 
> >>> diff --git a/scripts/oe-buildenv-internal b/scripts/oe-buildenv-internal
> >>> index c13fc40..b223292 100755
> >>> --- a/scripts/oe-buildenv-internal
> >>> +++ b/scripts/oe-buildenv-internal
> >>> @@ -55,4 +55,4 @@ unset BITBAKEDIR
> >>> export BUILDDIR
> >>> export PATH
> >>> 
> >>> -export BB_ENV_EXTRAWHITE="MACHINE DISTRO TCMODE TCLIBC http_proxy ftp_proxy https_proxy all_proxy ALL_PROXY no_proxy SSH_AGENT_PID SSH_AUTH_SOCK BB_SRCREV_POLICY SDKMACHINE BB_NUMBER_THREADS PARALLEL_MAKE GIT_PROXY_COMMAND"
> >>> +export BB_ENV_EXTRAWHITE="MACHINE DISTRO TCMODE TCLIBC http_proxy ftp_proxy https_proxy all_proxy ALL_PROXY no_proxy SSH_AGENT_PID SSH_AUTH_SOCK BB_SRCREV_POLICY SDKMACHINE BB_NUMBER_THREADS PARALLEL_MAKE GIT_PROXY_COMMAND SOCKS5_PASSWD SOCSK5_USER"
> >>> --
> >>> 1.7.3.4
> >> 
> >> Ping on this patch
> >> 
> > Kumar,
> > 
> > I think you were asked to modify this patch so that the additinal
> SOCKS5_* do not get into sstate, Paul Eggleton provided the
> BB_HASHSPACE_WHITELIST info.
> > 
> > Please update this patch
> > 
> > Thanks
> > 	Sau!
> 
> From the thread it sounded as if that was NOT needed.  As nothing
> refers to SOCKS5_* we didn't need to add it.  Much like how it doesn't
> have SSH_AGENT_PID or SSH_AUTH_SOCK in it.

It would be good is someone could confirm it but its in the environment
so it likely is needed.

Cheers,

Richard



