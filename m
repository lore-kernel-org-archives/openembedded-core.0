Return-Path: <alex.kanavin@gmail.com>
Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com
	[209.85.210.48])
	by mail.openembedded.org (Postfix) with ESMTP id EEF3D7D723
	for <openembedded-core@lists.openembedded.org>;
	Tue,  7 May 2019 13:54:48 +0000 (UTC)
Received: by mail-ot1-f48.google.com with SMTP id c3so257792otr.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 07 May 2019 06:54:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=dRBlYhUafgfmF6nJOA8+QTeycBkb15PwvU3w9qYisco=;
	b=PPpcJdUCYRahl7yqQg+3FyYnN1svwcjbP4C1/rxjIcur4I+fcXrHS7zSv6+LRIm5rp
	RnztM/2CFajAhYDtS41fLJWEfo5bqUK6tQyHz9sREpDO/8kzdrYchbYGoL6AZIx8w2Uo
	xjKMK/zI9tidONixegdY5HS+b433gX3u8UEUwwAH7SVr4Qxo7QFLKF//J8fyvfvl8sBl
	B6n2ISMpMDhYmgdY1rxEaHYtt/+PIbdInsQDi33Tb8/KAaKEuldPD5Ch/A1dOaW83eIV
	dLaQ9v3894YWi2/ytmkA/ZzhQYYRcwBdZV/Lm0OWq9AZMa9E6RhX8gmVWcfq2f09tpgo
	BClg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=dRBlYhUafgfmF6nJOA8+QTeycBkb15PwvU3w9qYisco=;
	b=dksHl64gFFSWDf+CaGLU3rnqMoizkCJ8t2hsQ8x5yVi6E91DVChV3mctIHeXt5u1FO
	G0x7KTzJA61JynaRao1fs4FeMstdToIGGpc6TY8fwLgpW8pMKBDsIwxjlAbGAG9CqyUb
	Et7V/897QBtYgB9XpeJAIcr6DWUNVcyUms1l3+rI+zs/MKXb5EN00Y0b29hCLPhZoy+q
	wwFCTcAfA0AZ7usoyHtOVYLKxSMQPSMbV0mzYKm3eXe0IFrRt40wez04/xqcDqRSAXzn
	hCGt2mSk1OKBXLzrTCAYNAEe+9gIcb+lHGboiDXE1bYiWtTMY+hkaLFDhcjQ7pBnQwkI
	1OaA==
X-Gm-Message-State: APjAAAUQNTNH6ULusVfmCHAD59MYQhqH2QyOz2pepcwRvaMr/OL8B1tB
	ANdnERo+ma3AlCNENQf6lxnbZGWprhMD0lgpfHRtPvuz
X-Google-Smtp-Source: APXvYqwGs7AjoRJVBll3hy6aLGk9B+i0GKAjbse2tWBI4ypCuClgRyN0ODKaGMVWhanxU1c7X83xnzAm981FejxNHc4=
X-Received: by 2002:a9d:6209:: with SMTP id g9mr1309183otj.153.1557237289874; 
	Tue, 07 May 2019 06:54:49 -0700 (PDT)
MIME-Version: 1.0
References: <20190507131151.31070-8-bunk@stusta.de>
In-Reply-To: <20190507131151.31070-8-bunk@stusta.de>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 7 May 2019 15:54:38 +0200
Message-ID: <CANNYZj92pV-EiG8Af2cvhtNUScBBR8-wE96kzRJFQzYKMhrPgg@mail.gmail.com>
To: Adrian Bunk <bunk@stusta.de>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] sysstat: inherit upstream-version-is-even
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
X-List-Received-Date: Tue, 07 May 2019 13:54:50 -0000
Content-Type: text/plain; charset="UTF-8"

You need to remove UPSTREAM_CHECK_REGEX from the recipe at the same time.

Alex

On Tue, 7 May 2019 at 15:12, Adrian Bunk <bunk@stusta.de> wrote:
>
> Currently a development version is being used.
>
> Signed-off-by: Adrian Bunk <bunk@stusta.de>
> ---
>  meta/recipes-extended/sysstat/sysstat.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-extended/sysstat/sysstat.inc b/meta/recipes-extended/sysstat/sysstat.inc
> index 0bc7e14d36..e7ddc02b71 100644
> --- a/meta/recipes-extended/sysstat/sysstat.inc
> +++ b/meta/recipes-extended/sysstat/sysstat.inc
> @@ -15,7 +15,7 @@ UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)\.tar"
>  DEPENDS += "base-passwd"
>
>  # autotools-brokensep as this package doesn't use automake
> -inherit autotools-brokensep gettext systemd
> +inherit autotools-brokensep gettext systemd upstream-version-is-even
>
>  PACKAGECONFIG ??= ""
>  PACKAGECONFIG[lm-sensors] = "--enable-sensors,--disable-sensors,lmsensors,lmsensors-libsensors"
> --
> 2.17.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

