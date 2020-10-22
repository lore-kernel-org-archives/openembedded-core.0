Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com [209.85.128.67])
 by mx.groups.io with SMTP id smtpd.web11.1015.1603399331485414990
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Oct 2020 13:42:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=dLQLIWfX;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.67, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f67.google.com with SMTP id d78so4812078wmd.3
        for <openembedded-core@lists.openembedded.org>; Thu, 22 Oct 2020 13:42:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=5UCuxOVxbjFXE729Ptw5g0s+9clgxNwGzcEMJntafmU=;
        b=dLQLIWfXpnyETbRHGSaN5tghilrsEgxbjlN9H+9HHo9AkP2NtLDZyPd5H2zuRu/8Fu
         VQEBmF6jC5YeOLuKAHlmA5ozQOYDJ/wIz0yQ2sgtWUJ9StsxcsqmUbPdWtksAlpUg7/E
         Ln+gpq/wqkDwZserq4GzWNeM3arY7+WBHE/PU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=5UCuxOVxbjFXE729Ptw5g0s+9clgxNwGzcEMJntafmU=;
        b=UR9u6EAlqCYT3I4Swj6cOZyYOUg41D7WreRsagftEX1huWxCakPu1CObtrHHSntatO
         p0dM+plM1atS7FDgW1NQseNmzpQHrc01xELyeIrZmPgd/9oHjokEec8ML015T9Vut7pE
         T0vX9g6wfdr+g6YlkcdJ0uFp3tFA1bfT7es/8CZN8jNqU8PjVsR6T2I4SrQR39+OTIET
         PiNfqkKqIgRDDA9loPxy7a+srBzhvUizq1rGpHzJZ4eUN7F3A7MlDEducfzrTvGc3v4s
         n04Dce53Ng2usPvY3dV+4+rbcLf0k7xYD9//CTzaQQVNrAdxv3/4i0oSrBO7vFExsoHW
         mQlg==
X-Gm-Message-State: AOAM533sWNpkCEBjXxsSAh/7p2f77JAzvpBTlM06hA7UEJTemoRbPPxt
	hpTayriBJagSGnvSQqvlmrxUTg==
X-Google-Smtp-Source: ABdhPJxBdF+J+vVUgVivlx990g4dXpL1TQjEmPJ1Zm1wcaMuqwdH4O0kRJxYNH18NrCOh673cpNGuw==
X-Received: by 2002:a1c:9a93:: with SMTP id c141mr4485500wme.168.1603399329854;
        Thu, 22 Oct 2020 13:42:09 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from a.6.3.d.1.f.b.7.5.5.7.b.f.2.d.5.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa (a.6.3.d.1.f.b.7.5.5.7.b.f.2.d.5.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:5d2f:b755:7bf1:d36a])
        by smtp.gmail.com with ESMTPSA id y5sm5745818wrw.52.2020.10.22.13.42.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2020 13:42:09 -0700 (PDT)
Message-ID: <bac2b9ce03584fc50842e725ab695a2960c9d6f8.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] multilib_header.bbclass: Do not install the stubs for non-multilib case
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Date: Thu, 22 Oct 2020 21:42:08 +0100
In-Reply-To: <7ef77885-d26d-37a3-5ee3-4b2299b8909e@gmail.com>
References: <20201021210932.984184-1-raj.khem@gmail.com>
	 <d4a88c9df72243f4e334d3b408200062b6113b59.camel@linuxfoundation.org>
	 <CAMKF1sp+iH=H3yTPWSr_6iSJK2F0yDGBHk59K_zq4_6JYLwwUQ@mail.gmail.com>
	 <16daa853-ba5a-af7b-40f7-8b4e757848be@gmail.com>
	 <0b8c63800f9b0c70e7949ec1244c5061efe2c746.camel@linuxfoundation.org>
	 <7ef77885-d26d-37a3-5ee3-4b2299b8909e@gmail.com>
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2020-10-22 at 13:37 -0700, Khem Raj wrote:
> 
> On 10/22/20 1:11 PM, Richard Purdie wrote:
> > On Thu, 2020-10-22 at 12:21 -0700, Khem Raj wrote:
> > > I ran a few combination builds without this patch applied.
> > > 
> > > build core-image-minimal/qemux86-64
> > > 
> > > then add just following to local.conf
> > > 
> > > require conf/multilib.conf
> > > MULTILIBS = "multilib:lib32"
> > > DEFAULTTUNE_virtclass-multilib-lib32 = "x86"
> > > 
> > > and rebuild core-image-minimal
> > > 
> > > here is buildhistory-diff output ( before and after adding
> > > multilib to
> > > local.conf)
> > > 
> > > http://sprunge.us/oM7Fg3
> > > 
> > > It ends up rebuilding all target packages inclduing some cross
> > > packages
> > > e.g. libtool-cross, native sstate it still re-used and that
> > > remains so
> > > with above patch applied as well.
> > > 
> > > Therefore this patch does not make things any different than they
> > > are
> > > currently.
> > > 
> > > Let me know if I should be checking more things.
> > 
> > Imagine you configure 64 bit x86 to use /lib64 in all situations
> > (which
> > many do now, it probably should be the default).
> 
> interesting but its not default, and multilib is not default as well.

I thought it was the default on other distros? We only have it as the
default for nodistro and poky for historical reasons and I've not
wanted the pain of switching.

> Thirdly we are optimizing for a case where we want to switch distros 
> between multilib and non-multilib case. 

Ok, in 3.3, lets propose switching the default on 64 bit x86 and that
in turn should let us optimise the autobuilder load to cut out a lot of
these currently basically duplicated builds? If its not wanted for
nodistro, I can propose we change poky.

> are there practical usecases of  these three conditions? I think we
> are optimizing for a relatively small  usecase here if there are any.

See above, we can at the very least optimise the autobuilder. I'd
actually thought it should be reusing now but it clearly isn't. We
should fix that.

I do think its a sensible optimization to have working. I know it means
we need to be a bit more careful with that patch.

Cheers,

Richard


