Return-Path: <obi@opendreambox.org>
Received: from mail.dream-property.net (mail.dream-property.net
	[82.149.226.172])
	by mail.openembedded.org (Postfix) with ESMTP id 46F4A6DF23
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Dec 2013 12:50:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mail.dream-property.net (Postfix) with ESMTP id B87BA31481E4;
	Thu,  5 Dec 2013 13:50:15 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at mail.dream-property.net
Received: from mail.dream-property.net ([127.0.0.1])
	by localhost (mail.dream-property.net [127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id 0vfe_cQeMksW; Thu,  5 Dec 2013 13:50:13 +0100 (CET)
Received: from [172.22.22.61] (unknown [212.255.228.66])
	(using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mail.dream-property.net (Postfix) with ESMTPSA id A240731481E3;
	Thu,  5 Dec 2013 13:50:13 +0100 (CET)
Message-ID: <52A07685.6020302@opendreambox.org>
Date: Thu, 05 Dec 2013 13:50:13 +0100
From: Andreas Oberritter <obi@opendreambox.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.1.1
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <1382009488-6120-1-git-send-email-obi@opendreambox.org>
	<1382009488-6120-4-git-send-email-obi@opendreambox.org>
In-Reply-To: <1382009488-6120-4-git-send-email-obi@opendreambox.org>
Subject: Re: [PATCH 4/4] cogl-1.0: explicitly disable cairo
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 05 Dec 2013 12:50:16 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Ping.

On 17.10.2013 13:31, Andreas Oberritter wrote:
> - Cairo was auto-detected, but not listed as a dependency.
> 
> Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
> ---
>  meta/recipes-graphics/cogl/cogl-1.0.inc | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/meta/recipes-graphics/cogl/cogl-1.0.inc b/meta/recipes-graphics/cogl/cogl-1.0.inc
> index 0c4e86d..11810ef 100644
> --- a/meta/recipes-graphics/cogl/cogl-1.0.inc
> +++ b/meta/recipes-graphics/cogl/cogl-1.0.inc
> @@ -33,6 +33,7 @@ EXTRA_OECONF += "--disable-introspection	\
>  	       	 --enable-examples-install	\
>  	       	 --enable-debug		 	\
>  	       	 --disable-gles1		\
> +	         --disable-cairo                \
>  	    	"
>  
>  # OpenGL/GLX
> 


