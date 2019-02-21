Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f193.google.com (mail-qt1-f193.google.com
	[209.85.160.193])
	by mail.openembedded.org (Postfix) with ESMTP id E8C766C0F6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Feb 2019 05:12:15 +0000 (UTC)
Received: by mail-qt1-f193.google.com with SMTP id y4so30132303qtc.10
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Feb 2019 21:12:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=uhEa127Rf2tWQkUaX/tbTNsBvdDBotLMdYMQVG9iYPw=;
	b=ivLQaxnThKFOkzcJlLIwipEs6e3ztBEdf/rBFEgq67etNIpyjcIpKgWbXw2xlDFB5U
	N9FFni89EkEwXfuO9oKdiJI+b311XEe1ft9zgWxMMnbs9ohuV2AaMpfkavMofEQcZLuK
	t3wUras5zvUdHyt7aDgWrVv6g66rfAsFbfLA4a4RUMtTQi4LFmdndeGRerCIrTHT7mS8
	tt8ahnfCVp9+ngnnv+/XOer9wd7zJ7fgr7+d9QM/ob5gaqpm57YifrUS2SM9d6YmUyi9
	6qanPZ3hs+lIvT8rKX+bvWCJsw/mvufdyo6M5B6uGdczcl9Co+eZWnH/IA/Xv/kH8olG
	5+Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=uhEa127Rf2tWQkUaX/tbTNsBvdDBotLMdYMQVG9iYPw=;
	b=FgOZayprbtkox8YnMxbALOhNRpQM3y4FXgVYSwKjvvkaVjG6dLy0FethzQIfPVXMz7
	QKKOiAxKxaD3QJK+A+BQUlrbJB94K0xixrDkdc2peizi50Rvn6QoWq7O3OGUxu0jfM0D
	f0prHN8MS0wIFrwr3Ll1UrEHgaho4aduDiupwAy0DJ0W53cCBGtYiNHUnLt9q+/Jl+Px
	E0qb7Fn/8EHlkS9pa65t8GopDAxIp5QtKocVTd1Ch159kg5SD/nXaSLAFbuQUUst4p3g
	U7RKdjOuPyscQhRMIVik/IutgXkuGiP/wwMnUWVJ6FurBHUprQlYIQjOhEPUNZVP5xpe
	Q19A==
X-Gm-Message-State: AHQUAuaaL0y2lWH2gEh2npR3nLkM0Ijgf1ZDYi4g3UJw1nbXg13wUvVK
	jiNihhIdp6WGpnceYHGDtpxkBYaHBk03WxahNGk=
X-Google-Smtp-Source: AHgI3IYJZiaqA1373cKmPDgGUjSjD/JzNi38tg7nra7GrxZ+0nrlFvgT9Gaak6sXISL4qmWsjGbRKcpRtWj3+A/CKkg=
X-Received: by 2002:a0c:94cf:: with SMTP id k15mr28357327qvk.55.1550725936507; 
	Wed, 20 Feb 2019 21:12:16 -0800 (PST)
MIME-Version: 1.0
References: <20190220211034.27159-1-fabio.berton@ossystems.com.br>
	<451a3c0d5250062208cb29a8e16e9c8373538ce6.camel@intel.com>
In-Reply-To: <451a3c0d5250062208cb29a8e16e9c8373538ce6.camel@intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 20 Feb 2019 21:11:50 -0800
Message-ID: <CAMKF1sqss0=crDQ0pGGA8FHXjjRYv+9tHE5i5ohZneipW6J7TA@mail.gmail.com>
To: "Mittal, Anuj" <anuj.mittal@intel.com>
Cc: "otavio@ossystems.com.br" <otavio@ossystems.com.br>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [RFC][PATCH v3] mesa: Convert recipe to use meson build system
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
X-List-Received-Date: Thu, 21 Feb 2019 05:12:16 -0000
Content-Type: text/plain; charset="UTF-8"

still seeing errors when building for rpi3-64

| checking for xrandr... no
| configure: error: Package requirements (xrandr) were not met:
|
| No package 'xrandr' found
|
| Consider adjusting the PKG_CONFIG_PATH environment variable if you
| installed software in a non-standard prefix.


On Wed, Feb 20, 2019 at 4:41 PM Mittal, Anuj <anuj.mittal@intel.com> wrote:
>
> On Wed, 2019-02-20 at 18:10 -0300, Fabio Berton wrote:
> > +PACKAGECONFIG[xvmc] = "-gallium-xvmc=true,-Dgallium-
> > xvmc=false,libxvmc"
>
> This is missing a '-D' ... Was a problem with my original patch as
> well.
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

