Return-Path: <net147@gmail.com>
Received: from mail-qc0-f175.google.com (mail-qc0-f175.google.com
	[209.85.216.175])
	by mail.openembedded.org (Postfix) with ESMTP id 37E126F0C9
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Feb 2014 04:38:53 +0000 (UTC)
Received: by mail-qc0-f175.google.com with SMTP id x13so4942071qcv.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Feb 2014 20:38:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=R7QU/nZto6AKQu24cgvCwqDZ8S6VXd7sBbV6n5o5GjE=;
	b=ekRS3xH2g6gFU8rsVuxjD9HgcsCMz3vsV/dXiDYPHYc+/foI8zziDzb0SGGaKWrWh6
	1g0Hry2ezOU8vpJPQXU1aDOyf7uqVGLXz3dhCXHkBUfVMXD/XZOz6g2i57o/8osTlFnt
	SFSzzB/E7aYKjYK3p+M/JhUT6Nt0YXC3qVj/BV+0nFHdiXpFcCfI+XodeQnwNpHqMBCN
	KyA0pklLIT+P42vLCna4ZluOAJ/dP3xTwYu4kTRbGkjyYBUhE6sHGUCLsKQ3gqVCsGGC
	r1dTIf7JiLoWuOD9JlMj9xMpDwilDA0BLJeUPMlT3PJnMP4X8OJA2utUR8i5lL6425Zn
	nsGA==
MIME-Version: 1.0
X-Received: by 10.140.49.109 with SMTP id p100mr6584390qga.52.1392957534649;
	Thu, 20 Feb 2014 20:38:54 -0800 (PST)
Received: by 10.96.78.193 with HTTP; Thu, 20 Feb 2014 20:38:54 -0800 (PST)
In-Reply-To: <1392957672-831-1-git-send-email-net147@gmail.com>
References: <1392957672-831-1-git-send-email-net147@gmail.com>
Date: Fri, 21 Feb 2014 15:38:54 +1100
Message-ID: <CANwerB3t60FeNYq1Snhv=Sabo+_-1w3bg76X6mjw=js=qGZOEg@mail.gmail.com>
From: Jonathan Liu <net147@gmail.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH v3] image_types.bbclass: fix cpio IMAGE_CMD to preserve working directory
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
X-List-Received-Date: Fri, 21 Feb 2014 04:38:56 -0000
Content-Type: text/plain; charset=UTF-8

Whoops, wrong tag. This was meant for OE-core. Resubmitting.

Regards,
Jonathan

On 21 February 2014 15:41, Jonathan Liu <net147@gmail.com> wrote:
> The working directory is changed in a subshell when executing cpio to
> preserve the working directory for any subsequent commands. This is to
> keep the working directory consistent when generating multiple image
> types.
>
> Signed-off-by: Jonathan Liu <net147@gmail.com>
> ---
>  meta/classes/image_types.bbclass | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/classes/image_types.bbclass b/meta/classes/image_types.bbclass
> index 9577b1f..602c1f0 100644
> --- a/meta/classes/image_types.bbclass
> +++ b/meta/classes/image_types.bbclass
> @@ -70,7 +70,7 @@ IMAGE_CMD_cpio () {
>         if [ ! -L ${IMAGE_ROOTFS}/init ]; then
>                 touch ${IMAGE_ROOTFS}/init
>         fi
> -       cd ${IMAGE_ROOTFS} && (find . | cpio -o -H newc >${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.cpio)
> +       (cd ${IMAGE_ROOTFS} && find . | cpio -o -H newc >${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.cpio)
>  }
>
>  ELF_KERNEL ?= "${STAGING_DIR_HOST}/usr/src/kernel/${KERNEL_IMAGETYPE}"
> --
> 1.8.5.4
>

