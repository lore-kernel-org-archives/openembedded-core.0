Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com [209.85.128.68])
 by mx.groups.io with SMTP id smtpd.web12.744.1594844268896419757
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Jul 2020 13:17:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=FnV6XfT6;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.68, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f68.google.com with SMTP id c80so7090997wme.0
        for <openembedded-core@lists.openembedded.org>; Wed, 15 Jul 2020 13:17:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=811kDRXwamSlIADq8IS0EJ1ADUH1CYZ74a2U35TrRjs=;
        b=FnV6XfT6WDiZGLFrvqVJURTOpTdP+0JLWcETaTPH/ohimB97vGJvbhaxiLF9XqWodu
         YL8GBN5jgHkDc9xpapLjpJp1X9F3+Mm91Z05M5T42RKefMxbi9Ta3Fs1wanGp0aMEGs+
         73q0iBilt4hK+KwGSjuwNjHR3NJT38X8AzDqY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=811kDRXwamSlIADq8IS0EJ1ADUH1CYZ74a2U35TrRjs=;
        b=Ort0/0/P35AccIiKRZEgryaNTAxAi/j74nq9lM0gM+OmosJU8ymXEt2e3nio04gASY
         Px3K7qCJTCHXynSRJGhiJwC+c6CXDafrMag+n4gtWbnZgP5Qg6pPvtiOZ7ug4sCAEcod
         IfvyPtFEpXbnGv68YBHUTldP5M+fIVW12D84vm8yuJubhpYtCUlGi38I4e7D4sDNOvRD
         3lLf6lxyB3KLxVJNgUxlO09/S4DSpHzxCpophqssohZIMWaGL15sAR1zoH2wBLMqGmic
         JfafgR0iPLeqUhLMf1NEpsuVGMNApSlpW5Q+hnCcEGmO7iwOPkaB9V+qJV3n6O8qO5Od
         TQrA==
X-Gm-Message-State: AOAM532/Um43DZPQoDpM8Hfvtzzq5l2xAuDh7ZKhjioUsQS36SRWRY7A
	YQRIyzL83HkzB+cFmMt4cyOqjQ==
X-Google-Smtp-Source: ABdhPJzobuljDf9KWcn0FXQpmwQt6wYCfSBjSPvC2xw1iGW2sLJLdyNosUW//ekJCVbJe3sx5b+apA==
X-Received: by 2002:a1c:4143:: with SMTP id o64mr1156214wma.11.1594844267233;
        Wed, 15 Jul 2020 13:17:47 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from f.c.4.9.c.e.0.f.2.5.c.9.7.3.d.1.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa (f.c.4.9.c.e.0.f.2.5.c.9.7.3.d.1.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:1d37:9c52:f0ec:94cf])
        by smtp.gmail.com with ESMTPSA id x185sm4938543wmg.41.2020.07.15.13.17.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2020 13:17:46 -0700 (PDT)
Message-ID: <621447751555a369f45f76a033ff743612d580f5.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] qemu: use host pkg-config only when host provides sdl
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: "Taras Kondratiuk (takondra)" <takondra@cisco.com>, 
	"alex.kanavin@gmail.com"
	 <alex.kanavin@gmail.com>
Cc: "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>, "xe-linux-external(mailer
 list)" <xe-linux-external@cisco.com>
Date: Wed, 15 Jul 2020 21:17:43 +0100
In-Reply-To: <b2d458f64f65890e3fa30644b4c18f7dcd74dddf.camel@cisco.com>
References: <fb3b732ab791369a2287a3b89e0d125c78f228ca.camel@cisco.com>
	 <20200712213551.2206605-1-takondra@cisco.com>
	 <CANNYZj8QBo7X5qoq3yse8rO3qh47_zTWkm6hkRUng2hHmj+c_w@mail.gmail.com>
	 <0cef3914ade47872815423de749d0885759d24e8.camel@cisco.com>
	 <CANNYZj-5OJTK7OZ0MHvdiHuWdEAykbG0SKbkxaQjYQpqkgQzqw@mail.gmail.com>
	 <b2d458f64f65890e3fa30644b4c18f7dcd74dddf.camel@cisco.com>
User-Agent: Evolution 3.36.2-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2020-07-15 at 18:54 +0000, Taras Kondratiuk (takondra) wrote:
> On Wed, 2020-07-15 at 19:23 +0200, Alexander Kanavin wrote:
> > On Wed, 15 Jul 2020 at 19:09, Taras Kondratiuk (takondra) <
> > takondra@cisco.com> wrote:
> > > This specific xkbcommon issue was hit on Zeus branch. You are
> > > right, on
> > > Dunfell and master the commit 3f1fd15cf0df ("qemu-system-native:
> > > disable options not included in extended tarball") will hide this
> > > issue. But the issue is still there. One will have to keep adding
> > > PACKAGECONFIG options for each configuration that can be out of
> > > sync
> > > between host and buildtools tarball.
> > 
> > But that means we have a non-determinism problem: if qemu is picking
> > up things from the host without being explicitly told to do so, then
> > the right fix is indeed to add the missing PACKAGECONFIGs so those
> > things are either explicitly enabled or explicitly disabled.  This
> > patch seems to be working around the non-determinism, rather than
> > addressing it.
> 
> PACKAGECONFIG improves determinism, but it is not sufficient. It is not
> feasible to make sure that PACKAGECONFIGs cover all configurations.
> There will be always something that slips through. I think
> acknowledging this fact was one of the reasons for recipe-specific
> sysroots.

We are supposed to have PACKAGECONFIG for all the options a given bit
of software has. Setting those options is meant to be deterministic. I
appreciate that some recipes don't have complete coverage but they
should have.

Recipe specific sysroots is there as an extra layer of protection but
it doesn't mean PACKAGECONFIG shouldn't be specified or working. RSS
was added for multiple reasons, this is only a small piece of it.

> We use buildtools tarball to better isolate OE build from host
> environment and improve determinism. Host pkg-config opens a big hole
> for non-determinism and plugging it with PACKAGECONFIGs seems fragile.

You make this sound like we do that a lot, we don't. There are some
isolated and very specific cases. Ensuring the PACKAGECONFIG handling
in those cases is correct should be managable.

The question is therefore whether there is a problem with PACKAGECONFIG
in master. I appreciate zeus may have a bigger issue.

Cheers,

Richard





