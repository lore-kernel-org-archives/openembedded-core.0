Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-ot0-f172.google.com (mail-ot0-f172.google.com
	[74.125.82.172])
	by mail.openembedded.org (Postfix) with ESMTP id CA92578741
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Jan 2018 00:13:54 +0000 (UTC)
Received: by mail-ot0-f172.google.com with SMTP id x4so2853516otg.7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Jan 2018 16:13:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc; bh=tgothqvIIxq3CreLDT2eMLRxjnvShU3pcSzfZE1uft8=;
	b=fF15fRsiQG8IIaXjOI8ye9JztMlgHPMt3OvTSgaCKOVz4Hi26etbNcmetyHEpLS/Dn
	M3bU0Lu49HX/6t8WRCTmS+CCw30AMOE0jQUifZ9TQJc6pkRBqcp4m0C9cBCX/l/XCEZK
	5Ho2ruhV5X25Vw76KdGUv0zZTVtUvgaSf+Bgm7UpY20mxocPdUIVO2yAIcm7CrsLT2eQ
	5qtSGptLV6LIm2EK+tOb546UvGab5EDdncLz5fa27yC+cV2AR99n3FAKhEXycBgeQQaA
	nJ+iSUyqO3NDZRLtBmkuXdsJwOgkYCNLfrEro69r14tHHOAMOw4dzwSM7MltVRL4rX46
	FAcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc;
	bh=tgothqvIIxq3CreLDT2eMLRxjnvShU3pcSzfZE1uft8=;
	b=Jm1QyYKDUQrbYxVgYSCmjJuvlYSz+w13KJNMDAakpOm7UbIcBcCJmGtRgdBdYc0h+C
	xvXDCCKPuMCmB4/ae++mahQm88fcsRr2iXAxOrtkE5EmJL4mHvDKOfhuopBewR7excHY
	5zA2rnqbTn6Wv3GcoEp8/YTnznalgJX4aERlNfFf1BEhOTNLGxgb7C9316NrWUh52RAQ
	BNSRIc389KRjqFIL1wqv5ObJD/mzp5nemjTsyfrAnva9kjjpELdv79MlmNc2QiqyzjQ8
	qfedLaDKRy62G6PUkJcBjpxUK6hWDMqB4oQwrkqH/ZcdRL7mdMlNDtqIPBpM3QyVQGl3
	wXrQ==
X-Gm-Message-State: AKwxytcmiFl/V3ulfXvtHRIJduQ0pcdmpiy2DVEW0AZ8g63Qgua4gq5B
	bZeLAogFEXgeraqJ9waSGCDDpqg5
X-Google-Smtp-Source: ACJfBos/lETcCYlKdAJPHBC1+o9yK4puv8IcJGlP5OVbNQhnt7DgKLcS2fxwEtHxhrnPxvoo9C5pVg==
X-Received: by 10.157.33.60 with SMTP id i57mr2189573otb.324.1516234435444;
	Wed, 17 Jan 2018 16:13:55 -0800 (PST)
Received: from mail-oi0-f45.google.com (mail-oi0-f45.google.com.
	[209.85.218.45]) by smtp.gmail.com with ESMTPSA id
	d21sm2793739oti.66.2018.01.17.16.13.53
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 17 Jan 2018 16:13:54 -0800 (PST)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-oi0-f45.google.com with SMTP id d124so14444758oib.13
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Jan 2018 16:13:53 -0800 (PST)
X-Received: by 10.202.71.149 with SMTP id u143mr1911112oia.37.1516234433479;
	Wed, 17 Jan 2018 16:13:53 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.38.102 with HTTP; Wed, 17 Jan 2018 16:13:51 -0800 (PST)
In-Reply-To: <CAJTo0LaJqU9Q4AZ_GELbaZtHWBsZ6+M-nhNM-BVhLYd6M3oBcw@mail.gmail.com>
References: <20180116132559.27794-1-ross.burton@intel.com>
	<CAP9ODKoHLrvk4=wTan8uU8nSTzy2y=uys1g=PKxM_Xn4+R+29g@mail.gmail.com>
	<59b242ee-84fa-72b7-6335-5238c6d8b3cd@windriver.com>
	<CAJTo0LaJqU9Q4AZ_GELbaZtHWBsZ6+M-nhNM-BVhLYd6M3oBcw@mail.gmail.com>
Date: Wed, 17 Jan 2018 22:13:51 -0200
X-Gmail-Original-Message-ID: <CAP9ODKo4ms4rH4xQd6-KGmD+w0VEbXcBDHhHq1XqJEYkwT2AAg@mail.gmail.com>
Message-ID: <CAP9ODKo4ms4rH4xQd6-KGmD+w0VEbXcBDHhHq1XqJEYkwT2AAg@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [RFC PATCH] cmake: use Ninja backend instead of Make
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
X-List-Received-Date: Thu, 18 Jan 2018 00:13:55 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Jan 17, 2018 at 7:43 PM, Burton, Ross <ross.burton@intel.com> wrote:
> There appears to be a small number of upstreams that break with ninja, so
> I'll rework this patch so that the backend is an option but default to
> Ninja.

When doing so, please rebase on top of my patches and send it as
official patch (no RFC). Besides test, it is very welcome.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

