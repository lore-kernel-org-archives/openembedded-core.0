Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
	[209.85.221.54])
	by mail.openembedded.org (Postfix) with ESMTP id 3F61B7D016
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Apr 2019 08:27:33 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id h4so6105900wre.7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Apr 2019 01:27:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=cBD/SO5p0J9WwBru1WA7LaeNLsmjkVfuwH7vk7+rYyA=;
	b=JAyJ1bEpPzSorMCoq6tIRzQOGacO389jKqAZcNWPTwLllQIinQAdv481SPUlmvz5BK
	yMPsLi8Zn3fgNKv4k6noqTKmK+aQl/hDjRQ5fYQq+0RHPRalzIFvjLbIo8DS4K7BaAJN
	R1wLJdLQzHJ52cJNQAKATzX6sNlMFlP8P2Q2I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=cBD/SO5p0J9WwBru1WA7LaeNLsmjkVfuwH7vk7+rYyA=;
	b=ZRl0uWIVKj+RHRAz91vYpgMyZMEsSFUVn0TaMdrvqKXlLF2tcCPOjWKISm77FDipkd
	1nZVM3l5PpbjdHYdk9viBrGc13tNwt2IicCcXdLyf2zVp3/V0IKw1BncENWma3QqWp0x
	xBhWjjB2p7oQDgrQ4M2GqmHG+MpyqI1e2BijdnJYNU3c4DxT+Y0V663J1FcYg/dZ20xM
	YVd6o5hc1TtvzjfG5mgCdMexUx3vMg54JplcgZA0YPSMISDpAHghpjuWwH/ut7pZj4Y/
	1nS6/U7e5V0op0cvLBl+y07dse4C2d/yunc8LB9HGKj+bRYsbwYmm+IY/FlGrn3hK87K
	lNUg==
X-Gm-Message-State: APjAAAW4PgLqaNcp/wGyfAc6Ea7Q1pbHREvx2xLzkiJnRzkQY7pPQ4Ea
	gCKK/Pxhq+CXvtDFt+6zfu/TIQ==
X-Google-Smtp-Source: APXvYqyoRhVD1MjXfoRv4fqquHg88k1Zut30fbyZEOme/Yw41w4tzRyPW8L9do673+3pmEg+eWdniQ==
X-Received: by 2002:adf:f88c:: with SMTP id u12mr29805195wrp.235.1554971253962;
	Thu, 11 Apr 2019 01:27:33 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	m6sm45835621wrr.53.2019.04.11.01.27.32
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 11 Apr 2019 01:27:33 -0700 (PDT)
Message-ID: <eac980cd94a8d408a02f143f8ee9f2723655e819.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alistair Francis <Alistair.Francis@wdc.com>, 
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Date: Thu, 11 Apr 2019 09:27:32 +0100
In-Reply-To: <20190410172152.13509-1-alistair.francis@wdc.com>
References: <20190410172152.13509-1-alistair.francis@wdc.com>
User-Agent: Evolution 3.32.0-1 
MIME-Version: 1.0
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: Re: [PATCH] u-boot: Upgrade from 2019.01 to 2019.04
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
X-List-Received-Date: Thu, 11 Apr 2019 08:27:33 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2019-04-10 at 17:23 +0000, Alistair Francis wrote:
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  meta/recipes-bsp/u-boot/u-boot-common.inc                       | 2
> +-
>  .../{u-boot-fw-utils_2019.01.bb => u-boot-fw-utils_2019.04.bb}  | 0
>  .../u-boot/{u-boot-tools_2019.01.bb => u-boot-tools_2019.04.bb} | 0
>  .../recipes-bsp/u-boot/{u-boot_2019.01.bb => u-boot_2019.04.bb} | 0
>  4 files changed, 1 insertion(+), 1 deletion(-)
>  rename meta/recipes-bsp/u-boot/{u-boot-fw-utils_2019.01.bb => u-
> boot-fw-utils_2019.04.bb} (100%)
>  rename meta/recipes-bsp/u-boot/{u-boot-tools_2019.01.bb => u-boot-
> tools_2019.04.bb} (100%)
>  rename meta/recipes-bsp/u-boot/{u-boot_2019.01.bb => u-
> boot_2019.04.bb} (100%)

Breaks beaglebone-yocto:

https://autobuilder.yoctoproject.org/typhoon/#/builders/65/builds/490
https://autobuilder.yoctoproject.org/typhoon/#/builders/46/builds/489

Cheers,

Richard


