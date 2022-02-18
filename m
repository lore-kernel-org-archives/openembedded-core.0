Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9AE8FC4332F
	for <webhook@archiver.kernel.org>; Fri, 18 Feb 2022 06:59:07 +0000 (UTC)
Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com
 [209.85.222.47])
 by mx.groups.io with SMTP id smtpd.web09.8060.1645167546675744217
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Feb 2022 22:59:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=qcYiEYbU;
 spf=pass (domain: gmail.com, ip: 209.85.222.47,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ua1-f47.google.com with SMTP id d22so3839891uaw.2
        for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Feb 2022 22:59:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Vy7OPV9ZSkK39slSA8QGv/4YaUYNX+Rpji8YIl17QuU=;
        b=qcYiEYbUva++qyLbnzu0LxCQRnGLTVhEqvb6ypXGcsPxKKOT1G9G3s/Jgb9mGlQmAY
         ErTZuT1aF+CErJpoE4xIoGERVMAx7gjxOIf8hBMsZjZnqq5bCOdT40p8itenGANidfrM
         wssWbxKqC3P/Gz/IsSJg9ujDWH8xFtacveMyrOW7Bqq7LvLlP97IJj3LrcJiRw5VHX7F
         Q9H3rVMLSSi98kDN2qZ5YfM83L7GHpVvU7gSdQmCKsYOT1WdaWKZlE299mWtI7OztCCP
         C/NGqxlywYTWEFuU1rj9wKI5tYMgNveEJxOL24p3IJ9VawDtnm2T25vnLr5c6CexLd+f
         qMEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Vy7OPV9ZSkK39slSA8QGv/4YaUYNX+Rpji8YIl17QuU=;
        b=ZJmcU+F8k/c/rzDrWwNepuiOe1Az20u3GwRRCAu3p70wiDIpTNXl6ucHWesBNLthLT
         PHPj3vMLSTjBEOShYuD9RXmKaI587HPANP05iFHhqFemtYLGzGdHMOIMkFGwF0hrV4IZ
         nSaq3WMVnNUh2O/i/D/Ru4WW7rn+30lpDgpc06/UUYQbsPTfb9of8bSFPPcRf7YSEo2R
         DzKFKlg7rOJS1BQ0jTGFEolWIVWlFo82pNKeZwEqV7V2tsDUoEAuMWS/7yO9vL8IRswn
         3pFzSxmp4i3Atl9jhJFz4kdUrKTh1rHhDOqUpdTDOBtmLyJS47i0U8vdFKIsWTXrRJUr
         9Z/w==
X-Gm-Message-State: AOAM531rkM5RcfBx/3RoL62oLsCVK5bnDGR7gwJ8cx426NYAcVNZ/1LZ
	ep7QRV0yoN1zqbRgMQmGPlDOEYbOoV2haQnlZ+qAjcKv
X-Google-Smtp-Source: 
 ABdhPJw685wFb+k6oF55TxEjWbijVGNLm3OzrxUUbR/LwAyTITZ0+/BjkfYeDuyGgeCTGrZ9IjQRVcJ+xt9wvUZKjqw=
X-Received: by 2002:a9f:2008:0:b0:33d:b3:a3de with SMTP id
 8-20020a9f2008000000b0033d00b3a3demr2756685uam.71.1645167545823;
 Thu, 17 Feb 2022 22:59:05 -0800 (PST)
MIME-Version: 1.0
References: <20220217230023.727460-1-quaresma.jose@gmail.com>
In-Reply-To: <20220217230023.727460-1-quaresma.jose@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 18 Feb 2022 07:58:54 +0100
Message-ID: 
 <CANNYZj82igrbkuPBK4kD9AyCHVpOxjqvGBP_LPwf-4xv0nsJpg@mail.gmail.com>
Subject: Re: [OE-core] [RFC 1/2] meson.bbclass: add native meson test
To: Jose Quaresma <quaresma.jose@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 18 Feb 2022 06:59:07 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161882

Nice - but please find a different word than 'native', as this is
clearly a cross-binary testing with qemu usermode :)

Alex

On Fri, 18 Feb 2022 at 00:00, Jose Quaresma <quaresma.jose@gmail.com> wrote:
>
> This patch add a task on the meson bbclass to add the
> possibility to run the native test of the project using
> the exe_wrapper.
>
> This can be useful in some the integration processes
> and add the possibility to run the test in an interactive
> way using the devtool build for example.
>
> There are two variable for that:
> MESON_QEMU_WRAPPER_TEST_ENABLED: this enables the test when "1"
> EXTRA_OEMESON_TEST: this is used to add extra args
>
> Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
> ---
>  meta/classes/meson.bbclass | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/meta/classes/meson.bbclass b/meta/classes/meson.bbclass
> index 0bfe945811..2df7794f1d 100644
> --- a/meta/classes/meson.bbclass
> +++ b/meta/classes/meson.bbclass
> @@ -179,3 +179,10 @@ meson_do_install() {
>  }
>
>  EXPORT_FUNCTIONS do_configure do_compile do_install
> +
> +EXTRA_OEMESON_TEST ?= ""
> +MESON_QEMU_WRAPPER_RUNTEST = "${@d.getVar('MESON_QEMU_WRAPPER_TEST_ENABLED') == '1' and d.getVar('EXEWRAPPER_ENABLED') == 'True'}"
> +meson_do_test() {
> +    meson test -C ${B} --print-errorlogs ${EXTRA_OEMESON_TEST}
> +}
> +do_install[prefuncs] += "${@"meson_do_test" if d.getVar('MESON_QEMU_WRAPPER_RUNTEST') == 'True' else ""}"
> --
> 2.35.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#161868): https://lists.openembedded.org/g/openembedded-core/message/161868
> Mute This Topic: https://lists.openembedded.org/mt/89221715/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

