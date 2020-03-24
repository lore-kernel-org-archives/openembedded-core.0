Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com [209.85.221.66])
 by mx.groups.io with SMTP id smtpd.web11.2160.1585073757760852384
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Mar 2020 11:15:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=B5arNNGI;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.66, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f66.google.com with SMTP id 65so6037452wrl.1
        for <openembedded-core@lists.openembedded.org>; Tue, 24 Mar 2020 11:15:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=NPiYdYv32AEuY/6NJSaYx6OWciMm70d4CL6yw6imnec=;
        b=B5arNNGIrKc0adnQ1Xiomn1slrT56+TJplDW/M+yy1yD2zkFbz8yi2nzYK3ZYqezhe
         iGPA/6/6MBcQQTsL5MVilYVHA4TGsaXVrdMU3xE2weLlt9dAT5gQUV4s7g8RNa6FYVvz
         zaSFbE0JgFlXDxgpmlios+irVc+CNFwN1yiQA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=NPiYdYv32AEuY/6NJSaYx6OWciMm70d4CL6yw6imnec=;
        b=b01o+Fpb9mgxeLAaywC3ytQo/NIIr7zg4OIq2PQJ3Dj9njYlIH9DEOhJt4DXfqz9wy
         RT0fyKDM/5kJweiay0D4svHjjlYMC2SK/YGQ/vrURdDavoJQplu6RKYTv8en8MzYeWQm
         IH+jHLJqXqZg5PLW5xw3y5hltESEsGaSXLF7FwxpU4GuxNNeWewIluaAW30whFAGcGFg
         3eyZC8EZWiRNQs+2IerRSxGM6lLVIZUjNBQU5Pfj9tVfTSk8SDUPs4La6DrsrCyOEQiT
         VM0vjroGbhxxZ7/KJzz/I/YW31ZfI0tNvYZJRjVoqnRX3iJy4x0hcV9XGx9hDoZF751c
         lVdg==
X-Gm-Message-State: ANhLgQ2rlY7/WD4Tc35foh9KGMJLypWc4F9uL04IP3Ifm8vxe3TGsMUR
	9ib7EYSu5SD27tu9iWTmXrGwxQ==
X-Google-Smtp-Source: ADFU+vuL7kD1dp5+ZKu4wzaRr9p/Sb0bJsmTshj1CCr8vXI/PQkF8SuNAvATwpoLIdiOVlPkVI/8Bw==
X-Received: by 2002:adf:84a3:: with SMTP id 32mr33007124wrg.378.1585073756135;
        Tue, 24 Mar 2020 11:15:56 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
        by smtp.gmail.com with ESMTPSA id s131sm5319354wmf.35.2020.03.24.11.15.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2020 11:15:52 -0700 (PDT)
Message-ID: <355e8218d0ac4611df2ad2ed0c199149c1dd1465.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 2/2] gstreamer1.0-plugins-good: add qt5 PACKAGECONFIG
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Denys Dmytriyenko <denis@denix.org>
Cc: Anuj Mittal <anuj.mittal@intel.com>, 
	openembedded-core@lists.openembedded.org
Date: Tue, 24 Mar 2020 18:15:51 +0000
In-Reply-To: <20200324181234.GX1578@denix.org>
References: <1582252918-89191-1-git-send-email-anuj.mittal@intel.com>
	 <1582252918-89191-2-git-send-email-anuj.mittal@intel.com>
	 <20200324175821.GW1578@denix.org>
	 <19b30b569a31c0068d5c3b46e1f83178942ecc8e.camel@linuxfoundation.org>
	 <20200324181234.GX1578@denix.org>
User-Agent: Evolution 3.35.92-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2020-03-24 at 14:12 -0400, Denys Dmytriyenko wrote:
> On Tue, Mar 24, 2020 at 06:07:44PM +0000, Richard Purdie wrote:
> > On Tue, 2020-03-24 at 13:58 -0400, Denys Dmytriyenko wrote:
> > > On Fri, Feb 21, 2020 at 10:41:58AM +0800, Anuj Mittal wrote:
> > > > Instead of disabling unconditionally, add PACKAGECONFIG for
> > > > qt5. Imported from meta-qt5 layer.
> > > > 
> > > > Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
> > > > ---
> > > >  .../gstreamer/gstreamer1.0-plugins-
> > > > good_1.16.2.bb                  | 7 +------
> > > >  1 file changed, 1 insertion(+), 6 deletions(-)
> > > > 
> > > > diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-
> > > > plugins-good_1.16.2.bb b/meta/recipes-
> > > > multimedia/gstreamer/gstreamer1.0-plugins-good_1.16.2.bb
> > > > index f3e0cee..8b34111 100644
> > > > --- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-
> > > > good_1.16.2.bb
> > > > +++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-
> > > > good_1.16.2.bb
> > > > @@ -42,6 +42,7 @@ PACKAGECONFIG[libpng]     = "-Dpng=enabled,-
> > > > Dpng=disabled,libpng"
> > > >  PACKAGECONFIG[libv4l2]    = "-Dv4l2-libv4l2=enabled,-Dv4l2-
> > > > libv4l2=disabled,v4l-utils"
> > > >  PACKAGECONFIG[mpg123]     = "-Dmpg123=enabled,-
> > > > Dmpg123=disabled,mpg123"
> > > >  PACKAGECONFIG[pulseaudio] = "-Dpulse=enabled,-
> > > > Dpulse=disabled,pulseaudio"
> > > > +PACKAGECONFIG[qt5]        = "-Dqt5=enabled,-
> > > > Dqt5=disabled,qtbase
> > > > qtdeclarative qtbase-native"
> > > 
> > > Does it make oe-core depend on meta-qt5 layer?
> > > 
> > > What is the policy here for having inter-layer dependencies in
> > > DEPENDS vs. PACKAGECONFIG without explicitly listing them in
> > > LAYERDEPENDS?
> > 
> > We have a clear policy that listing such options is ok as long as
> > its
> > not enabled by default.
> 
> Richard,
> 
> This is good, thank you for confirming. Do you have a link where this
> is clearly explained? Thanks again.

Its come up many times over the years and we've been consistent about
it. I don't have a link but there has been mailing list discussion and
perhaps TSC discussion long ago, I simply don't remember. There are
many examples of that in OE-Core.

The alternative is forcing more into bbappends which doesn't seem to
gain anything (PACKAGECONFIG itself could be changed from distro config
for example).

Its also easy to catch bad defaults since the recipes would no longer
parse due to missing dependencies which we'd quickly spot.

Cheers,

Richard


