Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RLCFJ-0000JZ-7A for openembedded-core@lists.openembedded.org;
	Tue, 01 Nov 2011 12:11:09 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pA1B50Aa027668
	for <openembedded-core@lists.openembedded.org>;
	Tue, 1 Nov 2011 11:05:00 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 27585-01 for <openembedded-core@lists.openembedded.org>;
	Tue,  1 Nov 2011 11:04:56 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pA1B4qQw027658
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 1 Nov 2011 11:04:54 GMT
Message-ID: <1320145492.13918.2.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Tue, 01 Nov 2011 11:04:52 +0000
In-Reply-To: <1320103860-20847-1-git-send-email-Martin.Jansa@gmail.com>
References: <1320103860-20847-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: Evolution 3.2.1- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH] bitbake.conf: drop STAGING_PYDIR
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
X-List-Received-Date: Tue, 01 Nov 2011 11:11:09 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2011-11-01 at 00:31 +0100, Martin Jansa wrote:
> * seems unused in oe-core
> 
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  meta/conf/bitbake.conf |    1 -
>  1 files changed, 0 insertions(+), 1 deletions(-)
> 
> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> index e2c1b6f..d0235ba 100644
> --- a/meta/conf/bitbake.conf
> +++ b/meta/conf/bitbake.conf
> @@ -345,7 +345,6 @@ STAGING_DATADIR = "${STAGING_DIR_HOST}${datadir}"
>  STAGING_EXECPREFIXDIR = "${STAGING_DIR_HOST}${exec_prefix}"
>  STAGING_LOADER_DIR = "${STAGING_DIR_HOST}/loader"
>  STAGING_FIRMWARE_DIR = "${STAGING_DIR_HOST}/firmware"
> -STAGING_PYDIR = "${STAGING_DIR}/lib/python2.4"
>  
>  STAGING_DIR_TARGET = "${STAGING_DIR}/${MACHINE}"
>  STAGING_DIR_TCBOOTSTRAP = "${STAGING_DIR_TARGET}-tcbootstrap"

Merged to master, thanks.

Richard



