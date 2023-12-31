Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C90EEC3DA6E
	for <webhook@archiver.kernel.org>; Sun, 31 Dec 2023 14:23:34 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web10.220756.1704032608120750792
 for <openembedded-core@lists.openembedded.org>;
 Sun, 31 Dec 2023 06:23:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=cpCbWSxm;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.43, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-336897b6bd6so8011015f8f.2
        for <openembedded-core@lists.openembedded.org>; Sun, 31 Dec 2023 06:23:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1704032606; x=1704637406; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+REuIAkN27d9JCNLjYXsuBMDTRbbauY/J/AVYuAJxk0=;
        b=cpCbWSxmu+rbIZMYtuPznIHK8QTP0HrswLWKZv6DvZDOYHKEBrDoSWCU5NI0PBYhYr
         pGL9d8JUVBUOa8b5KlMMxd96DqfLqoNoNSgMrwrAhFBXhB93OZBASYhYpnfbhAjSBZGQ
         /OZTvHah2GS7zFrXH8+uQ8v96hGYqhyZJrxoc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704032606; x=1704637406;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+REuIAkN27d9JCNLjYXsuBMDTRbbauY/J/AVYuAJxk0=;
        b=hCKJ6QRSv2HEL7XqjFuldQgwicvZRAAlFIh/hf8hxt786ENT3qpmYJ63cVR9Y+D3BF
         iNZoZ73pTC3FBKl5jMkYpyaU5BrcGSyEXQUxTXXO7bXesrvUks+SBtwVHkJ6VUTobYky
         Zs3z+nL7NHGuJ8aB19n5nTXZJs6YopBDpToEiciHkYqyq4dPdh/f/6d5JwU+pr5QWkO1
         ee8vBiCGu0pHUWQj6wSV6SsKXIzG5K7loLqMn5DyquaPPFg8UTAHRxz8XzYzFjE/7e9p
         f1f3dMUvgB16noou8ZH7JoS6+a7rIYhF5VfeI2px5vFCbQIEXMBU96zTIUGKsGVY57/3
         SS/A==
X-Gm-Message-State: AOJu0YzZlOThUz+4ZZ0n6zt3N0UaBvGRmSmNe9BP4n0O0sDNbhKWRa8E
	urPuhFBYXs6HKo/tMWkoLcK2XeQdwI+2UXUiY7j1/SNqdDs=
X-Google-Smtp-Source: AGHT+IF0XdLBUVBxA79OG4gkf1VNbANYwiZ6HkAEl3Qe/2WI2LDOeIuXnmBgfpcmcFWmVwvhsyOkXA==
X-Received: by 2002:a05:600c:1ca9:b0:40d:60ac:409f with SMTP id k41-20020a05600c1ca900b0040d60ac409fmr3247495wms.173.1704032606656;
        Sun, 31 Dec 2023 06:23:26 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:c5f8:2676:155:a895? ([2001:8b0:aba:5f3c:c5f8:2676:155:a895])
        by smtp.gmail.com with ESMTPSA id q17-20020adfcd91000000b003362d0eefd3sm23605095wrj.20.2023.12.31.06.23.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 Dec 2023 06:23:26 -0800 (PST)
Message-ID: <0b857242f53a4350e85029306d308f570641fca8.camel@linuxfoundation.org>
Subject: Re: [OE-Core][PATCH 4/4] rust: Upgrade 1.74.1 -> 1.75.0
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alex Kiernan <alex.kiernan@gmail.com>, 
	openembedded-core@lists.openembedded.org
Date: Sun, 31 Dec 2023 14:23:25 +0000
In-Reply-To: <20231230154953.8135-4-alex.kiernan@gmail.com>
References: <20231230154953.8135-1-alex.kiernan@gmail.com>
	 <20231230154953.8135-4-alex.kiernan@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 31 Dec 2023 14:23:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193092

On Sat, 2023-12-30 at 15:49 +0000, Alex Kiernan wrote:
> Drop backported musl fixes. Set `change-id` rather than `changelog-seen`
> to fix build warning. Add fixes for 85c0ce24cc74 ("remap cargo
> dependencies to /rust/deps") which otherwise cause build failures:
>=20
> > thread 'main' panicked at src/core/builder.rs:1795:26:
> > std::fs::read_dir(registry_src) failed with No such file or directory (=
os error 2)
>=20
> https://blog.rust-lang.org/2023/12/28/Rust-1.75.0.html
> Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>

Unfortunately there were rust reproducibility failures too:

https://autobuilder.yoctoproject.org/typhoon/#/builders/117/builds/4170/ste=
ps/12/logs/stdio

Cheers,

Richard



