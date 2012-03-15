Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1S8AbT-0003zA-PN for openembedded-core@lists.openembedded.org;
	Thu, 15 Mar 2012 14:20:28 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q2FDBf6o021702
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Mar 2012 13:11:41 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 20946-07 for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Mar 2012 13:11:36 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q2FDBVjq021682
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Mar 2012 13:11:33 GMT
Message-ID: <1331817091.18586.80.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Thu, 15 Mar 2012 13:11:31 +0000
In-Reply-To: <1331813535-9763-1-git-send-email-obi@opendreambox.org>
References: <1331813535-9763-1-git-send-email-obi@opendreambox.org>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH] mirrors.bbclass: remove dead GNU mirrors
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
X-List-Received-Date: Thu, 15 Mar 2012 13:20:28 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2012-03-15 at 13:12 +0100, Andreas Oberritter wrote:
> * ftp.matrix.com.br and sunsite.ust.hk don't have DNS records.
> * ftp.cs.ubc.ca doesn't host the referenced directory.
> * ftp.ayamura.org doesn't respond to ping or ftp.
> 
> Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
> ---
>  meta/classes/mirrors.bbclass |    4 ----
>  1 files changed, 0 insertions(+), 4 deletions(-)
> 
> diff --git a/meta/classes/mirrors.bbclass b/meta/classes/mirrors.bbclass
> index c08a3d7..c613595 100644
> --- a/meta/classes/mirrors.bbclass
> +++ b/meta/classes/mirrors.bbclass
> @@ -18,10 +18,6 @@ ${DEBIAN_MIRROR}	ftp://ftp.es.debian.org/debian/pool \n \
>  ${DEBIAN_MIRROR}	ftp://ftp.se.debian.org/debian/pool \n \
>  ${DEBIAN_MIRROR}	ftp://ftp.tr.debian.org/debian/pool \n \
>  ${GNU_MIRROR}	ftp://mirrors.kernel.org/gnu \n \
> -${GNU_MIRROR}	ftp://ftp.matrix.com.br/pub/gnu \n \
> -${GNU_MIRROR}	ftp://ftp.cs.ubc.ca/mirror2/gnu \n \
> -${GNU_MIRROR}	ftp://sunsite.ust.hk/pub/gnu \n \
> -${GNU_MIRROR}	ftp://ftp.ayamura.org/pub/gnu \n \
>  ${KERNELORG_MIRROR}	http://www.kernel.org/pub \n \
>  ${KERNELORG_MIRROR}	ftp://ftp.us.kernel.org/pub \n \
>  ${KERNELORG_MIRROR}	ftp://ftp.uk.kernel.org/pub \n \

Merged to master, thanks.

Richard



