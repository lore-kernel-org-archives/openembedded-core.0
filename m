Return-Path: <jacob.kroon@gmail.com>
Received: from mail-lj1-f193.google.com (mail-lj1-f193.google.com
	[209.85.208.193])
	by mail.openembedded.org (Postfix) with ESMTP id CD0CC601E6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Mar 2020 09:22:39 +0000 (UTC)
Received: by mail-lj1-f193.google.com with SMTP id w4so3038467lji.11
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Mar 2020 02:22:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=PfDF5woQrYuo06tMcy2fYMN/9wBMHrpi40RnVhuCd0Y=;
	b=uBdkQOtQ4Oe3eW/xlYjoD+HjdAYWn06qPICWfZ/2fc97PpUVp7C3yfhQJNqbFjgiSy
	p73SVedU1TeLNwi20zgAz1ey0Bl+AWAH5N4AzhK2qaJM/uaota+o3lEZQF1OTt0QzoGs
	CSrbJEBkJMOG8VvGrcy18I9DC3aVI3/rxntK511DoeSGUEMo+u/SJ0atbHsV6MThnD3u
	kdjxi1Mq+XQ7XNPgIWE2EU98cL4U35jJ/yj5iRPW33SMRaYIcSGpYk+XjXajcmk1LmPe
	78AnDaOrKq/iXw6vWC8Gldw6zWuXhIDlDQQaCJlavpDNCZnl+RyMtU/a1Ovvd7+Wm9YJ
	L/tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=PfDF5woQrYuo06tMcy2fYMN/9wBMHrpi40RnVhuCd0Y=;
	b=InZWTSnctr7EoZDIdP2Epp8id+rZOFn/MRxPwhdXKaN4ctNRRanKopJMrsFhFqHiqy
	/iS179VwgF+xki9Y8Ay7zxVQ/otKrQiK770lRlTzxgwL+Sr3+I9GWU9/YplS/ikPktkz
	+fW7x6a+ErgeWuJ0BYEuO9rhezh3EtrHyLIMbGF0iF+Dhy5cW8RhQhUyz+ynp/zFMgox
	i2cE/HkzHXGYHsxLriC8lU98dACrMsywFKc0dvIq3SJXI6rcDoma5nxhc3F/yyJmOopP
	YMy9znSsr8bW3kZJbdqsgKZG7JsWvtbv+xt4PE7CRReoHylSpdTH7Mh1xxZkx0rqXSgE
	YXKQ==
X-Gm-Message-State: ANhLgQ1OENIvktkHJLefY4uU/Rxj+3wekmJVHe2Hllt1Ey5DwjqsnCm2
	VSWKIpyb/V712x+XlYSPXWYiRnMN
X-Google-Smtp-Source: ADFU+vukOrw+49WFF1ZShHdERVZRBbpJjrI9AmO8OJK86gIhCvbfCrUGnFqgS+1b+DYq81BB9m58zg==
X-Received: by 2002:a05:651c:21b:: with SMTP id
	y27mr15836299ljn.164.1584350559884; 
	Mon, 16 Mar 2020 02:22:39 -0700 (PDT)
Received: from localhost.localdomain ([213.185.29.22])
	by smtp.gmail.com with ESMTPSA id
	h24sm24098984ljc.36.2020.03.16.02.22.38
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Mon, 16 Mar 2020 02:22:39 -0700 (PDT)
To: Alexander Kanavin <alex.kanavin@gmail.com>
References: <74a48760-cfec-a2ff-e50b-ebd5d70ae8d8@gmail.com>
	<CANNYZj_koSi=wyZ04G-xQQsvTeY79N4S=yTpw=rLUS-bmF2sVw@mail.gmail.com>
From: Jacob Kroon <jacob.kroon@gmail.com>
Message-ID: <a677ada3-b148-dec9-8f38-28e8c7b467f3@gmail.com>
Date: Mon, 16 Mar 2020 10:22:38 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <CANNYZj_koSi=wyZ04G-xQQsvTeY79N4S=yTpw=rLUS-bmF2sVw@mail.gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: How to skip building kernel modules
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
X-List-Received-Date: Mon, 16 Mar 2020 09:22:40 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 3/16/20 10:12 AM, Alexander Kanavin wrote:
> The way I read kernel.bbclass, you need to set CONFIG_MODULES=n in your 
> configuration through some mechanism; then they'll be skipped altogether.
> 
> Alex
> 

Yeah, I should have mentioned, setting CONFIG_MODULES=n in a config 
fragment causes all modules to be built into the kernel, which is not 
what I want.

I've also tried setting

do_compile_kernelmodules[noexec] = "1"

but that breaks do_install()

/Jacob

> On Mon, 16 Mar 2020 at 10:06, Jacob Kroon <jacob.kroon@gmail.com 
> <mailto:jacob.kroon@gmail.com>> wrote:
> 
>     Hi,
> 
>     I'm using the linux-yocto kernel recipes together with additional
>     kernel
>     config fragments that I append in our custom distro layer. All required
>     functionality is built into the kernel, so we don't install any kernel
>     modules on target.
> 
>     What would be the correct way to save compilation time and skip
>     building/packaging the kernel modules ? Do I need to provide a custom
>     defconfig that explicitly disables all modules ?
> 
>     I can monkey-patch oe-core with the attached patch in order to achieve
>     that goal, but I'm guessing something like this wouldn't be suitable
>     for
>     upstreaming ?
> 
>     Cheers,
>     Jacob
> 
>     -- 
>     _______________________________________________
>     Openembedded-core mailing list
>     Openembedded-core@lists.openembedded.org
>     <mailto:Openembedded-core@lists.openembedded.org>
>     http://lists.openembedded.org/mailman/listinfo/openembedded-core
> 

