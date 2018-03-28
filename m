Return-Path: <twoerner@gmail.com>
Received: from mail-io0-f169.google.com (mail-io0-f169.google.com
	[209.85.223.169])
	by mail.openembedded.org (Postfix) with ESMTP id 20856784E2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Mar 2018 17:56:07 +0000 (UTC)
Received: by mail-io0-f169.google.com with SMTP id e79so4540622ioi.7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Mar 2018 10:56:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=0rH2MRDSci2c6v4sWEa51F0GNRCNMsYrDphm0TLNnWc=;
	b=vhhqcfHfiBzAD/MkpE8CaX6RHXS1iyKDmAiHgpul2kt6ORmWE0scy+CU2B8INz1Qqm
	pKR0mpYWiP47oVozdJbVUkaQ6r4E27ZOdHkuvhQcWYp2d/G84Wg4h5kEVR1fQHFxvCMv
	oUh4KhIq9Wy/5AG6b51l7m5Rjgpr00G+4nCVAb6OYh2R+DqXdBV/OVCeTTjk0ckZ1EkQ
	PplMR0Ds3D4tfjQWJ5UPSmtGgKTCtPrFnu1NcnwP22jZRc7CflHBGalNpjuMiLtfahFI
	kqo+tea+bl877G/rO65uqafLmjnEAiIUTA09WO53gFNmmm7ySoYHQTi+dPoOK9yZULww
	miVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=0rH2MRDSci2c6v4sWEa51F0GNRCNMsYrDphm0TLNnWc=;
	b=Ebk1YZ2QkcPt+0oD7koOEetugF3hBfiTCEyt55E0qREXaQWL7A6upQARWx2yghba6M
	YGQ6eHa7krbeE1pe+1IaT9E4qsCa77lReFKg0KuOBm0fqL9kYQRc9jaAfzcxmZYPh/+h
	qec3/dCUH6WtWKDswsqm0m0I80/etUZBgLnFhENRtHDTrXwKyJgXORxyReI2DSZ+g0as
	+FWjRsfdFuZNrGjcZCruKWmSBv7UHSYKS6equhAs4YWaCvmXYXSnkjEnpK+zBgFgzPCZ
	SiRB3w/2UoAHBHvUk3IBsObIpyHbOy7Pnw+5M5s2NDcvMBd9qwKumjGBQ4W7/YZ3jBgC
	e4VA==
X-Gm-Message-State: AElRT7GFJeqy9AZA1K7l3BrUopsYFLDjsj0L9nWhMBvIfDEZzlXuHzQe
	kL/phuQRxk/N4c8pxF/x103PmMFd
X-Google-Smtp-Source: AIpwx4+YaF1N5ady/DAXJA22AoEVvJla+KlmhH0/1cazacfuC/z2rnPzlkmpthQ+k2NKnvNexd8Png==
X-Received: by 10.107.143.211 with SMTP id r202mr17868804iod.185.1522259768458;
	Wed, 28 Mar 2018 10:56:08 -0700 (PDT)
Received: from linux-uys3 ([206.248.190.95]) by smtp.gmail.com with ESMTPSA id
	p68-v6sm17998itc.13.2018.03.28.10.56.06
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 28 Mar 2018 10:56:07 -0700 (PDT)
Date: Wed, 28 Mar 2018 13:56:05 -0400
From: Trevor Woerner <twoerner@gmail.com>
To: openembedded-core@lists.openembedded.org
Message-ID: <20180328175605.GA3400@linux-uys3>
References: <20180328152809.GA11111@linux-uys3>
MIME-Version: 1.0
In-Reply-To: <20180328152809.GA11111@linux-uys3>
User-Agent: Mutt/1.6.0 (2016-04-01)
Subject: Re: host kernel BUGs while building
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
X-List-Received-Date: Wed, 28 Mar 2018 17:56:08 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Wed 2018-03-28 @ 11:28:09 AM, Trevor Woerner wrote:
> Since this past December (December 18, 2017),
> ...
> Looking through my logs
> they appear to have stopped Mar 23 2018.

Reviewing my distro's package installer logs (/var/log/zypp/history):

	# 2017-11-19 20:39:29 kernel-default-4.4.92-31.1.x86_64.rpm installed ok
	2017-11-19 20:39:29|install|kernel-default|4.4.92-31.1|x86_64|4348:ruby|download.opensuse.org-oss_1|5ab33a00bdccd653b2f1fa1a31d4e4339911e0295a67f177ccf3f898b3b564f3|
	# 2017-12-18 10:01:05 kernel-default-4.4.103-36.1.x86_64.rpm installed ok
	2017-12-18 10:01:05|install|kernel-default|4.4.103-36.1|x86_64||download.opensuse.org-oss_1|7fb7db4fe0c291b02e4e6fd3c637a8f6de51afb8f916f68d9a91474ea8eebc4b|
	# 2018-01-05 09:01:32 kernel-default-4.4.104-39.1.x86_64.rpm installed ok
	2018-01-05 09:01:32|install|kernel-default|4.4.104-39.1|x86_64||download.opensuse.org-oss_1|43b2353f01ce8a5b026c9088861eecf65c5311f9f4b595c047c48d43e67c2003|
	# 2018-02-09 11:28:56 kernel-default-4.4.114-42.1.x86_64.rpm installed ok
	2018-02-09 11:28:56|install|kernel-default|4.4.114-42.1|x86_64||download.opensuse.org-oss_1|8c30a670135d89de0bd9a253909b9d97954e443aa232de199196984f631f7f5c|
	# 2018-03-23 23:51:47 kernel-default-4.4.120-45.1.x86_64.rpm installed ok
	2018-03-23 23:51:47|install|kernel-default|4.4.120-45.1|x86_64||download.opensuse.org-oss_1|ecb140c1d5c05476926799cae0abbf83e53c8698383ac43afb5b05bc732dbd3a|

So I see that at 10:01am on Dec 18 my host's kernel was updated from
4.4.92-31.1 to 4.4.103-36.1; later that same day the BUGs started.

On Mar 23 my last BUG occurred at 4:30pm, at 11:51pm my host's kernel was
updated from 4.4.114-42.1 to 4.4.120-45.1; I haven't seen any BUGs since.

