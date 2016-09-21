Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-io0-f194.google.com (mail-io0-f194.google.com
	[209.85.223.194])
	by mail.openembedded.org (Postfix) with ESMTP id 4E5646069D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Sep 2016 12:41:36 +0000 (UTC)
Received: by mail-io0-f194.google.com with SMTP id z135so3077070ioe.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Sep 2016 05:41:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc; bh=F6lok2Ub/MmchicSWfgX+QEIK4RmiwZYsrGOp1Va59s=;
	b=lmxeuOduGxFP4CVI7HnhN99w2l1V5kmQ6tgMxDrU79kTyaIySbv9IHi2avPKwg7KyV
	WARUd53QLkqSq9KK3BBPSgXMAEI9dc/ISuQ6WXQbBp4R8PycNtPt497vKi3TQOdGciG6
	WSCa12J4UZs3TgPUQS02PsWBg5eALDU1w2Nghf+6KsiKkLVnV3jd0PWQgLdSozVQhuHe
	PMDTFVr2ESPwid9xRLwbjI40z5EVSZEtqKpRf9QExlb6w7N7umOqcDfrL7ucIEqAa9vp
	yUGqcBCCo8nhQvphEwsSq2wTyNTMDA7XLh0I2WtkdhNkfsvRyylePTI6UL2YSsf31xyc
	TfqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc;
	bh=F6lok2Ub/MmchicSWfgX+QEIK4RmiwZYsrGOp1Va59s=;
	b=UUELmorPo0dk9LC2Q7jdU/6ntBdYRVSFOMWKUsN7z+yTfujSOILAhVjvdSu2qc8i4s
	KQwVx/ZP7oDhAzqoHtw+MLXXMkvcQheAsYEq5NmLH9QQlDxdWt7sVhnKXc1M3DfXt7rA
	pPKhaMtSIm6duQMGqfYUZ0jVfEp3x6KEobB+cZJVerZIfboRIzOLIa21PtQ/K/FQIIJ3
	Ddck2fJaKFIZxUupMtTuurd6EA6+dh0Rsl9esf5WFLtu7geusGworHkvoEiZ82CguEye
	NJ8rcwWTCsxTyNY3s5N/pqpRZu0d6xZ3VyHlEgDWIwmPgh9Ncz5x5jcYYMb0ln6YdGfA
	uEWg==
X-Gm-Message-State: AE9vXwMWJCTen4tNLU/9p0PACbHpY/P2Vp9RlpzbkBGv/m6ibvsI6VhGRw55k8F+bq775w==
X-Received: by 10.107.1.197 with SMTP id 188mr45122281iob.20.1474461697510;
	Wed, 21 Sep 2016 05:41:37 -0700 (PDT)
Received: from mail-io0-f174.google.com (mail-io0-f174.google.com.
	[209.85.223.174]) by smtp.gmail.com with ESMTPSA id
	c96sm12826308ioj.43.2016.09.21.05.41.36
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 21 Sep 2016 05:41:36 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-io0-f174.google.com with SMTP id m79so51127651ioo.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Sep 2016 05:41:36 -0700 (PDT)
X-Received: by 10.107.39.6 with SMTP id n6mr47516096ion.10.1474461695974; Wed,
	21 Sep 2016 05:41:35 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.132.150 with HTTP; Wed, 21 Sep 2016 05:41:35 -0700 (PDT)
In-Reply-To: <1474455237.7207.312.camel@linuxfoundation.org>
References: <1474455237.7207.312.camel@linuxfoundation.org>
Date: Wed, 21 Sep 2016 09:41:35 -0300
X-Gmail-Original-Message-ID: <CAP9ODKqOyhzf_pUZuDOYCSeh4f25KOR_=6SsdaQ3zVn3NM+O8g@mail.gmail.com>
Message-ID: <CAP9ODKqOyhzf_pUZuDOYCSeh4f25KOR_=6SsdaQ3zVn3NM+O8g@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] autotools/siteinfo: Tweak CONFIG_SITE handling for determism/races
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
X-List-Received-Date: Wed, 21 Sep 2016 12:41:37 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Sep 21, 2016 at 7:53 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> As things stand there are multiple races in the CONFIG_SITE handling
> where checksums can change depending on whether site directories
> exist or not when parsing happens. This is bad.
>
> Secondly, there is a build race that occurs if you build virtuals
> in parallel with the "main" recipe, since the main recipe is parsed
> when the virtual is (since it sets variables like BBCLASSEXTEND)
> and with the current code, it may look for files and directories
> which could be created/destroyed which the loop is executing. This
> is also bad.
>
> The aclocal-copy directory should only ever be accessed by the call
> from autotools.bbclass. This chanages the parameter name to make it

... This changes the parameter ...

> clear and ensures all callers have the right usage, neatly avoiding
> all the problems above. Also added better comments.
>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

