Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com
	[209.85.160.170])
	by mail.openembedded.org (Postfix) with ESMTP id 177616C132
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Jan 2019 16:50:27 +0000 (UTC)
Received: by mail-qt1-f170.google.com with SMTP id p17so236103qtl.5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Jan 2019 08:50:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=Zu6xAoBE1FAd+d0USKjvDnPdG/vRcJ8y4fONAffVw5Y=;
	b=Xea6lXxTf0Mv2D1ymscVtGnhs4TvaGy4XbjKHhz4kt8v8HIESdgeeSynTXkrWJwNZV
	6EJ1/sin3M3KmX8I3nh7d2SFHiiXxCxbZA9nYrp4FccqMnEhgnZX4OVUMJf6zHb4iyi8
	1PljJDNMnjuWKcnA8U0Zs+qcrAMYKC76sBOESyqXmaP6GUfxUNsApqDiELvFf3cHDaxU
	jmKhfrtezWfznJEKJJFBkRaZ9i/bLvgM7lZnvL0NDYRYFYNB3jXLVrKNdPBMIuhztu+E
	5DN7xY3K6O7Mmzbq8U39RbgmgdiEPAIPtbSULEhNvl9ZxMazOrK8XU8Jzy9ULqEv5QTf
	RUlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=Zu6xAoBE1FAd+d0USKjvDnPdG/vRcJ8y4fONAffVw5Y=;
	b=tqTDQa7bbX3AtX5WFjds+0l7FWUkaXRyasKF6QwnPoHndISTxr8D+XF/I8ZC69BtQx
	qaMN3NdXo6tJSx5gX2tL398W39M51sBIggkRw6ZVFrd8YPPDJU8vNOqR85hTj6pRuw6n
	ufHiQ1IyhC9CzbdPB5Hl0m/qPEJxS7YVuLYGqNoti7L1ZGeb33HWoeIfEj1vpd/iLD+Q
	fQuE/6CS25i22O1GLHFa2Hq2ejOEektT6xT0HKl1BxvXWkN6qeBpgyceO70PS5YnxmBI
	AuQpVj/004LFor9K/47NEmuvqQ0pD/lHUTkHM0ManCYkdhBI407EqpHQIG+qG5wrXmff
	cz0A==
X-Gm-Message-State: AJcUukdqEROHMnUmMfzAdakIpDfOjDB6KmqN1ejXkxj9PgGs2RZJYzrG
	0w+a6BNWIwMxnbYcX8r7f1oVeW1Mairx+B8LqxliyNf8
X-Google-Smtp-Source: ALg8bN4cTMUBXTaXJcxvuabDw1T70FzxAAi5XmSISYccB0nNdyYwSq1eQ2dJCGVV0RgilcuwQXxop7cI+/iVWmuns6c=
X-Received: by 2002:a0c:93e2:: with SMTP id g31mr29212274qvg.194.1548867028758;
	Wed, 30 Jan 2019 08:50:28 -0800 (PST)
MIME-Version: 1.0
References: <20190130093406.10391-1-bunk@stusta.de>
In-Reply-To: <20190130093406.10391-1-bunk@stusta.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 30 Jan 2019 08:50:02 -0800
Message-ID: <CAMKF1soqAE8aco2OAHiQgfpV_5_OccnH=piXBtVii3f6TVwXGg@mail.gmail.com>
To: Adrian Bunk <bunk@stusta.de>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] busybox: add devmem
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
X-List-Received-Date: Wed, 30 Jan 2019 16:50:28 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Jan 30, 2019 at 1:34 AM Adrian Bunk <bunk@stusta.de> wrote:
>
> This is a tiny but pretty useful tool.
>

question is, do we need this enabled in default config, or could be add it via
some DISTRO_FEATURE meant for validation etc. May be if you explain your
usecase then we might be able to make a better assessment.

> Signed-off-by: Adrian Bunk <bunk@stusta.de>
> ---
>  meta/recipes-core/busybox/busybox/defconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-core/busybox/busybox/defconfig b/meta/recipes-core/busybox/busybox/defconfig
> index d11707abc3..1519159a49 100644
> --- a/meta/recipes-core/busybox/busybox/defconfig
> +++ b/meta/recipes-core/busybox/busybox/defconfig
> @@ -791,7 +791,7 @@ CONFIG_DC=y
>  # CONFIG_DEVFSD_FG_NP is not set
>  # CONFIG_DEVFSD_VERBOSE is not set
>  # CONFIG_FEATURE_DEVFS is not set
> -# CONFIG_DEVMEM is not set
> +CONFIG_DEVMEM=y
>  # CONFIG_EJECT is not set
>  # CONFIG_FEATURE_EJECT_SCSI is not set
>  # CONFIG_FBSPLASH is not set
> --
> 2.11.0
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

