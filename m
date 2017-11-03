Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-ot0-f174.google.com (mail-ot0-f174.google.com
	[74.125.82.174])
	by mail.openembedded.org (Postfix) with ESMTP id 3A3B06AC00
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 Nov 2017 20:29:22 +0000 (UTC)
Received: by mail-ot0-f174.google.com with SMTP id q99so3690231ota.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 03 Nov 2017 13:29:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc; bh=o/7AtwQ3lV5beAZdene2FOMqZgjshNqvHJe7LzkYFmE=;
	b=sLBO4KJGvEdvuoG88rVnMEShHovbcImv+Hs9Av3nmIT0Q2QbOho6dLqoRKmxEfiuRu
	uKgWmWrf1TVd0GSYQiTTQLS9ntQNCYvNqpv1SbFxGmWRXLI7UpYQVvE9arS/bc0fkCRO
	nDH0mK5DE0fR3gB/2P/wUIKB8QJ5hiy1e+qVNarwTi9Rgyzi9lkn2mfxJsjEakHkYANc
	jmbv9C/CszwU+y2PPiyhjaqu8IMnn6eNKuPbzB3DjUlxUhYPr2C4GGhVhwxvECyNNo//
	l26qhdQq3OGZLwpU+7Mi/+qdQWGrsWqrc9wp55sMmm9qqUc/Q2RIthCsxqQO9MBaHVir
	lq7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc;
	bh=o/7AtwQ3lV5beAZdene2FOMqZgjshNqvHJe7LzkYFmE=;
	b=sqJV7b4KiTqJA1ZIklyR7BdVZFtcmJmNZOeRLQJ/hLafghZ8vfmuwnM4UjJW0jqRSK
	+d4ic1Nv18B/HDT2OJAYp1hrgVYCsnmA5hh0D/QvDFxJprMEzjvrCMmtaWoCRlMbRC4n
	jg/YUkFAtrSgEL1e7YHmz6wQWGxRrE4Ag62nEiwwfVujr35GApxqD4cka+WTgZnKVIVB
	KQe+eFTVm/VoNUWm9YJajwoF3jqnHt8QMKNGmH+crS/QDlnh4GOisSUaYpqgfEx3MewI
	GWYMo6+Tjqoeniz/nf6fid5jU8ngz6WAM0ElqR9FpZtLyQpH+Z+roWmcYdAFhSb3BO3w
	vOFw==
X-Gm-Message-State: AJaThX7u4U/X2XcdrX6VTDEPsFZx4SUR6eQtG/IzAYEhowgDSZpbaQkc
	BrdEjXUvBdkG5Ow8OIT3Fc1rOQtv
X-Google-Smtp-Source: ABhQp+TfHIpUiw2o+8tJUJ9PvAYkIEvyPPs2CAumdVS2MXoqGfbTM+OPJnpTZdlnCd8LI38LhB1zww==
X-Received: by 10.157.89.232 with SMTP id u40mr4954231otg.270.1509740963799;
	Fri, 03 Nov 2017 13:29:23 -0700 (PDT)
Received: from mail-oi0-f46.google.com (mail-oi0-f46.google.com.
	[209.85.218.46]) by smtp.gmail.com with ESMTPSA id
	188sm2888262oib.47.2017.11.03.13.29.22
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 03 Nov 2017 13:29:22 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-oi0-f46.google.com with SMTP id h6so3047649oia.10
	for <openembedded-core@lists.openembedded.org>;
	Fri, 03 Nov 2017 13:29:22 -0700 (PDT)
X-Received: by 10.202.81.10 with SMTP id f10mr4558987oib.93.1509740962310;
	Fri, 03 Nov 2017 13:29:22 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.157.56.216 with HTTP; Fri, 3 Nov 2017 13:29:21 -0700 (PDT)
In-Reply-To: <1509740585-20536-1-git-send-email-matt@madison.systems>
References: <1509740585-20536-1-git-send-email-matt@madison.systems>
Date: Fri, 3 Nov 2017 18:29:21 -0200
X-Gmail-Original-Message-ID: <CAP9ODKoHQ674TEyZgX=+efG5yY9Zv2FpfZC+9U45gCgyyhOKZA@mail.gmail.com>
Message-ID: <CAP9ODKoHQ674TEyZgX=+efG5yY9Zv2FpfZC+9U45gCgyyhOKZA@mail.gmail.com>
To: Matt Madison <matt@madison.systems>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] go: update to go1.9.2
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
X-List-Received-Date: Fri, 03 Nov 2017 20:29:23 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Nov 3, 2017 at 6:23 PM, Matt Madison <matt@madison.systems> wrote:
> Update to the go1.9.2 minor release, which includes
> fixes to the compiler and runtime.
>
> Signed-off-by: Matt Madison <matt@madison.systems>

Acked-by: Otavio Salvador <otavio@ossystems.com.br>


-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

