Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
 by mx.groups.io with SMTP id smtpd.web08.2656.1618461075122484896
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Apr 2021 21:31:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=FolJqwkc;
 spf=pass (domain: gmail.com, ip: 209.85.219.46, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f46.google.com with SMTP id gv2so1791728qvb.8
        for <openembedded-core@lists.openembedded.org>; Wed, 14 Apr 2021 21:31:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=uGphz61K9Xph/wmlKGQnZOrgNBj5SOvImqt6BRZuQjo=;
        b=FolJqwkc+BkUEnVfdI9uQKGJDgB2JOAkr8cHAjZKe2ibNIz1qPpmyC73bZf2nEaZyS
         5JsNeA5w9D8tCeREVRM1noQqp+IBsbj4N/zbG+1v6+iWV8CbicDWhP2ARy5G9fpq6GIl
         Th586KNRpBug7O/d19rMD/xso3Juh+HsEpz8JU1CQzvlF7ZZMac6eMF2SPYvXfris4TA
         +hZktwL0ObAoutFjuLnRd3BkAoBfGXWkslU9K40oXNup4Amc9XC7PnD8vjZg5L1Uc4gL
         Bu1R9oNkcJg4AkcN+hGAbfzLmu1OQmuIIDb9k3CxVGgksA9a1GAJEuTGaXKO9NHJWTPu
         1J6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=uGphz61K9Xph/wmlKGQnZOrgNBj5SOvImqt6BRZuQjo=;
        b=lBX5uJyRuSZvrCniArYnYxvtBCrHmW/pDk6N6+iQv0Q242DypC3xBJqBg+Tjs4dlGO
         D7LL0QlYDAvP1zT5pzC0atjB13NIyMFQSVfB7vhE9UcO/WxPWU+ZXYsq69udH+/zPKi7
         TSVkFYbrF07geAlQD83OOJeRIlvEJly3ioTOa1iUXSQ0+KoiR43l8qR2SylSKPbf4wCj
         F1/7g1SDETNytck7GTkByk/gR4StRpWApLzXhWW+L3VZ09r6DVwKI4MTpLmGvDPtf8gL
         bGECtrPz0QprzYI3BJkB5503FtWpEt3T+DRbzRmqAaIxs3feUEtblfe6Dl5AEN68n0kz
         ML2A==
X-Gm-Message-State: AOAM530xnBIkFmKkgYsW/IftRvaQ3bkN2XLfv+/BPXKTabMfjhfmF6MA
	SlV+7w8cKZyAVd9n2d+WBo4zN3VpKAZuJBWcfZA=
X-Google-Smtp-Source: ABdhPJyOM8t5bw98HqXvkXSd25QVyNCFYO1HD5K+1EmGk3b9xu4GGVj/ATZwvcBBmogEsZu/1t35qCNqBR3SS+ZJBCg=
X-Received: by 2002:a0c:b218:: with SMTP id x24mr1590247qvd.55.1618461074293;
 Wed, 14 Apr 2021 21:31:14 -0700 (PDT)
MIME-Version: 1.0
References: <CAMKF1spF-OQ6Q5GnK89tD0KhgnerwOcDLyOPDQ_Zmn963hsxUw@mail.gmail.com>
 <4917.1618456349740194827@lists.openembedded.org>
In-Reply-To: <4917.1618456349740194827@lists.openembedded.org>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Wed, 14 Apr 2021 21:30:47 -0700
Message-ID: <CAMKF1soGBuCBZEvngE0=nLbNU7i0f7G=-CLh=khadEptKO1Yew@mail.gmail.com>
Subject: Re: [OE-core] Initramfs with OpenSBI for a RISCV SoC
To: sathishmls@yahoo.com
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, Apr 14, 2021 at 8:12 PM sathishmls via lists.openembedded.org
<sathishmls=yahoo.com@lists.openembedded.org> wrote:
>
> I found the issue.
> The issue was that i have added "opensbi" using EXTRA_IMAGEDEPENDS through conf/machine/<machine>.conf file and that has made "opensbi" as dependency for initramfs image also.
> This has created the circular dependency.
>
> I added a EXTRA_IMAGEDEPENDS = "" to the core-image-minimal-initramfs.bb
>
> This fixed the circular dependency issue.

good, I think this could be a patch for
core-image-minimal-initramfs.bb that you can submit to oe-core ml.
Since we use opensbi in qemu machines its highly likely to be copied
into BSPs
would you mind submitting such a patch?

> 
>
