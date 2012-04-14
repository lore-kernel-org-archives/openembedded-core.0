Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SJ3Lu-0003B9-9F for openembedded-core@lists.openembedded.org;
	Sat, 14 Apr 2012 15:49:22 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q3EDe0lK013793
	for <openembedded-core@lists.openembedded.org>;
	Sat, 14 Apr 2012 14:40:00 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 12528-07 for <openembedded-core@lists.openembedded.org>;
	Sat, 14 Apr 2012 14:39:56 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q3EDdodK013787
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Sat, 14 Apr 2012 14:39:51 +0100
Message-ID: <1334410792.7309.104.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Sat, 14 Apr 2012 14:39:52 +0100
In-Reply-To: <e1cc1d55074d9755f1e7e20a3b07718b40cb9515.1334346682.git.tom.zanussi@intel.com>
References: <cover.1334346682.git.tom.zanussi@intel.com>
	<e1cc1d55074d9755f1e7e20a3b07718b40cb9515.1334346682.git.tom.zanussi@intel.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 1/2] systemtap: fix docproc build error
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
X-List-Received-Date: Sat, 14 Apr 2012 13:49:22 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2012-04-13 at 14:56 -0500, tom.zanussi@intel.com wrote:
> From: Tom Zanussi <tom.zanussi@intel.com>
> 
> When building docs in systemtap, docproc is used to generate the
> tapset documentation, but it gets built for the target, while it needs
> to be build for the host instead.  This change causes that to happen.
> 
> Fixes [YOCTO #2193].
> 
> Signed-off-by: Tom Zanussi <tom.zanussi@intel.com>
> ---
>  .../systemtap/systemtap/docproc-build-fix.patch    |   19 +++++++++++++++++++
>  meta/recipes-kernel/systemtap/systemtap_git.bb     |    6 +++++-
>  meta/recipes-kernel/systemtap/systemtap_git.inc    |    4 +++-
>  3 files changed, 27 insertions(+), 2 deletions(-)
>  create mode 100644 meta/recipes-kernel/systemtap/systemtap/docproc-build-fix.patch

This broke systemtap-uprobes. I've pushed a fix:

http://git.yoctoproject.org/cgit.cgi/poky/commit/?id=45da10943965193fd2d14b756b95e6f0f4ae9029

Cheers,

Richard



