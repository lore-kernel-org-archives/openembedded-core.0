Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com [209.85.221.67])
 by mx.groups.io with SMTP id smtpd.web11.14187.1601468818302754290
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Sep 2020 05:26:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=VTqmd2J6;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.67, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f67.google.com with SMTP id g4so1586652wrs.5
        for <openembedded-core@lists.openembedded.org>; Wed, 30 Sep 2020 05:26:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=xiJIN3Dt5vMFfjLROLLPiZ08mJII0JCNPVNjkgKCXZg=;
        b=VTqmd2J6qhMNJw7C5JDH0XrGc2hnCcmo392iYlFmD3z3yTIbKQ50Ke+wKh/IzO5cKk
         /AiqDTd7AVthiHvj64bojJ9ukMwpdz+QqVinl+yyJ36fIvuL5mfrj7SUWEjUmFSQV9tf
         +c1MmiK8u48KB7OwJhRcHpaLVUhU96qg+/POk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=xiJIN3Dt5vMFfjLROLLPiZ08mJII0JCNPVNjkgKCXZg=;
        b=j3N/o5HGgpisO5zDLICMJm1BB85zQxVHTgwd0fx7l8UjD9xgkm4gx0hpxwF3K5BoaU
         vMMfs20kNDrBri9NcoGOcL5RydjP91KbXbN9qqNkUTb0JYvuUKP7QHu2DgSXlRM7WW/a
         as5N+ObGuUrkfRmSEHevnsJQyQRdPFkT6mX8v8US60PFZshSEofk8GjnN9PGhlajF+58
         WOXTP1IB4Sc4UV6SN3HwsW5q+vHT0s6WfBfj7gH2VuX7qa7neL5W8w6fxDnZnw6+Du+3
         EzwrjMKg5MCDhd/iwX0/XWmLyKt7P2+5uaQ41PJ9ZC1pTZ9wze53o2h1L1azwvQz3iQP
         vTuA==
X-Gm-Message-State: AOAM532Cd9LT63K25nUjxTcBiPdOMH4XHw33Icj6jtXj04LVPcDUnC2S
	/0GOYTygOJhRS5vVVzZ+kK3GNw==
X-Google-Smtp-Source: ABdhPJzs5t1t2Kx3dpYQMgrtoh/EGsUCbIaC3hEeX35IQCZcaQr5xPyHQrDAH3pKOp2zdw0j2tx8aA==
X-Received: by 2002:a5d:5312:: with SMTP id e18mr3030918wrv.95.1601468816491;
        Wed, 30 Sep 2020 05:26:56 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from 7.f.c.3.4.0.2.3.2.2.3.7.e.3.c.9.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa (7.f.c.3.4.0.2.3.2.2.3.7.e.3.c.9.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:9c3e:7322:3204:3cf7])
        by smtp.gmail.com with ESMTPSA id h3sm2882007wrq.0.2020.09.30.05.26.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2020 05:26:56 -0700 (PDT)
Message-ID: <f2cd593503dfd6665224460d8e9c7cca447cfbb6.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 1/2] bjam-native: don't do debug builds
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Ross Burton <ross@burtonini.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Date: Wed, 30 Sep 2020 13:26:53 +0100
In-Reply-To: <CAAnfSTvp_97_cYD+We1XBNLECo=B7yubtT=neT+giJNbPOzugg@mail.gmail.com>
References: <20200929221638.2114178-1-ross.burton@arm.com>
	 <b4990a266f48396e83a13279b3c557e9d8b8d3bc.camel@linuxfoundation.org>
	 <CAAnfSTvp_97_cYD+We1XBNLECo=B7yubtT=neT+giJNbPOzugg@mail.gmail.com>
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2020-09-30 at 13:25 +0100, Ross Burton wrote:
> On Tue, 29 Sep 2020 at 23:21, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> > This isn't so simple unfortunately. If the binaries are stripped,
> > we
> > can't do the debug symbols processing, the src packages are empty
> > and
> > so on, it has knock on repercussions.
> 
> This is a native-specific recipe, so is that relevant?

I have to admit I didn't notice that! :)

Cheers,

Richard

