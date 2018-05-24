Return-Path: <gizero@gmail.com>
Received: from mail-vk0-f54.google.com (mail-vk0-f54.google.com
	[209.85.213.54])
	by mail.openembedded.org (Postfix) with ESMTP id AFBE4746AB
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 May 2018 05:22:52 +0000 (UTC)
Received: by mail-vk0-f54.google.com with SMTP id p206-v6so234193vkf.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 May 2018 22:22:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=Qtqg92H+6L0UQFxFPvi4FzAMyCjlByO0zy4wpNcEFfw=;
	b=G1E8L/M1WVEW0CfCu/7vjn0L6FMFLsIa9xYuqDQmfDu7A7H5GM5w2ntlPy+fadux9F
	iQJ2DDikJbywHinlcqVnRPxzyhWDPY7xJfhGQqLpUHKGpTDRAqyWEnATmBdVXj4p6r+O
	CQwSV5g41LkxReM6FPjgjCDFjh/AoXWHozyOUfsN5VlOa3sj5/6DcM1jFW7As5Hb88Xb
	qD/YrNQ3IA9PXKvpSwgflfRwP7QinlQdlarnFQ4elcLvrDSV9HHqapp6JwhIPwH4G7nS
	7qETR7JKEh6Iw5QjFYqZ4Nn7nogDkRY2MKam7Lrl8/LG8aje9M9irtXkCysI+O/AMZJz
	8LYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=Qtqg92H+6L0UQFxFPvi4FzAMyCjlByO0zy4wpNcEFfw=;
	b=aamTaEZgk6uK5xKrOBihYmhx+vKw4tIvlzYJbBJkyrHEe/Xv4FR0igF1Ruxvpn79X9
	fzTGXcBw9InGI/o1RTZFFz0gOUvO17PyKahF9JK2/j2Sl2iH58UVbqkrVsF7zJMNKcC8
	WrA5S7c68zZyoSBL766TaLQai8ZRg2w+jiQmWUSq+MO+jdk8SvXWXSMpeFSmFAyKYdH/
	nQ3ewOzzeEv96dnYQmuVydDCy2BpQKbQRg1P6G1IvNSZO7mbmyXrX1aBNaKcR6Ic018/
	Ps1tIo2u4o3mV/xNLlOW3d2l1P/iNVBogxKQ14+7ZB+YHFBlB8EPhDp0K+JMndzbgsej
	spcQ==
X-Gm-Message-State: ALKqPwevQJMuONO+uKIOigaOTA/9mKr6vACNj6sK46o0buOq+Y+kQG9F
	xkaVC/oKhjZsqqFK3L1vyVIl+Enm4vv47fjNKqSY6Q==
X-Google-Smtp-Source: AB8JxZpV8R7D8zRe7cMGZdgWVXbcR2+2sotq+yBsSKQtLoaOKBsMd6Ny9WTe7aSkJido5tpyR2XvOAVCgQlaTiLOQjw=
X-Received: by 2002:a1f:a8d2:: with SMTP id
	r201-v6mr3590495vke.39.1527139373184; 
	Wed, 23 May 2018 22:22:53 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9f:3643:0:0:0:0:0 with HTTP; Wed, 23 May 2018 22:22:32
	-0700 (PDT)
In-Reply-To: <33D4DBCAC5F2D74E96B07F6E7632BF7363AE493C@G08CNEXMBPEKD01.g08.fujitsu.local>
References: <33D4DBCAC5F2D74E96B07F6E7632BF7363AE493C@G08CNEXMBPEKD01.g08.fujitsu.local>
From: Andrea Galbusera <gizero@gmail.com>
Date: Thu, 24 May 2018 07:22:32 +0200
Message-ID: <CAC+thW0i5QMv5PNws19Mx2ACgLufG36xMtsAbU-zQQyqXxUDeQ@mail.gmail.com>
To: "Zheng, Ruoqin" <zhengrq.fnst@cn.fujitsu.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: question: Use systemd as the default initialization manager
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
X-List-Received-Date: Thu, 24 May 2018 05:22:53 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi!

On Thu, May 24, 2018 at 7:06 AM, Zheng, Ruoqin
<zhengrq.fnst@cn.fujitsu.com> wrote:
> Hi All=EF=BC=9A
>
> By default, the Yocto Project uses SysVinit as the initialization manager=
.
> However, systemd is used by many distributions and it's supported in Yoct=
o.
>
> Why didn't use systemd as the default initialization manager?

As you mentioned, the Yocto Project does support building and
configuring systems with either of the two init frameworks. Poky,
which is the reference distribution that comes with Yocto, uses
SysVinit by default. There's nothing bad with systemd support in
Yocto. It perfectly works and many of us are successfully building
their custom distributions (or simply Poky derivatives) with systemd.
Just follow instructions at [1] to select your preferred init system.

I'm not aware of any plan to switch default init system for Poky to
systemd. This probably more for historical than technical reasons as
of today.

[1] https://www.yoctoproject.org/docs/current/mega-manual/mega-manual.html#=
selecting-an-initialization-manager

> --------------------------------------------------
> Zheng Ruoqin
> Nanjing Fujitsu Nanda Software Tech. Co., Ltd.(FNST)
> ADDR.: No.6 Wenzhu Road, Software Avenue,
>        Nanjing, 210012, China
> MAIL : zhengrq.fnst@cn.fujistu.com
>
>
>
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

