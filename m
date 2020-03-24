Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com [209.85.128.68])
 by mx.groups.io with SMTP id smtpd.web12.370.1585078185973940026
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Mar 2020 12:29:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=WIV5c/ct;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.68, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f68.google.com with SMTP id a81so4865801wmf.5
        for <openembedded-core@lists.openembedded.org>; Tue, 24 Mar 2020 12:29:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=bKcusL0qLjlc7uSSdh/AyfwBGATR65CpZqVru+eLM8E=;
        b=WIV5c/ctuhdvAEJpD2m6+V126oS+o08xarD/4NZNwIhqcUi5ks/9hNRCwKkJ8hTzXH
         rncGvNpBtBYnvvffjcIjk7ZS/ZfEsj83d5CBQfqCao9FLTD6fz2e2CilgJmrYbkGvVQq
         lJWtvYIXuOV25btWOivVn4kis6yFp8zxUHjbg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=bKcusL0qLjlc7uSSdh/AyfwBGATR65CpZqVru+eLM8E=;
        b=h2++7vfJbm9CVV7frIugplEyV6lv/XkdVWFvQOqgD2NqWRLpDFjQQ0CGzsoiW0tTmn
         IHoao4Rbpn9OgHQqO8nNiePFvsPVTicx3h8oR/7Eq1Da9gxybuHYhJpomoCSwOXFsQDl
         YXi7yL2wBjhgf/qke42nTvf4s1clM3nyhtn8iPLR/iPSuXCSeKgFA0TqUQ4TItnPi5PV
         6Pj8TFxZ/UAHvuxp/XJpaFCrWfJe3vhlcItABujk1IRDmfnAZA4MmC1i8LAA3S705uFZ
         VJmpInDidk4kfgok7ErO++9a9FEcB85ry1dpo6nMPyD8+C7hz+C+MrKKnGhqCyV+iiNT
         aw+g==
X-Gm-Message-State: ANhLgQ06l/uWnnGtxBfPzNcqy1vctEReirmeyHRJTxr+g4K4uoKwRDpQ
	ysJcolh/5f+paFlXZObwMj/eIw==
X-Google-Smtp-Source: ADFU+vtdF5PE50xDfB5Mm4GbO9dnOHOUs+444HNlgYaVtkRJHDPUufCvR+6zOpvJfFrAsqmKyTLeuQ==
X-Received: by 2002:a1c:6385:: with SMTP id x127mr7270593wmb.141.1585078184443;
        Tue, 24 Mar 2020 12:29:44 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
        by smtp.gmail.com with ESMTPSA id d9sm2287521wmb.21.2020.03.24.12.29.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2020 12:29:43 -0700 (PDT)
Message-ID: <467110132be087c26851033a7b9e45972b5c0bd4.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 2/2] gstreamer1.0-plugins-good: add qt5 PACKAGECONFIG
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Denys Dmytriyenko <denis@denix.org>
Cc: Anuj Mittal <anuj.mittal@intel.com>, 
	openembedded-core@lists.openembedded.org
Date: Tue, 24 Mar 2020 19:29:42 +0000
In-Reply-To: <20200324184323.GZ1578@denix.org>
References: <1582252918-89191-1-git-send-email-anuj.mittal@intel.com>
	 <1582252918-89191-2-git-send-email-anuj.mittal@intel.com>
	 <20200324175821.GW1578@denix.org>
	 <19b30b569a31c0068d5c3b46e1f83178942ecc8e.camel@linuxfoundation.org>
	 <20200324181234.GX1578@denix.org>
	 <355e8218d0ac4611df2ad2ed0c199149c1dd1465.camel@linuxfoundation.org>
	 <15FF5122E920BDAA.24006@lists.openembedded.org>
	 <20200324184323.GZ1578@denix.org>
