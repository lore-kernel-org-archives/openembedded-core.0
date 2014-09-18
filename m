Return-Path: <net147@gmail.com>
Received: from mail-qc0-f169.google.com (mail-qc0-f169.google.com
	[209.85.216.169])
	by mail.openembedded.org (Postfix) with ESMTP id 8DB8A6FC4A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Sep 2014 07:45:18 +0000 (UTC)
Received: by mail-qc0-f169.google.com with SMTP id r5so708981qcx.28
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Sep 2014 00:45:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=e+C3GF67E8u6oTd33zaXLwVqlSKk4LP9wOU4F8nhqjg=;
	b=JRIQdmMuTqht09ppFWHg/7qO30lb8hrZ0cAurWCRr+JEjXXw5PQRDfHpHx2kXOKGFx
	oGD1hcjvd8fEI24NIk/8SLlNgnOBpMNKSK0y+qy9G+pBzVxMft8tVKrCWAROaHsg5N7R
	0dB0oMtIY7nt9FDgyEP3UDTgwt06YAFZwV4WpH1BJJLDb5ZGjc7zhY9jN78lpLSj1zL8
	RMAbxAbfNp1SFALui2Tr+xs30tj47OYRjd6XW5zUo4eWLiq/eUpWp56Nkx2cjkhQkHdJ
	uzx97AZDh+iUNEIri19dGSrrDwHyfByHKK6E/E1hjHnLdszTAbLtbaKWtx74zlxV6/iL
	ca8Q==
MIME-Version: 1.0
X-Received: by 10.224.111.193 with SMTP id t1mr5225494qap.103.1411026319398;
	Thu, 18 Sep 2014 00:45:19 -0700 (PDT)
Received: by 10.96.4.133 with HTTP; Thu, 18 Sep 2014 00:45:19 -0700 (PDT)
In-Reply-To: <1409320119-25825-1-git-send-email-net147@gmail.com>
References: <1409320119-25825-1-git-send-email-net147@gmail.com>
Date: Thu, 18 Sep 2014 17:45:19 +1000
Message-ID: <CANwerB1ifwVuZdixcEpOBNeKX6C-o-p6Vr1fPZrZ1A33eBD_CA@mail.gmail.com>
From: Jonathan Liu <net147@gmail.com>
To: Saul Wold <sgw@linux.intel.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [daisy][PATCH] qemu: Explicitly disable libiscsi, its not in DEPENDS
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
X-List-Received-Date: Thu, 18 Sep 2014 07:45:23 -0000
Content-Type: text/plain; charset=UTF-8

On 29 August 2014 23:48, Jonathan Liu <net147@gmail.com> wrote:
> Signed-off-by: Jonathan Liu <net147@gmail.com>
> ---
>  meta/recipes-devtools/qemu/qemu.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
> index 2702986..472988d 100644
> --- a/meta/recipes-devtools/qemu/qemu.inc
> +++ b/meta/recipes-devtools/qemu/qemu.inc
> @@ -26,7 +26,7 @@ SRC_URI_append_class-native = "\
>      file://fix-libcap-header-issue-on-some-distro.patch \
>      "
>
> -EXTRA_OECONF += "--target-list=${@get_qemu_target_list(d)} --disable-werror --audio-drv-list=oss,alsa --disable-bluez --with-system-pixman --extra-cflags='${CFLAGS}'"
> +EXTRA_OECONF += "--target-list=${@get_qemu_target_list(d)} --disable-werror --audio-drv-list=oss,alsa --disable-bluez --disable-libiscsi --with-system-pixman --extra-cflags='${CFLAGS}'"
>
>  EXTRA_OECONF_class-nativesdk = "--target-list=${@get_qemu_target_list(d)} --disable-werror \
>                                 "
> --
> 2.0.3
>

Ping.

Regards,
Jonathan

