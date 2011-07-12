Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1Qgduw-0000rV-3D for openembedded-core@lists.openembedded.org;
	Tue, 12 Jul 2011 16:26:30 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p6CEMXdu021047
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Jul 2011 15:22:33 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 20598-10 for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Jul 2011 15:22:29 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p6CEMSBG021041
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Jul 2011 15:22:28 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <901d1d04284eaa806af61557f46bf35c07970b01.1310477287.git.paul.eggleton@linux.intel.com>
References: <cover.1310477287.git.paul.eggleton@linux.intel.com>
	<901d1d04284eaa806af61557f46bf35c07970b01.1310477287.git.paul.eggleton@linux.intel.com>
Date: Tue, 12 Jul 2011 15:22:26 +0100
Message-ID: <1310480546.20015.1063.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 1/1] insane.bbclass: skip rdepends QA checks for kernel / modules
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
X-List-Received-Date: Tue, 12 Jul 2011 14:26:30 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2011-07-12 at 14:29 +0100, Paul Eggleton wrote:
> The kernel and module recipes have very few dbg/dev packages, however
> they can easily have false positive results from the rdepends QA checks
> (e.g. kernel-module-lirc-dev). Thus disable these tests for any recipe
> that inherits kernel or module-base.
> 
> Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
> ---
>  meta/classes/insane.bbclass |    5 +++++
>  1 files changed, 5 insertions(+), 0 deletions(-)

Merged to master, thanks.

Richard



