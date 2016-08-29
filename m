Return-Path: <kristian.amlie@mender.io>
Received: from mail-lf0-f53.google.com (mail-lf0-f53.google.com
	[209.85.215.53])
	by mail.openembedded.org (Postfix) with ESMTP id CE6837002B
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Aug 2016 09:00:02 +0000 (UTC)
Received: by mail-lf0-f53.google.com with SMTP id b199so96076651lfe.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Aug 2016 02:00:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mender-io.20150623.gappssmtp.com; s=20150623;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-transfer-encoding;
	bh=S7x2319/PT/MjoA5REXNKFBMqQUgNjBy/2Sfj72SB/0=;
	b=XRorkz8UEw2w0c1z5bhurqux1Pm1YGCDViW6orw4jBMw0EqdKun5fql8izjPgHLIYR
	ODSoSpwChxO+E/Mp6xUkjqcKjrqDtEwFHlGgWewCC1gcNvrhHieTFrE55HrOSps3WBgw
	U5CVeDET7kJOZjffL2b543wR3Q9WN1mgse5g+DjfzaySRSJJAhnkCrHLv2m4tbDMqPlJ
	zjCmQB25SkwnJGKNHwofCdJOdt36FcRJ5OBVUPmcIvAjdzjOJuZkRRm4PyrKrRKloN86
	LAp3b3ldBtSTQfMCGkAGFJ9qxRCxHGMvIins5nFooC0Wiu3l47QNEO8gd7BycWngnoQ9
	HN4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=S7x2319/PT/MjoA5REXNKFBMqQUgNjBy/2Sfj72SB/0=;
	b=JQhGKKAGDvRs4XgybXAjJ6umSEdvOLRWSl+QdhNhC9lTQQjSF+yOZFN4u4v/MzZvow
	UiNNpW3fbO/VP7bwoIoi7olLv1q3LSN3DTY0Hc9SJttOHGZenCuKyxfLf2+Dy4NR3BWj
	hC/7GO+1b64mFm0/cmNIoorp3TDPlaw/gUY51BRu3qRKUc2xgY5kR6n6+1LZYwuE1k0K
	hA/svgCQwkiYSbEQKUFAmCM64rTmgSDMKZH23SA+lvmepnxs5hcFduD6ah4IqGVUSGEO
	j0A7GQlw4TvJ5lq393UaNNBJKL9SSoUGU+NEg0xAahFm3nlZMQ8AoU+tNh2rwg6NlO5t
	FEpw==
X-Gm-Message-State: AE9vXwN2YNMI5T9KDOSpYh8vdi9ToGYUtq3SJjWvQQvXt88v30oPrv6fiFfISHJ7+2eRyg==
X-Received: by 10.25.215.35 with SMTP id o35mr5115106lfg.40.1472461202401;
	Mon, 29 Aug 2016 02:00:02 -0700 (PDT)
Received: from [10.25.0.170] ([195.159.140.90])
	by smtp.googlemail.com with ESMTPSA id
	g29sm6219772lji.45.2016.08.29.02.00.01
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 29 Aug 2016 02:00:01 -0700 (PDT)
To: akuster808 <akuster808@gmail.com>, openembedded-core@lists.openembedded.org
References: <1469001221-26502-1-git-send-email-kristian.amlie@mender.io>
	<CAJTo0LbW8c7V=5vHXML8srwVgzacqGJp2o0M4OOReVE42DnW0g@mail.gmail.com>
	<ddcae3ee-b5a1-c9b8-b53d-50a4001f3eeb@mender.io>
	<CAJTo0LbauTnzYsW=fVkM5zG4BqsYShDhwr0=d5HNX=XPSi8zFw@mail.gmail.com>
	<57B22C24.2070604@gmail.com>
From: Kristian Amlie <kristian.amlie@mender.io>
Message-ID: <750bf9cc-ef3d-1ec0-6a48-604d20d85772@mender.io>
Date: Mon, 29 Aug 2016 11:00:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <57B22C24.2070604@gmail.com>
Subject: Re: [krogoth] systemd network service fails to start on boot
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
X-List-Received-Date: Mon, 29 Aug 2016 09:00:03 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit

On 15/08/16 22:55, akuster808 wrote:
> 
> 
> On 08/15/2016 02:24 AM, Burton, Ross wrote:
>> On 15 August 2016 at 07:38, Kristian Amlie <kristian.amlie@mender.io> wrote:
>>
>>> So, I did what you asked. Is there anything else missing?
>>>
>>
>> No, just wait for the krogoth maintainer to pick up the patches.
> 
> pulling to staging.
> 
> thanks armin

So, any idea when this will end up in the krogoth branch? I see the
branch has moved forward, but this is still missing.

Systemd has been broken on krogoth for over a month now...

-- 
Kristian

