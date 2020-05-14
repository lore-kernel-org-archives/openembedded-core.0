Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com [209.85.128.66])
 by mx.groups.io with SMTP id smtpd.web12.12139.1589462814275448713
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 May 2020 06:26:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=djsPCqam;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.66, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f66.google.com with SMTP id n5so17757486wmd.0
        for <openembedded-core@lists.openembedded.org>; Thu, 14 May 2020 06:26:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=BBeM0tACVVZknoW8dmbismtyGLyCQP6w39oCsHPMXEw=;
        b=djsPCqam1prJi4Iqn/gBIIGyCMXRu5cjDN+BpVVM49iMNr/HWWQGmAOIZyk9MI1FC5
         M4Fzyjq2S4Z9tfXlv05/DKBAX4uBWY6XLQbFTgOzsNypPVKTB3SstWrs+SeuC35oOYx7
         cth/5ullpgNwaY3KQfEUBqQX8cQ5O5F1L1QF4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=BBeM0tACVVZknoW8dmbismtyGLyCQP6w39oCsHPMXEw=;
        b=DoyLxn9j6DbGi9uJJHXn5ACGHXNFCuIrRFvOssUns+alKxr6hlDGQAWBsIt9VOcRNz
         Zw8P6VAGZFShA+bsc27lnybOFiQ9731F0nrrcDVb/adlCKn3pPAZlX4th5eA4vS43beq
         bPmsX/LBWK0NDRZHAwuOCAjvIc1UrAbp4fkYrav+XoQGajU+d+qpwitW0GCY+MWfV3Hj
         KPqViiYOIswaC/yhfFC2O98gFOLy06/EJookWvIf/zHzrQUD8sVmDzlUBtEU5H8nREdT
         GGDaEo7u2gTrK1yXL0Msuv6RECBt611FtJju+QV0UqkFh1mFqN8MqUrMcaICIupPtX58
         J7rA==
X-Gm-Message-State: AOAM530Eb+UsOahyDEr50SH/6oL0daESuGepzlHMpiXzrt3WRfjnCJmf
	9v1iMoBzRuBjfw/0kroyEONCCDpUxN8=
X-Google-Smtp-Source: ABdhPJxcSyeamTlvgNtOL9JSUbtazJw0P6doNYmLl4WoHuht9qfC5HJjNhGEwkeykLDopQtL+gt9KQ==
X-Received: by 2002:a7b:cf22:: with SMTP id m2mr8420104wmg.82.1589462812222;
        Thu, 14 May 2020 06:26:52 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
        by smtp.gmail.com with ESMTPSA id w10sm4273015wrg.52.2020.05.14.06.26.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2020 06:26:51 -0700 (PDT)
Message-ID: <9c5dcfc03d2670a447cc08565cb74e407211906a.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] gcr: depends on gnupg-native
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: kai <kai.kang@windriver.com>, openembedded-core@lists.openembedded.org
Date: Thu, 14 May 2020 14:26:50 +0100
In-Reply-To: <f00e9d2b-8ada-a259-337d-9c1fa37862ab@windriver.com>
References: <20200511092342.29197-1-kai.kang@windriver.com>
	 <f00e9d2b-8ada-a259-337d-9c1fa37862ab@windriver.com>
User-Agent: Evolution 3.36.1-2 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Thu, 2020-05-14 at 09:59 +0800, kai wrote:
> On 2020/5/11 下午5:23, kai.kang@windriver.com wrote:
> > From: Kai Kang <kai.kang@windriver.com>
> > 
> > It fails to build gcr if no commmand gpg on build host:
> > 
> > > meson.build:44:0: ERROR: Program(s) ['gpg2', 'gpg'] not found or
> > > not executable
> > 
> > Add dependency gnupg-native to fix the error.
> > 
> > Signed-off-by: Kai Kang <kai.kang@windriver.com>
> > ---
> >   meta/recipes-gnome/gcr/gcr_3.36.0.bb | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/meta/recipes-gnome/gcr/gcr_3.36.0.bb b/meta/recipes-
> > gnome/gcr/gcr_3.36.0.bb
> > index 4fe3b2fff3..458dc8e6c4 100644
> > --- a/meta/recipes-gnome/gcr/gcr_3.36.0.bb
> > +++ b/meta/recipes-gnome/gcr/gcr_3.36.0.bb
> > @@ -8,7 +8,7 @@ BUGTRACKER = "
> > https://gitlab.gnome.org/GNOME/gcr/issues"
> >   LICENSE = "GPLv2"
> >   LIC_FILES_CHKSUM =
> > "file://COPYING;md5=55ca817ccb7d5b5b66355690e9abc605"
> >   
> > -DEPENDS = "gtk+3 p11-kit glib-2.0 libgcrypt \
> > +DEPENDS = "gtk+3 p11-kit glib-2.0 libgcrypt gnupg-native \
> >              ${@bb.utils.contains('GI_DATA_ENABLED', 'True',
> > 'libxslt-native', '', d)}"
> >   
> >   GNOMEBASEBUILDCLASS = "meson"
> 
> Any comment, please?

Why did this happen? Was this as a result of the move to meson? Is it
really needed and can we avoid it? native dependencies like this are a
pain from a build performance perspective...

Cheers,

Richard

