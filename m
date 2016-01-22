Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-pf0-f172.google.com (mail-pf0-f172.google.com
	[209.85.192.172])
	by mail.openembedded.org (Postfix) with ESMTP id 1C852731E1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Jan 2016 13:04:18 +0000 (UTC)
Received: by mail-pf0-f172.google.com with SMTP id e65so42342825pfe.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Jan 2016 05:04:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc:content-type;
	bh=a8iHe3P//4vj4mtx4GWljkWBYJXx9a2q/pqQhiyUYy8=;
	b=LGojdklKIycWL8lcOP7IKndR5+qNQP3KdfFM0QmQWgsDrNgI09XbzjKdg9AlqtFUic
	E2kIIPLu3F7d+pu45+GdhWlcIyMEGEVdbCFHUrWpwljsneO+zRAqE16VAJUhkMuZCT6E
	mznQjGEaOmJ3VPjHZLf1kwkh3bmY6Eei91+AD6VJKInheNBVZjSxafi+MqqVukQyKpWC
	4e88aay0bqM8CG6sUsyFEpymRGrDbFJh+U0Qnkc34ibPV95DmKTz+5VwbtGZZC42yZuJ
	NN/MWOZza1C/8739e1rcs4K8kTxHsYSMpqORmpDHa7rFvpq8A1MV7korEOciZKBS35z2
	bFpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc:content-type;
	bh=a8iHe3P//4vj4mtx4GWljkWBYJXx9a2q/pqQhiyUYy8=;
	b=JYUKGlsIDRd2wkcSoERJNbHIpeSEGF1rgnN3x7tTh9obdQ//j0ErBnFG8GPP4tD+1R
	BEzJRYBT7Xi9eMXZSw92y6uTB5zSNal58+7Ip+f5P1hRfv2C5IPiMXusIifAA6a0Jyh2
	JRoXNxmb8JlYcTi8jYqMaMTGOGNkLT+obgA0tOYjqer2rL0Y0rxaMmSjYrYE6iiojA/W
	s5OkoEpp8Av/oTQ3qlzbO8YUO1RN0rlwOj+48BmbGSZuromSgFcbjGHH2byDnachLWh0
	higOPF5yEhX+KyhO46c4XHNwFVFkJc2ZnAVPgF84ac970hfIqp+/0TO2V7x9xrB5KQ9r
	d73A==
X-Gm-Message-State: AG10YOTIkdmUxRQLj/Rf5MYm7Rc9CP6d8LD9YhcAJsbE7jw3oc3Wiuu5psT58MR0jx0tlQ==
X-Received: by 10.98.86.8 with SMTP id k8mr4191143pfb.28.1453467859351;
	Fri, 22 Jan 2016 05:04:19 -0800 (PST)
Received: from mail-pf0-f174.google.com (mail-pf0-f174.google.com.
	[209.85.192.174]) by smtp.gmail.com with ESMTPSA id
	dg1sm9813301pad.18.2016.01.22.05.04.16
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 22 Jan 2016 05:04:17 -0800 (PST)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-pf0-f174.google.com with SMTP id n128so42070537pfn.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Jan 2016 05:04:16 -0800 (PST)
MIME-Version: 1.0
X-Received: by 10.98.74.135 with SMTP id c7mr4222308pfj.129.1453467856572;
	Fri, 22 Jan 2016 05:04:16 -0800 (PST)
Received: by 10.66.72.229 with HTTP; Fri, 22 Jan 2016 05:04:16 -0800 (PST)
In-Reply-To: <56A22767.7050000@linux.intel.com>
References: <56A22767.7050000@linux.intel.com>
Date: Fri, 22 Jan 2016 11:04:16 -0200
X-Gmail-Original-Message-ID: <CAP9ODKqGqJGg9mhzdBm+0zLW=+bd7sr_=BO8Ao6ejeXh9n5G6g@mail.gmail.com>
Message-ID: <CAP9ODKqGqJGg9mhzdBm+0zLW=+bd7sr_=BO8Ao6ejeXh9n5G6g@mail.gmail.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: proposal: remove DirectFB from oe-core in the next release cycle
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
X-List-Received-Date: Fri, 22 Jan 2016 13:04:21 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Jan 22, 2016 at 10:58 AM, Alexander Kanavin
<alexander.kanavin@linux.intel.com> wrote:
> DirectFB upstream project has been dead for several months, the website has
> completely disappeared, and no explanation or apology has ever surfaced. [1]
>
> So let's keep DirectFB in the forthcoming release, but drop it early in the
> next release cycle.
>
> [1] http://www.phoronix.com/scan.php?page=news_item&px=DirectFB-Is-It-Gone

I would be in favor of dropping it for 2.1 release.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

