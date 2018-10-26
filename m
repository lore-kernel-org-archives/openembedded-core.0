Return-Path: <kamensky@cisco.com>
Received: from rcdn-iport-9.cisco.com (rcdn-iport-9.cisco.com [173.37.86.80])
	by mail.openembedded.org (Postfix) with ESMTP id 0C42F6FFFE
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Oct 2018 03:37:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=cisco.com; i=@cisco.com; l=1672; q=dns/txt; s=iport;
	t=1540525072; x=1541734672;
	h=date:from:to:cc:subject:in-reply-to:message-id:
	references:mime-version;
	bh=ZSvT/CvNciCJCOEogB+N/sO6sFli6XR5GrE4Yxgtt1U=;
	b=G5YUgFEf6NIhHjL6hzHqVpMJtsahATN0DbvYvt9rl+5TilCmn0MKHXEL
	QoYkhchOM2q/eV9bZSSWv3N13b0w+odCP3y6BcbEmtLQJXYsUZdfhaJvf
	qIxltV2Z+c8bUxS6lJVZxU+OzNSRSJXkOm0X6g9Bvs00SHtxJc4fjQIs5 c=;
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A0BCAAC0i9Jb/5BdJa1jGQEBAQEBAQE?=
	=?us-ascii?q?BAQEBAQcBAQEBAQGBZYIFZn8ojGyLOIFoJZkWCwEBGA2ERwKDESE4FgEDAQE?=
	=?us-ascii?q?CAQECbRwMhTsBAQECAQEmEQI/BQsLRigvBgGDNIF5CA+oRzOELAGFb4tmF4I?=
	=?us-ascii?q?AgUSCKjWDGwMCgUiFcAKIaweGXY8nCYZohgOEKoFSTIQqiFOBKIxqiXgCBAs?=
	=?us-ascii?q?CFIFaIYFVTSMVSBWCSgmCHReDSIJkgjCFXh8wAY0tAQE?=
X-IronPort-AV: E=Sophos;i="5.54,426,1534809600"; d="scan'208";a="387056351"
Received: from rcdn-core-8.cisco.com ([173.37.93.144])
	by rcdn-iport-9.cisco.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	26 Oct 2018 03:37:51 +0000
Received: from sjc-ads-6991 (sjc-ads-6991.cisco.com [10.30.218.111])
	by rcdn-core-8.cisco.com (8.15.2/8.15.2) with ESMTPS id w9Q3boq4000381
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Fri, 26 Oct 2018 03:37:51 GMT
Date: Thu, 25 Oct 2018 20:37:50 -0700 (PDT)
From: Victor Kamensky <kamensky@cisco.com>
To: Martin Jansa <martin.jansa@gmail.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
In-Reply-To: <alpine.LRH.2.00.1810171314560.37492@sjc-ads-6991.cisco.com>
Message-ID: <alpine.LRH.2.00.1810252000220.5649@sjc-ads-6991.cisco.com>
References: <20181015182128.13115-1-kamensky@cisco.com>
	<CAJTo0LYWG7O+VryaFi9r4kc5JagPtuynWHi9gV6nV+cLPUw+SQ@mail.gmail.com>
	<9f182627633f75c8383901510cc11e4b87349084.camel@linuxfoundation.org>
	<alpine.LRH.2.00.1810162250430.53155@sjc-ads-6991.cisco.com>
	<118f12f46497b3b4fda287b64c5e432afde9b6d9.camel@linuxfoundation.org>
	<CA+chaQcjv6-2v8oC25=7fapKKg5XapC21+6K1oN28Kk9MJF2zw@mail.gmail.com>
	<40a5b6dd1386ea77070814f7ef7ad340cc2e9e62.camel@linuxfoundation.org>
	<CA+chaQekaVbr5MMkW7TFWXeFq5Ye-Cyfn5WBn-0ZiM=QVTW-GA@mail.gmail.com>
	<alpine.LRH.2.00.1810171314560.37492@sjc-ads-6991.cisco.com>
User-Agent: Alpine 2.00 (LRH 1167 2008-08-23)
MIME-Version: 1.0
X-Outbound-SMTP-Client: 10.30.218.111, sjc-ads-6991.cisco.com
X-Outbound-Node: rcdn-core-8.cisco.com
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] systemtap: 3.3 -> 4.0
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
X-List-Received-Date: Fri, 26 Oct 2018 03:37:51 -0000
Content-Type: TEXT/PLAIN; format=flowed; charset=US-ASCII

Hi Guys,

On Wed, 17 Oct 2018, Victor Kamensky wrote:

> stap-exporter service is a new feature in SystemTap 4.0, I've never used
> it before. I'll dig in and will try to make sure that it is functional
> in resulting OE image.

I've had a chance to look at stap-exporter and its service more closely.

It looks like it is simple HTTP server that allows to run stap scripts
on target and relay its information to Prometheus monitoring system.
Please check.

https://www.mankier.com/8/stap-exporter

https://prometheus.io

Since it is HTTP server, and its man page says that it is not supposed
to run in untrusted environment I am quite hesitant to have it enabled
by default. Moreover, it comes with some default example scripts that
actually fail to compile in OE core-image-lsb-sdk because it does not
include kernel-vmlinux package by default. stap-exporter is not
prepared to handle script compilation failure and tries to compile it
in the loop, so in core-image-lsb-sdk systemd image where 
stap-exporter.service would be enabled by default it would trash the
system.

Considering all that I suggest stap-exporter to be moved in separate
systemtap-exporter package, so it can be installed explcitely. I
posted patch for it at

http://lists.openembedded.org/pipermail/openembedded-core/2018-October/157073.html

BTW in FC it is separate systemtap-exporter package.

I've tested systemtap-exporter and stap-exporter, if installed
along with proper prerequisites (kernel-vmlinux) is functioning
OK with given default example as far as my manual http testing
with curl shows. I did not test it with prometheus.

Thanks,
Victor

