Return-Path: <jonathan.rajotte-julien@efficios.com>
Received: from mail.efficios.com (mail.efficios.com [167.114.26.124])
	by mail.openembedded.org (Postfix) with ESMTP id 4D4857FAB7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Jan 2020 16:59:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mail.efficios.com (Postfix) with ESMTP id 493C02601E9;
	Mon, 27 Jan 2020 11:59:49 -0500 (EST)
Received: from mail.efficios.com ([127.0.0.1])
	by localhost (mail03.efficios.com [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id jZG6v9wwO99K; Mon, 27 Jan 2020 11:59:48 -0500 (EST)
Received: from localhost (localhost [127.0.0.1])
	by mail.efficios.com (Postfix) with ESMTP id C3978260803;
	Mon, 27 Jan 2020 11:59:48 -0500 (EST)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.efficios.com C3978260803
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=efficios.com;
	s=default; t=1580144388;
	bh=Ql7FjPzAlyB1FjsNerklgy7q37nrpOdMehc+aY5bP9M=;
	h=Date:From:To:Message-ID:MIME-Version;
	b=qR4DOIDGziW30mUuEIKGjP4FkjKHyi8SKBb4QcEtorJtTUVybGXpVUQ9JkfpHDjq0
	8Ehqjt1vuNS9520I7Sb8XAx5jo0W3hOJgySnuTLAIqWi06opHcaJHoQtaO/Yes/Kct
	LpJHNwcjGWlzAgWO0Objt+4UAywE9Hg1/j24cuAgWXjRh3OZbsgOgM2LRGBrP/EWb2
	4SqKjvOO2jE6aGKaZXL3Jol9uqMrD5bQNt7BfxQF7yubumiNk7P73dCLTsDYia0NCh
	s6DskqSrCscTIpFlbyoX0XaJa+IOd3ppZZh3+JD1ZL70iWYt+YBRIe8QUOq35OJYg+
	PfNajZjzLIE/Q==
X-Virus-Scanned: amavisd-new at efficios.com
Received: from mail.efficios.com ([127.0.0.1])
	by localhost (mail03.efficios.com [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id i8JkTKg-V5EO; Mon, 27 Jan 2020 11:59:48 -0500 (EST)
Received: from joraj-alpa
	(CPEbc4dfb40f613-CMbc4dfb40f610.cpe.net.cable.rogers.com
	[174.118.12.38])
	by mail.efficios.com (Postfix) with ESMTPSA id 6E512260800;
	Mon, 27 Jan 2020 11:59:48 -0500 (EST)
Date: Mon, 27 Jan 2020 11:59:46 -0500
From: Jonathan Rajotte-Julien <jonathan.rajotte-julien@efficios.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Message-ID: <20200127165946.GB819@joraj-alpa>
References: <20200127141908.84922-1-alex.kanavin@gmail.com>
	<20200127141908.84922-9-alex.kanavin@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20200127141908.84922-9-alex.kanavin@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 9/9] lttng-tools: disable tests that sporadically fail
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
X-List-Received-Date: Mon, 27 Jan 2020 16:59:49 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,
On Mon, Jan 27, 2020 at 03:19:08PM +0100, Alexander Kanavin wrote:

> Upstream is aware, and will investigate and fix.

For reference: https://bugs.lttng.org/issues/1217

Acked-by: Jonathan Rajotte-Julien <jonathan.rajotte-julien@efficios.com>

> 
> Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> ---
>  ...ression-disable-the-tools-live-tests.patch | 29 +++++++++++++++++++
>  .../lttng/lttng-tools_2.11.0.bb               |  1 +
>  2 files changed, 30 insertions(+)
>  create mode 100644 meta/recipes-kernel/lttng/lttng-tools/0001-tests-regression-disable-the-tools-live-tests.patch
> 
> diff --git a/meta/recipes-kernel/lttng/lttng-tools/0001-tests-regression-disable-the-tools-live-tests.patch b/meta/recipes-kernel/lttng/lttng-tools/0001-tests-regression-disable-the-tools-live-tests.patch
> new file mode 100644
> index 00000000000..a558a0993f9
> --- /dev/null
> +++ b/meta/recipes-kernel/lttng/lttng-tools/0001-tests-regression-disable-the-tools-live-tests.patch
> @@ -0,0 +1,29 @@
> +From 5f0ef3e007ed83c1ce7ae817308e5942decc1230 Mon Sep 17 00:00:00 2001
> +From: Alexander Kanavin <alex.kanavin@gmail.com>
> +Date: Fri, 24 Jan 2020 18:03:25 +0100
> +Subject: [PATCH] tests/regression: disable the tools/live tests
> +
> +They have been found to sporadically fail; the issue has been
> +reported upstream and they will work to investigate and fix:
> +https://bugs.lttng.org/issues/1217
> +
> +Upstream-Status: Inappropriate [upstream is working on a real fix]
> +Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> +---
> + tests/regression/Makefile.am | 3 ---
> + 1 file changed, 3 deletions(-)
> +
> +diff --git a/tests/regression/Makefile.am b/tests/regression/Makefile.am
> +index 73eb9f7..92fc18f 100644
> +--- a/tests/regression/Makefile.am
> ++++ b/tests/regression/Makefile.am
> +@@ -9,9 +9,6 @@ TESTS = tools/filtering/test_invalid_filter \
> + 	tools/filtering/test_valid_filter \
> + 	tools/streaming/test_ust \
> + 	tools/health/test_thread_ok \
> +-	tools/live/test_ust \
> +-	tools/live/test_ust_tracefile_count \
> +-	tools/live/test_lttng_ust \
> + 	tools/tracefile-limits/test_tracefile_count \
> + 	tools/tracefile-limits/test_tracefile_size \
> + 	tools/exclusion/test_exclusion \
> diff --git a/meta/recipes-kernel/lttng/lttng-tools_2.11.0.bb b/meta/recipes-kernel/lttng/lttng-tools_2.11.0.bb
> index 639d4b62114..9cb896314b8 100644
> --- a/meta/recipes-kernel/lttng/lttng-tools_2.11.0.bb
> +++ b/meta/recipes-kernel/lttng/lttng-tools_2.11.0.bb
> @@ -33,6 +33,7 @@ SRC_URI = "https://lttng.org/files/lttng-tools/lttng-tools-${PV}.tar.bz2 \
>             file://0001-tests-do-not-strip-a-helper-library.patch \
>             file://run-ptest \
>             file://lttng-sessiond.service \
> +           file://0001-tests-regression-disable-the-tools-live-tests.patch \
>             "
>  
>  SRC_URI[md5sum] = "e6c23244a36e2a09783d03a362eb63cb"
> -- 
> 2.17.1
> 
> -- 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

-- 
Jonathan Rajotte-Julien
EfficiOS

