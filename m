Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f171.google.com (mail-qk0-f171.google.com
	[209.85.220.171])
	by mail.openembedded.org (Postfix) with ESMTP id 8FF4C775FC
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 Mar 2017 16:07:22 +0000 (UTC)
Received: by mail-qk0-f171.google.com with SMTP id v125so3227876qkh.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 03 Mar 2017 08:07:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=UPLYu4Wr/zvQqozxvqIxSxdQBnDGjTzmX7VY2YWOvQ0=;
	b=PdEy0osI8Kxyc89s9aJdNW3l2a3G+/f96XoJWzRUkCyY/kR3QS1irIkeG1OZ66qDjD
	kpOas/SdtYwq6yjbpspxw4daPS8F6BAhzFOoiS428Jc4ENY3YfDrQf80gB9nEshTZoDf
	qc5VWdclVPIVlCaIUAh2UxnpgTrsy4gXF4O7Z4/EixTpP3xV7We4XyMyyxWyA9u0HWc4
	CxDon2bb6cCKMOjUWevyQO8Se8mTZ9SBcT0Ur6QB/43dRVNlR9eR+0XLxwXlZKOmcGUM
	10VtZtpeBczaYLG1IMHNRxT/mNxB34JishT9V4BJCE7ugNWOu9+B7cJDvrQfz69drHeW
	RpOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=UPLYu4Wr/zvQqozxvqIxSxdQBnDGjTzmX7VY2YWOvQ0=;
	b=KtSIUTjxZA4fQ8X6K0nzkeWxFuJnZjIeDTqmsPNzD9zJyEvpj53bfzyYq38g2HSD2Y
	4S9qVxTcLb9o5IMrQaDjt4vAbmzK8Bx6VPcrdECiVmADw3vvK++ZyVjJvBzuXlIeudU8
	oeURJ+6Wwiz8duTGTvVNOrArWCtaAGO3xHpMkH/ysJvfP06FoDL5BZZTfpccDsKfV5oJ
	ub2aqVI9oQseQ+z0ymcvpSPmfcUzYW7sw7w1eggtO5Gos5zdoZWGCDcjyQKwkPHo1alC
	osrwDzzQEk5MK8lH9+UDtsCXvddeZqh9bWFMpavwENWxSZnYW23s4sL5a+DeRBZUBkAd
	shRg==
X-Gm-Message-State: AMke39lkeAT29Mixm81OPi3EEgEQI622H7+rgSH8fXHIY7BXJakyHcuyqgsEqhLNZEiEp9W6vNiNM5R2VqpS+RXJ
X-Received: by 10.55.221.1 with SMTP id n1mr3166007qki.221.1488557243569; Fri,
	03 Mar 2017 08:07:23 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.22.166 with HTTP; Fri, 3 Mar 2017 08:07:03 -0800 (PST)
In-Reply-To: <CAJTo0LYbO0_oE0cB-fmXXNPeZF=YwEWTwQ1-YEyRbYKe3oGomQ@mail.gmail.com>
References: <cover.1488164498.git.bruce.ashfield@windriver.com>
	<CAJTo0LYbO0_oE0cB-fmXXNPeZF=YwEWTwQ1-YEyRbYKe3oGomQ@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 3 Mar 2017 16:07:03 +0000
Message-ID: <CAJTo0LZRU2JgT6oFo-FUG+nzjqgjwR9M6542ngDHLW_CfhN4hA@mail.gmail.com>
To: Bruce Ashfield <bruce.ashfield@windriver.com>
Cc: Saul Wold <saul.wold@intel.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/4] linux-yocto: kernel version updates
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
X-List-Received-Date: Fri, 03 Mar 2017 16:07:23 -0000
Content-Type: multipart/alternative; boundary=001a1149d7dcbb3ff10549d5bd72

--001a1149d7dcbb3ff10549d5bd72
Content-Type: text/plain; charset=UTF-8

On 3 March 2017 at 14:41, Burton, Ross <ross.burton@intel.com> wrote:

> This appears to be causing cryptodev-module to fail:
> http://errors.yoctoproject.org/Errors/Details/134637/
>
> TOPDIR/tmp/work/qemux86_64-poky-linux/cryptodev-module/1.
> 8-r0/cryptodev-linux-1.8/zc.c:63:8: error: too few arguments to function
> 'get_user_pages_remote'
>   ret = get_user_pages_remote(
>         ^~~~~~~~~~~~~~~~~~~~~
>

Never mind, found a fix upstream and sent a patch.

Ross

--001a1149d7dcbb3ff10549d5bd72
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 3 March 2017 at 14:41, Burton, Ross <span dir=3D"ltr">&lt;<a href=3D"mai=
lto:ross.burton@intel.com" target=3D"_blank">ross.burton@intel.com</a>&gt;<=
/span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8=
ex;border-left:1px #ccc solid;padding-left:1ex"><div>This appears to be cau=
sing cryptodev-module to fail: <a href=3D"http://errors.yoctoproject.org/Er=
rors/Details/134637/" target=3D"_blank">http://errors.yoctoproject.<wbr>org=
/Errors/Details/134637/</a><br><br>TOPDIR/tmp/work/qemux86_64-<wbr>poky-lin=
ux/cryptodev-module/1.<wbr>8-r0/cryptodev-linux-1.8/zc.c:<wbr>63:8: error: =
too few arguments to function &#39;get_user_pages_remote&#39;<br>=C2=A0 ret=
 =3D get_user_pages_remote(<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 ^~~~~~~~~~~~~~~~=
~~~~~</div></blockquote></div><br>Never mind, found a fix upstream and sent=
 a patch.</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_ext=
ra">Ross</div></div>

--001a1149d7dcbb3ff10549d5bd72--
