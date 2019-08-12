Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com
	[209.85.208.170])
	by mail.openembedded.org (Postfix) with ESMTP id 7ED4A7E584
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Aug 2019 13:40:56 +0000 (UTC)
Received: by mail-lj1-f170.google.com with SMTP id e27so3178469ljb.7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Aug 2019 06:40:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding:content-language;
	bh=GRklEIyyt+7FnwdkEJ/XCStt2xawgCNp5G2+PxWHxD8=;
	b=N+tHzEcmMM74KeefmIqFJjnffM78JQHI4yTEeqp7wkSMl04szW6ivjSBrOfWCL6NBf
	YV0mqWy1qrFc6H4hi0fNUllX6k21IMG1ENuM+uQE+UkOjfnL2FzMqXC2Ihb8b+cqXVsZ
	r/7uZGehcjBuBM5xVOS0focxODPtbcHkAROYiqEZAHid1Nq4N4QBph5iUWq1m7MCwl2/
	VuySKFZMncYBhlu0KRCLNfS0V5Yvm+8xUmLGvrtRwCVjdWOvAbs5owePQ+KVTZ6gqgoD
	64pc94X3/pNjmiNOt1nK1ypyknEFgNDS+qFNfISIGAGSrXRB9DvTnrRvySposPgTeNEw
	jxDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=GRklEIyyt+7FnwdkEJ/XCStt2xawgCNp5G2+PxWHxD8=;
	b=gw/Kz6i15UJzGEwe3pLzCTGm1jNnOkNlTBm9OozbfhWcmrBc47INWXjX7hwi3Ldoyb
	mzrWTsL1ueGGyI8YDH9+P3nOFDAiFhYFmHeCva3SJrUgvHxAqvVzhYjtRZv4ND6MFEL5
	1K9OP7CuUNjf1be8R8/7Weu5MLPyUTPOOzNvehu3GG/0aFs/U0ihoLdVjrFXLTSNanQb
	VoK4+Fh23OIyJhywNhYYopzYLLz27Iux+GiY9m+soaAYzjWY5De53jsZAUqjVvJJTekW
	i5uPRd23kf0Jt3fU8t3fEkM+4X3Gp2LPtRfG2cXusZldFl2fj/tQB/RWWCi5LmeSzLmT
	M8Rw==
X-Gm-Message-State: APjAAAXPIAqnICLzpEKFbmp1zcQufjp1rR3bM54Y0eSyQaceakaVK4X+
	Tb1njGZKueAguBTUHwM+51BqYw==
X-Google-Smtp-Source: APXvYqxiWOuVBbahSDqth8AnalVWFQqvNSKbXa3yj2jffCju9zjmJ7uKPJBlMFsWYuCVsqw8RR5CeQ==
X-Received: by 2002:a2e:6c0d:: with SMTP id h13mr7263035ljc.181.1565617256933; 
	Mon, 12 Aug 2019 06:40:56 -0700 (PDT)
Received: from [192.168.0.8] (c83-252-117-108.bredband.comhem.se.
	[83.252.117.108]) by smtp.gmail.com with ESMTPSA id
	f17sm5092339lfa.67.2019.08.12.06.40.56
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 12 Aug 2019 06:40:56 -0700 (PDT)
To: nick83ola <nick83ola@gmail.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <CABPh3UMS8VN9BkeX5iVD5vEgnc4XrSbesE1zp8Z4ouXudSU3ew@mail.gmail.com>
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Message-ID: <4c4a42ae-ca41-47cc-d555-7648f8067c69@oleksandr-kravchuk.com>
Date: Mon, 12 Aug 2019 15:40:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CABPh3UMS8VN9BkeX5iVD5vEgnc4XrSbesE1zp8Z4ouXudSU3ew@mail.gmail.com>
Subject: Re: [BUG] patch linux-firmware: bump to 20190618 breaks package index
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
X-List-Received-Date: Mon, 12 Aug 2019 13:40:56 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Hi Nicola,

How do I reproduce this? It builds fine for me.

