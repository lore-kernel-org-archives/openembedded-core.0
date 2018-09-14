Return-Path: <ross.burton@intel.com>
Received: from mail-oi0-f67.google.com (mail-oi0-f67.google.com
	[209.85.218.67])
	by mail.openembedded.org (Postfix) with ESMTP id B337C79917
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Sep 2018 10:43:28 +0000 (UTC)
Received: by mail-oi0-f67.google.com with SMTP id v198-v6so12377791oif.9
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Sep 2018 03:43:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=D2JpvOseBS/qhEVudxXEqEHHR61Fhs5xdj+oAKhk3VE=;
	b=GbeSwh3Wjb6tnJGL79gpsssW7Zknghs9BEQvRR6B8SlHLuIClttQAlJeGPHbtanhle
	dPIQAxgurWan4p/2c76ue1FbvxHfRfn+mu/P/W6EOq0Bgo91qkjRacFc4GVflY9ufJZe
	abUXkN79/JOelrxPVdduezaJpCVMl7xUtGLAITEaIEimuHnOoR7KxMzUSlYZu9tEoMQL
	SVaEue+tlAbEK1ImWzrDMFCCdeOFqfLkfL3QJf6hEzRdyxW2O0FmPA40W1NSWeXqK5rO
	Yfl2fJZolBUJmw+jzunkTGcDNUGtPxr8ETUA+HJsCoj8iHIfII+xp6LEuJOr9HCL3Oj/
	Pj+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=D2JpvOseBS/qhEVudxXEqEHHR61Fhs5xdj+oAKhk3VE=;
	b=VIrHb/hy42kQXNTf7LCo9jr9QY7YPb78mXdqhcEl58JvN8I5YuW2g+QSCP6TWfKmQF
	s791oBUhMxmpYHkK5VuGJdPBli3T0P+oVgglaCw9wLKoBQWKMGptZC9p7A1wOWh0uXBf
	Jq5dg9CBfFcbsF0WgkWw4g9wddXvE4+/M+nzniQdYDsP3WUlYeoCpNL77yQW30W00wIS
	iCLatrltyrDcNKbTKFsWlWrTLuePmeGRiqUXI8oXeq5Ae6cSpZ0NzJCw3XVlUnP3ABZ0
	Xf93MPb8FYsv1c6lpZGExd7B/DFCREuwFVNnXQUIN3zI7cHGu0hJuwp4F6mGCfrhWE/O
	oZhw==
X-Gm-Message-State: APzg51CASEoyTpUmux0ZfL3zaYCVryPqoBTMqLOw+vIUxfSGjS9j/uSy
	xQqyt3VGER+Bu+SSASCXDFlDi+oogo9uCWp3hbL/Nw==
X-Google-Smtp-Source: ANB0VdavH7hjL+lSSwoKX0pULLUJdLTLagup3WVE34tmNUB8R64lOrfQqXFLe6lGrgHcBhgmUmiHuqNT4RFIb7D8jJI=
X-Received: by 2002:aca:55cd:: with SMTP id
	j196-v6mr8822953oib.202.1536921809735; 
	Fri, 14 Sep 2018 03:43:29 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ac9:7ac:0:0:0:0:0 with HTTP;
	Fri, 14 Sep 2018 03:43:09 -0700 (PDT)
In-Reply-To: <CAJ86T=WukCufiTWU-p8L2cCA4DsnCxC-iPp+Ed-7nWviEAYjRQ@mail.gmail.com>
References: <20180913072547.12321-1-anuj.mittal@intel.com>
	<CAJ86T=V1LDa=b07pxFi3x-D0ijw0PZMFH_BwsHsoQodhjEOnNg@mail.gmail.com>
	<CA+chaQePowpbWZi_k-iJKdUn+ocPZC_0T4VBArs82DSuO0iJkw@mail.gmail.com>
	<CAJ86T=WukCufiTWU-p8L2cCA4DsnCxC-iPp+Ed-7nWviEAYjRQ@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 14 Sep 2018 11:43:09 +0100
Message-ID: <CAJTo0LYRgU7XkE5idH7YHo+6WFz27ic6YPvMBHneyC6JDFHvNQ@mail.gmail.com>
To: Andre McCurdy <armccurdy@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] tune-core2: use n270 instead of core2duo
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
X-List-Received-Date: Fri, 14 Sep 2018 10:43:29 -0000
Content-Type: text/plain; charset="UTF-8"

On 13 September 2018 at 23:50, Andre McCurdy <armccurdy@gmail.com> wrote:
> From the Yocto bug these warnings are coming from the nightly builds:
>
>   https://bugzilla.yoctoproject.org/show_bug.cgi?id=12916
>
> Has something changed recently? Have the nightly builds moved onto an
> AMD machine?

No, the new AB code surfaces build warnings: previously only errors
were surfaced (as they are fatal) and you had to look at each stdio to
see if there were any warnings.

Ross

