Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4459C43217
	for <webhook@archiver.kernel.org>; Thu, 17 Nov 2022 13:17:23 +0000 (UTC)
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
 by mx.groups.io with SMTP id smtpd.web11.15183.1668691039922757003
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Nov 2022 05:17:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=yhBS/kAq;
 spf=pass (domain: linaro.org, ip: 209.85.167.51, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f51.google.com with SMTP id j4so2801994lfk.0
        for <openembedded-core@lists.openembedded.org>; Thu, 17 Nov 2022 05:17:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=iIy28PggmyAA5AQIOaVLggSDZfXjguqdatOe3qTER9c=;
        b=yhBS/kAqhOSCUoNPo4+OMKVlXBX7kgfPbuF+LVVqxMFChOnMMuC7zPx/guErPXtEQj
         ZU5P6bZ5TUJty9RjZhtQrzuYRq68BfHeMOwJFDWSPOXf+oOZz2bTJ/RvbnLTmEJ4spac
         syaUvjg4F2SP87FFGg+UNYLZQiq/qDt8ZUhstr8KITx7noi1OdXG2zxsUjWzw31okAte
         KIKYgWwfKCshFIkm2dt6Zme318ULryeWkJowIYvRx8YzwiKoNErwe9OJgzqNXDoYziCA
         x4YvE0alXseXENvWH73ITywAXq7us7/qGEVVpmAd0pEVGqPJ8GD9OMkcHbwQxm1xch9P
         Rc5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iIy28PggmyAA5AQIOaVLggSDZfXjguqdatOe3qTER9c=;
        b=lv9zm5mn4xVpV+9lDVkPbN2Z9O03aDRiJqxSgmOh3p/Xlp0kQNzexOXqiPmrlJ5oJx
         E7dMBDbQhzjqTrViBTqsdYy70mWTJ83Jegzpq/Jxe9jCGjmKE4VfuSARGMyHlyCkSXY6
         GDC3dLCV8wFU7AkW95xuTTkgE1gTmqWlQoBHd2KjvelzTB3adcCozpmDFwoo2RFQ33Uf
         HBEognA5NoF58M8KremWV5FYjzZrzO2vYkBLgT2xyHeoovBcq2LNWXNkJuc1Yra6mDk6
         RGOPYT5vU0ErWQYfAQJEnH/f7qSoG0qrGiwJ1mCCQdLHApQSSolKFrSuDaYmZf3PsNfZ
         jiUQ==
X-Gm-Message-State: ANoB5pnJFgPT5EP3mbf8a6zoeYw5J4XsWDFbMwAP1VJ2xorauhOvYWNY
	Ik8NmqhiQRie4sxEYJIIokmMvA==
X-Google-Smtp-Source: AA0mqf5MANAQRhwsv2/I0voxGIQw9byIY98NlGBxzHyvf+awzbt8zz+IlYHe3MeBiyXEouVQtFNMfg==
X-Received: by 2002:a05:6512:52d:b0:4a2:7574:b64a with SMTP id o13-20020a056512052d00b004a27574b64amr827389lfc.336.1668691037802;
        Thu, 17 Nov 2022 05:17:17 -0800 (PST)
Received: from nuoska (dsl-olubng12-54fa1d-36.dhcp.inet.fi. [84.250.29.36])
        by smtp.gmail.com with ESMTPSA id s19-20020a056512315300b004ac6a444b26sm145226lfi.141.2022.11.17.05.17.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Nov 2022 05:17:17 -0800 (PST)
Date: Thu, 17 Nov 2022 15:17:15 +0200
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: Quentin Schulz <quentin.schulz@theobroma-systems.com>
Cc: openembedded-core@lists.openembedded.org,
	Quentin Schulz <foss+yocto@0leil.net>
Subject: Re: [OE-core] [PATCH v2 1/2] qemurunner.py: support setting slirp
 host IP address
Message-ID: <Y3Y0WzcO5XRxLvQo@nuoska>
References: <20221114155038.3654499-1-mikko.rapeli@linaro.org>
 <5c71519e-8f9e-3402-5f5a-b15d9e4fe384@theobroma-systems.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5c71519e-8f9e-3402-5f5a-b15d9e4fe384@theobroma-systems.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Nov 2022 13:17:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173421

Hi,

On Thu, Nov 17, 2022 at 02:13:01PM +0100, Quentin Schulz wrote:
> Hi Mikko,
> 
> On 11/14/22 16:50, Mikko Rapeli wrote:
> > By default host side IP address is not set and qemu listens
> > on all IP addresses on the host machine which is not a good
> > idea when images have root login enabled without password.
> > It make sense to listen only on localhost IP address 127.0.0.1 using
> > config change like:
> > 
> > QB_SLIRP_OPT = "-netdev user,id=net0,hostfwd=tcp:127.0.0.1:2222-:22"
> > 
> > This config works for qemu itself, but breaks runqemu which tries to
> > parse the host side port number from qemu process command line arguments.
> > So change the runqemu side hostfwd parsing for port number to ignore
> > the host IP address field.
> > 
> > Reviewed-by: Quentin Schulz <foss+yocto@0leil.net>
> > Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
> > ---
> >   meta/lib/oeqa/utils/qemurunner.py | 3 ++-
> >   1 file changed, 2 insertions(+), 1 deletion(-)
> > 
> > v2: improved commit message
> > 
> > v1: https://urldefense.com/v3/__https://lists.openembedded.org/g/openembedded-core/topic/95016024*173234__;Iw!!OOPJP91ZZw!lmurd9F5r43EHopuJkrpTJZMlC93fI8sXSNgnxmfVSRyTvP6unwa8Wn4-wxgjS9UM6EQUnGK5X8gzyVSyfm3WExF4pLQQuHl0L_BlQ$
> > 
> > diff --git a/meta/lib/oeqa/utils/qemurunner.py b/meta/lib/oeqa/utils/qemurunner.py
> > index e602399232..f175f8a1de 100644
> > --- a/meta/lib/oeqa/utils/qemurunner.py
> > +++ b/meta/lib/oeqa/utils/qemurunner.py
> > @@ -401,7 +401,8 @@ class QemuRunner:
> >                   cmdline = re_control_char.sub(' ', cmdline)
> >               try:
> >                   if self.use_slirp:
> > -                    tcp_ports = cmdline.split("hostfwd=tcp::")[1]
> > +                    tcp_ports = cmdline.split("hostfwd=tcp:")[1]
> > +                    tcp_ports = tcp_ports.split(":")[1]
> >                       host_port = tcp_ports[:tcp_ports.find('-')]
> >                       self.ip = "localhost:%s" % host_port
> 
> Wondering if we shouldn't also update the self.ip here to display the actual
> ip to use? I assume we just need to extract it from the first tcp_ports. I
> think it should just be tcp_ports.split(":")[0] ? and just need to check if
> it's empty/None in which case we set it to localhost?
> 
> What do you think?

Good idea! I'll send a new version.

Cheers,

-Mikko

> Cheers,
> Quentin

