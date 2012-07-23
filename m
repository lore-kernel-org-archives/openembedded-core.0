Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1StL0K-0006fk-Pl for openembedded-core@lists.openembedded.org;
	Mon, 23 Jul 2012 17:57:04 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q6NFjcGK022942
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Jul 2012 16:45:38 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 04261-10 for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Jul 2012 16:45:34 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q6NFjSXR022936
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Jul 2012 16:45:30 +0100
Message-ID: <1343058327.21788.98.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Mon, 23 Jul 2012 16:45:27 +0100
In-Reply-To: <1343053509-5931-1-git-send-email-Martin.Jansa@gmail.com>
References: <1343053509-5931-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [RFC] bitbake.conf: exclude whole MACHINEOVERRIDES from OVERRIDES vardeps
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
X-List-Received-Date: Mon, 23 Jul 2012 15:57:05 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2012-07-23 at 16:25 +0200, Martin Jansa wrote:
> * whole MACHINEOVERRIDES can change e.g. between MACHINES with different arm architecture, causing allarch packages to reexecute do_package
>   bitbake-diffsigs ../shr-core/tmp-eglibc/stamps/all-oe-linux/xserver-nodm-init-2.0-r16.do_package.sigdata.90e760a8f6cecbd87cb2e95f1237e3cc ../shr-core/tmp-eglibc/stamps/all-oe-linux/xserver-nodm-init-2.0-r16.do_package.sigdata.9eeccfd15f25032b3b6b132534660fff
>   basehash changed from 7618e17d3fda05d1f15246e6800ca0f0 to 97bc4dc8c1521c535bd96b2aa62d8a03
>   Variable MACHINEOVERRIDES value changed from ${MACHINE}${@bb.utils.contains("TUNE_FEATURES", "armv5", ":armv5", "" ,d)}${@bb.utils.contains("TUNE_FEATURES", "armv4", ":armv4", "" ,d)}:${MACHINE_CLASS} to ${MACHINE}${@bb.utils.contains("TUNE_FEATURES", "armv7a", ":armv7a", "" ,d)}${@bb.utils.contains("TUNE_FEATURES", "armv6", ":armv6", "" ,d)}${@bb.utils.contains("TUNE_FEATURES", "armv5", ":armv5", "" ,d)}${@bb.utils.contains("TUNE_FEATURES", "armv4", ":armv4", "" ,d)}:${MACHINE_CLASS}
> 
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  meta/conf/bitbake.conf |    1 +
>  1 files changed, 1 insertions(+), 0 deletions(-)

Won't this hide genuine changes where things should get rebuilt too?

Cheers,

Richard



