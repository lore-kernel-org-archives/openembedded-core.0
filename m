Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f47.google.com (mail-qg0-f47.google.com
	[209.85.192.47])
	by mail.openembedded.org (Postfix) with ESMTP id F13016A9D4
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Sep 2014 11:40:57 +0000 (UTC)
Received: by mail-qg0-f47.google.com with SMTP id i50so2738795qgf.34
	for <openembedded-core@lists.openembedded.org>;
	Tue, 09 Sep 2014 04:40:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=t4Fwf125wTCImYTFBlhlVY6l8ZIjbrLYTAnM/SD2Los=;
	b=SRAALJdP46lP3B6ZnitZ0AiKEljO6FPEwtBFaMw/CgOkWnkCsaCz6m2YgFN6Qf1vlp
	c6Ex+7qwOHrxOBm10k7Qks/h+QRD/Oa1qe4NlzApcOi7HN3zVZ1zwcsXRZTv12c2e7zs
	CQh7OYx2+geO1dVPCrwwm6LwA1P7Kuh33sLO/93aK+1DjGiHOx8n5luhzTmf5fgWa6qE
	d536LhM5NIOk387DJyr5luODFwSfDfVumZs+12SKGQ2yvfHXuzMBGqigQS2ZyzZwXZ1r
	D2awgTyuF9t0IGYw9l9kgfmkIR5IYKvDn9iFiiU99YZccuk7SzzqyBTWCM98EI1jS+Ye
	m1Mw==
X-Gm-Message-State: ALoCoQmzRHDtzQDhHp4t4hDQw6MDj2JHwC3ZjJMgOw0uUW3yrSu6+96Gmlq4e88HBbCHBC/fWUwI
X-Received: by 10.140.40.84 with SMTP id w78mr48153546qgw.87.1410262858364;
	Tue, 09 Sep 2014 04:40:58 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.29.183 with HTTP; Tue, 9 Sep 2014 04:40:37 -0700 (PDT)
In-Reply-To: <6df082a8d4a4b54ab2967a5746b37a20dc7f6834.1410205901.git.bruce.ashfield@windriver.com>
References: <cover.1410205901.git.bruce.ashfield@windriver.com>
	<6df082a8d4a4b54ab2967a5746b37a20dc7f6834.1410205901.git.bruce.ashfield@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 9 Sep 2014 12:40:37 +0100
Message-ID: <CAJTo0LaexRywk_BscfMZKbOOA061_4BnvYrw_j4cK3eo09D8bA@mail.gmail.com>
To: Bruce Ashfield <bruce.ashfield@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/7] lttng-modules: fix compilation for 3.17-rcX
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
X-List-Received-Date: Tue, 09 Sep 2014 11:40:59 -0000
Content-Type: text/plain; charset=UTF-8

On 8 September 2014 20:55, Bruce Ashfield <bruce.ashfield@windriver.com> wrote:
> +++ b/meta/recipes-kernel/lttng/lttng-modules/Fix-noargs-probes-should-calculate-alignment-and-eve.patch
> @@ -0,0 +1,127 @@
> +From d3de7f1468be0b18145ff85b3c1a7c7fb1d48c15 Mon Sep 17 00:00:00 2001
> +From: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
> +Date: Fri, 25 Jul 2014 12:30:43 -0400
> +Subject: [PATCH 1/3] Fix: noargs probes should calculate alignment and event
> + length
> +
> +A noargs probe could have event fields. noargs just means that the probe
> +does not receive any argument as parameter. However, it could very well
> +serialize data into fields (global variables, constants, etc).
> +
> +It just happens that LTTng does not serialize any data in noargs events
> +at the moment, but this may very well change.
> +
> +The if (0) with (void) variable access strategy to stop compiler from
> +complaining from unused variables does not seem to work as expected with
> +gcc 4.9.1. Use "unused" attribute instead.
> +
> +Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>

These patches need Upstream-Status: Backport and your s-o-b.

Ross

