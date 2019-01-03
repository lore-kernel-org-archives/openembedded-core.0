Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
	[209.85.128.50])
	by mail.openembedded.org (Postfix) with ESMTP id 0795A6B180
	for <openembedded-core@lists.openembedded.org>;
	Thu,  3 Jan 2019 12:34:00 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id a62so29166958wmh.4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 03 Jan 2019 04:34:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=7pmrDv5mqfUy7XV4DosEisHQEUmknkhMz3AH8aHDzi0=;
	b=OuRuIq+qFZLSwMZSahqIqUrEoi9Iu2VO0r7MLxMGznWXp/yZV9XpuiEB9uvHRT+/0U
	danzO/vVnZqqKUJ5TFkrGXBjq5P+8sKfvYOZIw+HewtVXWTjennnxJoVuuNow62miwDg
	NxbHQ1YIdaWdu0sNguqxIB2uDPWP4HKY4RP+4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=7pmrDv5mqfUy7XV4DosEisHQEUmknkhMz3AH8aHDzi0=;
	b=iTBro2DC08Z+5KbIkQhuNQXZ/7/iYQa/Cq2cKrT2Tr4Rz78QpqsxODQYnDvylj2IMQ
	ri0vHqXMgMeFns+M70INAuU5lqyt7+ekeSostkrae1F1O5fUocLHSdjPbdP9dAVZpyza
	R11d/HcGKH6pa01F78IYAJKN5k891te14gRevfyOJoilbmKXguYQwQJHMDd7qtmNH49W
	/jGw/S/ggL5HT+vL3MIDl8bUjOuQCvr+pQGlnLuv6//ml7dai0FXn1E620T6YeYdLmy8
	/EtGJy5VZI59S1hyRRIeDZPTDdWsV+qhOrNmmpP3dHaJ/uihQgAVBngz7ykqYVyaxJCf
	c7MQ==
X-Gm-Message-State: AA+aEWawp0kiKkZ7e89mnhCxqY8mkmswb9p+cT01dZvsqzZon2+Max99
	ulV1WQaROj4k7J7Q7pLz6vWPZQ==
X-Google-Smtp-Source: AFSGD/Xaj5DGXsQTyfauucbbkWS5uaRY9bvNaCTWh8cQYamT6mTY+aloxl33porwG6E9/zDnn8yQdw==
X-Received: by 2002:a1c:b607:: with SMTP id g7mr39839940wmf.97.1546518841670; 
	Thu, 03 Jan 2019 04:34:01 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	e17sm70370716wri.36.2019.01.03.04.34.00
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 03 Jan 2019 04:34:00 -0800 (PST)
Message-ID: <4bd60df2602c4e4193a567c61d9c4523104b0d65.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>, Armin Kuster <akuster808@gmail.com>
Date: Thu, 03 Jan 2019 12:33:59 +0000
In-Reply-To: <CAMKF1spP0b_U5S_5hEbM6rZsj1DCiyyc9eYzEC8NN-mgCk5ELA@mail.gmail.com>
References: <1546446977-27510-1-git-send-email-akuster808@gmail.com>
	<1546446977-27510-3-git-send-email-akuster808@gmail.com>
	<CAMKF1spP0b_U5S_5hEbM6rZsj1DCiyyc9eYzEC8NN-mgCk5ELA@mail.gmail.com>
User-Agent: Evolution 3.30.2-1 
Mime-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/8] nettle: update to 3.4.1
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
X-List-Received-Date: Thu, 03 Jan 2019 12:34:01 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2019-01-02 at 22:35 -0800, Khem Raj wrote:
> native version fails on ubuntu 14.04, seems like we need to pass
> -std=c99 explicitly via cflags see
> 
> http://errors.yoctoproject.org/Errors/Details/214590/

and 
https://autobuilder.yoctoproject.org/typhoon/#/builders/56/builds/86

Cheers,

Richard


