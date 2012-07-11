Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SouH8-00042a-Qm for openembedded-core@lists.openembedded.org;
	Wed, 11 Jul 2012 12:36:07 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q6BAOtfc002804
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Jul 2012 11:24:55 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 00772-10 for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Jul 2012 11:24:49 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q6BAOl7V002798
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Jul 2012 11:24:48 +0100
Message-ID: <1342002288.7934.2.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Wed, 11 Jul 2012 11:24:48 +0100
In-Reply-To: <1341949535-2466-1-git-send-email-msm@freescale.com>
References: <1341949535-2466-1-git-send-email-msm@freescale.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH] openjade-native_1.3.2.bb: fix typo and change the deps exclusion to correct var
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
X-List-Received-Date: Wed, 11 Jul 2012 10:36:07 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2012-07-10 at 14:45 -0500, Matthew McClintock wrote:
> Signed-off-by: Matthew McClintock <msm@freescale.com>
> ---
>  meta/recipes-devtools/openjade/openjade-native_1.3.2.bb |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta/recipes-devtools/openjade/openjade-native_1.3.2.bb b/meta/recipes-devtools/openjade/openjade-native_1.3.2.bb
> index a539c35..266210d 100644
> --- a/meta/recipes-devtools/openjade/openjade-native_1.3.2.bb
> +++ b/meta/recipes-devtools/openjade/openjade-native_1.3.2.bb
> @@ -33,7 +33,7 @@ CONFIGUREOPTS := "${@d.getVar('CONFIGUREOPTS', True).replace('--datadir=${datadi
>  # CONFIGUREOPTS has hard coded paths so we need to ignore it's vardeps
>  # there are other bits in there too but they are picked up by other variable
>  # dependencies so it all works out
> -do_configure[vardepsexclude] += "CONNFIGUREOPTS"
> +oe_runconf[vardepsexclude] += "CONFIGUREOPTS"
>  
>  CFLAGS =+ "-I${S}/include"
>  

Merged to master, thanks.

Richard