On 12/08/2019 15:38, nick83ola wrote:
> Hi all
> after this patch I got a ton of errors regarding Package version went backwards
>
> Cheers
> Nicola Lunghi
>
> ERROR: linux-firmware-20190618-r0 do_packagedata: QA Issue: Package
> version for package linux-firmware-src went backwards which would
> break package feeds from (1:0.0+git0+711d3297ba-r0 to 0:20190618-r0)
> [version-going-backwards]
> ERROR: linux-firmware-20190618-r0 do_packagedata: QA Issue: Package
> version for package linux-firmware-dbg went backwards which would
> break package feeds from (1:0.0+git0+711d3297ba-r0 to 0:20190618-r0)
> [version-going-backwards]
> ERROR: linux-firmware-20190618-r0 do_packagedata: QA Issue: Package
> version for package linux-firmware-ralink-license went backwards which
> would break package feeds from (1:0.0+git0+711d3297ba-r0 to
> 0:20190618-r0) [version-going-backwards]
> ERROR: linux-firmware-20190618-r0 do_packagedata: QA Issue: Package
> version for package linux-firmware-ralink went backwards which would
> break package feeds from (1:0.0+git0+711d3297ba-r0 to 0:20190618-r0)
> [version-going-backwards]
> ERROR: linux-firmware-20190618-r0 do_packagedata: QA Issue: Package
> version for package linux-firmware-mt7601u-license went backwards
> which would break package feeds from (1:0.0+git0+711d3297ba-r0 to
> 0:20190618-r0) [version-going-backwards]
> ERROR: linux-firmware-20190618-r0 do_packagedata: QA Issue: Package
> version for package linux-firmware-mt7601u went backwards which would
> break package feeds from (1:0.0+git0+711d3297ba-r0 to 0:20190618-r0)
> [version-going-backwards]
> ERROR: linux-firmware-20190618-r0 do_packagedata: QA Issue: Package
> version for package linux-firmware-radeon-license went backwards which
> would break package feeds from (1:0.0+git0+711d3297ba-r0 to
> 0:20190618-r0) [version-going-backwards]
> ERROR: linux-firmware-20190618-r0 do_packagedata: QA Issue: Package
> version for package linux-firmware-radeon went backwards which would
> break package feeds from (1:0.0+git0+711d3297ba-r0 to 0:20190618-r0)
> [version-going-backwards]
> ERROR: linux-firmware-20190618-r0 do_packagedata: QA Issue: Package
> version for package linux-firmware-marvell-license went backwards
> which would break package feeds from (1:0.0+git0+711d3297ba-r0 to
> 0:20190618-r0) [version-going-backwards]
> ERROR: linux-firmware-20190618-r0 do_packagedata: QA Issue: Package
> version for package linux-firmware-pcie8897 went backwards which would
> break package feeds from (1:0.0+git0+711d3297ba-r0 to 0:20190618-r0)
> [version-going-backwards]
> ERROR: linux-firmware-20190618-r0 do_packagedata: QA Issue: Package
> version for package linux-firmware-pcie8997 went backwards which would
> break package feeds from (1:0.0+git0+711d3297ba-r0 to 0:20190618-r0)
> [version-going-backwards]
> ERROR: linux-firmware-20190618-r0 do_packagedata: QA Issue: Package
> version for package linux-firmware-sd8686 went backwards which would
> break package feeds from (1:0.0+git0+711d3297ba-r0 to 0:20190618-r0)
> [version-going-backwards]
> ERROR: linux-firmware-20190618-r0 do_packagedata: QA Issue: Package
> version for package linux-firmware-sd8688 went backwards which would
> break package feeds from (1:0.0+git0+711d3297ba-r0 to 0:20190618-r0)
> [version-going-backwards]
> ERROR: linux-firmware-20190618-r0 do_packagedata: QA Issue: Package
> version for package linux-firmware-sd8787 went backwards which would
> break package feeds from (1:0.0+git0+711d3297ba-r0 to 0:20190618-r0)
> [version-going-backwards]
> ERROR: linux-firmware-20190618-r0 do_packagedata: QA Issue: Package
> version for package linux-firmware-sd8797 went backwards which would
> break package feeds from (1:0.0+git0+711d3297ba-r0 to 0:20190618-r0)
> [version-going-backwards]
> ERROR: linux-firmware-20190618-r0 do_packagedata: QA Issue: Package
> version for package linux-firmware-sd8801 went backwards which would
> break package feeds from (1:0.0+git0+711d3297ba-r0 to 0:20190618-r0)
> [version-going-backwards]
> ERROR: linux-firmware-20190618-r0 do_packagedata: QA Issue: Package
> version for package linux-firmware-sd8887 went backwards which would
> break package feeds from (1:0.0+git0+711d3297ba-r0 to 0:20190618-r0)
> [version-going-backwards]
> ERROR: linux-firmware-20190618-r0 do_packagedata: QA Issue: Package
> version for package linux-firmware-sd8897 went backwards which would
> break package feeds from (1:0.0+git0+711d3297ba-r0 to 0:20190618-r0)
> [version-going-backwards]
> ERROR: linux-firmware-20190618-r0 do_packagedata: QA Issue: Package
> version for package linux-firmware-usb8997 went backwards which would
> break package feeds from (1:0.0+git0+711d3297ba-r0 to 0:20190618-r0)
> [version-going-backwards]
> ERROR: linux-firmware-20190618-r0 do_packagedata: QA Issue: Package
> version for package linux-firmware-ti-connectivity-license went
> backwards which would break package feeds from
> (1:0.0+git0+711d3297ba-r0 to 0:20190618-r0) [version-going-backwards]
> ERROR: linux-firmware-20190618-r0 do_packagedata: QA Issue: Package
> version for package linux-firmware-wlcommon went backwards which would
> break package feeds from (1:0.0+git0+711d3297ba-r0 to 0:20190618-r0)
> [version-going-backwards]
> ERROR: linux-firmware-20190618-r0 do_packagedata: QA Issue: Package
> version for package linux-firmware-wl12xx went backwards which would
> break package feeds from (1:0.0+git0+711d3297ba-r0 to 0:20190618-r0)
> [version-going-backwards]
> ERROR: linux-firmware-20190618-r0 do_packagedata: QA Issue: Package
> version for package linux-firmware-wl18xx went backwards which would
> break package feeds from (1:0.0+git0+711d3297ba-r0 to 0:20190618-r0)
> [version-going-backwards]
> ERROR: linux-firmware-20190618-r0 do_packagedata: QA Issue: Package
> version for package linux-firmware-vt6656-license went backwards which
> would break package feeds from (1:0.0+git0+711d3297ba-r0 to
> 0:20190618-r0) [version-going-backwards]

