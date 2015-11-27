Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-pa0-f48.google.com (mail-pa0-f48.google.com
	[209.85.220.48])
	by mail.openembedded.org (Postfix) with ESMTP id CDD166012C
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Nov 2015 11:21:50 +0000 (UTC)
Received: by pacdm15 with SMTP id dm15so112898865pac.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Nov 2015 03:21:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc:content-type;
	bh=FC+jDr7oW9uUpDYGZWvuL0M6oHGZen4buCbL/nG7sKE=;
	b=wY9RbnxFKOi0mlaPd7TspGS6qj4tnhYoplSWvmUj6rV1EUTc4+WvqwJc68uaRf4vDQ
	mvi41zKIr8XX6az+gS4TvLXMqwN+sOyfDBcAPQD+NUCf7Hki93y0gOGiGNRMCU/o6isi
	kXfmtOQcWUjSaSj8aLwhzYTKhiG48w24yYTHLJgfQTOSK+Bnjg5EIE935L1ZFDXhc0Qa
	wVWYlGN4BhzA8F6D9FbDijlZQsqQAWNlJpPNSQ0qOQLZ6SXuKgZUXoihwY5SyF2HucU7
	JMBOotZGhN9yMOBUIHRwi/pDVHe5jfJI3Fm6I/JX1X1acBELcY6glIoxsFkP1ZESJrQW
	hsJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc:content-type;
	bh=FC+jDr7oW9uUpDYGZWvuL0M6oHGZen4buCbL/nG7sKE=;
	b=m7MtqZWfuf5bJzI1SJ/28F6ynzMDmhht5mCeIoVi0XWF7nYrhnxsh1yrLiMQUBJcfZ
	8u9s/QRmKToIrV9WDLMQXBUphx1FEDRUUrjhtwnHsZL6KIDSt+rZGFuSnz+EcAC9afC6
	7yjmhfSStzUelC9j87ZR0PICWEUKjtIzmqQidr8fmELtTeFp4nVKcg1a+qZrCI3l1R2i
	lY7F0Ts/4ZZVXGL2IY+7LSy9Rr2xSmM/pMybT9H6KwfCAiiqX4dA4Ar/k5W8EFcCroSa
	tcmX/61cIT4KnTsBXOeiYLWB2R6cYrNgbsM43uLUwGf7iGhCZV8bAGEWnMRNVQBfS0NL
	hvsg==
X-Gm-Message-State: ALoCoQm7kZlVoESuONw8coG+xqRuizamQmd9++aCfMz8DuVnOFXOdjq9Qe7xAEauUmAtu5Od0q1v
X-Received: by 10.66.90.133 with SMTP id bw5mr66997917pab.1.1448623310871;
	Fri, 27 Nov 2015 03:21:50 -0800 (PST)
Received: from mail-pa0-f51.google.com (mail-pa0-f51.google.com.
	[209.85.220.51]) by smtp.gmail.com with ESMTPSA id
	by6sm34111577pab.25.2015.11.27.03.21.49
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 27 Nov 2015 03:21:49 -0800 (PST)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by pacdm15 with SMTP id dm15so112898064pac.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Nov 2015 03:21:49 -0800 (PST)
MIME-Version: 1.0
X-Received: by 10.98.64.136 with SMTP id f8mr47181316pfd.95.1448623309114;
	Fri, 27 Nov 2015 03:21:49 -0800 (PST)
Received: by 10.66.197.129 with HTTP; Fri, 27 Nov 2015 03:21:49 -0800 (PST)
In-Reply-To: <20151127111932.GC17303@jama>
References: <1448622259-5907-1-git-send-email-maxin.john@intel.com>
	<CAP9ODKq4R9UT2oL_vMALhCA_ocqCSxJoegCa_WEgy0Xj9xFT5A@mail.gmail.com>
	<20151127111932.GC17303@jama>
Date: Fri, 27 Nov 2015 09:21:49 -0200
X-Gmail-Original-Message-ID: <CAP9ODKrhabx-do0da05hGWZ5ZG4ovYUyOfpLsxdgOLUEmSdXkw@mail.gmail.com>
Message-ID: <CAP9ODKrhabx-do0da05hGWZ5ZG4ovYUyOfpLsxdgOLUEmSdXkw@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [RFC] Use libjpeg-turbo in place of libjpeg
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
X-List-Received-Date: Fri, 27 Nov 2015 11:21:51 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Nov 27, 2015 at 9:19 AM, Martin Jansa <martin.jansa@gmail.com> wrote:
> On Fri, Nov 27, 2015 at 09:13:22AM -0200, Otavio Salvador wrote:
>> On Fri, Nov 27, 2015 at 9:04 AM, Maxin B. John <maxin.john@intel.com> wrote:
>> > This patch set provides libjpeg-turbo as a drop-in replacement for libjpeg.
>> >
>> > libjpeg-turbo is a fork of the original libjpeg project.Most of the major Linux
>> > distros (Fedora, Debian, OpenSUSE) moved from libjpeg to libjpeg-turbo recently.
>> > lbjpeg-turbo provides better JPEG compression/decompression(at least 25% faster)
>> > while maintaining same API/ABI as libjpeg.
>> >
>> > Once we reach an agreement on this, based on the decision, we can move the
>> > libjpeg package to meta-oe for applications which may depend on API version 9.
>>
>> I support this change, due:
>>
>>  - agreement with major Linux distros
>>  - performance improvement
>>
>> I also think moving libjpeg (API version 9) for meta-oe is fine as
>> well. I am not aware of any application which requires it, though.
>
> I'm not aware of any as well, so I would prefer to drop libjpeg
> completely.
>
> + less junk in meta-oe
> + people were confused about multiple jpeg providers before, now they
> would be again, but without good reason (as nobody knows about apps
> depending on libjpeg9).

Agreed.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

