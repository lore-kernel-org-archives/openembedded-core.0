Return-Path: <jonathan.rajotte-julien@efficios.com>
Received: from mail.efficios.com (mail.efficios.com [167.114.142.138])
	by mail.openembedded.org (Postfix) with ESMTP id C728F7C6B3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Mar 2019 22:47:19 +0000 (UTC)
Received: from localhost (ip6-localhost [IPv6:::1])
	by mail.efficios.com (Postfix) with ESMTP id F0851184FDB;
	Wed, 13 Mar 2019 18:47:20 -0400 (EDT)
Received: from mail.efficios.com ([IPv6:::1])
	by localhost (mail02.efficios.com [IPv6:::1]) (amavisd-new, port 10032)
	with ESMTP id e0R2K9eKbnWc; Wed, 13 Mar 2019 18:47:20 -0400 (EDT)
Received: from localhost (ip6-localhost [IPv6:::1])
	by mail.efficios.com (Postfix) with ESMTP id 163D7184FD1;
	Wed, 13 Mar 2019 18:47:20 -0400 (EDT)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.efficios.com 163D7184FD1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=efficios.com;
	s=default; t=1552517240;
	bh=n9dOZovWMtkTBt2YPyCjHiL4d6hLO+jZ+OLiJ8TjsOI=;
	h=Date:From:To:Message-ID:MIME-Version;
	b=MkppivT5gnsILsnHgdYkurX1s4GG6evSVMI2ZnTN2aPqnNo7Bg5Ow4h1RwwZgPjeU
	w7lE1q+sq4RkGVha46eq3vSHk4nikagf8hx0Tb6iDoTxZjKZ0eoiN8EheoNwtbatSa
	lPICk/cr4kgqKBsYwev2rnkjxAbMrX7ceKsCIGytTj3tD/EpTs7JMDD66845vMCMTV
	aWTY85R2yESmsIXFNvDYBH/3pKS0MvtNalkO6lJwPLNTtYiBx+vtSYIhl0+mVy4wyU
	rxNXCNWQPN46vPdQrLbmBatiL9bGbe0sH55goC5XaCX6KzcVHsr/vmCB/JNyJCU2ub
	sglPMl/vtJVew==
X-Virus-Scanned: amavisd-new at efficios.com
Received: from mail.efficios.com ([IPv6:::1])
	by localhost (mail02.efficios.com [IPv6:::1]) (amavisd-new, port 10026)
	with ESMTP id EMOTrsysqdT5; Wed, 13 Mar 2019 18:47:20 -0400 (EDT)
Received: from joraj-alpa (unknown [107.159.43.215])
	by mail.efficios.com (Postfix) with ESMTPSA id E419C184FC3;
	Wed, 13 Mar 2019 18:47:19 -0400 (EDT)
Date: Wed, 13 Mar 2019 18:47:19 -0400
From: Jonathan Rajotte-Julien <jonathan.rajotte-julien@efficios.com>
To: openembedded-core@lists.openembedded.org
Message-ID: <20190313224719.GB14253@joraj-alpa>
References: <20190313213008.9842-1-jonathan.rajotte-julien@efficios.com>
MIME-Version: 1.0
In-Reply-To: <20190313213008.9842-1-jonathan.rajotte-julien@efficios.com>
User-Agent: Mutt/1.9.5 (2018-04-13)
Cc: Alexander Kanavin <alexander.kanavin@intel.com>
Subject: Re: [Sumo][PATCH] babeltrace: update to 1.5.6
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
X-List-Received-Date: Wed, 13 Mar 2019 22:47:19 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

Disregard this patch. It does not follow the project guideline regarding recipe
update for stable release.

Thanks,

On Wed, Mar 13, 2019 at 09:30:08PM +0000, Jonathan Rajotte wrote:
> Signed-off-by: Jonathan Rajotte <jonathan.rajotte-julien@efficios.com>
> ---
>  .../lttng/{babeltrace_1.5.4.bb => babeltrace_1.5.6.bb}        | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename meta/recipes-kernel/lttng/{babeltrace_1.5.4.bb => babeltrace_1.5.6.bb} (82%)
> 
> diff --git a/meta/recipes-kernel/lttng/babeltrace_1.5.4.bb b/meta/recipes-kernel/lttng/babeltrace_1.5.6.bb
> similarity index 82%
> rename from meta/recipes-kernel/lttng/babeltrace_1.5.4.bb
> rename to meta/recipes-kernel/lttng/babeltrace_1.5.6.bb
> index a29402adb1..254b5f652a 100644
> --- a/meta/recipes-kernel/lttng/babeltrace_1.5.4.bb
> +++ b/meta/recipes-kernel/lttng/babeltrace_1.5.6.bb
> @@ -15,5 +15,5 @@ SRC_URI = "http://www.efficios.com/files/babeltrace/babeltrace-${PV}.tar.bz2 \
>  
>  EXTRA_OECONF = "--disable-debug-info"
>  
> -SRC_URI[md5sum] = "3e8cdafec3ac0346a389870e87bf1344"
> -SRC_URI[sha256sum] = "9643039923a0abc75a25b3d594cee0017423b57f10d2b625e96ed1e8d4891fc1"
> +SRC_URI[md5sum] = "8ce610461e73f48b9c6beec9ba95dcc3"
> +SRC_URI[sha256sum] = "5308bc217828dd571b3259f482a85533554064d4563906ff3c5774ecf915bbb7"
> -- 
> 2.17.1
> 

-- 
Jonathan Rajotte-Julien
EfficiOS

