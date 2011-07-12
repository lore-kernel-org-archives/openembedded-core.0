Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QgdlP-0000Vh-IS for openembedded-core@lists.openembedded.org;
	Tue, 12 Jul 2011 16:16:39 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p6CEChjh020984
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Jul 2011 15:12:43 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 19843-09 for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Jul 2011 15:12:39 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p6CECbAx020978
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Jul 2011 15:12:37 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <e06067f253d42feefee8852f159de8a22d3f897b.1310478977.git.paul.eggleton@linux.intel.com>
References: <cover.1310478977.git.paul.eggleton@linux.intel.com>
	<e06067f253d42feefee8852f159de8a22d3f897b.1310478977.git.paul.eggleton@linux.intel.com>
Date: Tue, 12 Jul 2011 15:12:36 +0100
Message-ID: <1310479956.20015.1060.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 1/1] busybox: fix missing features due to lack of variable expansion
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
X-List-Received-Date: Tue, 12 Jul 2011 14:16:39 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2011-07-12 at 14:59 +0100, Paul Eggleton wrote:
> Expand DISTRO_FEATURES and MACHINE_FEATURES fully so that any inner
> variable references (such as DISTRO_FEATURES_LIBC) are expanded properly.
> 
> Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
> ---
>  meta/recipes-core/busybox/busybox.inc       |    4 ++--
>  meta/recipes-core/busybox/busybox_1.18.4.bb |    2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)

Merged to master, thanks.

Richard



