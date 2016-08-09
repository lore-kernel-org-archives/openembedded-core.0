Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f46.google.com (mail-it0-f46.google.com
	[209.85.214.46])
	by mail.openembedded.org (Postfix) with ESMTP id A590B77190
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Aug 2016 10:00:39 +0000 (UTC)
Received: by mail-it0-f46.google.com with SMTP id x130so8618513ite.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 09 Aug 2016 03:00:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=ExHbe9PblPlJrhBrxYHw/qBRGJ46mF0+bGo/LlusKT8=;
	b=U2rqiqcjHHHaC13w/kkBLTwsrFjqL4ENIMXzo4/1XYZwSRkTLfjbv3zvg8i7DUJFrN
	YL4loSqJC4qL4D44xUD8yIt3W3lyOPkmBjloGso8ltOE2EzUVd72iYWAuG+ZV6CvOGVE
	e+OTFAzCmEAggEUWaTHKNXoR9e8RPIvHle0it5RVCKZcoRMcWU50jYiQcHJcob2pdmiY
	6PBJSteysMXzm11xfsCMpJjl9FcxgvmQ8D51CQ7B5CCUcFQJGGpfrXeJ7qh108tJC4LN
	cwpvTb1jd7IaeGEPJkPgIR+hrhlHeZyKf2/hwiyl7Zr3j0e/jvtUAN3LpnV0CMG/JK24
	70Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=ExHbe9PblPlJrhBrxYHw/qBRGJ46mF0+bGo/LlusKT8=;
	b=TRCMnxIbAnBY4rDoQhPIl4QsR6Ooe3YlMH68NngdUN2W/so4wCnxdlo16zWI8wg4ey
	srSYFU4EaLVGzlRHaCfg2AyHg6r5w/QR+LJaGJ0WfELIB5EUgoRPO1ymsANSUwq1NOgH
	EWcBbavcqiq/yuqLWZ/gx8iCWJAD36e1pmrClqCXIuNQKSMI1EZoC+iN6vOnX7n5i/hn
	Hy1rknX1jpYl/YCK/A5NiMoz4kSd9d9QbEb1n+aj3d+spc0elrjm9lNWPnpQGkV64cah
	rK+rXvRuWiS94/5DWQ7qEp5wAnIfZwfEPyMBuFQBXTVCSGguVsiAVnnbYpxnmoOj5nqz
	qnXg==
X-Gm-Message-State: AEkoouv+VYeG9sF/ASFdp7Vq1dEQZn5KyIItjXS4TdxBJwslOqcBW42OcBN0yjWTSJT9uFGatUgGV5q+yOUitYwo
X-Received: by 10.36.129.213 with SMTP id q204mr24255536itd.38.1470736839922; 
	Tue, 09 Aug 2016 03:00:39 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.18.17 with HTTP; Tue, 9 Aug 2016 03:00:19 -0700 (PDT)
In-Reply-To: <CALbNGRTfPz3h=G3WJG88ShDtCJjgFj1zTk0kT=Ri+k_N6d=tog@mail.gmail.com>
References: <20160729222801.9806-1-raj.khem@gmail.com>
	<CAP9ODKr5zc+cB-iGcze7Uq8DswUko=2cReYhWLyURe5DwLuE2Q@mail.gmail.com>
	<1741854.t2UPzGOPnl@peggleto-mobl.ger.corp.intel.com>
	<CALbNGRSP+nbV045-UaW_bZXv0iwnTe-MhjMLe3NEqAeg=-6Lyw@mail.gmail.com>
	<CALbNGRTfPz3h=G3WJG88ShDtCJjgFj1zTk0kT=Ri+k_N6d=tog@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 9 Aug 2016 11:00:19 +0100
Message-ID: <CAJTo0LbSmfeoTfpsTRgZ4ZUr7B+fkjxHBPAmAWu=UWk3UUAj4Q@mail.gmail.com>
To: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	Otavio Salvador <otavio.salvador@ossystems.com.br>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/3] linux-dtb.inc: Support for .dtbo files for dtb overlays
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
X-List-Received-Date: Tue, 09 Aug 2016 10:00:39 -0000
Content-Type: multipart/alternative; boundary=94eb2c08b1fce6ebee0539a09a05

--94eb2c08b1fce6ebee0539a09a05
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 9 August 2016 at 10:22, Andreas M=C3=BCller <schnitzeltony@googlemail.co=
m>
wrote:

> Is there anything wrong with this patch? The original patch was sent
> end of May, there were pings / a resend but it was never applied. Why
> I insist: It is necessary for RaspberryPi's open source (VC4) patch
> series pending for very long time.
>

Just slipped through the net, now in my staging branch for master.

Ross

--94eb2c08b1fce6ebee0539a09a05
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 9 August 2016 at 10:22, Andreas M=C3=BCller <span dir=3D"ltr">&lt;<a hre=
f=3D"mailto:schnitzeltony@googlemail.com" target=3D"_blank">schnitzeltony@g=
ooglemail.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div =
id=3D":1ra" class=3D"a3s aXjCH m1566e9e5ff760697">Is there anything wrong w=
ith this patch? The original patch was sent<br>
end of May, there were pings / a resend but it was never applied. Why<br>
I insist: It is necessary for RaspberryPi&#39;s open source (VC4) patch<br>
series pending for very long time.</div></blockquote></div><br>Just slipped=
 through the net, now in my staging branch for master.</div><div class=3D"g=
mail_extra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--94eb2c08b1fce6ebee0539a09a05--
