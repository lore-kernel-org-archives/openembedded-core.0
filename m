Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id AA97073181
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Apr 2016 14:56:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u34Eu0BO009872; Mon, 4 Apr 2016 15:56:27 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id uz1fE-kFF4Bk; Mon,  4 Apr 2016 15:56:27 +0100 (BST)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u34EuPjO009904
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Mon, 4 Apr 2016 15:56:26 +0100
Message-ID: <1459781785.7348.151.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patrick Ohly <patrick.ohly@intel.com>,
	openembedded-core@lists.openembedded.org
Date: Mon, 04 Apr 2016 15:56:25 +0100
In-Reply-To: <af63dbfb9cff4fbbd38bccbff955af03cbda3f92.1459776943.git.patrick.ohly@intel.com>
References: <bcd7b4f85a904081342992ec49c92ca3bcf0449b.1459776943.git.patrick.ohly@intel.com>
	<af63dbfb9cff4fbbd38bccbff955af03cbda3f92.1459776943.git.patrick.ohly@intel.com>
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Subject: Re: [PATCH 5/5] ca-certificates: support Toybox
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
X-List-Received-Date: Mon, 04 Apr 2016 14:56:33 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2016-04-04 at 15:41 +0200, Patrick Ohly wrote:
> "mktemp -t" is deprecated and does not work when using Toybox.
> Replace
> with something that works also with Toybox.
> 
> Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
> ---
>  .../update-ca-certificates-support-Toybox.patch    | 35
> ++++++++++++++++++++++
>  .../ca-certificates/ca-certificates_20160104.bb    |  1 +
>  2 files changed, 36 insertions(+)
>  create mode 100644 meta/recipes-support/ca-certificates/ca
> -certificates/update-ca-certificates-support-Toybox.patch
> 
> diff --git a/meta/recipes-support/ca-certificates/ca
> -certificates/update-ca-certificates-support-Toybox.patch
> b/meta/recipes-support/ca-certificates/ca-certificates/update-ca
> -certificates-support-Toybox.patch
> new file mode 100644
> index 0000000..b3b21e2
> --- /dev/null
> +++ b/meta/recipes-support/ca-certificates/ca-certificates/update-ca
> -certificates-support-Toybox.patch
> @@ -0,0 +1,35 @@
> +From 30378026d136efa779732e3f6664e2ecf461e458 Mon Sep 17 00:00:00
> 2001
> +From: Patrick Ohly <patrick.ohly@intel.com>
> +Date: Thu, 17 Mar 2016 12:38:09 +0100
> +Subject: [PATCH] update-ca-certificates: support Toybox
> +
> +"mktemp -t" is deprecated and does not work when using Toybox.
> Replace
> +with something that works also with Toybox.
> +
> +Upstream-Status: Inappropriate [embedded specific]

If its deprecated, is it really Inappropriate?

Cheers,

Richard


