Return-Path: <jonathan.rajotte-julien@efficios.com>
Received: from mail.efficios.com (mail.efficios.com [167.114.142.138])
	by mail.openembedded.org (Postfix) with ESMTP id E57B66C1BE
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Mar 2019 17:11:23 +0000 (UTC)
Received: from localhost (ip6-localhost [IPv6:::1])
	by mail.efficios.com (Postfix) with ESMTP id 35DB91A3837;
	Mon, 18 Mar 2019 13:11:25 -0400 (EDT)
Received: from mail.efficios.com ([IPv6:::1])
	by localhost (mail02.efficios.com [IPv6:::1]) (amavisd-new, port 10032)
	with ESMTP id tsoQQnlsMBxS; Mon, 18 Mar 2019 13:11:24 -0400 (EDT)
Received: from localhost (ip6-localhost [IPv6:::1])
	by mail.efficios.com (Postfix) with ESMTP id DCE5C1A3831;
	Mon, 18 Mar 2019 13:11:24 -0400 (EDT)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.efficios.com DCE5C1A3831
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=efficios.com;
	s=default; t=1552929084;
	bh=3uxWPrlbFK15p/h11CxW3T+GY4UnIpd5gWsyecJ0Kec=;
	h=Date:From:To:Message-ID:MIME-Version;
	b=O6F1c4zh5C6Z06pFmtXZrbCymSj1Ktl+SXd+n88ifE9lZDTF3ABUIxvgOhYS7o+Z1
	s/ZvHRh8SdjGwocB8GJO/1pTC7sAYeVnZUQGKh7Vgz/qsEhzqGdqlGs1bPXxRhHeTR
	B1EtVsY+TeGgnhSDdCt/ZQN3HdOmolmaRQv5ysanxFNHcEYu0x4Q2KrLZ96PEjdF/d
	ST8PkJVvdTe1+Teowpo4okZN6gY84tYlyqtELq6zCRR45ZXFHDY8s19Do8RgN2dUFP
	lkN3hkf7fx9EY3212waYxAs/1Y6GJnJxdYeo/n8qIKf0XrCrAQnaQSD/J/UW/47bjq
	t0IqB0utjsWYA==
X-Virus-Scanned: amavisd-new at efficios.com
Received: from mail.efficios.com ([IPv6:::1])
	by localhost (mail02.efficios.com [IPv6:::1]) (amavisd-new, port 10026)
	with ESMTP id dW9xdsC2-6L5; Mon, 18 Mar 2019 13:11:24 -0400 (EDT)
Received: from joraj-alpa (192-222-157-41.qc.cable.ebox.net [192.222.157.41])
	by mail.efficios.com (Postfix) with ESMTPSA id BD1651A382B;
	Mon, 18 Mar 2019 13:11:24 -0400 (EDT)
Date: Mon, 18 Mar 2019 13:11:19 -0400
From: Jonathan Rajotte-Julien <jonathan.rajotte-julien@efficios.com>
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20190318171109.GA5144@joraj-alpa>
References: <20190318165803.10375-1-raj.khem@gmail.com>
	<20190318165803.10375-3-raj.khem@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20190318165803.10375-3-raj.khem@gmail.com>
User-Agent: Mutt/1.9.5 (2018-04-13)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 3/3] gdb: Do not disable lttng-ust on risc-v
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
X-List-Received-Date: Mon, 18 Mar 2019 17:11:24 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Mar 18, 2019 at 09:58:03AM -0700, Khem Raj wrote:
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta/recipes-devtools/gdb/gdb-common.inc | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/meta/recipes-devtools/gdb/gdb-common.inc b/meta/recipes-devtools/gdb/gdb-common.inc
> index 57bc0dc773..a07625bb8d 100644
> --- a/meta/recipes-devtools/gdb/gdb-common.inc
> +++ b/meta/recipes-devtools/gdb/gdb-common.inc
> @@ -6,7 +6,6 @@ DEPENDS = "expat zlib ncurses virtual/libiconv ${LTTNGUST} bison-native"
>  LTTNGUST = "lttng-ust"

I did not know that gdb depends on lttng-ust, I know gdb can depend on
libbabeltrace*. I'll check that a bit more.

Cheers.

>  LTTNGUST_arc = ""
>  LTTNGUST_aarch64 = ""
> -LTTNGUST_riscv64 = ""
>  LTTNGUST_mipsarch = ""
>  LTTNGUST_sh4 = ""
>  LTTNGUST_libc-musl = ""
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

