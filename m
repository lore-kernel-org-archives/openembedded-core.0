Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com [209.85.128.68])
 by mx.groups.io with SMTP id smtpd.web12.1170.1588022928969621384
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Apr 2020 14:28:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=jWaPQ4OB;
 spf=pass (domain: gmail.com, ip: 209.85.128.68, mailfrom: sakoman@gmail.com)
Received: by mail-wm1-f68.google.com with SMTP id u127so566523wmg.1
        for <openembedded-core@lists.openembedded.org>; Mon, 27 Apr 2020 14:28:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=UgvmF3jjN3l+hGRQYuYQhQJ37toqq4N7kez+ZC26lmM=;
        b=jWaPQ4OBq1r7FXAoGWmYY/s4F8nn4xOjkgZk2C6oQFRn2V8Tz2CdrRsf8zLUPR/PJ2
         Qo4+Vw9nKrK9wp3k9dDR/btua83PgsYz/Ce3mB83VJwSD+HdCfrK0jJirBKFQLBfanEn
         yYuEzyDbKQAg5HG/Z/Lad90thHBWPrC3ODFP+YwjqIe3Dz3HOS1DM9v65ELRWZd3e4i8
         eSylWYOrBr5MifRU1I2t5ePYYM8xw7duRv60ASxXb85LelsL7fSctzjpTXVW36Q3j7sK
         LpAzVxqqv+u2vZX3EYfGYTsR4h2Np1EWM/sWmj2jJYCxW5NsXtcpusdAOa+cVkGoX/B5
         OeMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=UgvmF3jjN3l+hGRQYuYQhQJ37toqq4N7kez+ZC26lmM=;
        b=Be7ohATyQD61hx/UQWYqVnJxnVgTzLov81odEQYIdfuky6/YEbA0FNk08PZqcjBowV
         n9x6RCDZoiZPNxbBFnOHbWnPk0YXxhlgvXAsqcw/rrC5/YxG6aI0WmXd/VORb4iF+XQM
         j66oLDHcpF96If+cfUuIh/t6i3gU69couIrCZkrPlU9zDDOuh3KpWvu+fgtT25ODsRZY
         28qdlMqwyII6iGU+IpIsw9bNtQhSZR6o7N1sAE60Mxxqc7WWyGzozc19Xbe9rW4MpOLf
         hSOsj4p5s0FpjsTNCtGE6UF2GmSj0iqSVoR78C9sN5VYHtJFAvFpU9JOWkOQlFiKuX2N
         7uRw==
X-Gm-Message-State: AGi0PuZARy6H8xhEtCXss8uUFP1zEe/WpTX+Tfr3G0aM5ayub8QLQmzM
	91I7uMe/agYqemPOrCvnjMbck3FWQzx0GQHLaJQ=
X-Google-Smtp-Source: APiQypKsTO497H7XVIy9mg2QGiMLpAhoNFM7j69X3HJ7GqCuQVxfc51iXVSRDFJfko1Fl3oo9kKqDFTadyZb39Cwch8=
X-Received: by 2002:a1c:b757:: with SMTP id h84mr739696wmf.188.1588022927467;
 Mon, 27 Apr 2020 14:28:47 -0700 (PDT)
MIME-Version: 1.0
References: <20200426191302.25782-1-jpuhlman@mvista.com>
In-Reply-To: <20200426191302.25782-1-jpuhlman@mvista.com>
From: "Steve Sakoman" <sakoman@gmail.com>
Date: Mon, 27 Apr 2020 11:28:35 -1000
Message-ID: <CAGDS+nkC-W_2MwQ3NnZ65fuPjoqyM5=qQ2neAf_+Fqk58_5Xcg@mail.gmail.com>
Subject: Re: [OE-core] [dunfell][PATCH 1/3] qemu-system-native: Fix commented out PACKAGECONFIG
To: Jeremy Puhlman <jpuhlman@mvista.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"

Thanks Jeremy!  I have this series queued up for dunfell-next.

Steve

On Sun, Apr 26, 2020 at 9:13 AM Jeremy Puhlman <jpuhlman@mvista.com> wrote:
>
> From: Jeremy Puhlman <jpuhlman@mvista.com>
>
> (From OE-Core rev: f2bcc384a6e90480b5b0f0c77530f014785b291e)
>
> Signed-off-by: Jeremy A. Puhlman <jpuhlman@mvista.com>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  meta/recipes-devtools/qemu/qemu.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
> index f17a046fca..7a1ccf2115 100644
> --- a/meta/recipes-devtools/qemu/qemu.inc
> +++ b/meta/recipes-devtools/qemu/qemu.inc
> @@ -180,7 +180,7 @@ PACKAGECONFIG[snappy] = "--enable-snappy,--disable-snappy,snappy"
>  PACKAGECONFIG[glusterfs] = "--enable-glusterfs,--disable-glusterfs"
>  PACKAGECONFIG[xkbcommon] = "--enable-xkbcommon,--disable-xkbcommon,libxkbcommon"
>  PACKAGECONFIG[libudev] = "--enable-libudev,--disable-libudev,eudev"
> -#PACKAGECONFIG[libxml2] = "--enable-libxml2,--disable-libxml2,libxml2"
> +PACKAGECONFIG[libxml2] = "--enable-libxml2,--disable-libxml2,libxml2"
>
>  INSANE_SKIP_${PN} = "arch"
>
> --
> 2.20.1
>
> 
