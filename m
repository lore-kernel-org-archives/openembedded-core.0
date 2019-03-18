Return-Path: <jonathan.rajotte-julien@efficios.com>
Received: from mail.efficios.com (mail.efficios.com [167.114.142.138])
	by mail.openembedded.org (Postfix) with ESMTP id 4BA5F6C1BE
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Mar 2019 17:12:42 +0000 (UTC)
Received: from localhost (ip6-localhost [IPv6:::1])
	by mail.efficios.com (Postfix) with ESMTP id 921C21A38E2;
	Mon, 18 Mar 2019 13:12:43 -0400 (EDT)
Received: from mail.efficios.com ([IPv6:::1])
	by localhost (mail02.efficios.com [IPv6:::1]) (amavisd-new, port 10032)
	with ESMTP id 5gk8ef04GH-U; Mon, 18 Mar 2019 13:12:43 -0400 (EDT)
Received: from localhost (ip6-localhost [IPv6:::1])
	by mail.efficios.com (Postfix) with ESMTP id 4F3591A38DE;
	Mon, 18 Mar 2019 13:12:43 -0400 (EDT)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.efficios.com 4F3591A38DE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=efficios.com;
	s=default; t=1552929163;
	bh=5+iL8O9Rq1Ux4oI8TOBBJB3cs4jvUNCX+YGYR4TAyxg=;
	h=Date:From:To:Message-ID:MIME-Version;
	b=HJTnoAQtxHIyN0BEKdef7uWy923EZTWrXYWnj7NDK3kZUREc5UTB+QMR4+P3JNw/Y
	fYlZtje+0htNfN+xuPBxsQlGb9g3N25Ser8Rku1s3Up7AIUnBb5/NbkcBZxSy7T+PO
	MSv2aGSqXvbg03XKm74d8MJHmSlCj19w184aAyjzFQOPo93DmGXg5Rd8cvs/Ee6fsG
	q0OGyR4VajVYn++P7qAXiJvEnCNuj3JAb/hPJRD0oUdYz+pusbbi5MCLIpwKLhFLTP
	O39Xwfi3AYp52R2E/v15rZ9SxwIF9tIUDDsMILmpZVeyoRKczJMzhVaU+juWGXcslK
	c5+hPI04Fb8ZQ==
X-Virus-Scanned: amavisd-new at efficios.com
Received: from mail.efficios.com ([IPv6:::1])
	by localhost (mail02.efficios.com [IPv6:::1]) (amavisd-new, port 10026)
	with ESMTP id U_nZMq0nRY0J; Mon, 18 Mar 2019 13:12:43 -0400 (EDT)
Received: from joraj-alpa (192-222-157-41.qc.cable.ebox.net [192.222.157.41])
	by mail.efficios.com (Postfix) with ESMTPSA id 353981A38D9;
	Mon, 18 Mar 2019 13:12:43 -0400 (EDT)
Date: Mon, 18 Mar 2019 13:12:42 -0400
From: Jonathan Rajotte-Julien <jonathan.rajotte-julien@efficios.com>
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20190318171242.GB5144@joraj-alpa>
References: <20190318165803.10375-1-raj.khem@gmail.com>
	<20190318165803.10375-2-raj.khem@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20190318165803.10375-2-raj.khem@gmail.com>
User-Agent: Mutt/1.9.5 (2018-04-13)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/3] packagegroup-core-tools-profile: Do not remove lttng-ust for musl and risc-v
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
X-List-Received-Date: Mon, 18 Mar 2019 17:12:42 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Mar 18, 2019 at 09:58:02AM -0700, Khem Raj wrote:
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  .../packagegroups/packagegroup-core-tools-profile.bb           | 3 ---
>  1 file changed, 3 deletions(-)
> 
> diff --git a/meta/recipes-core/packagegroups/packagegroup-core-tools-profile.bb b/meta/recipes-core/packagegroups/packagegroup-core-tools-profile.bb
> index 762c046636..3d8e0c2ed7 100644
> --- a/meta/recipes-core/packagegroups/packagegroup-core-tools-profile.bb
> +++ b/meta/recipes-core/packagegroups/packagegroup-core-tools-profile.bb
> @@ -39,16 +39,13 @@ SYSTEMTAP_riscv64 = ""
>  LTTNGUST = "lttng-ust"
>  LTTNGUST_libc-musl = ""

Looks like you missed this, based on the commit msg.

>  LTTNGUST_arc = ""
> -LTTNGUST_riscv64 = ""
>  
>  LTTNGTOOLS = "lttng-tools"
>  LTTNGTOOLS_libc-musl = ""

Looks like you missed this, based on the commit msg.

>  LTTNGTOOLS_arc = ""
> -LTTNGTOOLS_riscv64 = ""
>  
>  LTTNGMODULES = "lttng-modules"
>  LTTNGMODULES_arc = ""
> -LTTNGMODULES_riscv64 = ""
>  
>  BABELTRACE = "babeltrace"
>  
> -- 
> 2.21.0
> 
> -- 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

-- 
Jonathan Rajotte-Julien
EfficiOS

