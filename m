Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web10.221.1627503892324705716
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Jul 2021 13:24:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=diCkLX23;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.47, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f47.google.com with SMTP id h24-20020a1ccc180000b029022e0571d1a0so2489945wmb.5
        for <openembedded-core@lists.openembedded.org>; Wed, 28 Jul 2021 13:24:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=w/gHCQ6V/0nn4bxLI+VsLRjACJ1RsZA+5b4reuAf6KA=;
        b=diCkLX23hMPGLwJKkpzgDUFQXT2s3bpAM6KjJBX05mFe0AOR5v6xv1l8raRZbQCw1x
         bw1+WPrSCsP1cV/mHcZxiqUayjxIfQqlTn5j0WfzzwIF1i7ViJNAPMaM1nD+luTHpxvX
         q47XiVJP2aq3ieM3d0Bq3Sj/MKfdhLJfK4Oc4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=w/gHCQ6V/0nn4bxLI+VsLRjACJ1RsZA+5b4reuAf6KA=;
        b=beyspqFDLht5+Pvc4bWhV5vAV0mlBpFIEA2Dk3e+9vdInbpZCRh1tz9TNH6S1N20Yh
         JX17NfK6oX3ZW3wjbSLfPkxBD9qcbUbja6U+Da6gTfouwHhCAqBLWD4H82TiBKakT0mz
         1kv7dRHr3dO4O0rHnqSddMXFTdY122f3v4GR1MiQkb3B3vuXndMw7t7AT+JjeyxdUO+Z
         e1h94DWLTwRlCTJA6sgCWZAb8TpfafskGjwtLHA0QajLA7GsJnNdeMibSHUNZnXKoEuU
         dcRizTgmhc6VAxyrxE2hcH/Iz0tEeUwEKuoDJLSUKq6q2DT8v0FCOZLnFB08XveEE9FJ
         ViLw==
X-Gm-Message-State: AOAM533p0SGxi4YfdN626h2InHnlygSOxj702zNlxo1dEXQwn1FL9Ake
	KW/8EiNemCFTA2ETx5UmsNWOnQ==
X-Google-Smtp-Source: ABdhPJzX0PJYjcgx0K4t6sNbk26hgK9GMUvKx1JgEWt1XLKsWBdLcvQhaZ8mgWuaiszEx178CInBAw==
X-Received: by 2002:a05:600c:190e:: with SMTP id j14mr1257635wmq.19.1627503890618;
        Wed, 28 Jul 2021 13:24:50 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:824:a750:d1fb:a5cc? ([2001:8b0:aba:5f3c:824:a750:d1fb:a5cc])
        by smtp.gmail.com with ESMTPSA id l2sm859302wms.21.2021.07.28.13.24.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jul 2021 13:24:50 -0700 (PDT)
Message-ID: <ca0a10a951237a41cda24eefa7300ea646f98c23.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 3/3] meta: Manual override fixes
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Andre McCurdy <armccurdy@gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Date: Wed, 28 Jul 2021 21:24:48 +0100
In-Reply-To: <16960CD0F3F5D3AD.12099@lists.openembedded.org>
References: <20210728141506.3287158-1-richard.purdie@linuxfoundation.org>
	 <20210728141506.3287158-3-richard.purdie@linuxfoundation.org>
	 <CAJ86T=UNcf=Tzj4hq2uwXJzmtio71YZExLsr6zqOZr-ZAq9trQ@mail.gmail.com>
	 <16960CD0F3F5D3AD.12099@lists.openembedded.org>
User-Agent: Evolution 3.40.0-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Wed, 2021-07-28 at 21:00 +0100, Richard Purdie via lists.openembedded.org wrote:
> On Wed, 2021-07-28 at 12:32 -0700, Andre McCurdy wrote:
> > On Wed, Jul 28, 2021 at 7:15 AM Richard Purdie
> > <richard.purdie@linuxfoundation.org> wrote:
> > > 
> > > The automated conversion of OE-Core to use the new override sytax isn't
> > > perfect. This patches some mis-converted lines and some lines which were missed
> > > by the automation.
> > > 
> > > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> > > @@ -86,7 +86,7 @@ python systemd_populate_packages() {
> > >          bb.debug(1, 'adding systemd calls to postinst/postrm for %s' % pkg)
> > > 
> > >          paths_escaped = ' '.join(shlex.quote(s) for s in d.getVar('SYSTEMD_SERVICE:' + pkg).split())
> > > -        d.setVar('SYSTEMD_SERVICE:ESCAPED_' + pkg, paths_escaped)
> > > +        d.setVar('SYSTEMD_SERVICE_ESCAPED:' + pkg, paths_escaped)
> > 
> > This is manually fixing the misconversion of _ESCAPED to :ESCAPED,
> > right? If so then does it mean a bug in the automatic conversion
> > script since overrides can't be uppercase?
> 
> There are several bugs in the script, yes. The question is how far to go 
> in trying to address them and this wasn't a common issue.

In case it isn't clear, this isn't as easy as you might first think. We need
to convert SYSTEMD_SERVICE_${PN} which has uppercase characters in it. Can it
be fixed? Probably, yes. Is it worth the effort/complexity? Maybe not.

Cheers,

Richard

