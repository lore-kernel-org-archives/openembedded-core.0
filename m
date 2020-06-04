Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web12.12852.1591274865379446286
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Jun 2020 05:47:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=FL31HyF+;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.47, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f47.google.com with SMTP id q11so5969911wrp.3
        for <openembedded-core@lists.openembedded.org>; Thu, 04 Jun 2020 05:47:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=oAXMITxEVJEOAK8BzA/iOV7/Uq24ICT4iD0pzHUBYYI=;
        b=FL31HyF+iorQFwJjR6UsKbLWjUQNTfGyPMQZ3dUFu6z0npgIaWqEXnFNniTr4eY6/k
         ukbgY2l7ztnZ7RWyAnKV5zdLM08Hr66pKWqcl3kZpUCZVnUNPCGw5GGxtxZq01TScW9A
         KMA4m05EGxr5tpp9KOznLiHOIi/41i8QvOuss=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=oAXMITxEVJEOAK8BzA/iOV7/Uq24ICT4iD0pzHUBYYI=;
        b=TQAwzmV21hW37/4qZUf2mWS/QFsHu8gDKVco2kEJPAYDxsY25iwKx4yPbpwXcZ/mkZ
         TZd/ZpN3vcHSYVH2OHVs/s6V9OCRI0/BV2bsfifOeIA6qfmGOEs1qaFqoEL1gWDS55RP
         SyiYqNFgE51xw1TejHRMNMrRX4nxTr79QHBRi9n7QEOBYf5oTsG24hbxiwEBoemOKa2+
         1p4b13QhbZ1lpJ+/ytY+tX8arK6UQQTgaJkBxRcojIjpVsGdR0OTzztKso+2LHetNm7S
         /93Rx1x2wVlEpTSnJrdPf279RabtpQj0XW89dTA6yLFmKntFm3f9me93KMf1OSLzNFdg
         ReRQ==
X-Gm-Message-State: AOAM532gkz/Y8a3a5CKIl0IQTYilDzxAX5Uf5Cvch6yJBukJakK1asGX
	t+31WmJ7NT/NHDMckCopVzwEZA==
X-Google-Smtp-Source: ABdhPJzPsnkHkkOOocdsYOSlHxDJj6aqBfv/NQ8rjKFshfvYQDm7ho0+spG7qtAjKid7H1ZZLrff9Q==
X-Received: by 2002:a5d:4c45:: with SMTP id n5mr4279085wrt.341.1591274864029;
        Thu, 04 Jun 2020 05:47:44 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
        by smtp.gmail.com with ESMTPSA id a124sm7253947wmh.4.2020.06.04.05.47.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2020 05:47:43 -0700 (PDT)
Message-ID: <421c9a5c69b54bfb41734e58b89dc66bf9e84c0a.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH][warrior] pseudo: Fix enum typedef
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Andreas =?ISO-8859-1?Q?M=FCller?= <schnitzeltony@gmail.com>
Cc: Patches and discussions about the oe-core layer
	 <openembedded-core@lists.openembedded.org>
Date: Thu, 04 Jun 2020 13:47:42 +0100
In-Reply-To: <CALbNGRQDVCm4zDJ6NPw=+-mQ8xibCDh+pqjToPcrnXRvJcYOkg@mail.gmail.com>
References: <20200604120349.17455-1-schnitzeltony@gmail.com>
	 <faaa5a2d120eacab6825cf079e92aa220dd7b151.camel@linuxfoundation.org>
	 <CALbNGRQDVCm4zDJ6NPw=+-mQ8xibCDh+pqjToPcrnXRvJcYOkg@mail.gmail.com>
User-Agent: Evolution 3.36.2-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Thu, 2020-06-04 at 14:18 +0200, Andreas Müller wrote:
> On Thu, Jun 4, 2020 at 2:11 PM Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> > On Thu, 2020-06-04 at 14:03 +0200, Andreas Müller wrote:
> > > From: Jacob Kroon <jacob.kroon@gmail.com>
> > > 
> > > 'pseudo_access_t' is a type, so use typedef.
> > > 
> > > Fixes building pseudo with gcc 10 where -fno-common is the
> > > default.
> > > 
> > > (Backport of OE-Core rev:
> > > a7d519f742aadc9110c2401f359254210a784f6b)
> > > 
> > > Signed-off-by: Jacob Kroon <jacob.kroon@gmail.com>
> > > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org
> > > >
> > > Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
> > 
> > Does warrior otherwise work on gcc10 hosts?
> Not yet but I am working on it.

I think to make a decision on whether we plan to support gcc10 or not
we'll need to know the scope of the changes. I'm starting to worry this
would be a bit too invasive, particularly as warrior is about to enter
community support or EOL depending on whether there is a maintainer.

Cheers,

Richard

