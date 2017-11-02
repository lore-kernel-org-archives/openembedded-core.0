Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-oi0-f45.google.com (mail-oi0-f45.google.com
	[209.85.218.45])
	by mail.openembedded.org (Postfix) with ESMTP id 620B171951
	for <openembedded-core@lists.openembedded.org>;
	Thu,  2 Nov 2017 12:21:08 +0000 (UTC)
Received: by mail-oi0-f45.google.com with SMTP id a132so8374929oih.11
	for <openembedded-core@lists.openembedded.org>;
	Thu, 02 Nov 2017 05:21:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc; bh=AIoTK6CszhHYUp8Q3+ecM/1zdD3U8oWZAh9dY6RhexU=;
	b=utiw91g9KNToPKlLQhyc3MRiTV9fOZkZRKKHZP/4duIEoE1xl1nTuGmyOqUmjvwljU
	ftuJys3YBXX4+w0l0ODKY3WosbAlZ4wwK0I53um+9ji/T/GGNeyCquE46KMr6VQ4BRoV
	CnLY6MohYaT36Dr/sB6nnCgarGOw628EvPSJU+cf0BV4H7PVhN7Uhq3J53eO2g8xPoIL
	T9RirCGQJjCxA58YOwQXkpaTcDY5IS2ib1W9/56KpXtnlRCNa17k0UHi7UTLsdYS16MI
	tDZD6vbBkygVB6mLz3wbfrmbEOt3/MPQhtqzf95WwdzMWWNQo9mXUY5rfT6QGOiWAjAM
	XeCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc;
	bh=AIoTK6CszhHYUp8Q3+ecM/1zdD3U8oWZAh9dY6RhexU=;
	b=ZQZsilzM7elxtiyDLS5n1mZZLgp9kVw4DH2+zZ513lA68f2+fI1dRl/YsQb5DpQolx
	xjxydD0fXONhfSxc6PIrNaOGnnBa5QYvB8kcw+quy0xExMjLFGfw7AJJZZjK3/i4UWmC
	NOm8DFL3TwvP+Rsd+0sCbBqznnshdHjVc6UdBOJ9E7ckuChXlAwXouCOiSwqfb9g0xoy
	Ne6Yi/Os4FzbhpJcJn4Uw6VZ5xcr5ZG7/w9AAMliDtRvfpOEBz59aWpl2ZLnt/VsYScy
	3aMFghIxKPdEWmdU56Uby61b71Codauoq5D9jN8Jp5yu8rH3kvxtKPFZtYfCmwr/AREO
	0xsQ==
X-Gm-Message-State: AMCzsaWvRpwf2B4KmeWWUy29Xl3Wa1Y84gyl0a/qVJ4STqBJMSzrHXkn
	GWhVEjhsfdGm+gFHe6qzsMd1HqWJ
X-Google-Smtp-Source: ABhQp+SEEn7Q9k8C8Yh5CpSe7+NQwjjpxYKOImcS/yfJ1ljY+PwJ28pW54JgOfYIJR3003r50Aw12Q==
X-Received: by 10.202.199.137 with SMTP id x131mr1930572oif.37.1509625269944; 
	Thu, 02 Nov 2017 05:21:09 -0700 (PDT)
Received: from mail-ot0-f170.google.com (mail-ot0-f170.google.com.
	[74.125.82.170]) by smtp.gmail.com with ESMTPSA id
	d141sm1289725oih.33.2017.11.02.05.21.08
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 02 Nov 2017 05:21:08 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-ot0-f170.google.com with SMTP id 96so1307166otw.11
	for <openembedded-core@lists.openembedded.org>;
	Thu, 02 Nov 2017 05:21:08 -0700 (PDT)
X-Received: by 10.157.21.54 with SMTP id u51mr2047169otf.215.1509625268056;
	Thu, 02 Nov 2017 05:21:08 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.157.56.216 with HTTP; Thu, 2 Nov 2017 05:21:07 -0700 (PDT)
In-Reply-To: <44258d74-acbd-45cf-0a00-c82554be03ec@linux.intel.com>
References: <20171102053922.33426-1-raj.khem@gmail.com>
	<44258d74-acbd-45cf-0a00-c82554be03ec@linux.intel.com>
Date: Thu, 2 Nov 2017 10:21:07 -0200
X-Gmail-Original-Message-ID: <CAP9ODKqKMjmPLm0yP91ojS3OX5rLkEW34uwrvR02V5rcs4VWGA@mail.gmail.com>
Message-ID: <CAP9ODKqKMjmPLm0yP91ojS3OX5rLkEW34uwrvR02V5rcs4VWGA@mail.gmail.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH V3] musl: Update to 1.1.18
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
X-List-Received-Date: Thu, 02 Nov 2017 12:21:09 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Nov 2, 2017 at 10:19 AM, Alexander Kanavin
<alexander.kanavin@linux.intel.com> wrote:
> On 11/02/2017 07:39 AM, Khem Raj wrote:
>
>> Changes since v2: Move to 1.1.18 release
>> -PV = "1.1.16+git${SRCPV}"
>> +PV = "1.1.18+git${SRCPV}"
>
>
> Can you drop this, and simply rename the recipe to musl_1.1.18.bb please?

Why? keeping it on _git makes sense to me.


-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

