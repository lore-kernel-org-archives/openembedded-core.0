Return-Path: <raj.khem@gmail.com>
Received: from mail-pl0-f66.google.com (mail-pl0-f66.google.com
	[209.85.160.66])
	by mail.openembedded.org (Postfix) with ESMTP id D45BA74B02
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 May 2018 18:52:30 +0000 (UTC)
Received: by mail-pl0-f66.google.com with SMTP id t22-v6so2754941plo.7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 08 May 2018 11:52:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=5unu4K7WW7fCAvZzctMY9I+bxlCM9Z2iLw2FrPWArrw=;
	b=M5WQwcdXXZShXWmqzGczsNogU2i7EGUx35krHdCoVKQp7wFaSrER789/7jMydNaZJD
	0uF3Q0YbBg7wnEyuCxXm8cL+0DfZsKpxZkpyEAIscDvfy0zr0Fwzk2hdLdq8UpSOZvdC
	3frvUqnyesma3eYOMtlDLNfB7suRcvhuS8vOTydUN6tRWMhu8M33gHODexJVbJr2FdaJ
	E+JTSEea9MFWL8XCTaGzwv5iGwSM2oSMby1qPVt7XWuMEqkxtOkOK6193xm4qTCjA6+p
	BzjrwvxImOMjpPo6Ds8vJDXOfsKoeacyVN0KSfEgO+Z+nH4BR+NSGdc3auhXge5G1+XN
	nDEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=5unu4K7WW7fCAvZzctMY9I+bxlCM9Z2iLw2FrPWArrw=;
	b=dHvnYa9h+YVo7XBohx0AbyLkWWWhLvdjKE8idLCd40JebcPJU1YobaN46HPsjhw2lR
	E0DZWs+VWNghnDpSOzcNYCTIOfCRZB71hUuPsKFheO8z+N0obOafTtVnpb2VJ3m5zX9D
	yKPC1fAXzHmQWC2rqpG+NBEOiPQcyPk/ycgOg/BG5s0THNkp4nMAtg/KtqtN8DTai7Z6
	nr0+WKwFtsT07odn7RV5KLFMKzFTR429umpjwB0a4/NUtdyRrY3pZaDco+4QBM1Ex3La
	oNXG9VqZtCdjTvJna/KdTVabTDdtRN0Xq1ztRQ/K6MOsdnq9h8NqsWSaMbg+lcjEzFby
	Rxbw==
X-Gm-Message-State: ALQs6tDZ91q77wGOcorRupP7iiWp3gi+dhDWQ1Di8aakqsgLRYkagPkK
	1/7VDp32ISfAqUPLFXyOVwkt2Oqqcv4iUjOF7CA=
X-Google-Smtp-Source: AB8JxZo+UX8Gqmd9l1SrB5wFo/oIsoFPQLmKCgpGT4gDxsfNH3qxTFdKCQRr10gTE+6wXMxeXDyvdv5hkFSt/oM86eA=
X-Received: by 2002:a17:902:b78a:: with SMTP id
	e10-v6mr26779309pls.260.1525805551407; 
	Tue, 08 May 2018 11:52:31 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.236.187.132 with HTTP; Tue, 8 May 2018 11:52:00 -0700 (PDT)
In-Reply-To: <20180508184903.13506-3-mkelly@xevo.com>
References: <20180508184903.13506-1-mkelly@xevo.com>
	<20180508184903.13506-3-mkelly@xevo.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 8 May 2018 11:52:00 -0700
Message-ID: <CAMKF1spzSX3mw9pHZvoECYXqWnW-LaL4U+txQ6LGGuMVZvf-bA@mail.gmail.com>
To: Martin Kelly <mkelly@xevo.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH 3/3] modemmanager: fix mbim disable string
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
X-List-Received-Date: Tue, 08 May 2018 18:52:30 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, May 8, 2018 at 11:49 AM, Martin Kelly <mkelly@xevo.com> wrote:
> The current string used to disable mbim is "--enable-mbim=no", which is
> producing a warning. It should be "--with-mdim=no", so change it.
>

LGTM yes it was a typo thanks for posting a fix.

> Signed-off-by: Martin Kelly <mkelly@xevo.com>
> ---
>  meta-oe/recipes-connectivity/modemmanager/modemmanager_1.7.991.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta-oe/recipes-connectivity/modemmanager/modemmanager_1.7.991.bb b/meta-oe/recipes-connectivity/modemmanager/modemmanager_1.7.991.bb
> index 4f9400169..b1a718dbf 100644
> --- a/meta-oe/recipes-connectivity/modemmanager/modemmanager_1.7.991.bb
> +++ b/meta-oe/recipes-connectivity/modemmanager/modemmanager_1.7.991.bb
> @@ -25,7 +25,7 @@ PACKAGECONFIG ??= "mbim qmi polkit \
>  PACKAGECONFIG[systemd] = "--with-systemdsystemunitdir=${systemd_unitdir}/system/,,"
>  PACKAGECONFIG[polkit] = "--with-polkit=yes,--with-polkit=no,polkit"
>  # Support WWAN modems and devices which speak the Mobile Interface Broadband Model (MBIM) protocol.
> -PACKAGECONFIG[mbim] = "--with-mbim,--enable-mbim=no,libmbim"
> +PACKAGECONFIG[mbim] = "--with-mbim,--with-mbim=no,libmbim"
>  # Support WWAN modems and devices which speak the Qualcomm MSM Interface (QMI) protocol.
>  PACKAGECONFIG[qmi] = "--with-qmi,--without-qmi,libqmi"
>
> --
> 2.11.0
>

