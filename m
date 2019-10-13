Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	by mail.openembedded.org (Postfix) with ESMTP id DC1867C124
	for <openembedded-core@lists.openembedded.org>;
	Sun, 13 Oct 2019 09:06:38 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id r19so14209330wmh.2
	for <openembedded-core@lists.openembedded.org>;
	Sun, 13 Oct 2019 02:06:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=4ndIsy60she4XyPIYldD964FgB1DHaLFer8ozrSfIXU=;
	b=KYCcoyh+3X8xl73g9/bbB8OhIBSuCk5cOrlJ4KNiFkEQRaeiPDlS0qx2zwEab8GsYx
	O2A2yaXRa8ZDMO3XOxLu9AoD4AJOJ3cBYTWyKZ233sSGJixM10YnOGgho9M7JnVtdnQ2
	AIEnjTDA4CdJS+5G52jUa19xq4t59bHvzHa4U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=4ndIsy60she4XyPIYldD964FgB1DHaLFer8ozrSfIXU=;
	b=diHUH+7TUslm2KB3DaHeEvKwqQy976bM+nizrBqvNnYyrw+otRblBbUfnC6itP06cd
	Qa/mLCVwCpQB4sbhB4LaekVTCtYSjZ0MSW9IeOW/HGk4U+UQimzwJwINpWrBOcUY28zm
	S79yxYJZjpEv0N3dYjaWIPOUwlR+ftoTqzadiQ/tr1jQ1tjidq6mkENb9e1kYRXug878
	j8oO43aJN+ykalIq/p2Wi3KnN9YUr8OdK4MCpcji+t9p9m675n+5AAB9myD+Q39vtwhn
	/mTj67P6GSyoCC6J1WCZPQge73I0TS38ID9aK2+i6NLDvZ46JQvzZvHmsiDByRpWL0Hr
	6DYQ==
X-Gm-Message-State: APjAAAUCX1djndPvBcd0sQzHg82KOK009PBSYy6r15+TELLVwzQCXl0E
	kz/32G857YsW5hP/53+oGTPMtQ==
X-Google-Smtp-Source: APXvYqxvyjsZt8bG0V8P6DNsPRhGRamMDr2bYlRP8SPSxTNCYYgyVvRYFrsB+FHMna/+YO0/5gB5SQ==
X-Received: by 2002:a7b:cb8a:: with SMTP id m10mr9875986wmi.132.1570957599290; 
	Sun, 13 Oct 2019 02:06:39 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	a204sm26007273wmh.21.2019.10.13.02.06.38
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 13 Oct 2019 02:06:38 -0700 (PDT)
Message-ID: <af47b666080c2808a32834efe1b14a88938b134c.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alistair Francis <alistair.francis@wdc.com>, 
	openembedded-core@lists.openembedded.org
Date: Sun, 13 Oct 2019 10:06:37 +0100
In-Reply-To: <20191008214551.32751-1-alistair.francis@wdc.com>
References: <20191008214551.32751-1-alistair.francis@wdc.com>
User-Agent: Evolution 3.34.1-2 
MIME-Version: 1.0
Subject: Re: [PATCH 1/2] u-boot: Bump from 2019.07 to 2019.10
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
X-List-Received-Date: Sun, 13 Oct 2019 09:06:39 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2019-10-08 at 14:45 -0700, Alistair Francis wrote:
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  .../u-boot/files/0001-CVE-2019-13103.patch    | 69 ---------------
> ----
>  .../u-boot/files/0002-CVE-2019-13104.patch    | 49 -------------
>  .../u-boot/files/0003-CVE-2019-13105.patch    | 37 ----------
>  .../u-boot/files/0004-CVE-2019-13106.patch    | 56 ---------------
>  .../0005-CVE-2019-14192-14193-14199.patch     | 43 ------------
>  ...-14197-14200-14201-14202-14203-14204.patch | 44 ------------
>  .../files/0007-CVE-2019-14194-14198.patch     | 42 -----------
>  .../u-boot/files/0008-CVE-2019-14195.patch    | 42 -----------
>  .../u-boot/files/0009-CVE-2019-14196.patch    | 48 -------------
>  meta/recipes-bsp/u-boot/u-boot-common.inc     | 13 +---
>  ..._2019.07.bb => u-boot-fw-utils_2019.10.bb} |  0
>  ...ols_2019.07.bb => u-boot-tools_2019.10.bb} |  0
>  .../{u-boot_2019.07.bb => u-boot_2019.10.bb}  |  0

I suspect this breaks on musl:

https://autobuilder.yoctoproject.org/typhoon/#/builders/64/builds/1135
https://autobuilder.yoctoproject.org/typhoon/#/builders/45/builds/1137

Cheers,

Richard


