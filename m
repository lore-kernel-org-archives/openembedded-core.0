Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
 by mx.groups.io with SMTP id smtpd.web11.12143.1590673158477680823
 for <openembedded-core@lists.openembedded.org>;
 Thu, 28 May 2020 06:39:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@stusta.de header.s=default header.b=KTCDNJzN;
 spf=pass (domain: stusta.mhn.de, ip: 141.84.69.5, mailfrom: srs0=eclz=7k=stusta.de=bunk@stusta.mhn.de)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 49XphL0Dc3z3K;
	Thu, 28 May 2020 15:39:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1590673155;
	bh=v6f/dXPMx2TXX3BNDlWdu1GtFsmY35wCHuag+z/mpSM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KTCDNJzNytX3lPLv+Cir1sePCKT1mH0r83HFV/wLdDYPvQNDzY3Rp9G+wKqBNQLHF
	 DKM03DZSreO5W+Xmib+kjDulyyFuOGl4ihc+0x3bO+t5z9G+9NTm5brv9vVCUZWABJ
	 GVFfckfWZjRD5WpDrogAb1VN2rq/8DCH9Zu0Q8RkViDUXS1IZKjKcx9Y7T5Rc3jaAX
	 Sak9964VQWd3RmUxJGIsFqVvhvdLFr29AjTOLs8sDG1DN/i+2GglAeS2ddlCQ0RjgI
	 Jva9bqnGxFVffBppuo0qPZwss06FaE4XCFPOZKoda2CeWjSe+edExlEvQ8po5OLJbi
	 x2PZZzFuyZ9Ch8KDOMManldITZBoxHxZy5SKfTnZX1//bnuaKhAunFfTjB4LTrbjMw
	 EYrhNnVL+PqNcjMTxQE1X1d9sAyqv4Wh4jRj479JLs3yLQLmWzRzKVQtRjWlP3zUg6
	 XVNJD8DEfLHOBL7IOouwZHqpZrKgNKj7WbP8PFfd3XGVjQCy6lWcMvAZlDka4keeaR
	 83fL9vZb6lOR9sTV/y/bcpwDsbeWy/osJpdI8gdSjnB/YXKfvOACqzuH51aBMGWzs9
	 mCswB+vO7loYBBOBQ3lmD41l3NIhl+kCZ5o/XV0ybimNcHJvJJqtkhyJ9WWhqfR6ol
	 zACpYscoeYDrY7n5EfHMgVj0=
Date: Thu, 28 May 2020 16:39:12 +0300
From: "Adrian Bunk" <bunk@stusta.de>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Denys Dmytriyenko <denis@denix.org>, Khem Raj <raj.khem@gmail.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH] linux-libc-headers: Check for asm/bpf_perf_event.h before multilibbing
Message-ID: <20200528133912.GB12536@localhost>
References: <20200527155011.3165976-1-raj.khem@gmail.com>
 <20200527155957.GK17660@denix.org>
 <765f3daeb6ce5f28c2d1e258dd303f5707363678.camel@linuxfoundation.org>
 <20200527231145.GO17660@denix.org>
 <f8ee3144eaa92a32d6661f397d7042da9a7db46d.camel@linuxfoundation.org>
MIME-Version: 1.0
In-Reply-To: <f8ee3144eaa92a32d6661f397d7042da9a7db46d.camel@linuxfoundation.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Thu, May 28, 2020 at 02:20:02PM +0100, Richard Purdie wrote:
> 
> Right, external toolchains I can understand having specific version
> requirements. What I don't really understand is external toolchains
> would come with their own headers in most cases I can think of?

What I don't really understand is why kernel 4.1 was mentioned
in the submission.

At kernel 4.1 times the latest gcc was gcc 5.

gcc 5 is not even supported as host gcc in master,
and target builds are only tested with gcc 10.

> Cheers,
> 
> Richard

cu
Adrian
