Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RnAuS-0001i0-CC for openembedded-core@lists.openembedded.org;
	Tue, 17 Jan 2012 16:25:17 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q0HFHRhC006298;
	Tue, 17 Jan 2012 15:17:27 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 06033-05; Tue, 17 Jan 2012 15:17:23 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q0HFHKaj006292
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Tue, 17 Jan 2012 15:17:21 GMT
Message-ID: <1326813445.14640.0.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Tue, 17 Jan 2012 15:17:25 +0000
In-Reply-To: <1326799711-31142-1-git-send-email-andrei@gherzan.ro>
References: <1326799711-31142-1-git-send-email-andrei@gherzan.ro>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: flocirel@gmail.com, Andrei Gherzan <andrei.gherzan@windriver.com>
Subject: Re: [PATCH] busybox uglic: remove obsolete check for "kernel24"
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
X-List-Received-Date: Tue, 17 Jan 2012 15:25:17 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2012-01-17 at 13:28 +0200, Andrei Gherzan wrote:
> From: Andrei Gherzan <andrei.gherzan@windriver.com>
> 
> Busybox checks if MACHINE_FEATURES contains "kernel24". If so, CONFIG_FEATURE_2_4_MODULES will be on "y".
> kernel24 is no longer present in any machine configuration. The same situation is in uglibc with a
> different CONFIG mapping.
> 
> [YOCTO #1901]
> 
> Signed-off-by: Andrei Gherzan <andrei@gherzan.ro>
> ---
>  meta/recipes-core/busybox/busybox.inc      |    4 +---
>  meta/recipes-core/uclibc/uclibc-config.inc |    4 +---
>  2 files changed, 2 insertions(+), 6 deletions(-)

Merged to master with minor tweaks to the commit shortlog, thanks.

Richard



