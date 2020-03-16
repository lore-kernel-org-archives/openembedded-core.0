Return-Path: <jonathan.rajotte-julien@efficios.com>
Received: from mail.efficios.com (mail.efficios.com [167.114.26.124])
	by mail.openembedded.org (Postfix) with ESMTP id D038E60B24
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Mar 2020 13:17:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mail.efficios.com (Postfix) with ESMTP id 8A37726AAF6;
	Mon, 16 Mar 2020 09:17:09 -0400 (EDT)
Received: from mail.efficios.com ([127.0.0.1])
	by localhost (mail03.efficios.com [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id vO5OJS3sWW-E; Mon, 16 Mar 2020 09:17:09 -0400 (EDT)
Received: from localhost (localhost [127.0.0.1])
	by mail.efficios.com (Postfix) with ESMTP id 619EB26AF0A;
	Mon, 16 Mar 2020 09:17:09 -0400 (EDT)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.efficios.com 619EB26AF0A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=efficios.com;
	s=default; t=1584364629;
	bh=1fu73cwXpL9b4zlFrzhj+ZBJP3S9CpJojFTSSsmmS44=;
	h=Date:From:To:Message-ID:MIME-Version;
	b=LNz3tFBHEg3CK//5SoPepxMqr6Jhsb5W6leAn5OQ2zSS8PAQ7y9ZrAj8uOji96HVe
	H3gfbZ9u3YCbRgwirye1z+Qi19wKsJrGVBrFbtMNfLhqKibB3nrwrngz3wQyfnVEmk
	8Kk5UlLjIzWJeenCN5YTfqndnazgAeFS8Ag2RRCKTWPxmv7FQI4+RxGjWA0elibBt6
	fAsYqVkYNXGqwK4VX9X56p8afmWFjzPx+lbsl3d3IMY2739q6wuV8GKcng2PKjbpOp
	oy0to6vTipjmu3uJvS0lTbWUIILd+YX7AksXNEnqHX8cxiJtWsCNpg13wmqId7llH9
	SUD0l27XP6RvA==
X-Virus-Scanned: amavisd-new at efficios.com
Received: from mail.efficios.com ([127.0.0.1])
	by localhost (mail03.efficios.com [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id qAjZnvMx1GIW; Mon, 16 Mar 2020 09:17:09 -0400 (EDT)
Received: from joraj-alpa (unknown [107.159.43.215])
	by mail.efficios.com (Postfix) with ESMTPSA id 2B4CD26AB70;
	Mon, 16 Mar 2020 09:17:09 -0400 (EDT)
Date: Mon, 16 Mar 2020 09:17:04 -0400
From: Jonathan Rajotte-Julien <jonathan.rajotte-julien@efficios.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Message-ID: <20200316131704.GA5753@joraj-alpa>
References: <20200311222249.29880-1-jpuhlman@mvista.com>
	<20200312142524.GB30953@joraj-alpa>
	<da907d6a7f3e2a7391896c767a19bd36e2e87f1a.camel@linuxfoundation.org>
MIME-Version: 1.0
In-Reply-To: <da907d6a7f3e2a7391896c767a19bd36e2e87f1a.camel@linuxfoundation.org>
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
X-List-Received-Date: Mon, 16 Mar 2020 13:17:09 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Mar 13, 2020 at 07:22:03AM +0000, Richard Purdie wrote:
> On Thu, 2020-03-12 at 10:25 -0400, Jonathan Rajotte-Julien wrote:
> > Is this something upstream (lttng-dev mailing list) should be
> > interested in?
> 
> Its a tough one as the man page is technically correct but the
> references give us a challenge in packaging it. I can therefore
> understand upstreams not accepting changes like this but if they were
> open to some kind of tweak it does help us not have to have patches...

Jeremy does plan to send us a version for upstream (bt2) someday, or at least
start the discussion on how to help yocto packaging on that end. We will see how
we can make everyone happy then.

Cheers

-- 
Jonathan Rajotte-Julien
EfficiOS

