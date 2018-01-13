Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-oi0-f66.google.com (mail-oi0-f66.google.com
	[209.85.218.66])
	by mail.openembedded.org (Postfix) with ESMTP id 5D5B171A0F
	for <openembedded-core@lists.openembedded.org>;
	Sat, 13 Jan 2018 11:48:44 +0000 (UTC)
Received: by mail-oi0-f66.google.com with SMTP id t16so5565019oif.10
	for <openembedded-core@lists.openembedded.org>;
	Sat, 13 Jan 2018 03:48:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc; bh=6SlN8J/aWQGJ52+XY2wmkkrQQNmi0XQa39RR7tgvbCk=;
	b=eNZVbrQbxT33VHFfaqPrQfATsG1kuAad9uel9Au37jO6b6efnuybRGYQJjZBcV/SLo
	rfI3THksT2oXm7QlIuaaGTrrF2qOkFkgXtw7TqXW/rbx/nnDJCOvh2T8fqItc9CtnLKx
	ORaT2BW/ptplrUYkkiCrs6l7NTNVA64YCpIpQS3vfUW+n2H066Hmb+bWYz+kO3ghRcpy
	qJOjKWj7xNegUVLALTdbSTyu8dLiR/x5W6OI68BVXAHs0vTblh5q/vEbZsolNhFC+5B7
	O4pL6eYsFHPW/1CwEggcZEs54IdeVedlG5rpku+mqGpwDE4qCy7M/e/sx32l3BhkcN+x
	PMCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc;
	bh=6SlN8J/aWQGJ52+XY2wmkkrQQNmi0XQa39RR7tgvbCk=;
	b=JRsCKnP9JVJnqEocZLmpGZ0AQbaL6BxJuUqKk6B7p6JIP33ixl70jp2+4adGABF2aO
	vt0SLSABaTvW7AMLqHmRV+hk11y1fnVaZQrHrE0AX2Z5YPzbRXnUQtWFlWW6repYsTAb
	HcolrzbWOKths8IuLYWl/3NBrst+Q4cJMkj4kE4gSzusqp9E3crdRblGqCW7F+ao2C3G
	W01oYEZr98uzZabo/joghOCVigJQmRsimro7ipa0c2M/PVjKyPyeYgE/BlC0rkDpw9z7
	glowIFHsHwkX/OxKGb3CB4M/4YcGDChwN2tK+BQdLeYTVjopRmY3FQGAT1In0Tkyerlt
	R3Vg==
X-Gm-Message-State: AKGB3mLNfEmwAKvOYWg5G2ZY+SRvjnXuc8CXVkapJvyMeOArggQm19Y4
	mskwca8qnoT0CdzeV/J1t1o6xk3w
X-Google-Smtp-Source: ACJfBosuNeqzz8AjxWDbYsfd+gDI0QKso2JiRMnkLP75VujdZ3fDIw8jwum2GKqTGTUrXQEE0nRzJQ==
X-Received: by 10.202.197.140 with SMTP id v134mr11706519oif.259.1515844125897;
	Sat, 13 Jan 2018 03:48:45 -0800 (PST)
Received: from mail-ot0-f182.google.com (mail-ot0-f182.google.com.
	[74.125.82.182]) by smtp.gmail.com with ESMTPSA id
	q12sm11771804oti.48.2018.01.13.03.48.44
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 13 Jan 2018 03:48:44 -0800 (PST)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-ot0-f182.google.com with SMTP id a24so7180804otd.4
	for <openembedded-core@lists.openembedded.org>;
	Sat, 13 Jan 2018 03:48:44 -0800 (PST)
X-Received: by 10.157.40.6 with SMTP id m6mr14118322otb.55.1515844123771; Sat,
	13 Jan 2018 03:48:43 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.38.102 with HTTP; Sat, 13 Jan 2018 03:48:42 -0800 (PST)
In-Reply-To: <20180112130644.21313-1-alex.stewart@ni.com>
References: <20180112130644.21313-1-alex.stewart@ni.com>
Date: Sat, 13 Jan 2018 09:48:42 -0200
X-Gmail-Original-Message-ID: <CAP9ODKoKBNbFia_YCQB-H1J10iUoCu2ROrjCZEW7t07LWRT4cA@mail.gmail.com>
Message-ID: <CAP9ODKoKBNbFia_YCQB-H1J10iUoCu2ROrjCZEW7t07LWRT4cA@mail.gmail.com>
To: Alex Stewart <alex.stewart@ni.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] recipes-core: move hwclock.sh to util-linux
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
X-List-Received-Date: Sat, 13 Jan 2018 11:48:45 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Jan 12, 2018 at 11:06 AM, Alex Stewart <alex.stewart@ni.com> wrote:
> * Move the hwclock.sh initscript from the busybox recipe to util-linux.
>   This script is generally useful for distros that get their hwclock
>   implementation from sources other than busybox and we follow debian's
>   example by providing it in util-linux.
>
> :busybox/*
> * Remove the busybox-hwclock package, as it no longer has a purpose.
> * If busybox is configured to include hwclock, the busybox package will
>   RDEPEND on util-linux-hwclock-init.
>
> :util-linux/*
> * Provide the hwclock.sh script in util-linux-hwclock-init, which can be
>   pulled by any packages that depend on its functionality.
> * util-linux-hwclock RDEPENDS on util-linux-hwclock-init for its
>   initscript.
>
> Signed-off-by: Alex Stewart <alex.stewart@ni.com>
> Acked-by: Haris Okanovic <haris.okanovic@ni.com>
> Acked-by: Adrian Ratiu <adrian.ratiu@ni.com>
> Acked-by: Ken Sharp <ken.sharp@ni.com>
> Natinst-ReviewBoard-ID: 214983, 215755

As mentioned by Christopher, it will increase the build time for
everyone and there is real gain in this this change. If you want to
disable the busybox dependency then move hwclock.sh to a hwclock-init
package that has no standard dependencies and is allarch and make
busybox and util-linux to depends on it.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

