Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-oi0-f67.google.com (mail-oi0-f67.google.com
	[209.85.218.67])
	by mail.openembedded.org (Postfix) with ESMTP id 2B25571B1D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Dec 2017 17:45:49 +0000 (UTC)
Received: by mail-oi0-f67.google.com with SMTP id s9so27465298oie.5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Dec 2017 09:45:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc; bh=nqTwTaJUsFw+0jD2FteXNqtQ9H6KKmM6/Qe3XcUflYc=;
	b=h1ujBlAVpdgbTq3seutpo8fFLeO7XBMtcqicHKPghiRwbYk0v/nUYvPd6BI0TyStpQ
	RGPJHWW+Wq0kVrDICVrNZtdC7LdW3lVQ6YFKFz+W15DORkhtXDwoav6pYiVD2OxIbYf9
	SclpcfOQe5ovluaeG1fr0VwV+2xhiDHiFnPTb5uNBPNR1afqON0+NjRxv/btBggJbAXW
	z4/DQD4/KiiqbaXgqbx3Gn529syKIUszHyWUc/fVh/c1TVKSStKzmApsbtanSHOfiK3Z
	MWK3+3s46y/t2/TWFfvTMKVOlNq9mnqkHwbLOtZ/1aGav1PP6u06XnX+Psxg/ULkQqvZ
	GcBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc;
	bh=nqTwTaJUsFw+0jD2FteXNqtQ9H6KKmM6/Qe3XcUflYc=;
	b=G4r7V8WliGFe9RSkiuge1cnyN0088PjmXE2tiSnYFXDH7kqs7N9K51Ua/aSraE4yNj
	02yOKQweUQw11+Ax+jXiUl/U4qEmGZhjoOydwhQ1DANBC1M6WrzPCs5arZKbFKPFYBRL
	Sj3Vh+Z6ILyL9h0FmhDN2FikPXIH9uUTzmEWtOqlCRAY2tlwLbVx1hyLjCaOTb8249Qo
	jehRbm6ahesoJ0kGY6FpCy4sPCjJvuFzPm+zVLXlLknWZOqJ6t6ljBSk7+rlaySABbi9
	ESjpzn/XbzL9bmA9OwPiahqDdy+yorhGw3rbI+uwSeCCikw+NCUDguSxFIfBUllN6LQg
	HBPA==
X-Gm-Message-State: AKGB3mKVgjEq565ufSIRSGNgyoJMf1rVaVhByny6Okeoyi9oQtwQkH6T
	oldeQLOVJqV2GTQ3O+tX7C5FYGP5
X-Google-Smtp-Source: ACJfBosP7/YJrk4D1qktMwFiUdywoui6nqHE6dZcJM2UMalyE+lD3yJIB/nI/53Rb2hZX41H0XDUVQ==
X-Received: by 10.202.229.1 with SMTP id c1mr14455761oih.339.1514483150846;
	Thu, 28 Dec 2017 09:45:50 -0800 (PST)
Received: from mail-oi0-f43.google.com (mail-oi0-f43.google.com.
	[209.85.218.43]) by smtp.gmail.com with ESMTPSA id
	q12sm4614937oti.48.2017.12.28.09.45.49
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 28 Dec 2017 09:45:49 -0800 (PST)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-oi0-f43.google.com with SMTP id s9so27465249oie.5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Dec 2017 09:45:49 -0800 (PST)
X-Received: by 10.202.67.65 with SMTP id q62mr21120930oia.37.1514483148890;
	Thu, 28 Dec 2017 09:45:48 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.41.233 with HTTP; Thu, 28 Dec 2017 09:45:48 -0800 (PST)
In-Reply-To: <1514473570.5525.32.camel@linuxfoundation.org>
References: <20171222133535.31170-1-otavio@ossystems.com.br>
	<1514473570.5525.32.camel@linuxfoundation.org>
Date: Thu, 28 Dec 2017 15:45:48 -0200
X-Gmail-Original-Message-ID: <CAP9ODKoLqZQzZuaRQ0K8-VFnUmdqEGPvoEAvQB+JX0zK+4P3bA@mail.gmail.com>
Message-ID: <CAP9ODKoLqZQzZuaRQ0K8-VFnUmdqEGPvoEAvQB+JX0zK+4P3bA@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] mesa: Upgrade to 17.3.1 release
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
X-List-Received-Date: Thu, 28 Dec 2017 17:45:50 -0000
Content-Type: text/plain; charset="UTF-8"

Hello Richard,

On Thu, Dec 28, 2017 at 1:06 PM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Fri, 2017-12-22 at 11:35 -0200, Otavio Salvador wrote:
>> The 17.3.1 release, published in December 21, 2017, is the first 17.3
>> stable release for use. It fixes a number of issues since 17.3.0
>> release.
>>
>> The release notes can be seen at:
>>
>>  - 17.3.0: https://www.mesa3d.org/relnotes/17.3.0.html
>>  - 17.3.1: https://www.mesa3d.org/relnotes/17.3.1.html
>>
>> This commit has reworked few patches, to apply to the new source, and
>> dropped the backported ones.
>>
>> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
>
> Doesn't build unfortunately:
>
> https://autobuilder.yocto.io/builders/nightly-rpm-non-rpm/builds/645/steps/BuildImages/logs/stdio
> https://autobuilder.yocto.io/builders/nightly-musl-x86-64/builds/129/steps/BuildImages/logs/stdio
> https://autobuilder.yocto.io/builders/nightly-packagemanagers/builds/310/steps/BuildImages/logs/stdio
> https://autobuilder.yocto.io/builders/nightly-x32/builds/653/steps/BuildImages/logs/stdio

I am out of town currently so I will try my best to fix it; in the
worse case, I fix it in the second week of Jan when I am back in
office.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

