Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com [209.85.221.66])
 by mx.groups.io with SMTP id smtpd.web12.2018.1585073269201120289
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Mar 2020 11:07:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=DNPWh7oN;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.66, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f66.google.com with SMTP id d5so10377407wrn.2
        for <openembedded-core@lists.openembedded.org>; Tue, 24 Mar 2020 11:07:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=zttw3lGIDUv3ZFUOgy6MtH8FY1FurvhVpY0ZHWeUtec=;
        b=DNPWh7oNB4m35RbHRcblQHVLDNFCWwJBjOq0BKNMyG1p6/7VL4Ef392IJ1ygPS0Fe8
         yzyQFGQSdrusFRHWG4rbUQmpagjghCJ5iKX0dFX0DrClLYllhVEvNkXVyd8g4+d8EEoF
         m9vYvEDsJNvDVAkuifzrcVq4lSF8m0IkANg7c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=zttw3lGIDUv3ZFUOgy6MtH8FY1FurvhVpY0ZHWeUtec=;
        b=KxPxydCNGpYfDtu8A+O2jKwjLdbFG9109z6SNt8nl3gKA2lgjMMGv46L7UNEejuV0M
         w7VNG2Zrrba1367Cd89q+b3Z1ptN+TJzAxwSWQ2zZE9wtTx6Xdgf2xMREOvDwhXjviid
         l1P2IQxesp7lPSKjDC4P4f2w6Fm9CIfHkW/oh+zVLSxwLhDxnRy4ZkjifTp5lTTNMad6
         MX/aC6WriyJCns1Na0H+FZRgsQSfMANtIxkGNVm3ijv3iBcRuTg7bkvd6SzwMncby0iP
         1KevbzOn+88906vHgaF4mmPHb/suKcA0fCfaKhVdgCMH7RxoSggZZMWdwrHEuAI1JtHO
         Ttgg==
X-Gm-Message-State: ANhLgQ1Pe4lCmEsrf1EzDcbSQu2F9rewT++sml9EOKWMN7rAtkm6HeXZ
	bY3U6p7V7QneWLDxY+vRCBC2QQ==
X-Google-Smtp-Source: ADFU+vsD8hVYEhAiZX9c70OpvrfEp5duw87j9IVz2zYlpQyWi6Lq5DG30d4ybAb5cgoQRutnwbM5Jw==
X-Received: by 2002:adf:fd87:: with SMTP id d7mr38029597wrr.393.1585073267568;
        Tue, 24 Mar 2020 11:07:47 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
        by smtp.gmail.com with ESMTPSA id s22sm4998772wmc.16.2020.03.24.11.07.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2020 11:07:46 -0700 (PDT)
Message-ID: <19b30b569a31c0068d5c3b46e1f83178942ecc8e.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 2/2] gstreamer1.0-plugins-good: add qt5 PACKAGECONFIG
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Denys Dmytriyenko <denis@denix.org>, Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Date: Tue, 24 Mar 2020 18:07:44 +0000
In-Reply-To: <20200324175821.GW1578@denix.org>
References: <1582252918-89191-1-git-send-email-anuj.mittal@intel.com>
	 <1582252918-89191-2-git-send-email-anuj.mittal@intel.com>
	 <20200324175821.GW1578@denix.org>
User-Agent: Evolution 3.35.92-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2020-03-24 at 13:58 -0400, Denys Dmytriyenko wrote:
> On Fri, Feb 21, 2020 at 10:41:58AM +0800, Anuj Mittal wrote:
> > Instead of disabling unconditionally, add PACKAGECONFIG for
> > qt5. Imported from meta-qt5 layer.
> > 
> > Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
> > ---
> >  .../gstreamer/gstreamer1.0-plugins-
> > good_1.16.2.bb                  | 7 +------
> >  1 file changed, 1 insertion(+), 6 deletions(-)
> > 
> > diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-
> > plugins-good_1.16.2.bb b/meta/recipes-
> > multimedia/gstreamer/gstreamer1.0-plugins-good_1.16.2.bb
> > index f3e0cee..8b34111 100644
> > --- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-
> > good_1.16.2.bb
> > +++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-
> > good_1.16.2.bb
> > @@ -42,6 +42,7 @@ PACKAGECONFIG[libpng]     = "-Dpng=enabled,-
> > Dpng=disabled,libpng"
> >  PACKAGECONFIG[libv4l2]    = "-Dv4l2-libv4l2=enabled,-Dv4l2-
> > libv4l2=disabled,v4l-utils"
> >  PACKAGECONFIG[mpg123]     = "-Dmpg123=enabled,-
> > Dmpg123=disabled,mpg123"
> >  PACKAGECONFIG[pulseaudio] = "-Dpulse=enabled,-
> > Dpulse=disabled,pulseaudio"
> > +PACKAGECONFIG[qt5]        = "-Dqt5=enabled,-Dqt5=disabled,qtbase
> > qtdeclarative qtbase-native"
> 
> Does it make oe-core depend on meta-qt5 layer?
> 
> What is the policy here for having inter-layer dependencies in
> DEPENDS vs. PACKAGECONFIG without explicitly listing them in
> LAYERDEPENDS?

We have a clear policy that listing such options is ok as long as its
not enabled by default.

Cheers,

Richard

