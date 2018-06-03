Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 0AD2074D03
	for <openembedded-core@lists.openembedded.org>;
	Sun,  3 Jun 2018 15:52:55 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	w53FqsUh019910
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Sun, 3 Jun 2018 16:52:56 +0100
Message-ID: <60162dc4c3584cafc44abe0042e2be4502018ad9.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Robert Yang <liezhi.yang@windriver.com>,
	openembedded-core@lists.openembedded.org
Date: Sun, 03 Jun 2018 16:52:54 +0100
In-Reply-To: <57ffc9737ad9e03150d3c5152871b7e163042358.1527670923.git.liezhi.yang@windriver.com>
References: <cover.1527670923.git.liezhi.yang@windriver.com>
	<57ffc9737ad9e03150d3c5152871b7e163042358.1527670923.git.liezhi.yang@windriver.com>
X-Mailer: Evolution 3.28.1-2 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.4 at dan
X-Virus-Status: Clean
Subject: Re: [PATCH 03/16] lsof: fix LSOF_CCV in version.h
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
X-List-Received-Date: Sun, 03 Jun 2018 15:52:56 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2018-05-30 at 17:03 +0800, Robert Yang wrote:
> From: Jian Liu <jian.liu@windriver.com>
> 
> When using cross compiler to build the package "lsof" on a host,
> the value of LSOF_CCV in version.h genegrated by the Makefile
> is the version of the compiler on the host while it should be
> the version of cross compiler.
> 
> On Ubuntu host before fixed:
>   #define LSOF_CCV        "4.6.3 (Ubuntu/Linaro 4.6.3-1ubuntu5) "
> 
> After fixed:
>   #define   LSOF_CCV        "4.9.1 (GCC) "

The above is good info but its not included in the patch header which
this patch adds. Could you add it there please so that we can
understand what the patch does and why in the future without having to
trawl git history please.

Cheers,

Richard


