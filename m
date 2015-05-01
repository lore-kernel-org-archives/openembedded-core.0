Return-Path: <joshua.lock@collabora.co.uk>
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [93.93.135.160])
	by mail.openembedded.org (Postfix) with ESMTP id BBA507169F
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 May 2015 10:52:14 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(Authenticated sender: joshuagl) with ESMTPSA id 4D164600387
Message-ID: <1430477533.3318.7.camel@collabora.co.uk>
From: Joshua Lock <joshua.lock@collabora.co.uk>
To: Chunrong Guo <B40290@freescale.com>
Date: Fri, 01 May 2015 11:52:13 +0100
In-Reply-To: <1430210184-2629-1-git-send-email-B40290@freescale.com>
References: <1430210184-2629-1-git-send-email-B40290@freescale.com>
X-Mailer: Evolution 3.16.1 (3.16.1-1.fc22) 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [fido][PATCH] groff: add runtime dependency on sed
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
X-List-Received-Date: Fri, 01 May 2015 10:52:15 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2015-04-28 at 16:36 +0800, Chunrong Guo wrote:
>   This is to suppress the following QA warning:
>   groff-1.22.2: groff requires /bin/sed, but no providers in its 
> RDEPENDS [file-rdeps]
> 
> Signed-off-by: Chunrong Guo <B40290@freescale.com>

This patch is queued in my fido-next branch on poky-contrib[1].

Regards,

Joshua

> ---
>  meta/recipes-extended/groff/groff_1.22.2.bb | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/meta/recipes-extended/groff/groff_1.22.2.bb 
> b/meta/recipes-extended/groff/groff_1.22.2.bb
> index 6e84587..dd345b7 100644
> --- a/meta/recipes-extended/groff/groff_1.22.2.bb
> +++ b/meta/recipes-extended/groff/groff_1.22.2.bb
> @@ -17,6 +17,7 @@ SRC_URI[sha256sum] = 
> "380864dac4772e0c0d7b1282d25d0c5fd7f63baf45c87c4657afed22a1
>  
>  DEPENDS = "groff-native"
>  DEPENDS_class-native = ""
> +RDEPENDS_${PN} += "sed"
>  
>  inherit autotools texinfo
>  
> -- 
> 1.9.2
> 

