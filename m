Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	by mail.openembedded.org (Postfix) with ESMTP id 7C0387F290
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Sep 2019 08:15:12 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id n10so2508959wmj.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 04 Sep 2019 01:15:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=MWiB08CiP9voxGu10t1eBQWM5kqYcY4r26mm0Ukv6Ys=;
	b=iGWgGUIq3fEKTd2viyrzb+gwnUmkDblsia4SDTX/jSKVPmZAsndxHGFwavidzYsRoT
	ah57E7JIApnUF/YFFqziY0iDhJ05ADBVxp3VtOx041mnczWoH7vQhwjtpi/30yxSZ0/+
	4VCe5w1VS/+kPy28QikSrmiBTJHiIqZcTZAOA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=MWiB08CiP9voxGu10t1eBQWM5kqYcY4r26mm0Ukv6Ys=;
	b=kCr2E1I8wfNWfC3RtsMZae2TesnZYrMXXf4tN+sVk5MGtvyEZFmj+BmLS5fMC9k9Wl
	6hbHmawMWjl8iG5UGRspTRkX5r//g7gsZPb7Xri8iTcnUaSmWlj0l7x7GauJiBMzvBZi
	sCGjamP1p0WB1CP+BjHW5y6AuomU06SV6Ce4BKKzIYlfuqidsPx5QY9xbM1I66TykWGo
	dUz1RPSMFEnTJ+U7ctthQKUxue/2qReVT1qnrGoCoEl5BvMGrRuBYLjQUF5KnUax0R9K
	HVIeNL2NKwA/ggT0KxZF6BaQgtfk29IPMQqHa3HTKNgKJg0E5UKjmxmWSdjNTtJH1UJX
	70uQ==
X-Gm-Message-State: APjAAAWPxGZewe50uD0vmAhCxjn50Bg7SMB0mNY3yIk3DogDhglX8UvM
	sPS5DJ08LnVSgLQWfx19MXM08A==
X-Google-Smtp-Source: APXvYqy1oPB4FZ0Ew+dpUY10Wn0q4qvT0WD9z2+/KD6Z4iiiBnVF6lugPovJLXYfa9EsV/VKCHDHbA==
X-Received: by 2002:a1c:e008:: with SMTP id x8mr3130452wmg.85.1567584913071;
	Wed, 04 Sep 2019 01:15:13 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	g24sm28663284wrb.35.2019.09.04.01.15.11
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 04 Sep 2019 01:15:12 -0700 (PDT)
Message-ID: <413ea6ab6c76a8a532b7d28303b54fe61f12cd99.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Changqing Li <changqing.li@windriver.com>, 
	openembedded-core@lists.openembedded.org
Date: Wed, 04 Sep 2019 09:15:11 +0100
In-Reply-To: <ef8f2598-6a4b-7087-2375-beac482e3924@windriver.com>
References: <1567485996-351404-1-git-send-email-changqing.li@windriver.com>
	<ef8f2598-6a4b-7087-2375-beac482e3924@windriver.com>
User-Agent: Evolution 3.32.2-1 
MIME-Version: 1.0
Subject: Re: [PATCH V3] dnf.py: installroot support usrmerge
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
X-List-Received-Date: Wed, 04 Sep 2019 08:15:12 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2019-09-04 at 16:04 +0800, Changqing Li wrote:
> Ping
> Test with/without  usrmege feature passed.
> With usrmerge:
> NOTE: test_dnf_installroot (dnf.DnfRepoTest)
> DEBUG: Checking if 'DISTRO_FEATURES' value contains 'usrmerge' to
> skip the test
> NOTE:  ... skipped 'Test run when not enable usrmerge'
> Test run when not enable usrmerge
> NOTE: test_dnf_installroot_usrmerge (dnf.DnfRepoTest)
> DEBUG: Checking if 'DISTRO_FEATURES' value contains 'usrmerge' to run
> the test
> DEBUG: [Running]$ ssh -l root -o UserKnownHostsFile=/dev/null -o
> StrictHostKeyChecking=no -o LogLevel=ERROR 192.168.7.16 export
> PATH=/usr/sbin:/sbin:/usr/bin:/bin; mkdir -p
> /home/root/chroot/test/etc
> ....
> 
> Without usrmerge:
> NOTE: test_dnf_installroot (dnf.DnfRepoTest)
> DEBUG: Checking if 'DISTRO_FEATURES' value contains 'usrmerge' to
> skip the test
> DEBUG: [Running]$ ssh -l root -o UserKnownHostsFile=/dev/null -o
> StrictHostKeyChecking=no -o LogLevel=ERROR 192.168.7.10 export
> PATH=/usr/sbin:/sbin:/usr/bin:/bin; mkdir -p
> /home/root/chroot/test/etc
> DEBUG: time: 1567404974.8490767, endtime: 1567406474.8424258
> DEBUG: [Command returned '0' after 0.13 seconds]
> DEBUG: Command: mkdir -p /home/root/chroot/test/etc
> Output:  
> ...
> NOTE:  ... ok
> NOTE: test_dnf_installroot_usrmerge (dnf.DnfRepoTest)
> DEBUG: Checking if 'DISTRO_FEATURES' value contains 'usrmerge' to run
> the test
> NOTE:  ... skipped 'Test run when enable usrmege'
> Test run when enable usrmege

In a previous version of this patch, it introduced a failure in the
parselogs test as an error was generated into the logs. I haven't
tested the new version of the patch, was that issue addressed?

Cheers,

Richard



