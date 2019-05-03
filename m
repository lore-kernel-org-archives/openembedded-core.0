Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id CEAAF7D660
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 May 2019 05:05:12 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id k16so6116533wrn.5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 02 May 2019 22:05:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=w/NQCs2fhqUbhZN7RjfM/rii63PQvUqzQJWbLkhrk/o=;
	b=IrEPCHdULw6T9ytdmNafDFKd7IrF68Ps1i8Ms/GEzvg7W0QrqTEOAe8rbNbEaYXduN
	rR8cu7uFtXq9hmVLejrPkP7lJz7jCdPXG2vZ6zaYWOUZS5sjCFgT7/oBvC0z5hV81Lal
	wFADm3VTiZH1ByI5PM44JrRd7Ye/Aq5EN24Vw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=w/NQCs2fhqUbhZN7RjfM/rii63PQvUqzQJWbLkhrk/o=;
	b=SHjfFiqdJW8pNLZjSkKAyTDO43mJKT9x0uLYsxx4Rkm+TCROah6sR/3ich1N9MZWKG
	lwEMbeCTBOfOC6dVIS72ZILV7qB/zZ+AkM7PKKVEpyk2dhnmhKqOZRbfYoJUtEpRYInj
	z5lqwajN7jJUruup2DNpdSHaF3bNtIUQoScFG5NblnNPuUerXsEFNgN4vCqTu5rJrgDF
	p6oRkok1piuScCLH2OiQ0ziHoZMCILX5E31JwFLVu8Gaz/gJIMQWgnOvgUcnVNbRo2Pt
	FXlhElyiUesXN3bGiIKVZrRuibyHOgoMGbHi4STUrPb6xpAkY+QtlzLdxnegmXPB8W4O
	aTHw==
X-Gm-Message-State: APjAAAXd9eZZzTeanDcjvMKoFXHx4qHldcvURiIYC3hIUDu0LBRK70Xt
	2MSdQLIj27UXgWgh66bMWbSAlw==
X-Google-Smtp-Source: APXvYqz1uBPvRIJ0vOREHR3LrCUJ+Zks9Ojarq+HzqfyUgzFp76r3Qk4bXBxCefPs4TovdTcleVKvQ==
X-Received: by 2002:adf:90ef:: with SMTP id i102mr2720832wri.133.1556859913433;
	Thu, 02 May 2019 22:05:13 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id o6sm983111wre.60.2019.05.02.22.05.12
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 02 May 2019 22:05:12 -0700 (PDT)
Message-ID: <7a2175fe5786ab041053400f235ede965cee3bcd.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: paul@betafive.co.uk, openembedded-core@lists.openembedded.org
Date: Fri, 03 May 2019 06:05:11 +0100
In-Reply-To: <20190502213052.15962-2-paul@betafive.co.uk>
References: <20190502213052.15962-1-paul@betafive.co.uk>
	<20190502213052.15962-2-paul@betafive.co.uk>
User-Agent: Evolution 3.32.1-2 
MIME-Version: 1.0
Subject: Re: [PATCH 1/1] license_image: Don't try to hard link license files
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 03 May 2019 05:05:13 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2019-05-02 at 21:30 +0000, paul@betafive.co.uk wrote:
> From: Paul Barker <paul@betafive.co.uk>
> 
> This change allows us to support the placement of WORKDIR and
> DEPLOY_DIR
> on different devices. As the license files are typically small, the
> increase in disk usage and build time should be negligible.
> 
> Signed-off-by: Paul Barker <paul@betafive.co.uk>
> ---
>  meta/classes/license_image.bbclass | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)

We create a lot of hardlinks and its not negligible overall ;-).

I'd prefer we continue to do so where we can. We should probably create
a function similar to lib.oe.path.copyhardlinktree() and use that here
rather than abandon the hardlinks.

Cheers,

Richard




