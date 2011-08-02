Received: from mail-pz0-f43.google.com ([209.85.210.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Qo4pq-0000B7-Qh
	for openembedded-core@lists.openembedded.org;
	Tue, 02 Aug 2011 04:35:59 +0200
Received: by pzk1 with SMTP id 1so12402761pzk.16
	for <openembedded-core@lists.openembedded.org>;
	Mon, 01 Aug 2011 19:31:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:organization:user-agent:in-reply-to
	:references:mime-version:content-transfer-encoding:content-type;
	bh=mO7oQgK6OgifdZ7YbrXBKRFjWL64qC4w7LmKRidL9q4=;
	b=Z4qSKWxMOJu+HynwTS+w7smgxTqQEedTrJjx/x9hLCYKltlhxawGeXDMDtgFSB6kcR
	E22xjXYAa0Q08Z0QN1a3qDZO60JEL7r9bZlGN2DoNd9nR/L9MEsb7ibf6OYBJ3zFq7wr
	W3yY0ZDE2KJ6E3hbeTIiX87h0GxVOxq7wlnrw=
Received: by 10.68.60.99 with SMTP id g3mr933555pbr.127.1312252296898;
	Mon, 01 Aug 2011 19:31:36 -0700 (PDT)
Received: from perseus.localnet (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id v2sm5980363pbi.51.2011.08.01.19.31.35
	(version=SSLv3 cipher=OTHER); Mon, 01 Aug 2011 19:31:36 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Mon, 01 Aug 2011 19:31:34 -0700
Message-ID: <1443716.1agPb8MbFj@perseus>
Organization: Sakrah
User-Agent: KMail/4.7.0  (Linux/2.6.38-10-generic; KDE/4.7.0; i686; ; )
In-Reply-To: <1312233054-8118-1-git-send-email-schnitzeltony@gmx.de>
References: <1312233054-8118-1-git-send-email-schnitzeltony@gmx.de>
MIME-Version: 1.0
Subject: Re: [angstrom] xfce-base-image: Add image for xfce48 desktop image
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
X-List-Received-Date: Tue, 02 Aug 2011 02:35:59 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Monday, August 01, 2011 11:10:54 PM Andreas Mueller wrote:
> * This patch requires patch series [1] to be committed in meta-oe
> 
> [1]
> http://lists.linuxtogo.org/pipermail/openembedded-devel/2011-August/034221.
> html
> 
> Signed-off-by: Andreas Mueller <schnitzeltony@gmx.de>
> ---
>  recipes-angstrom/images/xfce-base-image.bb |   26
> ++++++++++++++++++++++++++ 1 files changed, 26 insertions(+), 0
> deletions(-)
>  create mode 100644 recipes-angstrom/images/xfce-base-image.bb
> 

this recipe belongs to meta-angstrom or may be meta-xfce

> diff --git a/recipes-angstrom/images/xfce-base-image.bb
> b/recipes-angstrom/images/xfce-base-image.bb new file mode 100644
> index 0000000..80f5062
> --- /dev/null
> +++ b/recipes-angstrom/images/xfce-base-image.bb
> @@ -0,0 +1,26 @@
> +LICENSE = "MIT"
> +LIC_FILES_CHKSUM =
> "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58" +PR =
> "r0"
> +
> +require console-base-image.bb
> +
> +export IMAGE_BASENAME = "xfce-base-image"
> +
> +XSERVER ?= " \
> +    xserver-xorg \
> +    xf86-input-evdev \
> +    xf86-input-mouse \
> +    xf86-video-fbdev \
> +    xf86-input-keyboard \
> +"
> +
> +IMAGE_INSTALL += " \
> +    ${XSERVER} \
> +    task-base-extended \
> +    task-xfce-base \
> +    xserver-common \
> +#    xserver-nodm-init \
> +    ttf-dejavu-sans ttf-dejavu-sans-mono ttf-dejavu-common \
> +"
> +
> +inherit image
-- 
Khem Raj


