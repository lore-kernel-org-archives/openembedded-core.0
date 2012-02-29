Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1S2jA9-0000fO-Bl for openembedded-core@lists.openembedded.org;
	Wed, 29 Feb 2012 14:01:46 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q1TCrGe9029928
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Feb 2012 12:53:16 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 28765-07 for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Feb 2012 12:53:10 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q1TCr8Sb029922
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Feb 2012 12:53:09 GMT
Message-ID: <1330519991.24508.37.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Wed, 29 Feb 2012 12:53:11 +0000
In-Reply-To: <1330498590-29895-1-git-send-email-james@digitalmatter.com.au>
References: <1330498590-29895-1-git-send-email-james@digitalmatter.com.au>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH] busybox: Enable 64 bit shell tests, and disable non-standard date format interpretation.
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
X-List-Received-Date: Wed, 29 Feb 2012 13:01:46 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2012-02-29 at 14:56 +0800, James Limbouris wrote:
> Without 64 bit shell tests, the timestamp comparison in initscripts' bootmisc.sh throws 'out of range' errors.
> With CONFIG_FEATURE_DATE_COMPAT, date reads the YYYYMMddhhmm string as hhmmYYYYMMdd when setting the time from the timestamp in bootmisc.sh.
> 
> Signed-off-by: James Limbouris <james@digitalmatter.com.au>
> ---
>  meta/recipes-core/busybox/busybox-1.19.3/defconfig |    4 ++--
>  1 files changed, 2 insertions(+), 2 deletions(-)

Merged to master, thanks.

Richard



