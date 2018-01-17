Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-ot0-f177.google.com (mail-ot0-f177.google.com
	[74.125.82.177])
	by mail.openembedded.org (Postfix) with ESMTP id C91407864F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Jan 2018 16:18:49 +0000 (UTC)
Received: by mail-ot0-f177.google.com with SMTP id p16so17312740otf.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Jan 2018 08:18:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc; bh=vBcC2GAJYaFWUDqP2VMl2X+X6zZhpDJQjFMTh0kESp4=;
	b=WN9oh8BXrOyu/1B9qbpT0BFo6z/VJig+5LkvcvBk0R+MNJ2VShMy7Rym3SIt1RU3i6
	NpkJ/HjEGcVTwTTi6JAK8pVX7dQRZv5+sYjJcVk3qh1G0fseVGiyw01xqrqcdFNaKh0Z
	WqPEDv6hM6juxmb9BFIMT0lB2TrL3ox42aV9jR1Nn1l2+IOPEvEhGuwsPIexNq82PbSv
	YT8gu+Tv7ZUWa9gUwUETEe8Q5e3tdcjMDzTGIPL4v5QXWcnb/L02A8/azEIHqaCmt7I9
	s45shAW5QLoMrWUy7PRfmU4hY9wXRHf/zHIed+CeEG4i8ryxDaFdCRoVKlRmtIwh59S5
	KjiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc;
	bh=vBcC2GAJYaFWUDqP2VMl2X+X6zZhpDJQjFMTh0kESp4=;
	b=Cy2C+fg4OKfwPtA3t5BfQhBuJ/uVGpWnIHi7t+A50rCcIdsshBNm657+mq/mcaCscR
	zksFJvnISxUqYeOGOWlfoRj2IihNfmdScMWLXZagKUdAFS9tCgsmK1f/iBtzehgvJVOl
	XaoWbkVyETQXLE1m3Qui+p6snMmaXD2dED1QEB5LKxL/OJ4UuyOZ46aH0x5r+QHr9D2C
	C56uizggOt8rMER4hV1y6QmR9fn/WVTJ34cxWQ0dMk8OouzLA/91m993VYbe7Iugmjgh
	H1QW84R9+A1iCA9wvQjsKmbwqYRM3Hmmg0M6fGpKGnAFkGGeZPdnDrI1A2+pmdCzEHoL
	AgMA==
X-Gm-Message-State: AKwxytdsGAF6nZCh+vXflHXP2IzXBOdVgHT9qdmo8lkJICWLMBASZPWd
	1xQSn1afZTD2z5qKK6eL7t31+xNa
X-Google-Smtp-Source: ACJfBouMwFpAXnUr248kR5wE7/4Rlyhf1vJm70cWeM3i9jepG/44dLPc+LfIUKwC9DkD3LqW2eDL3A==
X-Received: by 10.157.60.7 with SMTP id q7mr1401620otc.288.1516205930439;
	Wed, 17 Jan 2018 08:18:50 -0800 (PST)
Received: from mail-ot0-f169.google.com (mail-ot0-f169.google.com.
	[74.125.82.169]) by smtp.gmail.com with ESMTPSA id
	h124sm2036454oib.29.2018.01.17.08.18.48
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 17 Jan 2018 08:18:49 -0800 (PST)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-ot0-f169.google.com with SMTP id s3so17287875otc.9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Jan 2018 08:18:48 -0800 (PST)
X-Received: by 10.157.12.230 with SMTP id o35mr1591420otd.191.1516205928530;
	Wed, 17 Jan 2018 08:18:48 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.38.102 with HTTP; Wed, 17 Jan 2018 08:18:47 -0800 (PST)
In-Reply-To: <20180116132559.27794-1-ross.burton@intel.com>
References: <20180116132559.27794-1-ross.burton@intel.com>
Date: Wed, 17 Jan 2018 14:18:47 -0200
X-Gmail-Original-Message-ID: <CAP9ODKoHLrvk4=wTan8uU8nSTzy2y=uys1g=PKxM_Xn4+R+29g@mail.gmail.com>
Message-ID: <CAP9ODKoHLrvk4=wTan8uU8nSTzy2y=uys1g=PKxM_Xn4+R+29g@mail.gmail.com>
To: Ross Burton <ross.burton@intel.com>
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
X-List-Received-Date: Wed, 17 Jan 2018 16:18:49 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Jan 16, 2018 at 11:25 AM, Ross Burton <ross.burton@intel.com> wrote:
> The Ninja backend is faster than Make for large projects (takes three minutes
> off webkitgtk:do_compile for me), so use it by default.
>
> Signed-off-by: Ross Burton <ross.burton@intel.com>

I tried to test this but it did not apply in master. Could you rebase it?

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

