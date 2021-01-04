Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web11.13454.1609767652240057584
 for <openembedded-core@lists.openembedded.org>;
 Mon, 04 Jan 2021 05:40:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=LrBfRWUM;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.50, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f50.google.com with SMTP id d13so32172470wrc.13
        for <openembedded-core@lists.openembedded.org>; Mon, 04 Jan 2021 05:40:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=WjLESuyCbLI7FDECwFL13Qvb0SOUki65630zVtB5lmQ=;
        b=LrBfRWUMbmeBZtx95PHoVqIYl7Tg0y3bUJy1ZLpy6jKbfFsIWGw1eosdfB8Nrd4W9X
         1o+B3o1EO57CPJYB+q9VXa+MNQuruRuyIN3ofCEefbS0DAhvYJfz4nNuDjrAYb90pi1E
         H4aGbXv0rnclebOZSo7xGLjMGxIeYA69o3TdE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=WjLESuyCbLI7FDECwFL13Qvb0SOUki65630zVtB5lmQ=;
        b=Yjj5RcNHZb5FQZQ73Jrac4xiDmhf8RwSLvmIneGjIk2j5AvzSE49PzhkqQzt6WPrVB
         f+2SwBdTAb8OHvAxBaxZpkdtOveFfCUDeM3dnrwhkYJeParKFyjwFi8xnpK99odwNjDp
         iExvBVRTc9VkyF+LlKDLO5xzCfY07vp7OQVJMYz2SsQpe8Gjlwn2m7HLawDHKWazW+zu
         dsML0jc419Dljwxxe45TRL89OTVQUMkKm1oGWSIqdF9pzkc65ukHTaPFoHZrYimNoSn8
         Z4RIkMrwBWN1ENcZrg/n824PjLdjz3vtjBeP1BPPRr3UuQqDSIDepjxcOngGc4J5irgc
         81ZA==
X-Gm-Message-State: AOAM5315w61i+NiR+IuwsB40pB4CbdEuMpbx7SaS+6HFMMTqTHzxnIkC
	q8XzqKmnD6k+A5CQUk2UoJIwgg==
X-Google-Smtp-Source: ABdhPJyy4pmMRVs4DnMSU5fGlN35cHeVGuaEoWojHBao+a0HZHTPph0zR9tMIwkWzje3mtQBen8AQw==
X-Received: by 2002:a5d:4b44:: with SMTP id w4mr79595944wrs.155.1609767650871;
        Mon, 04 Jan 2021 05:40:50 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:4767:d28d:f91a:aa32? ([2001:8b0:aba:5f3c:4767:d28d:f91a:aa32])
        by smtp.gmail.com with ESMTPSA id u205sm36866741wme.42.2021.01.04.05.40.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Jan 2021 05:40:50 -0800 (PST)
Message-ID: <d1cd4d7e6db5c3f237469feae27fd8a1b196d7fb.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v2] u-boot: add /boot and ${sysconfdir} to SYSROOT_DIRS
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Diego Sueiro <Diego.Sueiro@arm.com>, 
	"openembedded-core@lists.openembedded.org"
	 <openembedded-core@lists.openembedded.org>
Cc: nd <nd@arm.com>
Date: Mon, 04 Jan 2021 13:40:47 +0000
In-Reply-To: <AM6PR08MB3461F2529B1767C7BF74D7F892D20@AM6PR08MB3461.eurprd08.prod.outlook.com>
References: 
	<9c29138b53742ac268b54768773f72a2279f3f49.1609748975.git.diego.sueiro@arm.com>
	 <56b88a5513085b38781e02327537289d2fdd8203.camel@linuxfoundation.org>
	 <AM6PR08MB346196292FFCAE3C6499D55D92D20@AM6PR08MB3461.eurprd08.prod.outlook.com>
	 <688508925922a91f009ed5fdb25814d3cbd1cfee.camel@linuxfoundation.org>
	 <AM6PR08MB3461DD31D010E15507D15B0892D20@AM6PR08MB3461.eurprd08.prod.outlook.com>
	 <3b18da8aa5741857c6a0d93d8ec77c7854fa1695.camel@linuxfoundation.org>
	 <AM6PR08MB3461F2529B1767C7BF74D7F892D20@AM6PR08MB3461.eurprd08.prod.outlook.com>
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2021-01-04 at 13:37 +0000, Diego Sueiro wrote:
> > Just thinking out loud, maybe we can use SYSROOT_DIRS if we use
> > something
> > which is named clearly such that its obvious it will never be on
> > the target
> > rootfs?
> > 
> > "/boot" is confusing as some systems do have/use that but there is
> > nothing
> > stopping us creating something specific to this purpose. We'd have
> > to clearly
> > document it should never be used for anything also shared using
> > do_deploy
> > and was for intermediate files only?
> > 
> This might be the simplest solution with low code and documentation
> impacts.
> In meta-arm we make usage of the "/firmware" directory to include
> these
> intermediate files.
> I suspect that in case of u-boot we could also consider it as a
> "firmware" artifact?

I'm wondering about "intermediate-deploy" as its then very clear what
its for and that its separate from any normal rootfs structure?

Cheers,

Richard

