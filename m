Return-Path: <Nathan_Lynch@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id 71E0C73232
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Sep 2015 22:45:44 +0000 (UTC)
Received: from svr-orw-fem-05.mgc.mentorg.com ([147.34.97.43])
	by relay1.mentorg.com with esmtp 
	id 1ZaAbA-00077s-K4 from Nathan_Lynch@mentor.com ;
	Thu, 10 Sep 2015 15:45:44 -0700
Received: from wedge.localnet (147.34.91.1) by svr-orw-fem-05.mgc.mentorg.com
	(147.34.97.43) with Microsoft SMTP Server id 14.3.224.2;
	Thu, 10 Sep 2015 15:45:43 -0700
To: <jianchuan.wang@windriver.com>
References: <1436509992-20896-1-git-send-email-jianchuan.wang@windriver.com>
From: Nathan Lynch <Nathan_Lynch@mentor.com>
Message-ID: <55F20815.6000403@mentor.com>
Date: Thu, 10 Sep 2015 17:45:41 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.1.0
MIME-Version: 1.0
In-Reply-To: <1436509992-20896-1-git-send-email-jianchuan.wang@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] lttng: Fix timer calculation error
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
X-List-Received-Date: Thu, 10 Sep 2015 22:45:46 -0000
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit

On 07/10/2015 01:33 AM, jianchuan.wang@windriver.com wrote:
> --- /dev/null
> +++ b/meta/recipes-kernel/lttng/lttng-tools/lttng-tools-Fix-live-timer-calculation-error.patch
> @@ -0,0 +1,42 @@
> +From 161496fbe1465817a77a50a1172734dae81a13ef Mon Sep 17 00:00:00 2001
> +From: Mikael Beckius <mikael.beckius@windriver.com>
> +Date: Tue, 12 May 2015 11:11:48 +0200
> +Subject: [PATCH] lttng-tools: Fix live timer calculation error
> +
> +There is an calculation error for live timer. Variable switch_timer_interval is
> +based on microsecond, and it is not right to assign switch_timer_interval mod
> +1000000 to var tv_nsec which is based on nanosecond.
> +
> +Upstream-Status: Pending

[...]

> --- /dev/null
> +++ b/meta/recipes-kernel/lttng/lttng-ust/lttng-ust-Fix-live-timer-calculation-error.patch
> @@ -0,0 +1,42 @@
> +From 6d02a6c1aeb1d050ffe7c6624bab9acfa76fc05f Mon Sep 17 00:00:00 2001
> +From: Mikael Beckius <mikael.beckius@windriver.com>
> +Date: Tue, 12 May 2015 11:04:34 +0200
> +Subject: [PATCH] lttng-ust:Fix live timer calculation error
> +
> +There is an calculation error for live timer. Variable chan->switch_timer_interval is
> +based on microsecond, and it is not right to assign chan->switch_timer_interval mod
> +1000000 to var tv_nsec which is based on nanosecond.
> +
> +Upstream-Status: Pending

Have these patches been submitted to LTTng upstream? I'm not finding
them on lttng-dev.

They look like real fixes that aren't OE-specific.


