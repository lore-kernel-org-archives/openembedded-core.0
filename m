Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RRPWt-0002by-EB for openembedded-core@lists.openembedded.org;
	Fri, 18 Nov 2011 15:35:01 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pAIESX1D030534;
	Fri, 18 Nov 2011 14:28:33 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 30490-01; Fri, 18 Nov 2011 14:28:29 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pAIESNHv030528
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Fri, 18 Nov 2011 14:28:24 GMT
Message-ID: <1321626509.15352.16.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Fri, 18 Nov 2011 14:28:29 +0000
In-Reply-To: <1321617588-18376-1-git-send-email-heinold@inf.fu-berlin.de>
References: <1321617588-18376-1-git-send-email-heinold@inf.fu-berlin.de>
X-Mailer: Evolution 3.2.1- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: Colin Walters <walters@verbum.org>
Subject: Re: [PATCH] glib-2.0: fix qsort_t testing for uclibc
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
X-List-Received-Date: Fri, 18 Nov 2011 14:35:01 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2011-11-18 at 12:59 +0100, Henning Heinold wrote:
> * instead of disabling the configure test and set it always true
>   use the site files to set it true for glibc/eglibc and false
>   for uclibc
> * remove the patch
> ' tested only for uclibc
> * bump PR
> 
> Signed-off-by: Henning Heinold <heinold@inf.fu-berlin.de>
> ---
>  .../glib-2.0/remove.test.for.qsort_r.patch         |   53 --------------------
>  meta/recipes-core/glib-2.0/glib-2.0_2.30.0.bb      |    6 +--
>  meta/site/common-glibc                             |    1 +
>  meta/site/common-uclibc                            |    1 +
>  4 files changed, 3 insertions(+), 58 deletions(-)
>  delete mode 100644 meta/recipes-core/glib-2.0/glib-2.0/remove.test.for.qsort_r.patch

Merged to master, thanks. I'd been meaning to remove this patch!

Colin: Its one issue fixed at least :)

Cheers,

Richard



