Return-Path: <kristian.amlie@mender.io>
Received: from mail-wm0-f53.google.com (mail-wm0-f53.google.com [74.125.82.53])
	by mail.openembedded.org (Postfix) with ESMTP id EBE72770E3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Aug 2016 10:26:03 +0000 (UTC)
Received: by mail-wm0-f53.google.com with SMTP id i5so94570575wmg.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Aug 2016 03:26:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mender-io.20150623.gappssmtp.com; s=20150623;
	h=subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=0YFr1HGv1PNVnjsFNFmrCpQ4fB1YQ/imJgq1fkfO0ew=;
	b=TStxSP7yZjNhoMrOj0fFbb2fzSuLIC9oo+iAxu/7tP9iiAXEFz8/wurcWhPAkPxGIC
	DhPGCOVJ+H5sT4x72/N2/jIF8NAVsFr/VyM6uDPBnirPdBZBUdbmpGp9cXSbl0Yt7CEz
	dXmHn3DVrlax8Ut7BBrrzqAyCH17zkiIfmz6xgjVbpsxYMDvrMZWngkdNpDGu70hww5b
	/K+LY2bpBkI5zUrKiKEx2P8yRXfdl1kYPdDmSS6ZcOwgb8oWHpc/js5dNrn/o3dvNhfp
	dyWM07qLLr3z9/O5BxrUGpgBHyAOmkX17c42ZLqpMwlzNzjKWYLMM5I3EcXKvXGc8q08
	uGtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:cc:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=0YFr1HGv1PNVnjsFNFmrCpQ4fB1YQ/imJgq1fkfO0ew=;
	b=Nbh/yL2gavSdMLOS4XBJeBNWmqi4zowgQDITTjPq8lT8GhVBhDEnPQEcNA7AbB8nkf
	8YugMdLhj9efNLuDyYniNbLBJdfAdbEYDcU63Mue0CjbHPMXXQee+Y6Tb1Ac4oZvvdYS
	yOJ4THUubL7MfCzsqzy3jRpp1ImPXfqeuFrXzDi5epZFyRwilRcGihF140e6WOW78ZvL
	vM1BkjCfTK3TFftqJQMlUBav1vAHvlfVmVZiQ30inifJTXOUvkxKZ3X7Fjmox5dzkJtA
	gMaC2NWipuDj73TmPCoh9dFBfhyGFeKqHfIqgug650WRP6t9FKRwW+sukt+NtUnLwT9v
	T+eA==
X-Gm-Message-State: AEkooutOIpZipp5nApk/CP84AxJIR40238LV8CNE+aD/sWM8EnPGjRjAmsSzD4L+4TAWvQ==
X-Received: by 10.25.33.79 with SMTP id h76mr4522511lfh.82.1471256763421;
	Mon, 15 Aug 2016 03:26:03 -0700 (PDT)
Received: from [10.20.40.172] ([77.88.92.14])
	by smtp.googlemail.com with ESMTPSA id
	g3sm3297331lfe.14.2016.08.15.03.26.02
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 15 Aug 2016 03:26:02 -0700 (PDT)
To: "Burton, Ross" <ross.burton@intel.com>
References: <1469001221-26502-1-git-send-email-kristian.amlie@mender.io>
	<CAJTo0LbW8c7V=5vHXML8srwVgzacqGJp2o0M4OOReVE42DnW0g@mail.gmail.com>
	<ddcae3ee-b5a1-c9b8-b53d-50a4001f3eeb@mender.io>
	<CAJTo0LbauTnzYsW=fVkM5zG4BqsYShDhwr0=d5HNX=XPSi8zFw@mail.gmail.com>
From: Kristian Amlie <kristian.amlie@mender.io>
Message-ID: <72ebb167-c656-15a4-5fe9-7292c12c92c4@mender.io>
Date: Mon, 15 Aug 2016 12:25:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0LbauTnzYsW=fVkM5zG4BqsYShDhwr0=d5HNX=XPSi8zFw@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
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
X-List-Received-Date: Mon, 15 Aug 2016 10:26:04 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

On 15/08/16 11:24, Burton, Ross wrote:
> 
> On 15 August 2016 at 07:38, Kristian Amlie <kristian.amlie@mender.io
> <mailto:kristian.amlie@mender.io>> wrote:
> 
>     So, I did what you asked. Is there anything else missing?
> 
> 
> No, just wait for the krogoth maintainer to pick up the patches.

Ah, I see. Sorry for nagging! :-)

-- 
Kristian

