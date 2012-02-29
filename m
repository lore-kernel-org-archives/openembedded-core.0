Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1S2jD8-0000kz-4j for openembedded-core@lists.openembedded.org;
	Wed, 29 Feb 2012 14:04:50 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q1TCuMYV030030
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Feb 2012 12:56:22 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 28765-09 for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Feb 2012 12:56:18 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q1TCuCAt030024
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Feb 2012 12:56:13 GMT
Message-ID: <1330520175.24508.39.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Wed, 29 Feb 2012 12:56:15 +0000
In-Reply-To: <515e5d34c437e37115e4005738a2b2c8055508cf.1330494042.git.otavio@ossystems.com.br>
References: <cover.1330494042.git.otavio@ossystems.com.br>
	<515e5d34c437e37115e4005738a2b2c8055508cf.1330494042.git.otavio@ossystems.com.br>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 2/3] image_types.bbclass: properly support IMAGE_LINK_NAME as empty
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
X-List-Received-Date: Wed, 29 Feb 2012 13:04:50 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2012-02-29 at 05:41 +0000, Otavio Salvador wrote:
> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
> ---
>  meta/classes/image_types.bbclass |   14 +++++++++-----
>  1 files changed, 9 insertions(+), 5 deletions(-)
> 
> diff --git a/meta/classes/image_types.bbclass b/meta/classes/image_types.bbclass
> index 74071c1..f9ed49f 100644
> --- a/meta/classes/image_types.bbclass
> +++ b/meta/classes/image_types.bbclass
> @@ -25,7 +25,9 @@ def get_imagecmds(d):
>              types.append("ext3")
>          types.remove("live")
>  
> -    cmds += "	rm -f ${DEPLOY_DIR_IMAGE}/${IMAGE_LINK_NAME}.*"
> +    if len(d.getVar('IMAGE_LINK_NAME', True)) > 0:
> +        cmds += "	rm -f ${DEPLOY_DIR_IMAGE}/${IMAGE_LINK_NAME}.*"
> +

I took this but I removed the unneeded len() above.

Cheers,

Richard



