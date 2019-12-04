Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	by mail.openembedded.org (Postfix) with ESMTP id 3DC01607E1
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Dec 2019 18:00:10 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id b11so670743wmj.4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 04 Dec 2019 10:00:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=VBZxUV9PSiSanIencUvqFMjAGfmuYwM2NzTnW+Bdo+Y=;
	b=cSqhqoG3n1/JAhpEp+2NnfaIbqdRb5UHMzdzkRvrMIy968kAjoKLM8WbIsQ/NAaITX
	qqYoGH0YOVNbxpfMz1Yg5KV/2k1YBaJrWh/ovtzdrAkl2HA0XTRWgI2KIPZQxxexGbDQ
	dTaUS9Uvs5E4jXMMW5pPhhRhpot3uVXTkvs1I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=VBZxUV9PSiSanIencUvqFMjAGfmuYwM2NzTnW+Bdo+Y=;
	b=U+oQmjhvM+qrArQVbWxP7ldosq9cWxGYFJttVnLpPaApjQH4aOCONIHmq8LJInJQbx
	ZcsdLiv0+znGMkZ2/qEGX0ObTCtVnfde7Htd63GimxY9MPONh35/ihbnNf8ZuyRUBHy5
	UpIBD3ZxnldX0Hb6MqaQeZbSeug938jH9+KQDeRtE9BEmtuIxa0564KGp18nRQTZvOst
	XEn4jEeypkFmNh/Il2gsMuq7DdkH9OwFDqh3r6/6DNJfY3Hd7Pd75DA/gk64aqCsi298
	Pi85Q3dnbHBWgJXxaohBYCO9Xn/woApDxeqfk00UVknySm5j+Ojl0FH/sAFSC1M0YqcT
	DNQQ==
X-Gm-Message-State: APjAAAXSrTsn4iuFMsqOlE6/BpMCkn4OelZniUfcZ5K4jEG1fUtWMMbx
	gNmZ80sFTpuSC7Nrg8xbk2Dqew==
X-Google-Smtp-Source: APXvYqxfFebcGIpwW05rpOJ9XQkacWXjg5wN10PuHG1Ka98tVOrhn1V5VlQVxm6WH92oOdrnFvw0Vg==
X-Received: by 2002:a05:600c:285:: with SMTP id 5mr935918wmk.158.1575482410872;
	Wed, 04 Dec 2019 10:00:10 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	l204sm7834064wmf.2.2019.12.04.10.00.09
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 04 Dec 2019 10:00:10 -0800 (PST)
Message-ID: <699e48bc46b4e96c13393b2d61dbe366c3c88825.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Wang Mingyu <wangmy@cn.fujitsu.com>, 
	openembedded-core@lists.openembedded.org
Date: Wed, 04 Dec 2019 18:00:08 +0000
In-Reply-To: <1575472180-11923-1-git-send-email-wangmy@cn.fujitsu.com>
References: <1575472180-11923-1-git-send-email-wangmy@cn.fujitsu.com>
User-Agent: Evolution 3.34.1-2 
MIME-Version: 1.0
Cc: Jon Mason <Jon.Mason@arm.com>, Denys Dmytriyenko <denys@ti.com>
Subject: Re: [PATCH] nss: 3.45 -> 3.47.1
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
X-List-Received-Date: Wed, 04 Dec 2019 18:00:10 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2019-12-04 at 07:09 -0800, Wang Mingyu wrote:
> Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
> ---
>  meta/recipes-support/nss/{nss_3.45.bb => nss_3.47.1.bb} | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename meta/recipes-support/nss/{nss_3.45.bb => nss_3.47.1.bb} (98%)

Fails on beaglebone:

https://autobuilder.yoctoproject.org/typhoon/#/builders/65/builds/1327

Cheers,

Richard


