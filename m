Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RQyoK-00083Q-Cf for openembedded-core@lists.openembedded.org;
	Thu, 17 Nov 2011 11:03:12 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pAH9umDw015099
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Nov 2011 09:56:48 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 14210-10 for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Nov 2011 09:56:44 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pAH9ugfm015092
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Nov 2011 09:56:43 GMT
Message-ID: <1321523807.18905.11.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Thu, 17 Nov 2011 09:56:47 +0000
In-Reply-To: <1321523310-29625-2-git-send-email-heinold@inf.fu-berlin.de>
References: <1321523310-29625-1-git-send-email-heinold@inf.fu-berlin.de>
	<1321523310-29625-2-git-send-email-heinold@inf.fu-berlin.de>
X-Mailer: Evolution 3.2.1- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH] useradd.bbclass: do not let depend native packages on base-passwd from target
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
X-List-Received-Date: Thu, 17 Nov 2011 10:03:12 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2011-11-17 at 10:48 +0100, Henning Heinold wrote:
> Signed-off-by: Henning Heinold <heinold@inf.fu-berlin.de>
> ---
>  meta/classes/useradd.bbclass |    1 +
>  1 files changed, 1 insertions(+), 0 deletions(-)
> 
> diff --git a/meta/classes/useradd.bbclass b/meta/classes/useradd.bbclass
> index 928f619..245588b 100644
> --- a/meta/classes/useradd.bbclass
> +++ b/meta/classes/useradd.bbclass
> @@ -3,6 +3,7 @@
>  # and support files needed to add and modify user and group accounts
>  DEPENDS_append = "${USERADDDEPENDS}"
>  USERADDDEPENDS = " base-passwd shadow-native shadow-sysroot shadow"
> +USERADDDEPENDS_virtclass-native = ""
>  USERADDDEPENDS_virtclass-nativesdk = ""
>  
>  # This preinstall function will be run in two contexts: once for the


Do we also need to do this for:

SYSROOTFUNC = "useradd_sysroot"
SYSROOTFUNC_virtclass-nativesdk = ""

and

SYSROOTPOSTFUNC = "useradd_sysroot_sstate"
SYSROOTPOSTFUNC_virtclass-nativesdk = ""

?

Cheers,

Richard



