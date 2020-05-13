Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com [209.85.128.68])
 by mx.groups.io with SMTP id smtpd.web11.442.1589405507485671015
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 May 2020 14:31:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Y0gdSqJp;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.68, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f68.google.com with SMTP id k12so28052331wmj.3
        for <openembedded-core@lists.openembedded.org>; Wed, 13 May 2020 14:31:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=iupeLZ+d4exD1pyUf/B2aN/zl1GSGZTO5AyR5uS6rwg=;
        b=Y0gdSqJps/Zy/leRNtAUoO3uG3OVEy6hkO5BXnJvIkB7uGPD/zbhs3RfttusF4WCHz
         drYrt0K+7WC8yhAoh/Morc3qQl9sgtJ5ilgteFfZb/58OdqAjT/b0z1a1N88AB+RGYnr
         bYvLIRQb2YTKqxcqfp57TUrFF0rkHQiHdIT2k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=iupeLZ+d4exD1pyUf/B2aN/zl1GSGZTO5AyR5uS6rwg=;
        b=ayxNI35u4CGREx0GH7rUAHcCUdFb3YvnrTw2c4bOjjbRuBwDx4PNEsH0w/SxZJYnBk
         dUf1QED0GVMTFL9bF09la63u+ljd49aRv8OoBjMecakHl7P8DeTBRq2ZHbvkwk8TUbDx
         dKVdXk81mM6uOyB9+frrXr9/CUA4mQ95AF6f7PRzL5ynvEvG5eQUjASwgXpvoP2fTkbV
         oP6uoOuat+SpT8Ker3S33/7ciOTQPmPjJy/0CigumGsZNyzXM6v2i5PvDhHc3VIuMDF6
         AEEcED7vrC6qDv7h+NQ7K7KYGjNOAS2rN+MrmLVwQl8HC4F5drhH3Tams4gPLmb7LwI1
         XVig==
X-Gm-Message-State: AGi0PuZ0bSW4MQKSzEvFxS7diCx1kEHnxlMNCXpD2C4x7VmBUmtxIAbJ
	2L45AW9Juw+Zv6XKn9PCwdA9cA==
X-Google-Smtp-Source: APiQypKmtlBHTBnQjdf5eVE/mkMNIDxuwTxNntcHEk/BL1gfgCmP0icwWM/1LxxotqsL4UHXXehZoA==
X-Received: by 2002:a7b:c399:: with SMTP id s25mr43458931wmj.169.1589405505969;
        Wed, 13 May 2020 14:31:45 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
        by smtp.gmail.com with ESMTPSA id p4sm1173530wrq.31.2020.05.13.14.31.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2020 14:31:45 -0700 (PDT)
Message-ID: <764c9a365a510d22a5df20e4e510c4e9e4ab633b.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] file: Remove unneccessary override of PACKAGECONFIG for native
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Andre McCurdy <armccurdy@gmail.com>, Peter Kjellerstedt
	 <peter.kjellerstedt@axis.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Date: Wed, 13 May 2020 22:31:44 +0100
In-Reply-To: <CAJ86T=Wf5n_PqiB9X8fYjdyYMwh=WakmVHjMfCVETKec4peZbA@mail.gmail.com>
References: <20200512214255.20678-1-pkj@axis.com>
	 <CAJ86T=U-0v06iC5wm8opzJSO5a7k8a_a_NncF4N5ep6BwnBGTw@mail.gmail.com>
	 <12d3b34c48784a218feef04fbc1463e4@XBOX03.axis.com>
	 <CAJ86T=Wf5n_PqiB9X8fYjdyYMwh=WakmVHjMfCVETKec4peZbA@mail.gmail.com>
User-Agent: Evolution 3.36.1-2 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2020-05-13 at 12:30 -0700, Andre McCurdy wrote:
> Yes. Unfortunately making recipes robust for users who want to change
> PACKAGECONFIG values doesn't seem to be a high priority for oe-core.
> Why else would default PACKAGECONFIG values be assigned with ??=
> instead of ?= other than as a trap for new users?

I'm not sure I understand that, equally I'm tired so I'll assume I'm
just missing something.

I will say that there is no intention to make OE-Core hard to use or
not robust, its only as good a the people contributing make it. In this
case I'm not sure I understand/see the problem.

If we should be using ?= instead of ??= then I'm open to an explanation
why and patches to improve things.

Unfortunately we do have quite some legacy and ??= vs ?= has been
troublesome in the many different contexts we have (recipe, class,
conf, inc and so on).

Cheers,

Richard

