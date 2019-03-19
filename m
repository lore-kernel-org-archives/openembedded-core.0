Return-Path: <jonathan.rajotte-julien@efficios.com>
Received: from mail.efficios.com (mail.efficios.com [167.114.142.138])
	by mail.openembedded.org (Postfix) with ESMTP id 314426BCE7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Mar 2019 20:37:40 +0000 (UTC)
Received: from localhost (ip6-localhost [IPv6:::1])
	by mail.efficios.com (Postfix) with ESMTP id D8B291CACB6;
	Tue, 19 Mar 2019 16:37:41 -0400 (EDT)
Received: from mail.efficios.com ([IPv6:::1])
	by localhost (mail02.efficios.com [IPv6:::1]) (amavisd-new, port 10032)
	with ESMTP id YAsj9lsNoWW1; Tue, 19 Mar 2019 16:37:41 -0400 (EDT)
Received: from localhost (ip6-localhost [IPv6:::1])
	by mail.efficios.com (Postfix) with ESMTP id 296C61CACB2;
	Tue, 19 Mar 2019 16:37:41 -0400 (EDT)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.efficios.com 296C61CACB2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=efficios.com;
	s=default; t=1553027861;
	bh=UsDffY9B5xpr+xCtlfj6FANr5oWwoLCYw4497UtypXo=;
	h=Date:From:To:Message-ID:MIME-Version;
	b=D5O+VXskqaCHccqW2A/B/aZJGYaKcFcbWSr/LRTV/KV+lPgUPXHJu2QPKqsq6w+bg
	dZJohipSVjuF/DCQKJ0QNWTdDweLouDBRRBR2RrRIw0A5D3+h1VZLaKqut9gaZFV0v
	3LLCJNXt5wHhT7YnFDcyEWEv+kg+2r9qb+XEagubnrGV8rflIh5IWPil3QeGw6tXPu
	tf9p6TL41dVdWumYVR6R11fxu4bVTtzHcbo4lQ3sxDlujmUsCMCfRxRtMqnhwnzKue
	WKwVd2Uxy7ZS/ZAc3jCLHJ4tIP7ZZnAMX/YvkWaGzqWhnW+OQzPBiNm++eibVnX8tm
	9JNbArFlitypA==
X-Virus-Scanned: amavisd-new at efficios.com
Received: from mail.efficios.com ([IPv6:::1])
	by localhost (mail02.efficios.com [IPv6:::1]) (amavisd-new, port 10026)
	with ESMTP id ekMbbRzWIsab; Tue, 19 Mar 2019 16:37:41 -0400 (EDT)
Received: from joraj-alpa (192-222-157-41.qc.cable.ebox.net [192.222.157.41])
	by mail.efficios.com (Postfix) with ESMTPSA id 74A281CACA8;
	Tue, 19 Mar 2019 16:37:40 -0400 (EDT)
Date: Tue, 19 Mar 2019 16:37:34 -0400
From: Jonathan Rajotte-Julien <jonathan.rajotte-julien@efficios.com>
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20190319203734.GA5754@joraj-alpa>
References: <20190318165803.10375-1-raj.khem@gmail.com>
	<20190318165803.10375-3-raj.khem@gmail.com>
	<20190318171109.GA5144@joraj-alpa>
MIME-Version: 1.0
In-Reply-To: <20190318171109.GA5144@joraj-alpa>
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
X-List-Received-Date: Tue, 19 Mar 2019 20:37:41 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Khem,

On Mon, Mar 18, 2019 at 01:11:19PM -0400, Jonathan Rajotte-Julien wrote:
> On Mon, Mar 18, 2019 at 09:58:03AM -0700, Khem Raj wrote:
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > ---
> >  meta/recipes-devtools/gdb/gdb-common.inc | 1 -
> >  1 file changed, 1 deletion(-)
> > 
> > diff --git a/meta/recipes-devtools/gdb/gdb-common.inc b/meta/recipes-devtools/gdb/gdb-common.inc
> > index 57bc0dc773..a07625bb8d 100644
> > --- a/meta/recipes-devtools/gdb/gdb-common.inc
> > +++ b/meta/recipes-devtools/gdb/gdb-common.inc
> > @@ -6,7 +6,6 @@ DEPENDS = "expat zlib ncurses virtual/libiconv ${LTTNGUST} bison-native"
> >  LTTNGUST = "lttng-ust"
> 
> I did not know that gdb depends on lttng-ust, I know gdb can depend on
> libbabeltrace*. I'll check that a bit more.

Gdb can indeed depend on lttng-ust for gdbserver for tracpoint.

This answer my question.

> 
> Cheers.
> 
> >  LTTNGUST_arc = ""
> >  LTTNGUST_aarch64 = ""
> > -LTTNGUST_riscv64 = ""
> >  LTTNGUST_mipsarch = ""
> >  LTTNGUST_sh4 = ""
> >  LTTNGUST_libc-musl = ""
> > -- 
> > 2.21.0
> > 
> > -- 
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core
> 
> -- 
> Jonathan Rajotte-Julien
> EfficiOS
> -- 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

-- 
Jonathan Rajotte-Julien
EfficiOS

