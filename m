Return-Path: <rbilovol@cisco.com>
Received: from aer-iport-3.cisco.com (aer-iport-3.cisco.com [173.38.203.53])
	by mail.openembedded.org (Postfix) with ESMTP id 7FCD3606B2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Mar 2019 14:14:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=cisco.com; i=@cisco.com; l=2715; q=dns/txt; s=iport;
	t=1552659259; x=1553868859;
	h=subject:to:cc:references:from:message-id:date:
	mime-version:in-reply-to:content-transfer-encoding;
	bh=SiQpFLgNvNY7WJGHJk4FY8n8fPvGAAn9FX3jB0ydJHM=;
	b=PksNtu1itdahVb1BpGnN9rkCLlH2iBiY0CBMa5dItG9+Jlp6LDuQIgsN
	o3jw6YSZCtzS2kidz16ABrh+0cZmloJZyGe59Sgdt8tcCSlbfg8T/lIg4
	i/tkBRDbGWPdKDEzMqvgYghtaf8rxbHJmvFahO5DYo/b9JyvviJbNX3+b M=;
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A0ADAADBsotc/xbLJq1kGQEBAQEBAQE?=
	=?us-ascii?q?BAQEBAQcBAQEBAQGBUQQBAQEBAQsBgndQMyeEC4gcX4tnOy2YMRSBZwsBASO?=
	=?us-ascii?q?ESQKEcjQJDQEBAwEBCQEDAm0cDIVLAQUjDwEFQRAJAhgCAiMDAgJGEQYNBgI?=
	=?us-ascii?q?BAYMeAYF1D5AJm2aBL4VGhHAUdyQBi0mBQD+BESeCa4MTCwKBJiMYgwqCVwO?=
	=?us-ascii?q?kSgmHW4tCBhmCVog2iESQNkSNAAIRFYFHOIFWMxoIGxWDJwmCDhaCJoElilU?=
	=?us-ascii?q?9AzCOewEB?=
X-IronPort-AV: E=Sophos;i="5.58,482,1544486400"; d="scan'208";a="10709121"
Received: from aer-iport-nat.cisco.com (HELO aer-core-2.cisco.com)
	([173.38.203.22])
	by aer-iport-3.cisco.com with ESMTP/TLS/DHE-RSA-SEED-SHA;
	15 Mar 2019 14:14:17 +0000
Received: from [10.63.15.135] ([10.63.15.135]) (authenticated bits=0)
	by aer-core-2.cisco.com (8.15.2/8.15.2) with ESMTPSA id x2FEEGBh018832
	(version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NO);
	Fri, 15 Mar 2019 14:14:17 GMT
To: Khem Raj <raj.khem@gmail.com>
References: <1552592626-25569-1-git-send-email-rbilovol@cisco.com>
	<CAMKF1sp1JRLepD130zWkGgk1=Dx5q2+Fb=2HTwzH0RnEUMWZaQ@mail.gmail.com>
From: Ruslan Bilovol <rbilovol@cisco.com>
Message-ID: <4da417cb-276e-eede-b8aa-1f7ad138c6a2@cisco.com>
Date: Fri, 15 Mar 2019 16:14:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <CAMKF1sp1JRLepD130zWkGgk1=Dx5q2+Fb=2HTwzH0RnEUMWZaQ@mail.gmail.com>
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Authenticated-User: rbilovol
X-Outbound-SMTP-Client: 10.63.15.135, [10.63.15.135]
X-Outbound-Node: aer-core-2.cisco.com
Cc: xe-linux-external@cisco.com, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] libnss-nisplus: Add recipe
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
X-List-Received-Date: Fri, 15 Mar 2019 14:14:18 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 3/14/19 11:42 PM, Khem Raj wrote:
> 
> 
> On Thu, Mar 14, 2019 at 12:43 PM Ruslan Bilovol <rbilovol@cisco.com 
> <mailto:rbilovol@cisco.com>> wrote:
> 
>     Same as with libnss-nis - this will substitute
>     the glibc nisplus module which has been removed
> 
>     SRCREV points to 1.3 release plus patch on top which
>     allows to build with recent glibc versions
> 
> 
> This looks okay but not
> An Oe core candidate to me

This recipe is very similar to libnss-nis which is a part
of OE-Core. Do you mean we need to move both out of
OE-Core (to meta-oe?)

Thanks,
Ruslan

> 
> 
> 
>     Signed-off-by: Ruslan Bilovol <rbilovol@cisco.com
>     <mailto:rbilovol@cisco.com>>
>     ---
>       .../libnss-nisplus/libnss-nisplus.bb <http://libnss-nisplus.bb>   
>                 | 31 ++++++++++++++++++++++
>       1 file changed, 31 insertions(+)
>       create mode 100644
>     meta/recipes-extended/libnss-nisplus/libnss-nisplus.bb
>     <http://libnss-nisplus.bb>
> 
>     diff --git a/meta/recipes-extended/libnss-nisplus/libnss-nisplus.bb
>     <http://libnss-nisplus.bb>
>     b/meta/recipes-extended/libnss-nisplus/libnss-nisplus.bb
>     <http://libnss-nisplus.bb>
>     new file mode 100644
>     index 0000000..2dbeee7
>     --- /dev/null
>     +++ b/meta/recipes-extended/libnss-nisplus/libnss-nisplus.bb
>     <http://libnss-nisplus.bb>
>     @@ -0,0 +1,31 @@
>     +# Copyright (C) 2019 Ruslan Bilovol <rbilovol@cisco.com
>     <mailto:rbilovol@cisco.com>>
>     +# Released under the MIT license (see COPYING.MIT for the terms)
>     +
>     +SUMMARY = "NSS module for glibc, to provide NIS+ support for glibc"
>     +
>     +DESCRIPTION = "This package contains the NSS NIS+ plugin for glibc.\
>     +This code was formerly part of glibc, but is now standalone to\
>     +be able to link against TI-RPC for IPv6 support."
>     +
>     +HOMEPAGE = "https://github.com/thkukuk/libnss_nisplus"
>     +LICENSE = "LGPL-2.1"
>     +LIC_FILES_CHKSUM =
>     "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
>     +SECTION = "libs"
>     +DEPENDS += "libtirpc libnsl2"
>     +
>     +PV = "1.3+git${SRCPV}"
>     +
>     +SRCREV = "c6934373c7bac91499ff7bbe7d2439599325ca63"
>     +
>     +SRC_URI = "git://github.com/thkukuk/libnss_nisplus
>     <http://github.com/thkukuk/libnss_nisplus> \
>     +          "
>     +
>     +S = "${WORKDIR}/git"
>     +
>     +inherit autotools pkgconfig
>     +
>     +BBCLASSEXTEND += "native nativesdk"
>     +#
>     +# We will skip parsing this packagegeoup for non-glibc systems
>     +#
>     +COMPATIBLE_HOST_libc-musl = 'null'
>     -- 
>     1.9.1
> 

