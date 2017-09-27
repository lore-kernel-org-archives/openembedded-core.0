Return-Path: <akuster808@gmail.com>
Received: from mail-pg0-f66.google.com (mail-pg0-f66.google.com [74.125.83.66])
	by mail.openembedded.org (Postfix) with ESMTP id 9B19B719F7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Sep 2017 03:04:38 +0000 (UTC)
Received: by mail-pg0-f66.google.com with SMTP id v5so7881649pgn.4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Sep 2017 20:04:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-transfer-encoding:content-language;
	bh=CoHTOL21Tzwo3xPWg33uHRR2/I2SHoxy2KtJ/aONTAU=;
	b=M3LSOvcLr80jK1jfiCjKoq98zaY/wqyp97coOoAp/hTk/FXDlNSMh2qGCC+mFeQy0I
	JpKRGWEmGIzDz1grnAjwNHBMH8MSYMpAXm6sypSXI7CikCDxZpxGx5bDJJsKeraZ3VPq
	l1LzTmTgzs26eJBx2NqS0gsLT+IpnjP59KACyTHSWjkrLcuQDEWr2wt4lS+F63wXbtTD
	Y2IXnbNCbBf35p2OBk5cmaqkA5+MbYZk9kSUNhtHiZDEaUelTg8RPEW1bD3wnxz+Br9K
	v+AToQudoqXRIHbsFxvhdeTtRbXDMnU+OsQ/iGMLuOfs8JhE8TpGQQvPDoW8bxzn+5w7
	3eeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=CoHTOL21Tzwo3xPWg33uHRR2/I2SHoxy2KtJ/aONTAU=;
	b=JY82kEYpfEXMrzjnqvwbZpa/PgElqo5A6cS+B/4rMe3VKhnLEw3HtneoB2RNGtNj95
	HAP666qOyZsswsATVvlnf0NgEKm5nrMvDCE0+LyXBVe7hIWB6yddX35PEOJDKm9fqbBo
	lIHtDBRVSgUfkPTMs6Y2kYaO++hOr/I3ZsRkfFNVDI2sgKHl3peRogGUlj5QcJNuRma6
	V4nD0pTA+qA86upUSQ+9M8msY/1JghQmSy41M/KSGbPUstf7cWx+QL3czNOn1eFDPV6u
	TJTWEomul6KVIqPYXLKywDx8mnHu+ed3KahRz1RUFKLjH0ha4YfYeB/hx5uOSaJKtmZs
	pe/Q==
X-Gm-Message-State: AHPjjUgePlt3bxoYqDqMP9TV5tOwy2OPsqBbsftrrbiyy3Rss3yhKNKg
	+eCbyXjOsTpWL6U6f93lxnTXHQ==
X-Google-Smtp-Source: AOwi7QBBobF3ofq+4mzQzXCXyQdKuMz+/NuY4VeToYN/Fkp3Dqz02oKeH1UvPS39FtgxZQmGSN9+fg==
X-Received: by 10.99.37.66 with SMTP id l63mr13104445pgl.348.1506481479469;
	Tue, 26 Sep 2017 20:04:39 -0700 (PDT)
Received: from ?IPv6:2601:202:4001:9ea0:f084:ad3:5bb0:9acb?
	([2601:202:4001:9ea0:f084:ad3:5bb0:9acb])
	by smtp.gmail.com with ESMTPSA id
	c82sm18087174pfe.172.2017.09.26.20.04.38
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 26 Sep 2017 20:04:39 -0700 (PDT)
To: openembedded-core@lists.openembedded.org
References: <cover.1506458497.git.paul.eggleton@linux.intel.com>
From: akuster808 <akuster808@gmail.com>
Message-ID: <8592a548-06b4-3339-fb41-809ed0876476@gmail.com>
Date: Tue, 26 Sep 2017 20:04:38 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <cover.1506458497.git.paul.eggleton@linux.intel.com>
Subject: Re: [pyro][PATCH 0/2] Backports for pyro to fix eSDK / initramfs interaction
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
X-List-Received-Date: Wed, 27 Sep 2017 03:04:38 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US

paul,


On 09/26/2017 01:42 PM, Paul Eggleton wrote:
> The following changes since commit 404a04a862a71a5a0fb1c20b6bc9fc9c8b2bb98c:
>
>   image.bbclass: Sorted ctypes to avoid basehash error (2017-09-22 17:52:58 +0100)
>
> are available in the git repository at:
>
>   git://git.openembedded.org/openembedded-core-contrib paule/pyro-esdk-initramfs-fix-oe
>   http://cgit.openembedded.org/openembedded-core-contrib/log/?h=paule/pyro-esdk-initramfs-fix-oe

thanks,
merged to staging.
- armin
> Ming Liu (1):
>   image.bbclass: drop initramfs bundle related code
>
> Paul Eggleton (1):
>   classes: drop image dependencies on TOPDIR variable
>
>  meta/classes/image.bbclass               | 12 ------------
>  meta/classes/image_types_wic.bbclass     |  2 +-
>  meta/classes/qemuboot.bbclass            |  1 +
>  meta/classes/rootfs-postcommands.bbclass |  1 +
>  4 files changed, 3 insertions(+), 13 deletions(-)
>


