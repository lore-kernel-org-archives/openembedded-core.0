Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id D93776BDE3
	for <openembedded-core@lists.openembedded.org>;
	Sat,  8 Jun 2019 09:05:18 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id v14so4376591wrr.4
	for <openembedded-core@lists.openembedded.org>;
	Sat, 08 Jun 2019 02:05:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=MtlKlbaiq+q4i4s+2aVXj5x88xYu5zM9QPOm9oE8Svs=;
	b=Al+7JheZxqLmQMIIkpFMULKfsFbO41F59Mk+F1QIbHARNvPhnec9O5X65YGE8cCmMY
	8Z/efWESyl85Ok/u7OiAKb0/xMoEo8YwaxdRsMVlJiGdncYRWIpAIa5bYXdFZ38v5K71
	Lj0kwfHylxbnH1t0n3XprIHTKlPG1iocNI/qM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=MtlKlbaiq+q4i4s+2aVXj5x88xYu5zM9QPOm9oE8Svs=;
	b=Bhh931tD1khSDkZvk36Xa491KA2x6eWhA09f3eLgBsQcaxh9nNnLiOS5DUpZQvpF42
	rjcgchTg2E5rCbaDB3uLwyHq9acXBEeUAViJZLEYgXpW9zoNO6R67ue7XSg2JsF/mqgi
	94eV3dWn9wlXu1WUG2B2eA95lcU9TO8VoDHER4QS45FMZPR0pKhL1s7jL4B4hPLoCd0I
	VGhK3Re6j4tPzdkL0N4wTz9g0nZk7In4yAbUtZz4UPei97Ep5SNp5ov0N9uLqLOiD/9Q
	KYw+JKbpdNq/DatkL+C+g2Tdr0Liu+fj9Ej48pLd8zp7BWzj1Jo0jjdaFPPhVfujeR8T
	MduQ==
X-Gm-Message-State: APjAAAVdBnOrPjYqMdJT5Ex2cs9ebfLows1Ai4eKGePfgvilILwsWbKO
	k3JgWBwZftGkqQpF3Pbnl+0Pzw==
X-Google-Smtp-Source: APXvYqx4Z1udoztwvqbhI1rNTD/WnaayKsi04gqw9XYs279n+eMg3lXudEoi/bJ8rD95WWXRsM253Q==
X-Received: by 2002:a5d:4f8b:: with SMTP id d11mr1810720wru.264.1559984719492; 
	Sat, 08 Jun 2019 02:05:19 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id r2sm5266831wme.30.2019.06.08.02.05.18
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Sat, 08 Jun 2019 02:05:18 -0700 (PDT)
Message-ID: <2d919bbd6f607604f8315c95e1154c169fd2c5da.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>, 
	openembedded-core@lists.openembedded.org
Date: Sat, 08 Jun 2019 10:05:17 +0100
In-Reply-To: <20190607121954.116898-3-alex.kanavin@gmail.com>
References: <20190607121954.116898-1-alex.kanavin@gmail.com>
	<20190607121954.116898-3-alex.kanavin@gmail.com>
User-Agent: Evolution 3.32.2-1 
MIME-Version: 1.0
Subject: Re: [PATCH 3/3] gtk+3: update 3.24.5 -> 3.24.8
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
X-List-Received-Date: Sat, 08 Jun 2019 09:05:19 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2019-06-07 at 14:19 +0200, Alexander Kanavin wrote:
> Rebase 0003-Add-disable-opengl-configure-option.patch
> 
> Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> ---
>  ...-Add-disable-opengl-configure-option.patch | 41 ++++++++++-------
> --
>  .../gtk+/{gtk+3_3.24.5.bb => gtk+3_3.24.8.bb} |  4 +-
>  2 files changed, 23 insertions(+), 22 deletions(-)
>  rename meta/recipes-gnome/gtk+/{gtk+3_3.24.5.bb => gtk+3_3.24.8.bb}
> (84%)

I retested with the date/time on the workers fixed and this series
present. We saw:

https://autobuilder.yoctoproject.org/typhoon/#/builders/47/builds/693

so I think there might be something not quite right with opengl
disabled (the main difference to nodistro I can think of?)

Cheers,

Richard


