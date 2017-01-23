Return-Path: <freesilicon@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id 01A9E73212
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Jan 2017 15:45:59 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id r126so27307023wmr.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Jan 2017 07:46:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=sX6ycMiEBWnLBT/mXvwPqyBKRewiAOtbe7dzq8A2MJE=;
	b=g6VQN5P/TcodQQR6DKgeVMEjse+wmLD+M/SZoAReQHVpw05ihS5HbS4H7mT66zRwuK
	KUjaHZK288JXyovnqT5ZTtuzOVWwXAD+2Jr9OISyE0CsIa5+KfeUD7Kly5UJ7LjvkhUh
	fx2jx9DSx9xKRrom+o15am8sswA/swNvhD+w+zcVKush7A24Ax7hO4KaWo/DHtv6zy9T
	VWFSwiqwDcfwZ7Y3gC+JoGddkUnD0BSWzIrrgIktp7vPnD4vdC/sPU3c8omB1MKqFUyF
	KanyRJGa+vfaQdfthug8q56zZ5FR3lNPyGHEZFON7v5AHkTubrgBqQ2LTyZThahDu9kJ
	RHlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=sX6ycMiEBWnLBT/mXvwPqyBKRewiAOtbe7dzq8A2MJE=;
	b=HM75BA37UNbsgl46BP0CASlOKgbtGJN6AW8Xj7NI+NlJcr/gLekVs69QzQYSNEhkX8
	0Pk/cdoygS0m0wAwMIvHeIt168S7EUjCWYqXHcNsFQM3mfcp9OnL1qd0wB90j0kE9dKh
	xg6beRHvqc6OJlhQD8bJ6R2Jzbcq4IZA9d3wfvkbd3XAg46bokD0CUPeTEdknfCi9nqc
	7d8qraHY3nMWlUdEE8uknh6M+T8HGhuqyWxjMpy1551Q6owCfdp5cOh4b5m6/OCQkVGa
	tZpemxjle4rirhAXs6/MjG6Izz5JMpws7HzmBc4PPQ2B6L2K/+QFy/QysVMVJ+KLZNM+
	OFXQ==
X-Gm-Message-State: AIkVDXJ09qMf/b6Dt+WIKfy96N6iHogdI52JKGA+lONd88jy5caaL+tBJyUbT4tNO9O7wA==
X-Received: by 10.223.169.114 with SMTP id u105mr24182989wrc.173.1485186358751;
	Mon, 23 Jan 2017 07:45:58 -0800 (PST)
Received: from crde-port-20.cahors.local ([185.47.80.46])
	by smtp.gmail.com with ESMTPSA id
	w18sm4049207wme.18.2017.01.23.07.45.58
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 23 Jan 2017 07:45:58 -0800 (PST)
From: David Vincent <freesilicon@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 23 Jan 2017 16:45:53 +0100
Message-ID: <4532053.H3eoubo94G@crde-port-20.cahors.local>
In-Reply-To: <20170123152336.23276.57694@do.openembedded.org>
References: <20170123145508.9252-1-freesilicon@gmail.com>
	<20170123152336.23276.57694@do.openembedded.org>
MIME-Version: 1.0
Subject: =?UTF-8?B?UmU6IOKclyBwYXRjaHRlc3Q6IGZhaWx1cmUgZm9yIG9wZW5zc2g6IE1ha2Ugc3NoZC1jb25maWcgYSBwYWNrYWdl?=
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
X-List-Received-Date: Mon, 23 Jan 2017 15:46:04 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="UTF-8"

On lundi 23 janvier 2017 15:23:36 CET Patchwork wrote:
> == Series Details ==
> 
> Series: openssh: Make sshd-config a package
> Revision: 1
> URL   : https://patchwork.openembedded.org/series/4904/
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
> * Issue             Series does not apply on top of target branch
> [test_series_merge_on_head] Suggested fix    Rebase your series on top of
> targeted branch
>   Targeted branch  master (currently at 842ad404b3)
> 
> 
> 
> If you believe any of these test results are incorrect, please reply to the
> mailing list (openembedded-core@lists.openembedded.org) raising your
> concerns. Otherwise we would appreciate you correcting the issues and
> submitting a new version of the patchset if applicable. Please ensure you
> add/increment the version number when sending the new version (i.e. [PATCH]
> -> [PATCH v2] -> [PATCH v3] -> ...).
> 
> ---
> Test framework: http://git.yoctoproject.org/cgit/cgit.cgi/patchtest
> Test suite:     http://git.yoctoproject.org/cgit/cgit.cgi/patchtest-oe

This result seems to be an error since I rebased my patches on top of current 
HEAD before submitting it. I just checked again to see if some other patches 
were left behind but my branch is currently up-to-date.

David


