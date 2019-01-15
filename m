Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	by mail.openembedded.org (Postfix) with ESMTP id A9C096C444
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Jan 2019 14:21:01 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id a62so3454922wmh.4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Jan 2019 06:21:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=JduKS05V18SLUatW9+a4/QuFosnIDqkzCzov/Thf1qw=;
	b=BfX25DXpY4+ncbaZznJlSYBrozu10M3CQvwNNNleON+deKrBNjaN6m7zHrsvLl8Rde
	X3SGhRySI+XNsD0c0lu3p8hhizIj3NCMNat9j6HQJ8v32GlxACi6WoaDIw7JTFD9gCPt
	cr9o7RFPp2P7ICdSI0pg7I+B71AEOaulwGDC8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=JduKS05V18SLUatW9+a4/QuFosnIDqkzCzov/Thf1qw=;
	b=Dg5E/mlfkfavQIoWkWFNtuZ8FaOrc35X7HY6NzCxlKHWtrGqt1dWPuin8TycbEcEsO
	THteiIXaHxMoWWtZot3eogGQGY7AsyIv7ynHuB0wkIQAcUNZd+Hxv0xuCnZ1WSRlljuJ
	LhcuUXam9HR6aQB7Db5fTBeeB6rDJQpSu2xKXR4JYcHVC1rxnFmw0IelHKdxwVgvA+7o
	Sf3RTajVyrnLctQFgRRbXiA84GqSsxc35mRosFt43fB+5cjCUhuBZb/0zA+y274//+3u
	LbOCmcjtvFwJBNwWMNh9Mu9g04XlXHzMshrT/aulxx+lJ0ZeSVfjjTe5o5aSE+JrBjRg
	DpWA==
X-Gm-Message-State: AJcUukcQkco+1ubp6XzipGlvgCQd2iX+f8iUexTD7wQvO6E42/UMrjfs
	6IFsZ4ScTaJHmII3FqzVctRWyA==
X-Google-Smtp-Source: ALg8bN6pfcF5z6wOtaQNQYRiH+NUXto+2RDW6kuXnTIXVSo9UytI5VRCYv8FTWAwRPoraOHeuxsiLA==
X-Received: by 2002:a1c:35ca:: with SMTP id c193mr3501338wma.146.1547562062211;
	Tue, 15 Jan 2019 06:21:02 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	60sm107406879wrb.81.2019.01.15.06.21.00
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 15 Jan 2019 06:21:01 -0800 (PST)
Message-ID: <14ddb1b07908b79de700fa528fc608e493fa8dae.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>, 
	openembedded-core@lists.openembedded.org
Date: Tue, 15 Jan 2019 14:20:59 +0000
In-Reply-To: <7cff741d1306283af05fa88c00ed7f2a084af318.1547477793.git.alex.kanavin@gmail.com>
References: <cover.1547477793.git.alex.kanavin@gmail.com>
	<7cff741d1306283af05fa88c00ed7f2a084af318.1547477793.git.alex.kanavin@gmail.com>
User-Agent: Evolution 3.30.4-1 
Mime-Version: 1.0
Subject: Re: [PATCH 17/23] qemu: add a gettext-native dependency
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
X-List-Received-Date: Tue, 15 Jan 2019 14:21:02 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2019-01-14 at 16:03 +0100, Alexander Kanavin wrote:
> xgettext/msgmerge is used during do_install().
> 
> Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> ---
>  meta/recipes-devtools/qemu/qemu.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-
> devtools/qemu/qemu.inc
> index db9c2245df9..6937bbc87b4 100644
> --- a/meta/recipes-devtools/qemu/qemu.inc
> +++ b/meta/recipes-devtools/qemu/qemu.inc
> @@ -1,7 +1,7 @@
>  SUMMARY = "Fast open source processor emulator"
>  HOMEPAGE = "http://qemu.org"
>  LICENSE = "GPLv2 & LGPLv2.1"
> -DEPENDS = "glib-2.0 zlib pixman"
> +DEPENDS = "glib-2.0 zlib pixman gettext-native"
>  RDEPENDS_${PN}_class-target += "bash"

gettext is a heavy enough dependency I'm tempted to suggest we do:

do_install[depends] += "gettext-native:do_populate_sysroot"

given how slow qemu is to compile...

Cheers,

Richard


