Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RaYRg-0002vJ-1U for openembedded-core@lists.openembedded.org;
	Tue, 13 Dec 2011 20:55:24 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pBDJmSIS013702
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Dec 2011 19:48:28 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 13216-06 for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Dec 2011 19:48:24 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pBDJmIi2013696
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Dec 2011 19:48:19 GMT
Message-ID: <1323805698.25491.12.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Tue, 13 Dec 2011 19:48:18 +0000
In-Reply-To: <1323793193-31090-9-git-send-email-dbaryshkov@gmail.com>
References: <1323793193-31090-1-git-send-email-dbaryshkov@gmail.com>
	<1323793193-31090-9-git-send-email-dbaryshkov@gmail.com>
X-Mailer: Evolution 3.2.1- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 9/9] libatomic-ops: drop directory with documentation to remove QA warning
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
X-List-Received-Date: Tue, 13 Dec 2011 19:55:24 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2011-12-13 at 20:19 +0400, Dmitry Eremin-Solenikov wrote:
> Signed-off-by: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
> ---
>  .../pulseaudio/libatomics-ops_1.2.bb               |    3 ++-
>  1 files changed, 2 insertions(+), 1 deletions(-)
> 
> diff --git a/meta/recipes-multimedia/pulseaudio/libatomics-ops_1.2.bb b/meta/recipes-multimedia/pulseaudio/libatomics-ops_1.2.bb
> index 184c167..f81aeb6 100644
> --- a/meta/recipes-multimedia/pulseaudio/libatomics-ops_1.2.bb
> +++ b/meta/recipes-multimedia/pulseaudio/libatomics-ops_1.2.bb
> @@ -26,5 +26,6 @@ ARM_INSTRUCTION_SET = "arm"
>  inherit autotools pkgconfig
>  
>  do_install_append() {
> -	mv ${D}${datadir}/libatomic_ops ${D}${datadir}/libatomic-ops || true
> +	# those contain only docs, not necessary for now.
> +	rm -rf ${D}${datadir}/libatomic_ops || true
>  }

Shouldn't we move that to docdir/${PN}?

Cheers,

Richard




