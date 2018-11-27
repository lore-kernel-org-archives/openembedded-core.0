Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-ot1-f66.google.com (mail-ot1-f66.google.com
	[209.85.210.66])
	by mail.openembedded.org (Postfix) with ESMTP id DEC996C42C
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Nov 2018 19:30:57 +0000 (UTC)
Received: by mail-ot1-f66.google.com with SMTP id t5so21283800otk.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Nov 2018 11:30:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:references:in-reply-to:date:message-id:subject:to
	:cc; bh=vrYMDbn0Fm0y3fbVCeNRn5Ga6HMsOQzwFWu1QyEb00M=;
	b=Da5dm2gC+y2W9x2D2nq5O7+Q/xfYgzhfRc6oLNVlnGQ9JIJcOjIp6fQ2NIzOb+Ae0X
	ILMYVCTKPoU4a9g88253IxcFCxIrZZl/nE4ppdL0djoEjW35ny9/KOY6xDOmBgraItgb
	QVH3e5SAfCcs+8H/Ojbv+VWKCXGre03r7AiJjvH5vnh3JPTUPFSy91rqBADROPo8L77S
	cBowbuMnbNHq/LOokvkN67JQjoBZ8KAkvxWy6z9RICx27Fqq4mFUWr21Z3U4h4lKo6hl
	TsPDXgFtJggZ70A93TXAQUqfmQ8717/1tSd3smPwteRUclLadZoGSWRQDmL+5zQNhPDd
	fbqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:mime-version:references:in-reply-to:date
	:message-id:subject:to:cc;
	bh=vrYMDbn0Fm0y3fbVCeNRn5Ga6HMsOQzwFWu1QyEb00M=;
	b=RWeY3biyP4P6ngkXZnbTKDfSVvTq/D+Rpd9zEHn1SW2OGezmb1+UNLsH8Bx/JB52GI
	3nJtQf9XgH7KLME+yJpCMJ3Cu+yyGglYye2MDy6/wyEJwkhEhoKldxZAfk/3ZdJinUMx
	ZzHuRRIWlFcfQHU9vASN3pkUZkqoyN2d4lDWaiP+H9dUlDgXeL3sbY7+jFZUTCLLgBSK
	caLekm2d45FMG1O1WfIj0vmQZ/KocyItuHaMrAXn48x/PdVTCw8dcLcw/RM2guo2LiI/
	WqEvT+gfDxj6DMMSdA2bEbJxiTKrmUe036t8T0STOBr/Ug5JL2L7bT9tTziSDRi5labI
	lPfg==
X-Gm-Message-State: AA+aEWYkcl6GKbYY5a/cw3FY+g1ObH7zuaA5d08wmS9UaI7ID0Ii5A7A
	B9DBTUtwqA5/VJJsQdf92q+L7SoCELK0pw==
X-Google-Smtp-Source: AFSGD/VE725m29QJn0INsgKGniNtYEDNqc2XOnFIZvddWn7DqBXutDnpbAQ6CWMVdlMglKUOAc4qMQ==
X-Received: by 2002:a9d:3387:: with SMTP id u7mr20194338otc.81.1543347057981; 
	Tue, 27 Nov 2018 11:30:57 -0800 (PST)
Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com.
	[209.85.210.45])
	by smtp.gmail.com with ESMTPSA id v3sm4843004oib.57.2018.11.27.11.30.56
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 27 Nov 2018 11:30:56 -0800 (PST)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-ot1-f45.google.com with SMTP id t5so21283653otk.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Nov 2018 11:30:56 -0800 (PST)
X-Received: by 2002:a9d:3095:: with SMTP id s21mr19630749otc.359.1543347055901;
	Tue, 27 Nov 2018 11:30:55 -0800 (PST)
MIME-Version: 1.0
References: <20181127191255.39052-1-abrodkin@synopsys.com>
In-Reply-To: <20181127191255.39052-1-abrodkin@synopsys.com>
Date: Tue, 27 Nov 2018 17:30:43 -0200
X-Gmail-Original-Message-ID: <CAP9ODKq2NRaMcW3nY-cs-uBuKBG3xx7sAuzBoZtRheo-jz+7CQ@mail.gmail.com>
Message-ID: <CAP9ODKq2NRaMcW3nY-cs-uBuKBG3xx7sAuzBoZtRheo-jz+7CQ@mail.gmail.com>
To: Alexey Brodkin <alexey.brodkin@synopsys.com>
Cc: Marek Vasut <marex@denx.de>, Tom Rini <trini@konsulko.com>,
	linux-snps-arc@lists.infradead.org,
	Otavio Salvador <otavio@ossystems.com.br>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] u-boot-tools: Improve build preparation
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
X-List-Received-Date: Tue, 27 Nov 2018 19:30:58 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Nov 27, 2018 at 5:13 PM Alexey Brodkin
<alexey.brodkin@synopsys.com> wrote:
> Even though we're not going to build here real U-Boot binary
> it is still required to "configure" U-Boot to get get to the
> tools building.
>
> We used to use "sandbox_defconfig" for that purpose but
> since U-Boot v2018.11 it started to cause problems [1] due to [2].
>
> So to have less dependencies let's create super minimalistic
> configuration which is good enough to allow us to run "make tools".
>
> [1] http://errors.yoctoproject.org/Errors/Details/202185/
> [2] http://git.denx.de/?p=u-boot.git;a=commitdiff;h=a4958a71017fb142542f977c843c5fce769fc6ea
>
> Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>

To allow extended use, we need to enable CONFIG_FIT_SIGNATURE
otherwise we won't have the support.

See:

# MXSImage needs LibSSL
ifneq ($(CONFIG_MX23)$(CONFIG_MX28)$(CONFIG_ARMADA_38X)$(CONFIG_ARMADA_39X)$(CONFIG_FIT_SIGNATURE),)
HOSTLOADLIBES_mkimage += \
        $(shell pkg-config --libs libssl libcrypto 2> /dev/null ||
echo "-lssl -lcrypto")

If you do that, we can likely rely on this and avoid some extra tools
packages (for example on meta-freescale).

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9 9981-7854          Mobile: +1 (347) 903-9750

