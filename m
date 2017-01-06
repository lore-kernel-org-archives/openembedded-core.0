Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f174.google.com (mail-qk0-f174.google.com
	[209.85.220.174])
	by mail.openembedded.org (Postfix) with ESMTP id F0D8271A1A
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Jan 2017 17:12:19 +0000 (UTC)
Received: by mail-qk0-f174.google.com with SMTP id a20so81521200qkc.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 06 Jan 2017 09:12:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=obVEwPrD5D6g/tQNRbeujwGyq93GDlUmy/+H+qAxgPg=;
	b=Lef4pRGh4DY2y8GYeoTgJd/bmd7NS4FyAuE7pmSUivLgoh3AIi7dFQLlnumXDdECH1
	7gFJKZxzdwgGj3e6CQEK1S22GizWIDcVG2pbv+VQ/Ehor7AeyXQCu6+DbyfwJIbp/HrL
	IpNyHCP9VEc+lkGJc9dNFaCKiAdAsAVPdrQF1cpjmDdw+ul9tisfgx2nZe0MxxUmIubB
	rV8VqaD+ELrE/xR/2E512GjWnoU2y4bnIqT9TGQjSVNiyN59WPFa/l0gMD4z7fph8mq4
	z13ODWr6X6ZwKanjKfPyhOeXjfb4L+EkXV7TFakdYQY2ianxIuQZL358BsKTBAnu5Kc3
	38kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=obVEwPrD5D6g/tQNRbeujwGyq93GDlUmy/+H+qAxgPg=;
	b=s1YTH/XIhNdirQr40NNok4BcOphSos9j5y6KkMcP0L5vh6Ykjf43C+Vk8oV+tB8/8G
	4zbJ8AN6cILKBw5wYW8kdagW3SVtL9/GlURXCbqd68ab4s8jVk581MCk0P8C7nESMJ/c
	lwcrX8vcNl7j6ARBWZGJylx6T4RUB0sDBlnUnhINKW5a5Y00s5Z6fQJiBR7MI7gsKPvB
	4lLBdl5FZX8Eie436UY23sXkhnh30fSswoZe+r1HsJ44qAAMktRughXDz/zTt/XfvVoC
	gjZThAMf9fWGNeeD7gOXy4z5EdDQXxaNaYbx/xL54X+P7ghnvYKAVjtFxtzdwD978Ug2
	AqyA==
X-Gm-Message-State: AIkVDXJ0EKJWBkXnkX1zPQy4lsI2VLG+SDRMmkt0zN9/tpBARDBYINYxSdBIMF2v45a1pr8DVAz4AsQD/qLCHF73
X-Received: by 10.55.15.231 with SMTP id 100mr70039018qkp.244.1483722739832;
	Fri, 06 Jan 2017 09:12:19 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.106.99 with HTTP; Fri, 6 Jan 2017 09:11:59 -0800 (PST)
In-Reply-To: <1482732918-8881-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
References: <1482732918-8881-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 6 Jan 2017 17:11:59 +0000
Message-ID: <CAJTo0LZoYUtoD-J1HWkZ4kZ_GmCWf3p9ekqQjiZYLax=snsTcQ@mail.gmail.com>
To: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] iproute2 4.7.0 -> 4.9.0
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
X-List-Received-Date: Fri, 06 Jan 2017 17:12:20 -0000
Content-Type: multipart/alternative; boundary=001a11476032da6c3b0545701ef9

--001a11476032da6c3b0545701ef9
Content-Type: text/plain; charset=UTF-8

On 26 December 2016 at 06:15, Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
wrote:

> +Subject: [PATCH] fix 4.9.0  musl compile problem
> +
> +Avoid in6_addr redefinition
> +
> +Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
>

This is missing an Upstream-Status tag.

Ross

--001a11476032da6c3b0545701ef9
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 26 December 2016 at 06:15, Zheng Ruoqin <span dir=3D"ltr">&lt;<a href=3D=
"mailto:zhengrq.fnst@cn.fujitsu.com" target=3D"_blank">zhengrq.fnst@cn.fuji=
tsu.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D=
"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D"=
:1p6" class=3D"a3s aXjCH m15939c6cb98bd940">+Subject: [PATCH] fix 4.9.0=C2=
=A0 musl compile problem<br>
+<br>
+Avoid in6_addr redefinition<br>
+<br>
+Signed-off-by: Zheng Ruoqin &lt;<a href=3D"mailto:zhengrq.fnst@cn.fujitsu.=
com">zhengrq.fnst@cn.fujitsu.com</a>&gt;</div></blockquote></div><br>This i=
s missing an Upstream-Status tag.</div><div class=3D"gmail_extra"><br></div=
><div class=3D"gmail_extra">Ross</div></div>

--001a11476032da6c3b0545701ef9--
