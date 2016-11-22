Return-Path: <kristian.amlie@mender.io>
Received: from mail-wm0-f41.google.com (mail-wm0-f41.google.com [74.125.82.41])
	by mail.openembedded.org (Postfix) with ESMTP id 434DD6B6F7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Nov 2016 09:54:47 +0000 (UTC)
Received: by mail-wm0-f41.google.com with SMTP id u144so3121280wmu.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Nov 2016 01:54:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mender-io.20150623.gappssmtp.com; s=20150623;
	h=subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=n4GGve1UVrPMdLIEIinoN5MybhhSsZDsWUj9JOvD3M8=;
	b=IRSEALaKmiNga0KYduQ9se4Dl1LPrvLR4SC8xcFrGXiHjqBdyPNO1wdvDr2ZoAFo/r
	zSbSUWRywUnmxpUpfoXsJnxpDHPOxtCUij1/Ejff2pa/djOmFavoTkfHL1pJ1Ueye95V
	Jfx9W+L1ZSnZAvnBBqWSzVsO5N9kIOgRfljSTRe1mMfY4XvxJ9uB4ioO6o9vLV979YQm
	1KkuoPFn6aT9ZBYtGGxYRHIHlA/vUKh/j21rcWxLm3UjjNd4Gqt7wZdbG/Hqr98E2zRW
	DUJwP2N0/uyFRPrdDoMItCZ7E/5K1975AILxoHQhKsizYhRXdw+nUJW2NbsWe7SZMXhO
	wfMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:cc:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=n4GGve1UVrPMdLIEIinoN5MybhhSsZDsWUj9JOvD3M8=;
	b=lIW6Gt79lV/w4phPBYb6V2kaiahCKJMCvro6uomQqUnsYHtFbJOl2sSTGRo5HZmclW
	C8oLT0AfN64Wjlg1ef3Y6/1RHcmSxYIoOYe2PDX1MZ9p4xSF0shphCNDkSYd8+Lp/c8l
	EmhTUihtmAdHMN+jZCIQHY1gnurUT2haNTTAbIgfH/gEzVeLhZxYg4j9puHZ2uzWlaT6
	wG3UIRmVL8E9lAq3AGY8MWZQz5Dg9J0S4exbgJCMIgvy4iOJibJbZiuq1qZ9vkbap3VN
	3eWsCQEZ9xevnvQApFYntb2TH+7Iy7dd4utOX/aLUq0qoJM2wZzHjm/H5V0k2Vmc8ag/
	WlpQ==
X-Gm-Message-State: AKaTC005Cr/CnSQ/Z2Z694+uZoIjfDD8CP+tdm8OhlHVGqU/CTKcC9Nf76mK91UgWJlFsQ==
X-Received: by 10.25.125.132 with SMTP id y126mr4155372lfc.86.1479808488797;
	Tue, 22 Nov 2016 01:54:48 -0800 (PST)
Received: from [10.25.0.170] ([195.159.140.90])
	by smtp.googlemail.com with ESMTPSA id
	s63sm6185881lja.19.2016.11.22.01.54.47
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 22 Nov 2016 01:54:48 -0800 (PST)
To: Yann Dirson <yann.dirson@blade-group.com>
References: <a90e8685-f087-5ee2-888b-aa537ebd94c4@mender.io>
	<CA+4=imZLMh7di712mejxQ6qgsDSXiCOJJDbUY99YC9DoCrqrmQ@mail.gmail.com>
From: Kristian Amlie <kristian.amlie@mender.io>
Message-ID: <c89de2fa-186f-5813-35ca-5ed98957a940@mender.io>
Date: Tue, 22 Nov 2016 10:54:47 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <CA+4=imZLMh7di712mejxQ6qgsDSXiCOJJDbUY99YC9DoCrqrmQ@mail.gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: Contents of non-rootfs partitions
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
X-List-Received-Date: Tue, 22 Nov 2016 09:54:48 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

On 22/11/16 10:27, Yann Dirson wrote:
> Since usually such a data partition needs to be written at times, you'll anyway have to handle the event of it getting corrupted, and possibly have to reformat it.
> With this in mind, one option is to include default contents in your rootfs, and populate the persistent one on first boot.

That's true, and a neat solution, but I consider this somewhat orthogonal. It solves the problem at run time, whereas my proposal tries to solve it at build time. With your solution, in a dual rootfs layout situation, you're paying the space cost of the initial data partition contents three times over, once in each of the two rootfs filesystems and once in the data filesystem. Depending on whether you have logic to detect a corrupt data partition or not, this price may not be worth paying if you can have a prepopulated data partition.

It also has higher complexity, particularly integrating the population step in the boot sequence. I'm not opposed to this solution, but maybe it makes sense to start smaller?

-- 
Kristian

