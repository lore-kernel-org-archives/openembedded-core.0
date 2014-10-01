Return-Path: <ross.burton@intel.com>
Received: from mail-qc0-f172.google.com (mail-qc0-f172.google.com
	[209.85.216.172])
	by mail.openembedded.org (Postfix) with ESMTP id 1AFB260809
	for <openembedded-core@lists.openembedded.org>;
	Wed,  1 Oct 2014 20:24:15 +0000 (UTC)
Received: by mail-qc0-f172.google.com with SMTP id o8so1092074qcw.31
	for <openembedded-core@lists.openembedded.org>;
	Wed, 01 Oct 2014 13:24:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=zliWgNJCVzSNjnQfQD141iXLTxwP7lfDd2gkDf9IDmg=;
	b=HUvHaW8jDpL37dcXT8GHKq2dUVC6wrodXG14XTcR5R042iLHNxmQ337cMOUeJyX5Mb
	P6Q47XITwYub2FnEAN82msjTl4NnEhP9S1xfkgpPh2/rQWJzO10GTPb1wD2qvvCcv6jY
	7ecKotAVGYO0eZBIwZRxbw3ResuN8V9EI6289fcfFLEgJqlH63+dnXTmaP8tHldDyEbm
	lVCSmmTe8Y9vyrsV8NepvFMgcQ+OlxU4ZWdjDZGRwq0K5d9k5mwjJXmfEgB1DEtiNuYu
	Kqbsdpg6VHN/EvpcI3pXYPpCSg5xfHdpL/RWbebFY+jxF7f+Z7T6B52nF9Hj3XGrq4g9
	wJlQ==
X-Gm-Message-State: ALoCoQm76QLuSDaatDndk6bt507dnVP/feL2hoHpHjt5Km560nBrB1e7bIy/L+SP5Ep/kYAYemvX
X-Received: by 10.224.63.140 with SMTP id b12mr59824645qai.22.1412195056665;
	Wed, 01 Oct 2014 13:24:16 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.34.180 with HTTP; Wed, 1 Oct 2014 13:23:56 -0700 (PDT)
In-Reply-To: <1412179063.17658.25.camel@ted>
References: <1412179063.17658.25.camel@ted>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 1 Oct 2014 21:23:56 +0100
Message-ID: <CAJTo0LZqXQU3mUKmS-EgpKBf-7xrsbeVNZ3=AgvMgNR-sUbXcw@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] oeqa/parselogs: Ignore qemu usbhid errors
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
X-List-Received-Date: Wed, 01 Oct 2014 20:24:25 -0000
Content-Type: text/plain; charset=UTF-8

On 1 October 2014 16:57, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> +    'usbhid .*: can't add hid device:',

The apostrophe in "can't" needs escaping.  In related news, the
autobuilder isn't in a happy place.

Ross

