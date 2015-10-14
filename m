Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-ig0-f172.google.com (mail-ig0-f172.google.com
	[209.85.213.172])
	by mail.openembedded.org (Postfix) with ESMTP id CE06460125
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Oct 2015 12:51:05 +0000 (UTC)
Received: by igbkq10 with SMTP id kq10so111480219igb.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Oct 2015 05:51:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc:content-type;
	bh=5a/mf2K1prS4/GuxwhKUbMfyeyCAUBdHStk4asvlbD4=;
	b=IH5Bu08lu38xIEMAB0X3bEyBVOpTc9f1zGhx6mwD4PkQkyS1gEyA6QNwes9Omj5iqs
	pE290uHXlWPRN3WSrwT6mLDa4aL9g7bGkvX5fNCFTVu3hzzUpYRymW4hUxxPQnymsPEX
	v5q/zOX9wbL6uDOYwgeTzptShoMa/W/hY7TBKidRo+2R0D7nwPOmbtaRCOTL/V4/1Rom
	d1NsmuFao7EvX8zhaSkuqNOMxgYBMzp9E2eIckhHrJ6BFpMIRhiXkjFA44JQiRAZ/BlR
	2E8IgIiLDRiRyrxzuchfWHReH59iuOQGx6z9gnU6Tmf5q0jetP6KkbtjDfcyb9pCs9cS
	LG+w==
X-Gm-Message-State: ALoCoQl6YJBJp6EqjvsVZKESNwIulUj3PSVeJ5w0yhSwY+03FgKfs5Jg/sE//D5x8L52sN/aggmf
X-Received: by 10.50.176.225 with SMTP id cl1mr23958847igc.80.1444827065537;
	Wed, 14 Oct 2015 05:51:05 -0700 (PDT)
Received: from mail-io0-f169.google.com (mail-io0-f169.google.com.
	[209.85.223.169]) by smtp.gmail.com with ESMTPSA id
	lo2sm3585690igb.17.2015.10.14.05.51.04
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 14 Oct 2015 05:51:04 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by iodv82 with SMTP id v82so53679062iod.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Oct 2015 05:51:03 -0700 (PDT)
MIME-Version: 1.0
X-Received: by 10.107.131.147 with SMTP id n19mr3409255ioi.192.1444827063862; 
	Wed, 14 Oct 2015 05:51:03 -0700 (PDT)
Received: by 10.36.218.7 with HTTP; Wed, 14 Oct 2015 05:51:03 -0700 (PDT)
In-Reply-To: <B678E6C6-E7F6-4256-84D9-C53DE739D630@gmail.com>
References: <CAP9ODKrxCLF1m-UR9_TYQboUQtWODG8erwgnmjFiWd_O57CEEw@mail.gmail.com>
	<2D1734FF-E28E-4B9D-AF22-A4911A5DE293@gmail.com>
	<1444798997.3844.47.camel@linuxfoundation.org>
	<B678E6C6-E7F6-4256-84D9-C53DE739D630@gmail.com>
Date: Wed, 14 Oct 2015 09:51:03 -0300
Message-ID: <CAP9ODKpeMm9Opf3r8W7h=VN60BKs-jieEANN0D=+ydvU=mLPmQ@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: glibc build error when it is rebuild due hash mismatch
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
X-List-Received-Date: Wed, 14 Oct 2015 12:51:06 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Oct 14, 2015 at 2:10 AM, Khem Raj <raj.khem@gmail.com> wrote:
>> On Oct 13, 2015, at 10:03 PM, Richard Purdie <richard.purdie@linuxfoundation.org> wrote:
>> Agreed, this does look like a missing gettext-native dependency
>> somewhere in the system. Unfortunately gettext(native) is a pretty heavy
>> dependency too :(
>
> We have two options
> 1. Ask for it on host ( can cause discrepancies)
> 2. Workout glibc to not rebuild message catalogs at any cost.

I prefer option 2, with a packageconfig and possibility to enable its
generation in a distro, if needed.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

