Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
 by mx.groups.io with SMTP id smtpd.web08.2077.1626982617655298051
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Jul 2021 12:36:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=if5c1z7e;
 spf=pass (domain: gmail.com, ip: 209.85.222.174, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f174.google.com with SMTP id q190so6547687qkd.2
        for <openembedded-core@lists.openembedded.org>; Thu, 22 Jul 2021 12:36:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=9E2UVt97fvotSahhA7uY63RfIwGhkqQVBrHG+U0Hlv4=;
        b=if5c1z7e8eQ5t3YP2eNqOPy/mDoupmV0iEJhhVSCdhtDNuLM0dPngostLd1rR4v/an
         oo3CEgImxtArKm2VXgpjKoWMsx+iCAfe1LTMj24WJrXA3+IC8eQQo9lmmgSPDa6KY/JT
         OVf5rkM5wB/IvuotYuANoXT2c+ZHGHUCXywYimK0Zjt4WKwCfMkH60kRUTWuudw7BFEv
         QJSlH1UpAL3EHCig6CBu0mQ6wN4aVFfhJS991DCrUwGjdGv+FveZcFHRwOvH3AB+mjo2
         on1sWRj/7t5ZDj/lHltSA85W+SsKpcrGJK1t/WxuBRwX1Qluml1dYh3MA3dfhy+VOJFu
         T6yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=9E2UVt97fvotSahhA7uY63RfIwGhkqQVBrHG+U0Hlv4=;
        b=XqERp8sXZLvZ9+HriqLUo3/bcw0aopFESKpeuaenakGIG1VtZ/7x/T2lxwn7MN0bFy
         zxUhtpeUmRD8gr+WGxlQaZIozULQXgIO8qcfVL/8Cb2xx4/ykbJcSzhQ9sEWMCfDHQUJ
         XMPqJKEthJK+/Mtq4vvBzpY4SdDlL2bVsTVIbaOtBAlP1tFBbJaUaIl6dTuhPyUHPza3
         7aSe6vclrQ3zV3+oJTnSAGni6p3/BhLSFJLETJvoWyqj5DCAMM0q9qSuX0bQ8T8xcy7H
         +RcrkHAakDT37i2hIZmbwmHyeOtLclVW54UWTwNgga+p4ZEAUGQ8SyHJPBPO/DMvgVr1
         KN6w==
X-Gm-Message-State: AOAM5320s3ZGbDT7ZeXuSDOWqrIlgd5ORFRhnSBrtT76CYkWpiCHb8D/
	ijICw2ufuMmouAJemscYSZDHg+3cO2Fze0WIb/7N6yA0A6k=
X-Google-Smtp-Source: ABdhPJzB5f8HJozO8NhT2wnpNuZNzj2N5iCq+Zwh7j9Vw/l9W0cxFajtYq0KIV3nnrte1fnSVw+vCs8SqSW9ozmt/aQ=
X-Received: by 2002:ae9:f201:: with SMTP id m1mr1236153qkg.381.1626982616600;
 Thu, 22 Jul 2021 12:36:56 -0700 (PDT)
MIME-Version: 1.0
References: <20210624165421.32088-1-raj.khem@gmail.com> <CAMKF1soqvCNDPaZtAStEyT6W1S_KdQyyfuu_L0inj3re9AQosQ@mail.gmail.com>
In-Reply-To: <CAMKF1soqvCNDPaZtAStEyT6W1S_KdQyyfuu_L0inj3re9AQosQ@mail.gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Thu, 22 Jul 2021 12:36:30 -0700
Message-ID: <CAMKF1sqMvVhVK4j6k5Y7dUp7=jnh6xrwQNPtSDrf6L07FFpLWA@mail.gmail.com>
Subject: Re: [PATCH] esdk: locked sig mismatch warnings when build from esdk env
To: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

ping^2, this helps with installing ESDK which has components using
multiple git repos in SRC_URI
if there is any issue with this patch, please reply here.

On Wed, Jul 7, 2021 at 10:16 AM Khem Raj <raj.khem@gmail.com> wrote:
>
> ping
>
> On Thu, Jun 24, 2021 at 9:54 AM Khem Raj <raj.khem@gmail.com> wrote:
> >
> > From: Mani Selvaraj <mani_selvaraj@comcast.com>
> >
> > A repo with multiple layers are placed under /layers/ and a repo
> > with single layer is placed under /layers/openembedded-core in esdk.
> > This tiggered locked sig mismatch warnings when building image from
> > esdk environment.
> > -----
> > TOPDIR=/Code/build
> > corebase=/Code/openembedded-core
> > -----
> > /Code/meta-java
> > /Code/meta-gplv2
> > /Code/meta-openembedded/meta-webserver
> > /Code/meta-openembedded/meta-oe
> > /Code/openembedded-core/meta
> > Are moved to
> > /sdk_org/layers/openembedded-core/meta-gplv2
> > /sdk_org/layers/openembedded-core/meta-java
> > /sdk_org/layers/meta-openembedded/meta-webserver
> > /sdk_org/layers/meta-openembedded/meta-oe
> > /sdk_org/layers/openembedded-core/meta
> >
> > here fix it to move all layers under /layers dir.
> >
> > to check this fix build image from esdk environment and
> > check for sig mismatch warnings.
> >
> > Signed-off-by: Mani Selvaraj <mani_selvaraj@comcast.com>
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > ---
> >  meta/lib/oe/copy_buildsystem.py | 2 --
> >  1 file changed, 2 deletions(-)
> >
> > diff --git a/meta/lib/oe/copy_buildsystem.py b/meta/lib/oe/copy_buildsystem.py
> > index d97bf9d1b9..4998afa60f 100644
> > --- a/meta/lib/oe/copy_buildsystem.py
> > +++ b/meta/lib/oe/copy_buildsystem.py
> > @@ -102,8 +102,6 @@ class BuildSystem(object):
> >                  layerdestpath += '/' + os.path.basename(corebase)
> >              else:
> >                  layer_relative = os.path.relpath(layer, corebase)
> > -                if os.path.dirname(layer_relative) == corebase_relative:
> > -                    layer_relative = os.path.dirname(corebase_relative) + '/' + layernewname
> >                  layer_relative = os.path.basename(corebase) + '/' + layer_relative
> >                  if os.path.dirname(layer_relative) != layernewname:
> >                      layerdestpath += '/' + os.path.dirname(layer_relative)
> > --
> > 2.32.0
> >
