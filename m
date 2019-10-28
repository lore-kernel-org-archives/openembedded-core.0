Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	by mail.openembedded.org (Postfix) with ESMTP id CBE006BC44
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Oct 2019 13:42:35 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id x5so1947390wmi.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Oct 2019 06:42:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=gWqMLOFoftUCA/JxeWwtm5RyCRHWRjL4PsNy0Z3C64k=;
	b=GImp9gdnHcwpKTAhc3B7V5JUTDl2AbTOIAJ9gdm4XDMGE/gvL2AZOneHsvI5h3DhBT
	558ZxZ8pCl0x5QRBeos1wCSOZiLs7JcsjQidygroHI2Sf+tWJ+guN5Ai9F7eUzIp1sCN
	ZHBSyXfOqVgtR8hciJpyLoPZyclUKwTQv1WrU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=gWqMLOFoftUCA/JxeWwtm5RyCRHWRjL4PsNy0Z3C64k=;
	b=Y7Deaw0JI0LTDNyu2Wy31v8tKGxb1hG5DgfaTbaIskbaPFkfhkMzoCiWTMyAnH3/RH
	gB+l35fSfpS3ZnWIvvuvvt2OnUmt0ps2Ui9oAwWNXRNHm/XeOJLkzXYjN5MHebNN7kQG
	EFHxMOyhheq+IPX7UdSgjqRtHRRWoRRT826H4LopReJFsbusz9359Jv3QBQ5F2Bjeg5M
	fpO/kjOHd0ddZfi5h+MWwJIfoy76XGg2BuH+cfTdxba9J7YLTn7ACFE8HAahOSBLRIzB
	smQpk0PP7lHKFMg1S4Pz7rtrjZpngkaVoZ6IhqNJXP7Md0LTrTi+3VOut1+7uEo82FfJ
	Rb6g==
X-Gm-Message-State: APjAAAXt4ao+eiC81MilnrF9y+dWCrEvzqh8BoJsY9YDjTR0wMqG08pm
	MnOZMoXWsuVPD3JSeOcZWWGn0ugjGDAOIA==
X-Google-Smtp-Source: APXvYqxA8+7NnjimH7JYoqtnuVmFM1qUNYl0tUA05SrWOc+z4gMqTAg/nN5TjVLnGdgUe9Fz4YFmpg==
X-Received: by 2002:a1c:6702:: with SMTP id b2mr27631wmc.107.1572270156342;
	Mon, 28 Oct 2019 06:42:36 -0700 (PDT)
Received: from hex (100.50.158.77.rev.sfr.net. [77.158.50.100])
	by smtp.gmail.com with ESMTPSA id
	t23sm11456438wmi.15.2019.10.28.06.42.35
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 28 Oct 2019 06:42:35 -0700 (PDT)
Message-ID: <dbaf2e58603f92536f790d13d74153249a9a7728.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Adrian Bunk <bunk@stusta.de>, openembedded-core@lists.openembedded.org
Date: Mon, 28 Oct 2019 13:42:33 +0000
In-Reply-To: <20191027150425.13079-1-bunk@stusta.de>
References: <20191027150425.13079-1-bunk@stusta.de>
User-Agent: Evolution 3.34.1-2 
MIME-Version: 1.0
Subject: Re: [PATCH v3] coreutils: Move stdbuf into an own package coreutils-stdbuf
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
X-List-Received-Date: Mon, 28 Oct 2019 13:42:36 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sun, 2019-10-27 at 17:04 +0200, Adrian Bunk wrote:
> This LD_PRELOAD trick is not really suitable for busybox,
> so can be the only part of coreutils needed.
> 
> coreutils depends on the new package,
> so nothing changes when installing coreutils.
> 
> Signed-off-by: Adrian Bunk <bunk@stusta.de>
> ---
> v3: coreutils-native fixed
> ---
>  meta/recipes-core/coreutils/coreutils_8.31.bb | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)

This is better but there look to be nativesdk warnings:

https://autobuilder.yoctoproject.org/typhoon/#/builders/23/builds/1406

Cheers,

Richard


