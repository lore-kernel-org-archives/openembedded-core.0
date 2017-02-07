Return-Path: <kristian.amlie@mender.io>
Received: from mail-lf0-f54.google.com (mail-lf0-f54.google.com
	[209.85.215.54])
	by mail.openembedded.org (Postfix) with ESMTP id D877D65CC7
	for <openembedded-core@lists.openembedded.org>;
	Tue,  7 Feb 2017 07:23:20 +0000 (UTC)
Received: by mail-lf0-f54.google.com with SMTP id z134so57716901lff.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 06 Feb 2017 23:23:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mender-io.20150623.gappssmtp.com; s=20150623;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-transfer-encoding;
	bh=+ToRCJZm4NKz8u9YXy0Z8y3yP0bWlyvyHOseCQKWTc0=;
	b=W/eFodhlYVHs5m5dd3raA+vT8UzE54tDD/dvZmFKG/jFqOpMcFlSTIOectFOahEokU
	I1W9Asj77zKfrV/P2It6JzIrWjp4tBxj1PPUsQdVnuF+dM49AEJbhDVSPOLE3RW6i1Mp
	f1739n0RfoaY/6LTFt8JLnyXYgY+dLwFqnrHLIWfMvRTDN6i2BlH01KNwT4XrJQPj/uG
	7nFkIddUkyLjJhmrXDcDZlbUptTxj96gZgDjksHehkX945qA5jpdxhg73+csgQnl4UZe
	uKj/IUENkQ2ppWvRdNzALZeEhLWqaEhpyk1wplRAGEodRRN4TF5QyotecFFmh/9i3BHy
	Avjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=+ToRCJZm4NKz8u9YXy0Z8y3yP0bWlyvyHOseCQKWTc0=;
	b=heX8mOaOe9hIA0mORgLK9/hCchoPSaxcaJe1nzA15gZl48vipqNJOJRy3XuqvmnEdA
	fGjWEegbaZsPtSyowUwGepZH8vEvzSWCWpscrV3RXnon6hrzS5Mx3319IEWA7VlF5Jrf
	WnJHVRIv7FFlfhFBT9+tCyeKmpB4NK7GFbK7MZ/xwNZFQFuvTOZ2MfSlQ+QD2DdPFN2e
	pk6mRh1LiETIsqMDU+tFJu6PcFLcBJ0D6M5LEULYkalPnLbEZN7OxvKFCA7uUVuSLWe6
	yDhqO0c2mOaLEXj/5Cr7HDn0VxfHNx5bA5Cu09oO63iojXQwYLiH0RHuReFAgUXF7Wbz
	BkTw==
X-Gm-Message-State: AIkVDXK16vf+nhMH12ArcFtyL0lI8ac9BYvpParwe/FT4oWYcCr+jfz+j/wCGs3lCCNoXg==
X-Received: by 10.46.84.6 with SMTP id i6mr5118870ljb.67.1486452200396;
	Mon, 06 Feb 2017 23:23:20 -0800 (PST)
Received: from [192.168.1.14] ([176.111.205.58])
	by smtp.googlemail.com with ESMTPSA id
	e21sm978037ljb.38.2017.02.06.23.23.19
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 06 Feb 2017 23:23:19 -0800 (PST)
To: openembedded-core@lists.openembedded.org
References: <1480068955-17053-1-git-send-email-kristian.amlie@mender.io>
	<20170206162956.9311.9990@do.openembedded.org>
From: Kristian Amlie <kristian.amlie@mender.io>
Message-ID: <17864936-a34d-6df4-5e57-b9dbb8860f60@mender.io>
Date: Tue, 7 Feb 2017 08:23:18 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.5.1
MIME-Version: 1.0
In-Reply-To: <20170206162956.9311.9990@do.openembedded.org>
Subject: =?UTF-8?B?UmU6IOKclyBwYXRjaHRlc3Q6IGZhaWx1cmUgZm9yIHdpYzogQWRkIC0tZXhjbHVkZS1wYXRoIG9wdGlvbiB0byByb290ZnMgc291cmNlIHBsdWdpbi4gKHJldjExKQ==?=
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
X-List-Received-Date: Tue, 07 Feb 2017 07:23:23 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

Is this old? The patch it mentions is not part of the patchset anymore.

I noticed I forgot to add the 'v5' tag to the patches I posted
yesterday. Maybe that's why?

-- 
Kristian

On 06/02/17 17:29, Patchwork wrote:
> == Series Details ==
> 
> Series: wic: Add --exclude-path option to rootfs source plugin. (rev11)
> Revision: 11
> URL   : https://patchwork.openembedded.org/series/4087/
> State : failure
> 
> == Summary ==
> 
> 
> Thank you for submitting this patch series to OpenEmbedded Core. This is
> an automated response. Several tests have been executed on the proposed
> series by patchtest resulting in the following failures:
> 
> 
> 
> * Patch            [v2,2/3] Add e2tools recipe, in order to test contents of images.
>  Issue             Shortlog does not follow expected format [test_shortlog_format] 
>   Suggested fix    Commit shortlog (first line of commit message) should follow the format "<target>: <summary>"
> 
> * Issue             Series does not apply on top of target branch [test_series_merge_on_head] 
>   Suggested fix    Rebase your series on top of targeted branch
>   Targeted branch  master (currently at b3a74335e1)
> 
> 
> 
> If you believe any of these test results are incorrect, please reply to the
> mailing list (openembedded-core@lists.openembedded.org) raising your concerns.
> Otherwise we would appreciate you correcting the issues and submitting a new
> version of the patchset if applicable. Please ensure you add/increment the
> version number when sending the new version (i.e. [PATCH] -> [PATCH v2] ->
> [PATCH v3] -> ...).
> 
> ---
> Test framework: http://git.yoctoproject.org/cgit/cgit.cgi/patchtest
> Test suite:     http://git.yoctoproject.org/cgit/cgit.cgi/patchtest-oe
> 

