Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id BF0557E97C
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Jun 2019 13:26:33 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id p11so2542650wre.7
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Jun 2019 06:26:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=o8UN/ah1ch+PnNgP5QKNTtUiXg6A+f43ahDWAC21uk4=;
	b=VFDS+Gx0pPIWLNgcl8++PL1Q5pciCLQDio2G2njWbeONCbUZA2DtxJkk5zlgQ42Bgc
	nPh7SLZwdqIlNSTdCLNctamqwiviS7wZtRJAsPCDLxkdPimis7+unQZiiNYoGX154ndd
	hEEXHvnStl4CmJBnmRni0if01d2AHIztva2ro=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=o8UN/ah1ch+PnNgP5QKNTtUiXg6A+f43ahDWAC21uk4=;
	b=Xno5Xu/Z+wGsubrFWx08xBV8SXgkTfz4nl93rtZ4ZnWnVzZeRyEz/hj7nSdDsf4A+b
	WLLnQAdxvbleSq1xVvlzVeKnQ/dXPEJzgM64drYw1a5d2ESS+i8KS8ebNRC6FD+jKUZJ
	NDlG8y29f3ozU81aWVIAl3cwIugeC4P9+e1kgvuIE9UAxq53sAjYjIS5rSxMSQyij1tb
	7VeVM55LC6STXirdE/MA81h+eFx3SB3fbRLFmstLlqSZlg/7YmN2DsjycMi6xhlTfHQ1
	sZrvD96C9Z2e1xiIsCPCDA89qPvtGheef984F+SqkUyrL2FO4HmgRmQldFYJrhLI6iv5
	c9Cw==
X-Gm-Message-State: APjAAAXz81I8/kg4LUynVdWONafxErAsraIBnCXPSBz7tSJ9pvTdCM4v
	7I8BQ7vkqOC5Btm/HOHgaVGohQ==
X-Google-Smtp-Source: APXvYqxRb323SJHKRPmLpP5zGsdypzY3Y+xNLa3qEIeM9zcpylxDi1V2/saKHKvLrjE+V44Wm85xhw==
X-Received: by 2002:a05:6000:1203:: with SMTP id
	e3mr514967wrx.300.1560518794519; 
	Fri, 14 Jun 2019 06:26:34 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	g19sm3886192wmg.10.2019.06.14.06.26.33
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Fri, 14 Jun 2019 06:26:33 -0700 (PDT)
Message-ID: <c85e93b13ddcbc27c27ac17fdcf97a0d1ffc4020.camel@linuxfoundation.org>
From: richard.purdie@linuxfoundation.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 14 Jun 2019 14:26:29 +0100
In-Reply-To: <99B005A2-CD21-4AA8-B960-54121098F850@gmail.com>
References: <20190613175442.26121-1-m.felsch@pengutronix.de>
	<a7a06678f3346863015258fec2ed65e7d8065196.camel@linuxfoundation.org>
	<20190614120448.2wg2523qu67la7mh@pengutronix.de>
	<ee3249ee4f978ee2ee7c74b0af81fe971ca66300.camel@linuxfoundation.org>
	<20190614123451.c5idgiizmqnlhob4@pengutronix.de>
	<f2348016a0867fd986bbe4965dcb88a5b652055f.camel@linuxfoundation.org>
	<99B005A2-CD21-4AA8-B960-54121098F850@gmail.com>
User-Agent: Evolution 3.32.2-1 
MIME-Version: 1.0
Cc: kernel@pengutronix.de, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/2] mesa: make gallium swrast target optional
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
X-List-Received-Date: Fri, 14 Jun 2019 13:26:34 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2019-06-14 at 15:05 +0200, Alexander Kanavin wrote:
> I guess the patch needs a small tweak so that swrast remains enabled,
> but becomes optional. Then Marco can set packageconfig exactly as he
> wants.

I guess if we can track down where the swrast dependency is coming and
and change things to avoid it, that would probably be ok.

I tend to think swrast is in a better state that it is in reality :(.

> The second patch is fine as it is, I think. Only qemu implements
> virgl device at the moment.

The second patch should be fine, I had to drop it as it depends on the
first though.

Cheers,

Richard


