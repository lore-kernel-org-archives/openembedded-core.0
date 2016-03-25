Return-Path: <net147@gmail.com>
Received: from mail-io0-f176.google.com (mail-io0-f176.google.com
	[209.85.223.176])
	by mail.openembedded.org (Postfix) with ESMTP id B753365CC2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Mar 2016 11:35:15 +0000 (UTC)
Received: by mail-io0-f176.google.com with SMTP id c63so114524624iof.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Mar 2016 04:35:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc; bh=ZZNFxB2vfd4B4Og3dxe+psvxq2nF824Oy5AN125K2ew=;
	b=qxIaoBjFE0rjHV60RwJOsTQuZmYZHh/ZrhXRUre5URujpQL4C8b2pRVsu/KUpwr//8
	dlzOdD97zNOvvcScxEMgDZNR9Tzh6aUJFZMOgy8xPjIPtQfO9TZuApNrjDIiDwiVwvrJ
	plLGjnsBn28A0JAqCEFxEc4CgYsw88rre8o9yIJUQSDDKmOUp6UPc82lrxxzFy+CSMe+
	31ZHWZKuWpKy3NPMIytfEYCFp8LW9Qc17uTq+f6rHEOWDy+t9te//3mg9UdLoTVLv0X4
	wva918h+nvK09yDbe/3oq9l5GcgXjDVrfx4lAPTBoB4fs4MLdsNSXvzVj+hiqAWZFEFr
	MBiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc;
	bh=ZZNFxB2vfd4B4Og3dxe+psvxq2nF824Oy5AN125K2ew=;
	b=AdVoxintE18L9SMfkYKi3bmZqK6C86SXEgBq6Bks8P63c7vZ9b6Hp/4L7LitUv7SyZ
	ADcg4yUmX86T0jeVMPrDjrkkQEl9cOxYgx/K1FbtajXjH/Goyi6Ch7wkS2h3Uq+oaI8J
	MJ7YJD0w6HEx+ms+XNAJLfqDCA9EUtLe23AXTkcnbJ8q/BcJYjzeBh4I4f3Iu+CgUpAg
	Llztlr2qPly68XQnw9Lg6PnLfi/bqNeRqXRUFsKZbHoU77mdbPDbu7xJic5V9d7QaWqP
	Cv08N3m7JEgzZEX3ip+WYUSwwsQjHMywVAIOMkQqWCnHOduJbSy4yc/KFSeaTd5qysA+
	9v4Q==
X-Gm-Message-State: AD7BkJIR+GJ+UmUy2AyHXiRcj2PR17GbuwOcC8pk7UCRP9qoXue2zzncDXd2vETAbPEdnQ2ZYVuAc9HF6Bf0Ag==
MIME-Version: 1.0
X-Received: by 10.107.32.20 with SMTP id g20mr13671858iog.149.1458905716178;
	Fri, 25 Mar 2016 04:35:16 -0700 (PDT)
Received: by 10.36.69.12 with HTTP; Fri, 25 Mar 2016 04:35:16 -0700 (PDT)
In-Reply-To: <1458887121-27484-1-git-send-email-net147@gmail.com>
References: <1458887121-27484-1-git-send-email-net147@gmail.com>
Date: Fri, 25 Mar 2016 22:35:16 +1100
Message-ID: <CANwerB02BfOuPNXsz6vDxKeoQDdK4yGA+dsEFW8wHJQssjJAiQ@mail.gmail.com>
From: Jonathan Liu <net147@gmail.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gdb-cross: fix enabling of Python support
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
X-List-Received-Date: Fri, 25 Mar 2016 11:35:17 -0000
Content-Type: text/plain; charset=UTF-8

On 25 March 2016 at 17:25, Jonathan Liu <net147@gmail.com> wrote:
> Python support was not being enabled because of a conflicting
> --without-python configure argument in OE_EXTRACONF.
>
> Signed-off-by: Jonathan Liu <net147@gmail.com>
> ---
>  meta/recipes-devtools/gdb/gdb-cross.inc | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/meta/recipes-devtools/gdb/gdb-cross.inc b/meta/recipes-devtools/gdb/gdb-cross.inc
> index 6e44778..9a9a5e4 100644
> --- a/meta/recipes-devtools/gdb/gdb-cross.inc
> +++ b/meta/recipes-devtools/gdb/gdb-cross.inc
> @@ -4,6 +4,7 @@ DEPENDS = "expat-native ncurses-native readline-native python-native"
>
>  inherit pythonnative
>
> +EXTRA_OECONF_remove = "--without-python"
>  EXTRA_OECONF += "--with-python=${STAGING_BINDIR_NATIVE}/python-native/python"
>
>  do_compile_prepend() {
> --
> 2.7.3
>

Please ignore this patch.
It is is replaced by "gdb-cross: use PACKAGECONFIG for python and readline".

Regards,
Jonathan

