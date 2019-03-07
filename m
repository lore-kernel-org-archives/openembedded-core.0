Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id C08E77CF0D
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Mar 2019 21:50:51 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id r5so19206475wrg.9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 07 Mar 2019 13:50:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=dIg84yId5oIiOWz6ut6eu/cHCvTlGU9UuWjCcw9PBKw=;
	b=YXVnmVkHbO/+JD9z9IPQkxdrsm+FexL2WXE26g1osjmO/lml60V0Js/rtzvluQmAXV
	sXU3kUNViKKY04h7EMrKe/1GSqrtm2EHI5/6PDNP7ly4G/paqsamhYK7r2e/+wENI735
	TSG6wcdqGvY6YZ2tzA0LeVC6wNaD8zuATS3M8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=dIg84yId5oIiOWz6ut6eu/cHCvTlGU9UuWjCcw9PBKw=;
	b=KbsS36WGcL9R56+njSDlX/OgcqAr7spECiv2mjOfvU1RHuTLMonlrhkHsHbdroMgY/
	8kTy1UL1WK32eeVAI3+TEXzmL/BBzI3HALbHAwlNjIqQr2pIdnli9a2vlborjplaKVlC
	61TvthQI34Sibn+Wp+N6I7+ltHuqTAgOeg8Ukl6xgNMcgNtCmEjag0hNO/YZLClzjif3
	AtdzaFGY+KlBQurLRBhEc4U7hE2P/DUnhWfCVPUI6J1RXILMoVqX1voGneAJH4BO4e6n
	Z02elzFy8OJHPTUBaswazkENYRfUtAqyZqcM+K2exsPHdCqfCCQSwNQaZuu0a1jfGI32
	iIAA==
X-Gm-Message-State: APjAAAWTweqyDGWoWCRjAPULUPoWA5eeRgSOYKRlyRI5cYpbdg8aHr7T
	DmIHaAbWUbrzN51+5fI3xi0M80bXuYE=
X-Google-Smtp-Source: APXvYqzrBCka7DSsUOLdvoVFe8bkHjEOKtZf+h0fgaB5J7Ca6VC0OkAo0xj76nRcQXMmuioN4GowXg==
X-Received: by 2002:adf:afe3:: with SMTP id y35mr8243617wrd.318.1551995452517; 
	Thu, 07 Mar 2019 13:50:52 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	t69sm11495726wmt.16.2019.03.07.13.50.51
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 07 Mar 2019 13:50:51 -0800 (PST)
Message-ID: <c7b91b44ea5055df61ce39287342dbf7926d970d.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Tom Rini <trini@konsulko.com>, openembedded-core@lists.openembedded.org
Date: Thu, 07 Mar 2019 21:50:51 +0000
In-Reply-To: <1551882973-8710-3-git-send-email-trini@konsulko.com>
References: <1551882973-8710-1-git-send-email-trini@konsulko.com>
	<1551882973-8710-3-git-send-email-trini@konsulko.com>
User-Agent: Evolution 3.31.90-1 
MIME-Version: 1.0
Subject: Re: [PATCH v2 2/4] inetutils: Import version 1.9.4
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
X-List-Received-Date: Thu, 07 Mar 2019 21:50:52 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2019-03-06 at 09:36 -0500, Tom Rini wrote:
> In order to have more robust stand-alone network tools in oe-core,
> bring
> in inetutils from meta-openembedded/meta-networking.  This imports
> the
> recipes as of git commit:
> commit 408204073e6bdcd8ac586e05d5b75213417673f2
> Author: Martin Jansa <martin.jansa@gmail.com>
> Date:   Thu Aug 16 20:39:15 2018 +0000
> 
>     inetutils: fix build with glibc-2.28
> 
> Signed-off-by: Tom Rini <trini@konsulko.com>

Somehow in all the noise from other failures we missed:

WARNING: inetutils-1.9.4-r0 do_package: inetutils: alternative target (/usr/bin/rcp or /usr/bin/rcp.inetutils) does not exist, skipping...
WARNING: inetutils-1.9.4-r0 do_package: inetutils: alternative target (/usr/bin/rlogin or /usr/bin/rlogin.inetutils) does not exist, skipping...
WARNING: inetutils-1.9.4-r0 do_package: inetutils: alternative target (/usr/bin/rsh or /usr/bin/rsh.inetutils) does not exist, skipping...
WARNING: inetutils-1.9.4-r0 do_package: inetutils: alternative target (/usr/bin/talk or /usr/bin/talk.inetutils) does not exist, skipping...
WARNING: inetutils-1.9.4-r0 do_package: inetutils: NOT adding alternative provide /usr/bin/rcp: /usr/bin/rcp.inetutils does not exist
WARNING: inetutils-1.9.4-r0 do_package: inetutils: NOT adding alternative provide /usr/bin/rlogin: /usr/bin/rlogin.inetutils does not exist
WARNING: inetutils-1.9.4-r0 do_package: inetutils: NOT adding alternative provide /usr/bin/rsh: /usr/bin/rsh.inetutils does not exist
WARNING: inetutils-1.9.4-r0 do_package: inetutils: NOT adding alternative provide /usr/sbin/rshd: /usr/sbin/in.rshd does not exist
WARNING: inetutils-1.9.4-r0 do_package: inetutils: NOT adding alternative provide /usr/sbin/rlogind: /usr/sbin/in.rlogind does not exist
WARNING: inetutils-1.9.4-r0 do_package: inetutils: NOT adding alternative provide /usr/bin/talk: /usr/bin/talk.inetutils does not exist
WARNING: inetutils-1.9.4-r0 do_package: inetutils: alt_link == alt_target: /usr/bin/rcp == /usr/bin/rcp
WARNING: inetutils-1.9.4-r0 do_package: inetutils: alt_link == alt_target: /usr/bin/rlogin == /usr/bin/rlogin
WARNING: inetutils-1.9.4-r0 do_package: inetutils: alt_link == alt_target: /usr/bin/rsh == /usr/bin/rsh
WARNING: inetutils-1.9.4-r0 do_package: inetutils: alt_link == alt_target: /usr/bin/talk == /usr/bin/talk

https://autobuilder.yoctoproject.org/typhoon/#/builders/64/builds/374
https://autobuilder.yoctoproject.org/typhoon/#/builders/45/builds/375

Cheers,

Richard



