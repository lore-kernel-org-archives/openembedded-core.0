Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web12.73.1620251566524030787
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 May 2021 14:52:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=dZ2Xmu2W;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.43, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f43.google.com with SMTP id n205so2264216wmf.1
        for <openembedded-core@lists.openembedded.org>; Wed, 05 May 2021 14:52:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=0JeEZhf+kdqyY6F9rbCW6/i5ibATIY7sycVytU7CPiU=;
        b=dZ2Xmu2Wp9HgoOC2Q6V5+DcJqnOUhRmlzi3I9sbebSlwXiFcQeInVwfwumRVY07Eav
         SiYk1UrASW8cdkStH7LqLzzn9nfxD5mp0eR6HECrPFvpc3Cp3e2tDT5dSZ4TDdnKVLMh
         JlZxs7Gsb9Pg9dVcac7L53ZhpNiSe/uBPzN2Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=0JeEZhf+kdqyY6F9rbCW6/i5ibATIY7sycVytU7CPiU=;
        b=PMefYzJt/q3V+349/SWWo2pCEKVyjGXMeg+l9HZ+XZcNvocUwELE2X8/h3BAOPL7CL
         5QVzxo8Vz1pkudtO4BPME26O6YnC5DyscGevaQPPDWC4i3Z41E8uKP05VBQx3Lq9N3nw
         sq5EW3yNoLLUvEXnuLh+qnddQq5wQ7IU/29l5IK9/es1baf5kE3tBIN4NP9Ao+whpSMe
         rUO+gI+vYIGolMLFQM69S9Fv9aG88l9FiKIYLdIMB0bf2gb4GSYEowRMyh7gi6y3aTR6
         j/QtRaqyyNFGBYBRVrJMmsQXJVm9wSU+c3wn1wZwvpCiLEBnSncypzIiPXu/4NT332wg
         NRTw==
X-Gm-Message-State: AOAM531JPcKXPGMt6upxGrRUDp6Uf2ZxuYZH9QWL6kNN9p2/Gpdy63Ba
	dzG3Pew0JhOdP6W6SrlxUGKlpA==
X-Google-Smtp-Source: ABdhPJxPKz/nL1lh/FAqTLkYU488GTQunrc3yR5PZs7fFSDdIsc0o8c0GFimDVbph+bxhUM0p7DpkA==
X-Received: by 2002:a1c:7419:: with SMTP id p25mr12171855wmc.79.1620251564781;
        Wed, 05 May 2021 14:52:44 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:d0ab:d9f1:6e0d:9f6e? ([2001:8b0:aba:5f3c:d0ab:d9f1:6e0d:9f6e])
        by smtp.gmail.com with ESMTPSA id w7sm800627wru.51.2021.05.05.14.52.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 May 2021 14:52:44 -0700 (PDT)
Message-ID: <0dc03ad24ae6700f7757b6afca84c37758759d29.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 58/61] gi-docgen: add a recipe and class
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>
Cc: Alexander Kanavin <alex.kanavin@gmail.com>, Patches and discussions
	about the oe-core layer <openembedded-core@lists.openembedded.org>
Date: Wed, 05 May 2021 22:52:43 +0100
In-Reply-To: <CAMKF1so4BWNatThY_tixepiRUvzH=kfE7_4BWHroj4RnzSVQyA@mail.gmail.com>
References: <20210505151850.660512-1-alex.kanavin@gmail.com>
	 <20210505151850.660512-58-alex.kanavin@gmail.com>
	 <CAMKF1spEqemKRZAwWnDMupsSmk7rteUef6P1HbmC0-KtsOjO_w@mail.gmail.com>
	 <CANNYZj9scBK7xAZpR1A3Fs9AiC8MT_EZHqszbGfiAkZSZgMYwg@mail.gmail.com>
	 <443c94b6db48ae6b7daae10b529b8ea420be4add.camel@linuxfoundation.org>
	 <CAMKF1so4BWNatThY_tixepiRUvzH=kfE7_4BWHroj4RnzSVQyA@mail.gmail.com>
User-Agent: Evolution 3.40.0-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Wed, 2021-05-05 at 14:28 -0700, Khem Raj wrote:
> On Wed, May 5, 2021 at 2:09 PM Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> > 
> > On Wed, 2021-05-05 at 20:45 +0200, Alexander Kanavin wrote:
> > > On Wed, 5 May 2021 at 20:05, Khem Raj <raj.khem@gmail.com> wrote:
> > > > On Wed, May 5, 2021 at 8:20 AM Alexander Kanavin <alex.kanavin@gmail.com> wrote:
> > > > > 
> > > > > This seems to be the gtk-doc successor, and gnome
> > > > > projects such as pango and gdk-pixbuf have started
> > > > > transitioning to it.
> > > > > 
> > > > 
> > > > going through
> > > > https://gitlab.gnome.org/GNOME/gi-docgen#disclaimer
> > > > 
> > > > it seems that its still under development and not declared stable, so
> > > > I am wary of the churn it will cause.
> > > > I would prefer to wait until at least its declared prime time for
> > > > system wide inclusion.
> > > > 
> > > 
> > > 
> > > It is only built if you enable api-documentation, and even then used only
> > > in pango and gdk-pixbuf. I'd say it's fairly well contained.
> > 
> > I did also have a quick chat with friends in that community and their advice
> > was that it was ok to switch now FWIW...
> 
> ok, that helps, perhaps they can reflect this assertion in document above?
> but still, depending upon abandoned packages needs to be answered by
> upstream IMO before we tread down this path

Reading that disclaimer, it seems to be saying they're making it work for gtk.
We're using it in the gtk related components it is being developed for so I'm
not sure there is an issue. What it says not to do is use it for general non-gtk 
code. We're not using it outside gtk?

Cheers,

Richard

