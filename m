Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web12.403.1620252981103210281
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 May 2021 15:16:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=dkn2E3ZL;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.42, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f42.google.com with SMTP id d11so3452239wrw.8
        for <openembedded-core@lists.openembedded.org>; Wed, 05 May 2021 15:16:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=AZtbIvJGKVo3qs9KES3DSnxazKcm6ZkCpidwkS8Sl4Q=;
        b=dkn2E3ZLWjXDR9jvE9CW0MM9u8vbB3/Uzl3/t7M/Z3sc8eP2ypW7d9TSOK+hA3zA/x
         2WYpHTqaCrEhjZEa2br6PlQ8aupx3vJmB+ZGMDx+IVDjUCGXJ+b74kjUduQcxhLBGELo
         ISq7s17iwGVMRgITROQB2a4FjxD/bR4EEtmH4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=AZtbIvJGKVo3qs9KES3DSnxazKcm6ZkCpidwkS8Sl4Q=;
        b=mafdIFMY48PlL+z7HgECV6uQfZgTnCvXSuMfxim9lLQKDg+LnlajBOWz8zcwgO9Jfg
         8O5xc7OCTKaRjXsvnmSYtr2LZPecbX9CDrSB+/GfB4lsGm6TIpZPHi2yvEJw4yZRpjTW
         e2VGF9dlGxAmVs6ampkHCtH5qbAOIK6xw2PDmBdJ6lh1gqOwEuIukcHMg5jNMEUoGzhv
         hG6u5DCWGRpkAywdqdiN3tBIdYtBcAj6iDf0TK9egR5iCCtRcHctUWc9qOtjws7A4DA6
         7reMHHCoMN9VpxWLv/vnT2FywDnf6bXrkFK8GsKHjAPHur8I8k5NZsEsthscNo/XsAOG
         XRTQ==
X-Gm-Message-State: AOAM533PLua/p/+hLL+3+AVRMcaka2Mv89J0NhB+/wlMX1TzPajlrrN/
	arG0AmCKeHRkHAUVebwHg56G0g==
X-Google-Smtp-Source: ABdhPJyTqM7n//wHyqwUmc6s7q/SUDd1icIjtWir8P5doneF67veN2kv3KyPqgOZWwywziM5Qd6BhA==
X-Received: by 2002:a05:6000:180a:: with SMTP id m10mr1243783wrh.215.1620252979592;
        Wed, 05 May 2021 15:16:19 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:d0ab:d9f1:6e0d:9f6e? ([2001:8b0:aba:5f3c:d0ab:d9f1:6e0d:9f6e])
        by smtp.gmail.com with ESMTPSA id l14sm898664wrv.94.2021.05.05.15.16.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 May 2021 15:16:19 -0700 (PDT)
Message-ID: <669dfd1f4c2d3c444cbff5c467187ed24306b4e6.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 58/61] gi-docgen: add a recipe and class
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>
Cc: Alexander Kanavin <alex.kanavin@gmail.com>, Patches and discussions
	about the oe-core layer <openembedded-core@lists.openembedded.org>
Date: Wed, 05 May 2021 23:16:16 +0100
In-Reply-To: <CAMKF1spWRv+mhtzRti5vpn8ja94CgrJLnJ5sSt10VaX_AUhHbg@mail.gmail.com>
References: <20210505151850.660512-1-alex.kanavin@gmail.com>
	 <20210505151850.660512-58-alex.kanavin@gmail.com>
	 <CAMKF1spEqemKRZAwWnDMupsSmk7rteUef6P1HbmC0-KtsOjO_w@mail.gmail.com>
	 <CANNYZj9scBK7xAZpR1A3Fs9AiC8MT_EZHqszbGfiAkZSZgMYwg@mail.gmail.com>
	 <443c94b6db48ae6b7daae10b529b8ea420be4add.camel@linuxfoundation.org>
	 <CAMKF1so4BWNatThY_tixepiRUvzH=kfE7_4BWHroj4RnzSVQyA@mail.gmail.com>
	 <0dc03ad24ae6700f7757b6afca84c37758759d29.camel@linuxfoundation.org>
	 <CAMKF1spWRv+mhtzRti5vpn8ja94CgrJLnJ5sSt10VaX_AUhHbg@mail.gmail.com>
User-Agent: Evolution 3.40.0-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2021-05-05 at 15:07 -0700, Khem Raj wrote:
> On Wed, May 5, 2021 at 2:52 PM Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> > 
> > On Wed, 2021-05-05 at 14:28 -0700, Khem Raj wrote:
> > > On Wed, May 5, 2021 at 2:09 PM Richard Purdie
> > > <richard.purdie@linuxfoundation.org> wrote:
> > > > 
> > > > On Wed, 2021-05-05 at 20:45 +0200, Alexander Kanavin wrote:
> > > > > On Wed, 5 May 2021 at 20:05, Khem Raj <raj.khem@gmail.com> wrote:
> > > > > > On Wed, May 5, 2021 at 8:20 AM Alexander Kanavin <alex.kanavin@gmail.com> wrote:
> > > > > > > 
> > > > > > > This seems to be the gtk-doc successor, and gnome
> > > > > > > projects such as pango and gdk-pixbuf have started
> > > > > > > transitioning to it.
> > > > > > > 
> > > > > > 
> > > > > > going through
> > > > > > https://gitlab.gnome.org/GNOME/gi-docgen#disclaimer
> > > > > > 
> > > > > > it seems that its still under development and not declared stable, so
> > > > > > I am wary of the churn it will cause.
> > > > > > I would prefer to wait until at least its declared prime time for
> > > > > > system wide inclusion.
> > > > > > 
> > > > > 
> > > > > 
> > > > > It is only built if you enable api-documentation, and even then used only
> > > > > in pango and gdk-pixbuf. I'd say it's fairly well contained.
> > > > 
> > > > I did also have a quick chat with friends in that community and their advice
> > > > was that it was ok to switch now FWIW...
> > > 
> > > ok, that helps, perhaps they can reflect this assertion in document above?
> > > but still, depending upon abandoned packages needs to be answered by
> > > upstream IMO before we tread down this path
> > 
> > Reading that disclaimer, it seems to be saying they're making it work for gtk.
> > We're using it in the gtk related components it is being developed for so I'm
> > not sure there is an issue. What it says not to do is use it for general non-gtk
> > code. We're not using it outside gtk?
> 
> This above says
> 
> GI-DocGen is still in development. The recommended use of GI-DocGen is
> to add it as a sub-project to your Meson build system, and vendor it
> when releasing dist archives.
> 
> we are trying to use it in system mode and not vendored along with
> packages which need it. Perhaps I am misunderstanding?

Effectively we are vendoring it since only things with a dependency on it will see it
and we're only depending on it from things which it is intended for. It isn't like 
we're making it a system wide development tool.

Cheers,

Richard

