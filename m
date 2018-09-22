Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f194.google.com (mail-qk1-f194.google.com
	[209.85.222.194])
	by mail.openembedded.org (Postfix) with ESMTP id EAEA2797C7
	for <openembedded-core@lists.openembedded.org>;
	Sat, 22 Sep 2018 17:13:35 +0000 (UTC)
Received: by mail-qk1-f194.google.com with SMTP id n186-v6so9599691qke.3
	for <openembedded-core@lists.openembedded.org>;
	Sat, 22 Sep 2018 10:13:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=0AxCo113AnIah7PkWJtZMjLpomfrFkOrmxDeWRTd7zc=;
	b=sGEDWDkhWw5Q8CVCR/Fxt1/H4gl6LGnYa9hO08FcuLBFpPwDjZFFU8MvWOvv+qFUye
	PP8is9iqnWhcNyZYVwuFg6D2uf6IPxOW3E+fL+WcUvRXKmkrli0Bnv7ppuS1SlJYX+w6
	D3thcwoPu6ae3lgHyyFmefgnRcr0n+7FXbp3PHgMHE3SD9yfG5L8NYhkyhDmuGb1jnBC
	9sAZD6ZYjDk5V0baj0aOpLThF52LdzwPJctwUU8fue6etmwAIPquoHqwvsUSt98+l12Z
	/ylwtMTxH/jhXdq43O6l4KGSuEs0it5NEjyPy6P3SfdnwLF+1kRgm+dGqUQXqHe47P4O
	GC/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=0AxCo113AnIah7PkWJtZMjLpomfrFkOrmxDeWRTd7zc=;
	b=a+rQ0Ezk5o2loVCbTd1SkuzLsvxkjV9CTgOaxOuJDXPGliaoLkJC6nokl89UFbHYog
	HZzKB66FanqYJjh0PZqPgZp3eNPsh2dOYKWPjoZzB/u6mBkoZbiVzf1OtJo8CAgL/wj/
	Bdqql8ulrzHUuHcpG3S7xwj7cymYLxZjKObOocSv1mtvUJumtat/dpJiOtcAHAbtzoEL
	gHR7VLiMA68ExrHZT+qesIz6IAzmL1P2QtdK6hMqRdJAHTRqy2k1nRepP/9uO5Iqz/C7
	tyzlTi6Qn1NGErptq6ZG38117rZ1kGdjytjTPFusSshGZEGOX9jjlK8/u3g6XJ44qLPw
	xJ3A==
X-Gm-Message-State: ABuFfojDHel0X5UIrFBcRrloc943BQ6plhwDH0VFKM8iutLE8HGdwpK9
	vHItjXinbnI61v66Jl+wkaWT7OBXVCRmAimN/eM=
X-Google-Smtp-Source: ACcGV63ycrRmgcv62FBXL9XO7lGh0WkqOZJlHOfA+IvBn+0KxJ67EWDynjETOULEDql7m2ZZUYVEdaibNmUEf4/vfYE=
X-Received: by 2002:a37:3086:: with SMTP id
	w128-v6mr1835874qkw.315.1537636416442; 
	Sat, 22 Sep 2018 10:13:36 -0700 (PDT)
MIME-Version: 1.0
References: <20180921142608.36203-1-abrodkin@synopsys.com>
	<20180921142608.36203-6-abrodkin@synopsys.com>
	<cf9d1a3f0b8e3b7d69c61212daa029f290975fc1.camel@linuxfoundation.org>
In-Reply-To: <cf9d1a3f0b8e3b7d69c61212daa029f290975fc1.camel@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 22 Sep 2018 10:13:10 -0700
Message-ID: <CAMKF1srdkv7OApx7uY9sQoDWs-AyjizonObUFDHVm0BKdptavA@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: wk@gnupg.org, Alexey Brodkin <Alexey.Brodkin@synopsys.com>,
	linux-snps-arc@lists.infradead.org,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v3 5/9] libgpg-error: Add ARC support
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
X-List-Received-Date: Sat, 22 Sep 2018 17:13:36 -0000
Content-Type: text/plain; charset="UTF-8"

On Sat, Sep 22, 2018 at 8:59 AM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Fri, 2018-09-21 at 17:26 +0300, Alexey Brodkin wrote:
> > Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
> > Cc: Ross Burton <ross.burton@intel.com>
> > Cc: Werner Koch <wk@gnupg.org>
> > ---
> >
> > Changes v2 -> v3:
> >  * Use proper [recently upstreamed] fix for ARC Glibc toolchain
> >  * Fix compilation for x86_64 due to renamed header
> >
> > Changes v1 -> v2:
> >
> >  * Added upstream status
>
> Its still breaking on the autobuilder:
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/21/builds/72/st
> eps/7/logs/step1b
>
> I think its for i586 which needs fixing similarly to x86_64.
>
> I did pull the simpler less risky pieces in for 2.6 but this experience
> is making me nervous about the remaining patches which should perhaps
> wait until 2.7.

I think this should be fine. Lets take the ones we have going for now


>
> Cheers,
>
> Richard
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

