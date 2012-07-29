Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SvPqS-0001qc-LB for openembedded-core@lists.openembedded.org;
	Sun, 29 Jul 2012 11:31:28 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q6T9JtLE026877
	for <openembedded-core@lists.openembedded.org>;
	Sun, 29 Jul 2012 10:19:55 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 18628-09 for <openembedded-core@lists.openembedded.org>;
	Sun, 29 Jul 2012 10:19:51 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q6T9JW1v026871
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 29 Jul 2012 10:19:44 +0100
Message-ID: <1343553570.16998.25.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Sun, 29 Jul 2012 10:19:30 +0100
In-Reply-To: <46e10fa82df93bea00d11334830c05fff662334c.1343425855.git.peter.seebach@windriver.com>
References: <cover.1343425855.git.peter.seebach@windriver.com>
	<46e10fa82df93bea00d11334830c05fff662334c.1343425855.git.peter.seebach@windriver.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 1/1] pseudo.inc/pseudo_1.4.bb: update pseudo to 1.4
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
X-List-Received-Date: Sun, 29 Jul 2012 09:31:29 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2012-07-27 at 16:54 -0500, Peter Seebach wrote:
> This update replaces the half-baked --arch logic with the use
> of $CFLAGS to pick compiler flags, on the grounds that it makes
> a lot more sense for the build system to pick flags than for
> pseudo to try to guess what they should be; this should allow
> pseudo to at least compile for targets, and possibly run on
> them.
> 
> This doesn't solve the problem of guessing how to forcibly
> build the 32-bit variant on hosts, because we really don't
> have a general solution for that. There's no idiom for "given
> this set of compiler flags and this architecture, what flags
> would you use to request a 32-bit compile instead?" So we
> basically ignore that for now. If someone comes along trying
> to use the build system to build pseudo-native on a 64-bit
> host that also supports 32-bit binaries and isn't x86, we
> will revisit this.
> ---
>  meta/recipes-devtools/pseudo/pseudo.inc      |   12 +++++++++---
>  meta/recipes-devtools/pseudo/pseudo_1.3.1.bb |    8 --------
>  meta/recipes-devtools/pseudo/pseudo_1.4.bb   |    8 ++++++++
>  meta/recipes-devtools/pseudo/pseudo_git.bb   |    8 ++++----
>  4 files changed, 21 insertions(+), 15 deletions(-)
>  delete mode 100644 meta/recipes-devtools/pseudo/pseudo_1.3.1.bb
>  create mode 100644 meta/recipes-devtools/pseudo/pseudo_1.4.bb


Merged to master, thanks.

Richard