User-Agent: Evolution 3.35.92-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2020-03-24 at 14:43 -0400, Denys Dmytriyenko wrote:
> On Tue, Mar 24, 2020 at 02:33:19PM -0400, Denys Dmytriyenko wrote:
> > On Tue, Mar 24, 2020 at 06:15:51PM +0000, Richard Purdie wrote:
> > > On Tue, 2020-03-24 at 14:12 -0400, Denys Dmytriyenko wrote:
> > > > On Tue, Mar 24, 2020 at 06:07:44PM +0000, Richard Purdie wrote:
> > > > > On Tue, 2020-03-24 at 13:58 -0400, Denys Dmytriyenko wrote:
> > > > > > On Fri, Feb 21, 2020 at 10:41:58AM +0800, Anuj Mittal
> > > > > > wrote:
> > > > > > > Instead of disabling unconditionally, add PACKAGECONFIG
> > > > > > > for
> > > > > > > qt5. Imported from meta-qt5 layer.
> > > > > > > 
> > > > > > > Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
> > > > > > > ---
> > > > > > >  .../gstreamer/gstreamer1.0-plugins-
> > > > > > > good_1.16.2.bb                  | 7 +------
> > > > > > >  1 file changed, 1 insertion(+), 6 deletions(-)
> > > > > > > 
> > > > > > > diff --git a/meta/recipes-
> > > > > > > multimedia/gstreamer/gstreamer1.0-
> > > > > > > plugins-good_1.16.2.bb b/meta/recipes-
> > > > > > > multimedia/gstreamer/gstreamer1.0-plugins-good_1.16.2.bb
> > > > > > > index f3e0cee..8b34111 100644
> > > > > > > --- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-
> > > > > > > plugins-
> > > > > > > good_1.16.2.bb
> > > > > > > +++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-
> > > > > > > plugins-
> > > > > > > good_1.16.2.bb
> > > > > > > @@ -42,6 +42,7 @@ PACKAGECONFIG[libpng]     = "-
> > > > > > > Dpng=enabled,-
> > > > > > > Dpng=disabled,libpng"
> > > > > > >  PACKAGECONFIG[libv4l2]    = "-Dv4l2-libv4l2=enabled,-
> > > > > > > Dv4l2-
> > > > > > > libv4l2=disabled,v4l-utils"
> > > > > > >  PACKAGECONFIG[mpg123]     = "-Dmpg123=enabled,-
> > > > > > > Dmpg123=disabled,mpg123"
> > > > > > >  PACKAGECONFIG[pulseaudio] = "-Dpulse=enabled,-
> > > > > > > Dpulse=disabled,pulseaudio"
> > > > > > > +PACKAGECONFIG[qt5]        = "-Dqt5=enabled,-
> > > > > > > Dqt5=disabled,qtbase
> > > > > > > qtdeclarative qtbase-native"
> > > > > > 
> > > > > > Does it make oe-core depend on meta-qt5 layer?
> > > > > > 
> > > > > > What is the policy here for having inter-layer dependencies
> > > > > > in
> > > > > > DEPENDS vs. PACKAGECONFIG without explicitly listing them
> > > > > > in
> > > > > > LAYERDEPENDS?
> > > > > 
> > > > > We have a clear policy that listing such options is ok as
> > > > > long as
> > > > > its
> > > > > not enabled by default.
> > > > 
> > > > Richard,
> > > > 
> > > > This is good, thank you for confirming. Do you have a link
> > > > where this
> > > > is clearly explained? Thanks again.
> > > 
> > > Its come up many times over the years and we've been consistent
> > > about
> > > it. I don't have a link but there has been mailing list
> > > discussion and
> > > perhaps TSC discussion long ago, I simply don't remember. There
> > > are
> > > many examples of that in OE-Core.
> > > 
> > > The alternative is forcing more into bbappends which doesn't seem
> > > to
> > > gain anything (PACKAGECONFIG itself could be changed from distro
> > > config
> > > for example).
> > > 
> > > Its also easy to catch bad defaults since the recipes would no
> > > longer
> > > parse due to missing dependencies which we'd quickly spot.
> > 
> > Richard,
> > 
> > Yes, yes, I understanf all that from a technical perspective and
> > agree with 
> > it, but I was thinking about a more clear definition of this policy
> > to be able 
> > to point anyone having such questions in the future...
> 
> BTW, I don't remember discussing this at YP TSC... Maybe OE TSC
> covered this in the past?

Metadata architecture decision would be the OE TSC and "TSC discussion
long ago" means something from several years ago.

Cheers,

Richard


