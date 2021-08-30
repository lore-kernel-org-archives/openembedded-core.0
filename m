Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
 by mx.groups.io with SMTP id smtpd.web08.381.1630339785709966091
 for <openembedded-core@lists.openembedded.org>;
 Mon, 30 Aug 2021 09:09:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=uV3y6EV0;
 spf=pass (domain: gmail.com, ip: 209.85.222.174, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f174.google.com with SMTP id f22so16221943qkm.5
        for <openembedded-core@lists.openembedded.org>; Mon, 30 Aug 2021 09:09:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Hi9FlI2VckbPk0AHIx0ulI/yMrZSSR8tHclRB7sbCxk=;
        b=uV3y6EV07+OFTuodNZc6vl61RXC/Z5MHboCIWHK9FpSiMMx1kEEj8Pv6dhe7z4B0+M
         pJ2fL8sC2VquwUikiD2WHoArh7QW0reG5O2wgmDO/TW9OQ0QYs0iu9wk1yz9FY42KNMa
         x5/9pVah682GzjsFlqypUIYx5GxDi9w6JZwGgXig/JXiCVrg+Xwz7mzzTplR7q53cK3H
         LOB1pnyODFzdwBepgL9ul9dq1zY+bfwRpwyNOCbUiBENGJNkPjQ+OLZWs8h8XYU9c9x8
         B1VO82Jp3BIqF3nfJFwwI+2a8fFrczZPrOTGwbgSOlsPcsVZhohId+tiGaaNs5eKnQMI
         JFmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Hi9FlI2VckbPk0AHIx0ulI/yMrZSSR8tHclRB7sbCxk=;
        b=XOQAnauUPuA0jmvcCOZc9RPjW/3X+WZeMm9cGgaRHM2kEJHgpbyYaQuUbNQNgD+90E
         Mc9PDZjvBtf04WsfgyLayTLcumI9lOO0YW8fPka6FY9TgKM2W+O6mL0s5dZZB186H2Hb
         bLa4BKIP2YMZXQNe9seFXkbe4WdCG0IAI0DwSswyYaY1mbg7QPC5TOOXacaIyCVKI2iU
         3dlUOJf91wVzw7+tFfzs5mDI3CD1Vd+ScvezSKq31ky0J0s7frvGWXrK6V9fTEQrqfNB
         yRGx+pUVN4CBNgcyquNon6/eYJkkakPbRhkN5/EuiJImJt16vOfA1ZWtegSVFiCqa2j3
         IOTQ==
X-Gm-Message-State: AOAM530rYoh51D/n95WedxSbr0cTf8TuBeiIw+uvmLsfl2wG7ZO6X8P7
	CpmQEWfr3RkVw/Xj/DCOgcKICnLseZopH/DaPbQ=
X-Google-Smtp-Source: ABdhPJz3+HzC3pOAd8/8JVwF9Ry6bMIAvErtBnSFckV5iSM9sSIN1M6vhDFIU7AtY5JWSUIouQpSPRLX/ei5tONMuvo=
X-Received: by 2002:a05:620a:799:: with SMTP id 25mr22871059qka.119.1630339784713;
 Mon, 30 Aug 2021 09:09:44 -0700 (PDT)
MIME-Version: 1.0
References: <a9a5b3df-5a2c-c7c-ba3e-9e4ed712cf67@crashcourse.ca>
In-Reply-To: <a9a5b3df-5a2c-c7c-ba3e-9e4ed712cf67@crashcourse.ca>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Mon, 30 Aug 2021 09:09:18 -0700
Message-ID: <CAMKF1sqwHvndd5ivxEgk_gV4ou6cwZ1bHhs4T6Czs6omQHYA+A@mail.gmail.com>
Subject: Re: [OE-core] why "PREFERRED_PROVIDER_udev" and not "PREFERRED_PROVIDER_virtual/udev"?
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, Aug 30, 2021 at 12:52 AM Robert P. J. Day <rpjday@crashcourse.ca> wrote:
>
>
>   i was going to extend section 3.3.17, "Using Virtual Providers",
> with an intro example using "udev" until i realized that that example
> doesn't use the "virtual/" notation. so ... why not? is there some
> distinction between other components that use the "virtual/" prefix,
> but a reason that one does not specify:
>
>   PROVIDES = "virtual/udev"
>
> rather than just:
>
>   PROVIDES = "udev"
>
> and then use the corresponding PREFERRED_PROVIDER_virtual/udev
> notation?

we also have VIRTUAL-RUNTIME_dev_manager which spans across systemd to mdev
so I guess we could but perhaps we already have this functionality
>
> rday
>
> 
>
