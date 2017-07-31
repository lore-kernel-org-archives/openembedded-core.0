Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id CD236781F7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 31 Jul 2017 19:52:45 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id t138so76090wmt.4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 31 Jul 2017 12:52:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc; bh=70tx7aHQf5vxyHTjvkGBNkLXu5oJFdfa2QBi1r7a1sw=;
	b=lKWwncRSI4lk4lax9HzXWDZtzEYlbwf/5INYIaPzMforg3yPyH5cVLJ+bkamPuucDr
	764v688YoM3ppjguOzUL2IpKdVYoME5F6RqAbEOn2FJQ5jQgkTHLDJ1FUuYGISGCKzFg
	ZCzx0m9+RjA1ZaXjLpdOgB6iC8UnzHl2L80Vf+EDdzT/r8IdujcMXfRPIOCJXzC+1t7l
	whU96FbOev7kQ5oOoHg2V24DVGdpwib9LmuQ5OB4WOJaQm1g7pq4kEXnLwz1Rihaasuf
	s6OXu/CcceWfm0JdkrLdIuIsdAzyPaMXOMIL+lSDPKWRv1LwQyfLZICQsNfbnSVtxmgl
	OZlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc;
	bh=70tx7aHQf5vxyHTjvkGBNkLXu5oJFdfa2QBi1r7a1sw=;
	b=R2f9xdVlXJpRggAdlFYhBrj83JWxmb7s+GqyP1hXe5og+DJZ1cPgHu0InHSOtJRNZ4
	2qOW98bELFSzidP4yFKTgxb1lBDmiN/dd2EJ9t+vGeA5yur6+106D8Mw6B4H9p3MBIR4
	XMlwBJ396PMCmqlgtJrdvDeTUKmtKIuRXNL6VIpmHLdsMqi/6g24MCwLRLrt3Mpn+Ibk
	U98JkeQVOc1JuWBt0IJ1Owi/3AGSYD2+2s8UCkmOisIO4iuvxPHuN3dhMEqqynfJMlUT
	v79dBq9aVsaXjbVqWhGX3bbwcLR8GUSZti+zgLa1dtlZXRPpuxO5n/FaxVqJmTphwfAL
	3tRQ==
X-Gm-Message-State: AIVw113WvNM9RW+KdAnG2I5XO7z0cyWUT0227HIx1rA4vAhVp+/LfqyZ
	3FD3P1YU0MzwqmlQoqs=
X-Received: by 10.28.57.193 with SMTP id g184mr12041465wma.32.1501530766181;
	Mon, 31 Jul 2017 12:52:46 -0700 (PDT)
Received: from mail-wr0-f176.google.com (mail-wr0-f176.google.com.
	[209.85.128.176])
	by smtp.gmail.com with ESMTPSA id 27sm3506751wru.62.2017.07.31.12.52.45
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 31 Jul 2017 12:52:45 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-wr0-f176.google.com with SMTP id f21so126904226wrf.5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 31 Jul 2017 12:52:45 -0700 (PDT)
X-Received: by 10.223.179.216 with SMTP id x24mr13218169wrd.7.1501530764874;
	Mon, 31 Jul 2017 12:52:44 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.28.198.70 with HTTP; Mon, 31 Jul 2017 12:52:43 -0700 (PDT)
In-Reply-To: <adac39d9-b395-9f8d-5af0-8882e2136140@gmail.com>
References: <20170728180734.1920-1-otavio@ossystems.com.br>
	<CAJTo0LbhyV1g4w4PG_hxMEioTTJdthaDvmgQhU-r2V-w3RHLeA@mail.gmail.com>
	<CAP9ODKqb2hLkkLpbnTSRnGHPRcczZqn_g=Uythiey8Tz+Y_Gcw@mail.gmail.com>
	<adac39d9-b395-9f8d-5af0-8882e2136140@gmail.com>
Date: Mon, 31 Jul 2017 16:52:43 -0300
X-Gmail-Original-Message-ID: <CAP9ODKrs_qij8v+q9ViZtW_rT0c9W02YcqQ+gAV1Y8DmWaz4sg@mail.gmail.com>
Message-ID: <CAP9ODKrs_qij8v+q9ViZtW_rT0c9W02YcqQ+gAV1Y8DmWaz4sg@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] go-dep: Add 0.2.0 release
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
X-List-Received-Date: Mon, 31 Jul 2017 19:52:46 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Jul 31, 2017 at 4:20 PM, Khem Raj <raj.khem@gmail.com> wrote:
>
>
> On 7/31/17 12:12 PM, Otavio Salvador wrote:
>> Hello Ross,
>> Hello Khem,
>>
>> On Sat, Jul 29, 2017 at 3:28 PM, Burton, Ross <ross.burton@intel.com> wrote:
>>> Failed in the no-x11 builder at least so far:
>>>
>>> ERROR: go-dep-0.2.0-r0 do_package: QA Issue: go-dep: Files/directories were
>>> installed but not shipped in any package:
>>>   /usr/lib/x86_64-poky-linux/go/bin/dep
>>> Please set FILES such that these items are packaged. Alternatively if they
>>> are unneeded, avoid installing them or delete them within do_install.
>>>
>>> https://autobuilder.yoctoproject.org/main/builders/nightly-no-x11/builds/537
>>
>> I did reproduce this; I could only reproduce it if I built it with a
>> machine which matches the architecture of host, in my case x86-64.
>> When building for other arch (e.g: ARM) it works as expected.
>>
>> The problem seems to be a generic problem and I am not experienced
>> enough on the Golang toolchain to look at this. Khem could you take a
>> look and see if you find the root cause?
>
> Delete this file, its building it on x86_64 because it can. We only need
> cross version.

I am not sure I follow you here.

Using qemux86-64 as target it does NOT install on ${bindir} and
surprisingly the installation path does also not match GOBIN_FINAL
value.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

