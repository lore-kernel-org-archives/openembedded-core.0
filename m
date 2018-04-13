Return-Path: <ross.burton@intel.com>
Received: from mail-oi0-f46.google.com (mail-oi0-f46.google.com
	[209.85.218.46])
	by mail.openembedded.org (Postfix) with ESMTP id 6D6C97462E
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Apr 2018 16:18:46 +0000 (UTC)
Received: by mail-oi0-f46.google.com with SMTP id f63-v6so8858736oic.4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Apr 2018 09:18:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=xqIQbCi/Ii033i5/iU7mNU0cRbWxMcEEywTVt8WeVuI=;
	b=CV4OzWuII4TzI7Xd2d4AnWqVLfqO2Hn2P2geL/qxbQnkD/XIxG1Y9l2yIVpkCGrXKw
	G6phORmePbLJVZinPDc5VgDbZMx8ogTWqREuUNLEESaSGqbvaD5lJRsf6swPVYYs6uIe
	28cQuH+vXqMgdwBVYl0jeECgZYmmS4djlDdSnEUa0SP/rhMjNypjhT6U8HCpuk3jaNOS
	CsxhjwFfs8NH0FYq/q/z2PBmd6pSwvTi7POI1QH3ylQisie5yx6Ox7ixyxxNLkjfy/12
	DgQtRTqKsbZXQYPMYk9CnNQC+EXK8fQG1tJozRSYk5/XnkwL0GEWPcOHjL51sn0xBKBt
	j4WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=xqIQbCi/Ii033i5/iU7mNU0cRbWxMcEEywTVt8WeVuI=;
	b=n/y8sQb78rB0V1m6v+eMv35Ob5gFvtOxIVTSL1JwRalSlWwrJktLTPy2jje34syNLZ
	9P/yikHnuweH3Hn0DNE3L1kGBWP2dVIO2tUwgs3JpBz6gCNGWvbuJ8MddivS/uSEouT5
	CbdWfMdtkuNzqq7Ap7uH4RcMzHWC+GRQFs/Iz3rhov9zUnEnhXXqRvuMNTXhXzNdgGZ/
	b41Zcj2fAVhH7v+9VXtozD+iUDsdlrwrNQyzickTAHXaiecZ7u+7SajZ4o8iBiyUPj+i
	4D+mEj7RjelU3XqmdG4l9dP6yQDjIGSBSEUT4t2/kmk+4pEQWrveNUR+UwZHxXDUYqoi
	lYBg==
X-Gm-Message-State: ALQs6tAxoIL83rU27aaKHTd0U+tHk5+JRTHoQQ0qUx5nBAaGcHOXnygE
	EZJkUvJLcTSrAw+wTYjKKmD1/70enfw2j83xB+oIAg==
X-Google-Smtp-Source: AIpwx4+RyVQitGm0idx/n+Fd0Ac66nzFdnxSy2UoUSc6k7ILvFaqsRHr2KTHgw55WheMv1OGbxuNAkLRjiCDQY+wYcw=
X-Received: by 2002:aca:698c:: with SMTP id
	e134-v6mr9417817oic.18.1523636327810; 
	Fri, 13 Apr 2018 09:18:47 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.138.17.198 with HTTP; Fri, 13 Apr 2018 09:18:27 -0700 (PDT)
In-Reply-To: <20180413160945.9944-1-raj.khem@gmail.com>
References: <20180413160945.9944-1-raj.khem@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 13 Apr 2018 17:18:27 +0100
Message-ID: <CAJTo0LaRbkg4Xs9HZPZtaU1w0Qr8_DeBFfwjvpXFahBWumu33g@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] musl: Upgrade to latest
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
X-List-Received-Date: Fri, 13 Apr 2018 16:18:47 -0000
Content-Type: text/plain; charset="UTF-8"

Is this a freeze break request for Sumo or an early submission for master?

Ross

On 13 April 2018 at 17:09, Khem Raj <raj.khem@gmail.com> wrote:
> Changes are here
>
> https://git.musl-libc.org/cgit/musl/log/?qt=range&q=55df09bfccbfe21fc9dd7d8f94550c0ff25ace04..ae2a01da2e388535da243b3d974aef74a3c06ae0
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta/recipes-core/musl/musl_git.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-core/musl/musl_git.bb b/meta/recipes-core/musl/musl_git.bb
> index 9f8c5126e8..42ba411f17 100644
> --- a/meta/recipes-core/musl/musl_git.bb
> +++ b/meta/recipes-core/musl/musl_git.bb
> @@ -3,7 +3,7 @@
>
>  require musl.inc
>
> -SRCREV = "55df09bfccbfe21fc9dd7d8f94550c0ff25ace04"
> +SRCREV = "ae2a01da2e388535da243b3d974aef74a3c06ae0"
>
>  PV = "1.1.19+git${SRCPV}"
>
> --
> 2.17.0
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

