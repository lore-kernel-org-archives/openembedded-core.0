Return-Path: <jonathan.rajotte-julien@efficios.com>
Received: from mail.efficios.com (mail.efficios.com [167.114.26.124])
	by mail.openembedded.org (Postfix) with ESMTP id 3084261B10
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Mar 2020 14:25:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mail.efficios.com (Postfix) with ESMTP id B4358280F4A;
	Thu, 12 Mar 2020 10:25:25 -0400 (EDT)
Received: from mail.efficios.com ([127.0.0.1])
	by localhost (mail03.efficios.com [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id XqZcj9ZoKXHW; Thu, 12 Mar 2020 10:25:25 -0400 (EDT)
Received: from localhost (localhost [127.0.0.1])
	by mail.efficios.com (Postfix) with ESMTP id 712EB2811C7;
	Thu, 12 Mar 2020 10:25:25 -0400 (EDT)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.efficios.com 712EB2811C7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=efficios.com;
	s=default; t=1584023125;
	bh=glsLV3yLwoLPeUeP5570wgQaa7GgoyY9/ZHzNs8I8aw=;
	h=Date:From:To:Message-ID:MIME-Version;
	b=uejZTfOlW09ixp3u/lHTpalccSSZUj9gaUy1lowlpoiQ0ulvORj6uh8hpxlykprrl
	niXu2Ut+Ikar0Qc6DSX9XIW6bOKaJ1Nkco4ZU2nutmZzoj3CEquyDOxyWWGIwm6xAV
	2CZ4jh6l7StOHcu2Ji2D8pYbpSm83hFjeiSmNqnJqqXYYmE8hhdjOKF1dvzKP7PDUE
	PLF1p7eDfQl+Amoquehue8fcEZNWo0UvBJtFmfi4R+rCDhlem+J9OPz1xxdCKsDq99
	LshPK4Q6Ftwt0GHYe+jRssDLB6yhGsmIIfqA9oIAi+2QlKSgUr2/pE/LlqozGOTfmB
	2BFW3lDhsBRVw==
X-Virus-Scanned: amavisd-new at efficios.com
Received: from mail.efficios.com ([127.0.0.1])
	by localhost (mail03.efficios.com [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id N2c2DtV8YctW; Thu, 12 Mar 2020 10:25:25 -0400 (EDT)
Received: from joraj-alpa (192-222-181-218.qc.cable.ebox.net [192.222.181.218])
	by mail.efficios.com (Postfix) with ESMTPSA id 50A3528112B;
	Thu, 12 Mar 2020 10:25:25 -0400 (EDT)
Date: Thu, 12 Mar 2020 10:25:24 -0400
From: Jonathan Rajotte-Julien <jonathan.rajotte-julien@efficios.com>
To: "Jeremy A. Puhlman" <jpuhlman@mvista.com>
Message-ID: <20200312142524.GB30953@joraj-alpa>
References: <20200311222249.29880-1-jpuhlman@mvista.com>
MIME-Version: 1.0
In-Reply-To: <20200311222249.29880-1-jpuhlman@mvista.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/2] babletrace2: make manpages multilib identical
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
X-List-Received-Date: Thu, 12 Mar 2020 14:25:25 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi

Is this something upstream (lttng-dev mailing list) should be interested in?

Cheers

On Wed, Mar 11, 2020 at 03:22:48PM -0700, Jeremy A. Puhlman wrote:
> From: Jeremy Puhlman <jpuhlman@mvista.com>
> 
> Signed-off-by: Jeremy A. Puhlman <jpuhlman@mvista.com>
> ---
>  .../0001-Make-manpages-multilib-identical.patch    | 28 ++++++++++++++++++++++
>  meta/recipes-kernel/lttng/babeltrace2_2.0.1.bb     |  1 +
>  2 files changed, 29 insertions(+)
>  create mode 100644 meta/recipes-kernel/lttng/babeltrace2/0001-Make-manpages-multilib-identical.patch
> 
> diff --git a/meta/recipes-kernel/lttng/babeltrace2/0001-Make-manpages-multilib-identical.patch b/meta/recipes-kernel/lttng/babeltrace2/0001-Make-manpages-multilib-identical.patch
> new file mode 100644
> index 0000000000..2401b176e6
> --- /dev/null
> +++ b/meta/recipes-kernel/lttng/babeltrace2/0001-Make-manpages-multilib-identical.patch
> @@ -0,0 +1,28 @@
> +From 56986190e4b0c10945ce6aaa7ca10d6bd8a26a39 Mon Sep 17 00:00:00 2001
> +From: Jeremy Puhlman <jpuhlman@mvista.com>
> +Date: Mon, 9 Mar 2020 21:10:35 +0000
> +Subject: [PATCH] Make manpages multilib identical
> +
> +Upstream-Status: Pending
> +Signed-off-by: Jeremy Puhlman <jpuhlman@mvista.com>
> +---
> + doc/man/asciidoc-attrs.conf.in | 4 ++--
> + 1 file changed, 2 insertions(+), 2 deletions(-)
> +
> +diff --git a/doc/man/asciidoc-attrs.conf.in b/doc/man/asciidoc-attrs.conf.in
> +index ad1183f1..e11c7031 100644
> +--- a/doc/man/asciidoc-attrs.conf.in
> ++++ b/doc/man/asciidoc-attrs.conf.in
> +@@ -1,7 +1,7 @@
> + [attributes]
> + # default values
> +-system_plugin_path="@LIBDIR@/babeltrace2/plugins"
> +-system_plugin_provider_path="@LIBDIR@/babeltrace2/plugin-providers"
> ++system_plugin_path="@prefix@/lib*/babeltrace2/plugins"
> ++system_plugin_provider_path="@prefix@/lib*/babeltrace2/plugin-providers"
> + babeltrace_version="@PACKAGE_VERSION@"
> + enable_debug_info="@ENABLE_DEBUG_INFO_VAL@"
> + defrdport=5344
> +-- 
> +2.24.1
> +
> diff --git a/meta/recipes-kernel/lttng/babeltrace2_2.0.1.bb b/meta/recipes-kernel/lttng/babeltrace2_2.0.1.bb
> index 16953d6807..61bc7f5e6b 100644
> --- a/meta/recipes-kernel/lttng/babeltrace2_2.0.1.bb
> +++ b/meta/recipes-kernel/lttng/babeltrace2_2.0.1.bb
> @@ -10,6 +10,7 @@ DEPENDS = "glib-2.0 util-linux popt bison-native flex-native"
>  SRC_URI = "git://git.linuxfoundation.org/diamon/babeltrace.git;branch=stable-2.0 \
>  	   file://run-ptest \
>  	   file://0001-tests-do-not-run-test-applications-from-.libs.patch \
> +           file://0001-Make-manpages-multilib-identical.patch \
>  	  "
>  SRCREV = "06df58f89ee51b1a2c6a2c187ec3f15691633910"
>  UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>2(\.\d+)+)$"
> -- 
> 2.13.3
> 
> -- 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

-- 
Jonathan Rajotte-Julien
EfficiOS

