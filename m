Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-pa0-f50.google.com (mail-pa0-f50.google.com
	[209.85.220.50])
	by mail.openembedded.org (Postfix) with ESMTP id 269116012A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Nov 2015 12:29:43 +0000 (UTC)
Received: by pacej9 with SMTP id ej9so85856567pac.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Nov 2015 04:29:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc:content-type;
	bh=M+Kni7s3vDVDH4G8dbl2EuwWlJN48zEJ+xSY2YdnN9M=;
	b=Ffh/sd3ofHzuV/hF6f6Tg+7F3c4Clty7U9PB7LaD5yd/97MNapgtYsMswFwoCZCZXT
	qnki9CAnZYFxUxC02VoKCNw/OZyiN3NFlfIXlU/e3FnmUThfY8VqfGgIfD/APeikx0qZ
	Vn8+89n4epLfdDDdx6swLol5oyRtfF2+V3+Bj38enHDqG9yQIqfGaQwmAtbW54KjgP3J
	+sr7DhaRDkDryA1uGCZb01MfQ2VMiizgZyHTg63UQlZ0w5Xc2WZaVl5/OgqnWJt3Yyef
	4pDjCUeF4paKt0TmsCjNZVYcARdjG71A+9lYDNw+e0Rtd5lSrQNQjAu+gACohTw7Nj1k
	4X+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc:content-type;
	bh=M+Kni7s3vDVDH4G8dbl2EuwWlJN48zEJ+xSY2YdnN9M=;
	b=a0lMfmFH1kZhajMEyYToTULftFe/hSYDfTAYKydirSBpQ00eRv6lc7Bom/QfntNh+X
	cCfx1QbijiBw/kwRsPQf9NPjYfGino8JKVajnxcpvaFq8JCg2VIyzeTpywYzMV+jIoi5
	DXOKXjrd6QWAsGm5f2X70+6I9DEQZc3RjhmmrJn9yFSERh2xzpOzoXiYvebuXDYvuX2+
	I7HKNV0RWFqPqhhWIhLRMeBBo/8d7K+J05K5iQDcFeMZzWp4eAbo2UOHzvxEQmVb+vN3
	TKAEAi9xi8nbM/X4WyA3m764OPIGygFJ31CCTusb7v5uhkTkPLMMU0Zz6UkHJQw4Ky0u
	V4AQ==
X-Gm-Message-State: ALoCoQkq0ylJmCbAuk8vn75ic6rF8iGAb7ZYMGp64Q3NYJGQtNcbA5h0Az+9doO/OI1BEq4A//9T
X-Received: by 10.66.155.197 with SMTP id vy5mr59466696pab.109.1448540984452; 
	Thu, 26 Nov 2015 04:29:44 -0800 (PST)
Received: from mail-pa0-f53.google.com (mail-pa0-f53.google.com.
	[209.85.220.53])
	by smtp.gmail.com with ESMTPSA id 9sm27353537pfn.51.2015.11.26.04.29.42
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 26 Nov 2015 04:29:43 -0800 (PST)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by padhx2 with SMTP id hx2so86003896pad.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Nov 2015 04:29:42 -0800 (PST)
MIME-Version: 1.0
X-Received: by 10.66.243.3 with SMTP id wu3mr59502809pac.135.1448540982494;
	Thu, 26 Nov 2015 04:29:42 -0800 (PST)
Received: by 10.66.197.129 with HTTP; Thu, 26 Nov 2015 04:29:42 -0800 (PST)
In-Reply-To: <1448489575-1598-5-git-send-email-tom.hochstein@freescale.com>
References: <1448489575-1598-1-git-send-email-tom.hochstein@freescale.com>
	<1448489575-1598-5-git-send-email-tom.hochstein@freescale.com>
Date: Thu, 26 Nov 2015 10:29:42 -0200
X-Gmail-Original-Message-ID: <CAP9ODKpGwaSifd4Tjs3o-yU_etpmaUm+Nzgeix_Z42OaBbCE0g@mail.gmail.com>
Message-ID: <CAP9ODKpGwaSifd4Tjs3o-yU_etpmaUm+Nzgeix_Z42OaBbCE0g@mail.gmail.com>
To: Tom Hochstein <tom.hochstein@freescale.com>, 
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>, 
	"Burton, Ross" <ross.burton@intel.com>
Cc: "meta-freescale@yoctoproject.org" <meta-freescale@yoctoproject.org>
Subject: Re: [meta-freescale] [meta-fsl-demos][PATCH v3 5/6] packagegroup-core-x11-base: Remove matchbox packages for xwayland
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
X-List-Received-Date: Thu, 26 Nov 2015 12:29:45 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Nov 25, 2015 at 8:12 PM, Tom Hochstein
<tom.hochstein@freescale.com> wrote:
> From: Neena Busireddy <neena.busireddy@freescale.com>
>
> Do not install x11 packages when both x11 and wayland DISTRO_FEATURES are availiable.
> Wayland backend is preferred as we will be using X11 on top of Wayland (XWayland).
>
> Signed-off-by: Neena Busireddy <neena.busireddy@freescale.com>
> Signed-off-by: Tom Hochstein <tom.hochstein@freescale.com>

This should be discussed at OE-Core mailing list as it will support
XWayland and we ought to have an unified design on how to implement
it.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

