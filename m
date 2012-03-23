Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SB3Nx-0000bI-Ru for openembedded-core@lists.openembedded.org;
	Fri, 23 Mar 2012 13:14:26 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q2NC5Tkh026363
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Mar 2012 12:05:29 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 25941-06 for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Mar 2012 12:05:24 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q2NC5MDm026356
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Mar 2012 12:05:23 GMT
Message-ID: <1332504325.9740.395.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Fri, 23 Mar 2012 12:05:25 +0000
In-Reply-To: <1332471418-31459-1-git-send-email-raj.khem@gmail.com>
References: <1332471418-31459-1-git-send-email-raj.khem@gmail.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 1/2] eglibc-2.15: Update SRCREV
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
X-List-Received-Date: Fri, 23 Mar 2012 12:14:26 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2012-03-22 at 19:56 -0700, Khem Raj wrote:
> Get new patches and remove the one that got merged upstream
> 
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  .../eglibc/eglibc-2.15/GLRO_dl_debug_mask.patch    |  108 ++++++++++++++++++++
>  .../eglibc-2.15/armv4-eabi-compile-fix.patch       |   25 -----
>  .../eglibc/eglibc-2.15/initgroups_keys.patch       |   20 ++++
>  meta/recipes-core/eglibc/eglibc_2.15.bb            |    5 +-
>  4 files changed, 131 insertions(+), 27 deletions(-)
>  create mode 100644 meta/recipes-core/eglibc/eglibc-2.15/GLRO_dl_debug_mask.patch
>  delete mode 100644 meta/recipes-core/eglibc/eglibc-2.15/armv4-eabi-compile-fix.patch
>  create mode 100644 meta/recipes-core/eglibc/eglibc-2.15/initgroups_keys.patch

Since 2.15 isn't the default I'm tempted to merge this despite the point
we're at in the release cycle. I'd like to give anyone using this the
opportunity to comment first though.

Cheers,

Richard



