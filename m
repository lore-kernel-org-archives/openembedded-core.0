Return-Path: <sstrogin@cisco.com>
Received: from aer-iport-3.cisco.com (aer-iport-3.cisco.com [173.38.203.53])
	by mail.openembedded.org (Postfix) with ESMTP id C27E471A88
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Mar 2017 16:45:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=cisco.com; i=@cisco.com; l=754; q=dns/txt; s=iport;
	t=1489077954; x=1490287554;
	h=subject:to:references:cc:from:message-id:date:
	mime-version:in-reply-to:content-transfer-encoding;
	bh=FnlkukX40TJdRHi+sXmLwtwaXXsnX3a4zYPJY+lX5eo=;
	b=MWnEQLocoS5Dsd9+v7pyne0zNsCbHCO37SxguVoNBTi/OGRrTUouN82a
	AeK/tT/26zAGMNmQzj4IV/1MPwy/CJnXMOzHadWX9grgwcRFdIgKGzFpN
	FZngjgVGXsj0EyJUS//mDfODpcgR+KXlWNgjvFNqOrej4255rvLJxbUEj I=;
X-IronPort-AV: E=Sophos;i="5.36,136,1486425600"; d="scan'208";a="651325495"
Received: from aer-iport-nat.cisco.com (HELO aer-core-1.cisco.com)
	([173.38.203.22])
	by aer-iport-3.cisco.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	09 Mar 2017 16:45:53 +0000
Received: from [10.61.198.147] ([10.61.198.147]) (authenticated bits=0)
	by aer-core-1.cisco.com (8.14.5/8.14.5) with ESMTP id v29GjpPp012452
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NO);
	Thu, 9 Mar 2017 16:45:53 GMT
To: "Burton, Ross" <ross.burton@intel.com>
References: <9a9e3651-e3d3-c8b0-28fb-91c9c9ef1995@cisco.com>
	<CAJTo0La=cCuaP8mvpg3K-J31VcSnxdEJJof+Jc_nWG1rjQimmw@mail.gmail.com>
From: Stefan Strogin <sstrogin@cisco.com>
Message-ID: <46f4cc8d-e1eb-e8d1-d1e2-ed17cf0172fa@cisco.com>
Date: Thu, 9 Mar 2017 18:45:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.7.1
MIME-Version: 1.0
In-Reply-To: <CAJTo0La=cCuaP8mvpg3K-J31VcSnxdEJJof+Jc_nWG1rjQimmw@mail.gmail.com>
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Authenticated-User: sstrogin
Cc: xe-linux-external@cisco.com,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] slang: add ptest
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
X-List-Received-Date: Thu, 09 Mar 2017 16:45:53 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

On 06/03/17 14:58, Burton, Ross wrote:
> 
> On 2 March 2017 at 17:29, Stefan Strogin <sstrogin@cisco.com <mailto:sstrogin@cisco.com>> wrote:
> 
>     +       cp -r ${S}/src/test ${D}${PTEST_PATH}/
>     +       mkdir ${D}${PTEST_PATH}/objs
>     +       cp ${S}/src/objs/libslang.a ${D}${PTEST_PATH}/objs/
> 
> 
> Why?
> 
> If this is because the tests need sltest, that's already been built and is in the package: just patch the Makefile instead.  It's also huge, so I'd be tempted to say we should strip sltest as enabling ptest for slang causes slang-dbg to increase by 2MB.
> 
> Ross

Sorry, my mistake. sltest doesn't need libslang.a for running, of course. I'll change the Makefile and resend the patch.


--
Thank you,
Stefan

