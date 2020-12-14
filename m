Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com [209.85.221.68])
 by mx.groups.io with SMTP id smtpd.web10.32450.1607942018565613678
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Dec 2020 02:33:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=JGH2cnO9;
 spf=pass (domain: gmail.com, ip: 209.85.221.68, mailfrom: luca.boccassi@gmail.com)
Received: by mail-wr1-f68.google.com with SMTP id q18so8410764wrn.1
        for <openembedded-core@lists.openembedded.org>; Mon, 14 Dec 2020 02:33:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=oNDWXt0z4AyQpN+hJiPO15kkiWq/3dPe6fc6g/e/j90=;
        b=JGH2cnO9/6kb6nekH2xoy+GNvz6DVIxr3OQryOi0HfY7Qh0xrwxYByX4mWmRErBtMb
         tthVqotwMlALSw1+i7lvV/6n7PoC6sxLhRYpfhnPWpFEwdX9XEK87ezHIcUk//ABxbQo
         rtGI1SmEE5ThhiubOVnYWiHGNV3SWztAXZsWSvUoAYB5NXwBbBpdftrtJDccAx5Jkpfl
         wNfEKzph1CfUONX1LtCdx2iT93zQlMBXNcKZ9dirWphOLgHd5Azx+czVIK511CmIuFtY
         vfBmQAjDYdyK7hL+yQxIrq91F3jUZLss1SAVZcU9Y9MyhKhv0RSSstWFtPHg1w3Bd8eq
         hhuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=oNDWXt0z4AyQpN+hJiPO15kkiWq/3dPe6fc6g/e/j90=;
        b=ZeJWmM9ZZfaNa4fzv5R7Ym+T2GKZ01zmHPu22ji/Xypk3MBS2npA9vk5XXbiN0Nb1M
         IVMp8y/s2eGKtmXgjlzy41tj1iza5qEiqQEOJ/6ArJmPF2ohAwg8p1iFF+UmKHnOMoqL
         qt1/VbxokUrRiBhhNtmaB2f2D1fdPmOiABb9T8/mQZubEvDF+P/CN7DvMM6l4aWJpKUv
         27azyn9AM+/bOblfc75wfY2oHF5sWrMrEi24eGhTPqPjuIzAaNNAszBiuE+MZd8kSHJb
         s2t8oYuWqTRsx1+whzXAlBaUbJNHqq3QpDB9gwTgiiCRhDFlGtXVdeUsNkUDvFEyOKqZ
         NJ7Q==
X-Gm-Message-State: AOAM532qVrHUeBGANVKFELflwWGGAajAYpXVYIaeUp1xoa+EICRobSQY
	0toz+jac1sMvw5qz7GfacsE=
X-Google-Smtp-Source: ABdhPJwfcTC74mMZ0n2PQ944bYJPL0L0zvAqE9A/7j0u7Z0mjfJf4gKD2/vclO3LSQHAR8t2WoAhBA==
X-Received: by 2002:adf:d082:: with SMTP id y2mr28482218wrh.301.1607942017165;
        Mon, 14 Dec 2020 02:33:37 -0800 (PST)
Return-Path: <luca.boccassi@gmail.com>
Received: from bluca-lenovo ([88.98.246.218])
        by smtp.gmail.com with ESMTPSA id f9sm3306371wrh.9.2020.12.14.02.33.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Dec 2020 02:33:36 -0800 (PST)
Message-ID: <9080ca5df5e9e03fe242623b9599c4b30c0b9818.camel@gmail.com>
Subject: Re: [OE-core] [PATCH 5/5] systemd: add RRECOMMENDS for weak dependencies, if enabled
From: "Luca Bocassi" <luca.boccassi@gmail.com>
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>, 
	"openembedded-core@lists.openembedded.org"
	 <openembedded-core@lists.openembedded.org>
Date: Mon, 14 Dec 2020 10:33:35 +0000
In-Reply-To: <3de202170ea048ff8ab2bdd4d85b1163@XBOX03.axis.com>
References: <20201210125312.3302065-1-luca.boccassi@gmail.com>
	 <20201210125312.3302065-5-luca.boccassi@gmail.com>
	 <3de202170ea048ff8ab2bdd4d85b1163@XBOX03.axis.com>
User-Agent: Evolution 3.30.5-1.2 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2020-12-11 at 20:34 +0000, Peter Kjellerstedt wrote:
> > -----Original Message-----
> > From: openembedded-core@lists.openembedded.org <openembedded-
> > core@lists.openembedded.org> On Behalf Of Luca Bocassi
> > Sent: den 10 december 2020 13:53
> > To: openembedded-core@lists.openembedded.org
> > Subject: [OE-core] [PATCH 5/5] systemd: add RRECOMMENDS for weak
> > dependencies, if enabled
> > 
> > From: Luca Boccassi <luca.boccassi@microsoft.com>
> > 
> > Some libraries are now dlopen'ed and skipped at runtime if
> > not available. Add them to the RRECOMMENDS list, to allow
> > users to exclude them for smaller images even if generally
> > enabled at build time.
> > 
> > Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
> > ---
> >  meta/recipes-core/systemd/systemd_247.1.bb | 7 +++++++
> >  1 file changed, 7 insertions(+)
> > 
> > diff --git a/meta/recipes-core/systemd/systemd_247.1.bb b/meta/recipes-core/systemd/systemd_247.1.bb
> > index f20e86d94b..951bffa23f 100644
> > --- a/meta/recipes-core/systemd/systemd_247.1.bb
> > +++ b/meta/recipes-core/systemd/systemd_247.1.bb
> > @@ -603,6 +603,13 @@ RRECOMMENDS_${PN} += "systemd-extra-utils \
> >                        systemd-conf \
> >  "
> > 
> > +# Weak dlopen-style dependencies: if explicitly requested via PACKAGECONFIG, recommend them
> > +RRECOMMENDS_${PN} += "${@bb.utils.contains('PACKAGECONFIG', 'qrencode', 'qrencode', '', d)} \
> > +                      ${@bb.utils.contains('PACKAGECONFIG', 'libidn', 'libidn', '', d)} \
> > +                      ${@bb.utils.contains('PACKAGECONFIG', 'libidn2', 'libidn2', '', d)} \
> > +                      ${@bb.utils.contains('PACKAGECONFIG', 'cryptsetup', 'cryptsetup', '', d)} \
> > +"
> 
> Please write this as:
> 
> RRECOMMENDS_${PN} += "${@bb.utils.filter('PACKAGECONFIG', 'cryptsetup libidn libidn2 qrencode', d)}"

Andre suggested instead to add the rrecommends directly in the
packageconfig definition.

-- 
Kind regards,
Luca Boccassi

