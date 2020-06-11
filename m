Received: from mail-ot1-f66.google.com (mail-ot1-f66.google.com [209.85.210.66])
 by mx.groups.io with SMTP id smtpd.web11.3111.1591899904946851002
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Jun 2020 11:25:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=Ry6TiMuW;
 spf=pass (domain: konsulko.com, ip: 209.85.210.66, mailfrom: paul.barker@konsulko.com)
Received: by mail-ot1-f66.google.com with SMTP id v13so5300958otp.4
        for <openembedded-core@lists.openembedded.org>; Thu, 11 Jun 2020 11:25:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=C1jCO5YMX0fK3qjC3nFbISbXYUEyhVPbk1eLChEP0dk=;
        b=Ry6TiMuWzr8Nfh3/9ZnHuyKOlaNh0F2Hs2c1MYNVaVzqekM2jo0aTVysTXOq9hGkt0
         2R6F1TfWBEt5NThZOKhrSBiOeuUH65k4lvYxyBGVrNKpJChEMO2V4zuQ0byM6/E83Ubd
         4N5xBIMa9syMWCZFwnF/Agq9N/xVQtxWNlycs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=C1jCO5YMX0fK3qjC3nFbISbXYUEyhVPbk1eLChEP0dk=;
        b=mAAGWqupSZHXKRe2q1WMXepBtCGIZPtJArMs6EttwpJPueuxeSHQa5wCnhCQgweHc7
         DS4G3gntoqAG5vUS0M8arnYY6GVVGTQr1xVfT4smS6TUls/DtZPLAcK3CxYYIkNaS+wT
         2SDgrivm4hzvbWf0xhVqFfLvx672Lgq3h6ttS8I18Zy/4DHZDVuGosndFtBL9kawAYjj
         OMVG1Cd4WkMLZ7JVuFQsOTdtL9zj4mDcIxHs7lvp75EBZJ7aTYKeb1Fk+VNql32dOrzb
         vxJDlutDwsPsbBp25ppk+7KtbXVZKApj3+4Kt6UvCac5BI0GrXhyjA5E2UfhY+1TFP5T
         ugJw==
X-Gm-Message-State: AOAM530jrOSEdUsQqb+STRU4yCFOcvggQBWIh9jJ9T3fl6WAtYPCCd+z
	T0QuycOfp3TNQGbeYcWxmBoUiGYjjzTPKv/X4NEvFQ==
X-Google-Smtp-Source: ABdhPJx0z9PQ5IkUua3i/sC74sssbNDus8WdqqapADKbN1lpRgkw+Rm/Lve7QJB77aglQqR7PsS1MPscnJSfoQzzMAA=
X-Received: by 2002:a9d:2f05:: with SMTP id h5mr7897734otb.258.1591899903757;
 Thu, 11 Jun 2020 11:25:03 -0700 (PDT)
MIME-Version: 1.0
References: <AfTE.1591899117764896101.PTbw@lists.openembedded.org>
In-Reply-To: <AfTE.1591899117764896101.PTbw@lists.openembedded.org>
From: "Paul Barker" <pbarker@konsulko.com>
Date: Thu, 11 Jun 2020 19:24:53 +0100
Message-ID: <CAM9ZRVurC-sSFJrVN_QQmKGoqGp=VRWEg6LdhWCzsn9g3od=Lg@mail.gmail.com>
Subject: Re: [OE-core] Changing kernel to the Mainline kernel ,linux-stable instead of linux-raspberrypi
To: Pankaj Vinadrao Joshi <pankaj.vj@exaleapsemi.com>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, 11 Jun 2020 at 19:12, Pankaj Vinadrao Joshi
<pankaj.vj@exaleapsemi.com> wrote:
>
> Hi,
> i have built the image for rpi4 using openembedded-core and meta-openembedded but i found that by default its taking the kernel which is linux-raspberrypi which is 4.19.x or 5.4.y but i want to change the kernel to the vanilla,5.5.6 from the mainline.
> Can someone guide me on how i should proceed with ??

Hi Pankaj,

You can use the linux-stable recipes in meta-kernel
(https://gitlab.com/openembedded/community/meta-kernel) to achieve
this. We don't have recipes for 5.5.y as it's already EOL but there
are recipes for 5.6.y. I'll be adding the recipe for 5.7.y very soon.
There will likely be a little integration work to do to get this
working with a Raspberry Pi, I've already done that for raspberrypi3
(as you can see in the readme for the meta-kernel layer) but other
models are currently left as an exercise for the reader. Patches are
welcome :)

You could also look at the linux-yocto recipes in openembedded-core.

Thanks,

-- 
Paul Barker
Konsulko Group
