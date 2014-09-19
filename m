Return-Path: <ross.burton@intel.com>
Received: from mail-qc0-f181.google.com (mail-qc0-f181.google.com
	[209.85.216.181])
	by mail.openembedded.org (Postfix) with ESMTP id 12AD8605BD
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Sep 2014 23:05:01 +0000 (UTC)
Received: by mail-qc0-f181.google.com with SMTP id r5so3952881qcx.12
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Sep 2014 16:05:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=SdJ3BwB4Z5lo9/oJRI14BnYRPT9/j5YnQFwHNmAFOYI=;
	b=haDtJbNLUMBJOZQk7WHxkYJTIJZaTjJVY6OR6pzDjm9cw7sGL1ATML3t9X5suoRTB1
	xKe8GCzLCwgWxL7le9ogZyDCczIk4s2tkJwKXmlfKdcZddcDRGFlV6NSJx0Dxlx1R0pB
	45fJLROJPo9Q8WTuJD8uLa0JKBmYWW5qizoI6LHgdjSJYD7xYzOFdjR8EpdXZLrhYEEq
	czyqPIND3Kl6ESdFtyh4O8Zw4E+K39GtxKmlKSIPZg8Htk3m1uzTtJrcTe1EAq8nD1TW
	h8IDDUphrBqlb/dd58itY1qb6jzD/H4nz9vfAtH5z16uEj47epAcdovMXLSd3uUWrbYh
	ljIg==
X-Gm-Message-State: ALoCoQmXGwvT/jJtXj9lQX6Yypfzut8cBZwyfcn0KyoNKshENZ4OtDS40e214YSOaVZRVz2SJnr6
X-Received: by 10.224.121.80 with SMTP id g16mr3653986qar.64.1411167902398;
	Fri, 19 Sep 2014 16:05:02 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.34.180 with HTTP; Fri, 19 Sep 2014 16:04:42 -0700 (PDT)
In-Reply-To: <541CB535.9040405@gmail.com>
References: <1411109370-27814-1-git-send-email-rongqing.li@windriver.com>
	<541CB535.9040405@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Sat, 20 Sep 2014 00:04:42 +0100
Message-ID: <CAJTo0LZodSWb3xTDSEudWVxuSGozbn+mr282EuodCvnOFcaX0g@mail.gmail.com>
To: akuster808 <akuster808@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] pinentry: add recipes
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
X-List-Received-Date: Fri, 19 Sep 2014 23:05:02 -0000
Content-Type: text/plain; charset=UTF-8

On 19 September 2014 23:59, akuster808 <akuster808@gmail.com> wrote:
> This recipe already resides in meta-securty.
>
> so I take it it should be removed from that layer?

*If* it goes into oe-core then yes.  I'm not yet convinced it needs to
go into oe-core.

Ross

