Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RKzol-00009A-6h for openembedded-core@lists.openembedded.org;
	Mon, 31 Oct 2011 22:54:56 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p9VLmlmj021767
	for <openembedded-core@lists.openembedded.org>;
	Mon, 31 Oct 2011 21:48:47 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 20466-10 for <openembedded-core@lists.openembedded.org>;
	Mon, 31 Oct 2011 21:48:43 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p9VLmdk7021761
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 31 Oct 2011 21:48:40 GMT
Message-ID: <1320097718.15599.19.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Mon, 31 Oct 2011 21:48:38 +0000
In-Reply-To: <1e2bfd8a59cefe4357257ef14f027d08ff7b29dc.1320082621.git.Martin.Jansa@gmail.com>
References: <cover.1320082621.git.Martin.Jansa@gmail.com>
	<1e2bfd8a59cefe4357257ef14f027d08ff7b29dc.1320082621.git.Martin.Jansa@gmail.com>
X-Mailer: Evolution 3.2.1- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [oe-core 7/7] bitbake.conf: update STAGING_PYDIR to 2.7 version
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
X-List-Received-Date: Mon, 31 Oct 2011 21:54:56 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2011-10-31 at 18:41 +0100, Martin Jansa wrote:
> * is it still used somewhere?
>   seems unused in oe-core
> 
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  meta/conf/bitbake.conf |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
> 
> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> index e2c1b6f..e9dec10 100644
> --- a/meta/conf/bitbake.conf
> +++ b/meta/conf/bitbake.conf
> @@ -345,7 +345,7 @@ STAGING_DATADIR = "${STAGING_DIR_HOST}${datadir}"
>  STAGING_EXECPREFIXDIR = "${STAGING_DIR_HOST}${exec_prefix}"
>  STAGING_LOADER_DIR = "${STAGING_DIR_HOST}/loader"
>  STAGING_FIRMWARE_DIR = "${STAGING_DIR_HOST}/firmware"
> -STAGING_PYDIR = "${STAGING_DIR}/lib/python2.4"
> +STAGING_PYDIR = "${STAGING_DIR}/lib/python2.7"

Given this has been pointing somewhere totally invalid for a while I'd
suggest we just drop this variable...

Cheers,

Richard



