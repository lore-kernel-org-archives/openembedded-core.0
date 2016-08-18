Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f53.google.com (mail-it0-f53.google.com
	[209.85.214.53])
	by mail.openembedded.org (Postfix) with ESMTP id 2F8F273257
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Aug 2016 11:34:17 +0000 (UTC)
Received: by mail-it0-f53.google.com with SMTP id e63so23868171ith.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Aug 2016 04:34:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=AHwNfuAYzaS6yBKw+56sSAY5p7I/6F35JIfmeY+o6QQ=;
	b=ID+Z9DX27liqskrxoEBiGX2YQq7Vcr6WUkfuPxMcBPiW43F8qjqRp60MBi0E1SaQGL
	xoehYkepSXGS+Y+wmZmIA8MppaZ6a/OIIVMECwBIwgVv1+7785LGKas9+Zw8IksHnBcM
	IKyn97t9LqfJRdTs2Jfbos2vcSUy+Hoy2F1zq+BXjvKhg98jFvmHKRKOtL50PRcu9MqL
	uuWt038eGd9CttZ9TK3IdTf5NMG8VpCgGQfGbanD10Jgz5Y7JT8oRwg12poKwvO1/Sl4
	66k3S5FYu2S68UW49nDLRh0ZWtm0ZCVv2LL32ZAt97jSwLNUmLvK/sRzmazyX3RZ0dah
	XHqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=AHwNfuAYzaS6yBKw+56sSAY5p7I/6F35JIfmeY+o6QQ=;
	b=Mn6j8A564v7rD6TgQ2/TjuKE/mru3hlLnOFjo8oAXjsGPxgZr7H+nM7QGh+XM1j0+M
	u38AKiZas7eBHVK9gSuo5oivPtwRXbQuNPU5D7d1eKVmgSMPDVuZUcPOqiwTHyQ8r9T1
	KtIOjT29adbUtpiYmA5xO9Y3OeF18AzPa5Z78zCbdC97IsNw4NQqm/vqcsk3vb+tWuw5
	lPgPaECoSVgAe+9UuXwNZdEovJpNRY6bLAOLPgG8m7m/ZoW32JVFPBCWlxf3Wy0I87J3
	8z/WQ9i85x1igp8AIcCTwYSr/b2N+Sg0IqYpoMhDdX9u7En4hzrDNJLSEJdTYlCLIPbs
	eL2A==
X-Gm-Message-State: AEkooutXLiw3CqxwNecr8SImYEo1EFX9rvQvKPvylP916ykL/OVvGh0N1xOgcTpc82rYBqyx9q+71XuMSpylAj9k
X-Received: by 10.36.216.138 with SMTP id b132mr2710325itg.38.1471520057784;
	Thu, 18 Aug 2016 04:34:17 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.18.17 with HTTP; Thu, 18 Aug 2016 04:33:57 -0700 (PDT)
In-Reply-To: <1471499308-1666-1-git-send-email-wangxin2015.fnst@cn.fujitsu.com>
References: <1471499308-1666-1-git-send-email-wangxin2015.fnst@cn.fujitsu.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 18 Aug 2016 12:33:57 +0100
Message-ID: <CAJTo0LZy-mx4K=eSJdNRq12JVDzGwW+Oe0uf40YRZAmyWVJsZQ@mail.gmail.com>
To: Wang Xin <wangxin2015.fnst@cn.fujitsu.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gdk-pixbuf: 2.34.0 -> 2.35.3
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
X-List-Received-Date: Thu, 18 Aug 2016 11:34:18 -0000
Content-Type: multipart/alternative; boundary=94eb2c05ae9253100e053a56f66e

--94eb2c05ae9253100e053a56f66e
Content-Type: text/plain; charset=UTF-8

On 18 August 2016 at 06:48, Wang Xin <wangxin2015.fnst@cn.fujitsu.com>
wrote:

> Upgrade gdk-pixbuf from 2.34.0 to 2.35.3.
>

2.35.x is a development release, so stick with 2.34.x until 2.36.0 is
available.

Ross

--94eb2c05ae9253100e053a56f66e
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 18 August 2016 at 06:48, Wang Xin <span dir=3D"ltr">&lt;<a href=3D"mailt=
o:wangxin2015.fnst@cn.fujitsu.com" target=3D"_blank">wangxin2015.fnst@cn.fu=
jitsu.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=
=3D":4ip" class=3D"a3s aXjCH m1569c3311408dd51">Upgrade gdk-pixbuf from 2.3=
4.0 to 2.35.3.<br></div></blockquote></div><br>2.35.x is a development rele=
ase, so stick with 2.34.x until 2.36.0 is available.</div><div class=3D"gma=
il_extra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--94eb2c05ae9253100e053a56f66e--
