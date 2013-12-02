Return-Path: <sgw@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 9F6196DEE6
	for <openembedded-core@lists.openembedded.org>;
	Mon,  2 Dec 2013 22:20:27 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 02 Dec 2013 14:20:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,813,1378882800"; d="scan'208";a="418211747"
Received: from unknown (HELO [10.255.15.171]) ([10.255.15.171])
	by orsmga001.jf.intel.com with ESMTP; 02 Dec 2013 14:20:26 -0800
Message-ID: <529D07AA.204@linux.intel.com>
Date: Mon, 02 Dec 2013 14:20:26 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.1.0
MIME-Version: 1.0
To: Chong.Lu@windriver.com, openembedded-core@lists.openembedded.org
References: <1385978863-14243-1-git-send-email-Chong.Lu@windriver.com>
In-Reply-To: <1385978863-14243-1-git-send-email-Chong.Lu@windriver.com>
Subject: Re: [PATCH] lttng-ust: fixed python interpret path
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
X-List-Received-Date: Mon, 02 Dec 2013 22:20:27 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 12/02/2013 02:07 AM, Chong.Lu@windriver.com wrote:
> From: Chong Lu <Chong.Lu@windriver.com>
>
> Changed python interpreter path to avoid syntax errors caused by
> older version.
>
> Signed-off-by: Chong Lu <Chong.Lu@windriver.com>
> ---
>   ...002-lttng-ust-fixed-python-interpret-path.patch |   28 ++++++++++++++++++++
>   meta/recipes-kernel/lttng/lttng-ust_2.3.0.bb       |    1 +
>   2 files changed, 29 insertions(+)
>   create mode 100644 meta/recipes-kernel/lttng/lttng-ust/0002-lttng-ust-fixed-python-interpret-path.patch
>
This is not applying cleanly, please ensure you are rebased against 
master, as the lttng-ust recipe has been updated.

Sau!

> diff --git a/meta/recipes-kernel/lttng/lttng-ust/0002-lttng-ust-fixed-python-interpret-path.patch b/meta/recipes-kernel/lttng/lttng-ust/0002-lttng-ust-fixed-python-interpret-path.patch
> new file mode 100644
> index 0000000..abc2c4e
> --- /dev/null
> +++ b/meta/recipes-kernel/lttng/lttng-ust/0002-lttng-ust-fixed-python-interpret-path.patch
> @@ -0,0 +1,28 @@
> +From d91876870f7cda8f9bf757c73d1c287e78d4d7e0 Mon Sep 17 00:00:00 2001
> +From: Lu Chong <Chong.Lu@windriver.com>
> +Date: Mon, 2 Dec 2013 03:18:13 -0500
> +Subject: [PATCH 2/2] lttng-ust: fixed python interpret path
> +
> +Upstream-Status: Pending
> +
> +Changed python interpreter path to avoid syntax errors caused by
> +older version.
> +
> +Signed-off-by: Chong Lu <Chong.Lu@windriver.com>
> +---
> + tools/lttng-gen-tp | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/tools/lttng-gen-tp b/tools/lttng-gen-tp
> +index 0f6f0b5..dca2e28 100755
> +--- a/tools/lttng-gen-tp
> ++++ b/tools/lttng-gen-tp
> +@@ -1,4 +1,4 @@
> +-#!/usr/bin/python
> ++#!/usr/bin/env python
> + #
> + # Copyright (c)  2012 Yannick Brosseau <yannick.brosseau@gmail.com>
> + #
> +--
> +1.8.2.1
> +
> diff --git a/meta/recipes-kernel/lttng/lttng-ust_2.3.0.bb b/meta/recipes-kernel/lttng/lttng-ust_2.3.0.bb
> index cdc834c..ae2dd65 100644
> --- a/meta/recipes-kernel/lttng/lttng-ust_2.3.0.bb
> +++ b/meta/recipes-kernel/lttng/lttng-ust_2.3.0.bb
> @@ -24,6 +24,7 @@ PE = "2"
>
>   SRC_URI = "git://git.lttng.org/lttng-ust.git \
>              file://0001-lttng-ust-several-fixes.patch \
> +           file://0002-lttng-ust-fixed-python-interpret-path.patch \
>   	   "
>
>   S = "${WORKDIR}/git"
>

