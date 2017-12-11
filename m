Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-oi0-f43.google.com (mail-oi0-f43.google.com
	[209.85.218.43])
	by mail.openembedded.org (Postfix) with ESMTP id 75D0178688
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Dec 2017 00:53:45 +0000 (UTC)
Received: by mail-oi0-f43.google.com with SMTP id w131so10583104oiw.0
	for <openembedded-core@lists.openembedded.org>;
	Sun, 10 Dec 2017 16:53:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc; bh=f+Ajds8jv3Hm/JK4FsvnB/FgmSfMzfgNWzOt7+4Yu7o=;
	b=s+JFkzyiksK0Dq/atEZJ2E6VBqFJ/qxOIs+jDJuuXvt5nQ+OTQCXLO4NtgUR8qRWX1
	zhHbwaIlSd/jt/QsXkQnH3DYlWdqa4kadAM35adVG0X4VsOqfis7dKEPqJNCa83nNobQ
	6ifxs6dGwcRrKHl4xO6gu7+qBrrH/h3AW3J2yrO44gIW/2hjtZmVF8Sn/QzFzs9TZvL+
	FxtkIpK10+DFf+wbPw62/lUawK9Wut/XeYK9Xf15LJ5UEFqfoDy2BVK9Va9isLdeN6cZ
	dWUYxz/c6TGcs3Hv4F5yJnrjhsyJHdeJJXUE7MEX9oXCUiz02dlQ4zN56DSsXOB9g9PP
	OPDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc;
	bh=f+Ajds8jv3Hm/JK4FsvnB/FgmSfMzfgNWzOt7+4Yu7o=;
	b=gVVN5WblvPInf78WAWTCxLO5QDemn8FCQvj2Taua7SNcSZAh0N/EM9JkK+OBmhI7g+
	cAgs12ZWSm4m0dLXWTkcgHB6Cdp1egU5f251a+b36NFwk1Hrtv4Bia3briLYxQhwAL0Y
	WMZ+bF6A6VSh3UYPRW2sCsAeIw8ny/JEshE3afcp/ERXKmIeQwo0ZQs0Jj6CWQDH9Kkw
	0MfgIH7JEboaCft5SicHUEvDNkKpQI1p7qK8U0+cCXIgwWefLFVbTgShO2CqOG4G9w2B
	Kx1e9xc312w+PKMWi8KVMxxDqa6QP1x64t+10BlvlvzVI6lPk1oz3GU8bXYH/vzGSK6r
	4hUQ==
X-Gm-Message-State: AJaThX6NSKWruhZoM1Eg76E1AeKbcrS5kJhmVIH2MZOlGemKFnLev2NO
	Ex28jrjTi/5tBaUX8eJu0NVUMb7p
X-Google-Smtp-Source: AGs4zMaRAahnrOu+v9L9+KgSnxqH54guRm/f3zLFiBVZcELw2XnZSMpDpwMYmesFLHCb4rDmB8fIBQ==
X-Received: by 10.202.64.65 with SMTP id n62mr31425789oia.110.1512953626090;
	Sun, 10 Dec 2017 16:53:46 -0800 (PST)
Received: from mail-oi0-f47.google.com (mail-oi0-f47.google.com.
	[209.85.218.47]) by smtp.gmail.com with ESMTPSA id
	u65sm5706203oia.46.2017.12.10.16.53.44
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 10 Dec 2017 16:53:45 -0800 (PST)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-oi0-f47.google.com with SMTP id w131so10583076oiw.0
	for <openembedded-core@lists.openembedded.org>;
	Sun, 10 Dec 2017 16:53:44 -0800 (PST)
X-Received: by 10.202.215.85 with SMTP id o82mr28178904oig.166.1512953624324; 
	Sun, 10 Dec 2017 16:53:44 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.17.210 with HTTP; Sun, 10 Dec 2017 16:53:43 -0800 (PST)
In-Reply-To: <20171209024546.16918-2-kexin.hao@windriver.com>
References: <20171209024546.16918-1-kexin.hao@windriver.com>
	<20171209024546.16918-2-kexin.hao@windriver.com>
Date: Sun, 10 Dec 2017 22:53:43 -0200
X-Gmail-Original-Message-ID: <CAP9ODKqdYcwwz0U2FG_LQ7cX2JpsX3bQ5q-Mnn2-x7b7xfDaqg@mail.gmail.com>
Message-ID: <CAP9ODKqdYcwwz0U2FG_LQ7cX2JpsX3bQ5q-Mnn2-x7b7xfDaqg@mail.gmail.com>
To: Kevin Hao <kexin.hao@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] wic: plugins: rawcopy: Add support to download the raw image from a http server
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
X-List-Received-Date: Mon, 11 Dec 2017 00:53:45 -0000
Content-Type: text/plain; charset="UTF-8"

On Sat, Dec 9, 2017 at 12:45 AM, Kevin Hao <kexin.hao@windriver.com> wrote:
> Some firmwares are critical for the basic functions of the board, and may
> be used by the bootloader. Due to the license issue, we can't integrate
> it. But we do need it when creating a booting image by using WIC.
> So add the support for the WIC to download a raw file from http
> server and write it to a specific part. In order to restrict the
> downloading behaviour, we introduce a "WKS_ALLOW_DOWNLOAD" variable and
> only do the downloading when this variable is set.
>
> Signed-off-by: Kevin Hao <kexin.hao@windriver.com>

This does not make much sense.

It does not allow to be downloaded? so build system can download it
and use it as a normal artifact. Adding another source way seems
controversial.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

