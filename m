Return-Path: <kamensky@cisco.com>
X-Greylist: delayed 571 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 17 Oct 2018 20:30:38 UTC
Received: from rcdn-iport-1.cisco.com (rcdn-iport-1.cisco.com [173.37.86.72])
	by mail.openembedded.org (Postfix) with ESMTP id A4AB579B34
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Oct 2018 20:30:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=cisco.com; i=@cisco.com; l=2008; q=dns/txt; s=iport;
	t=1539808240; x=1541017840;
	h=date:from:to:cc:subject:in-reply-to:message-id:
	references:mime-version;
	bh=LFGhjs9gjdpxZC4Eh1B1EyOaRCC7/cG2vBSt0x4rdO8=;
	b=a9hr0GwEuNwTXAT/tU7+ega+E6aTXyLyz9OEK8dmabLHw7vPNq+8+AKh
	8bhNZJA3hmbK0x7It4qzr79ea1uL/E9N81M4+z2kDlvz8f0nJZ9BCSUwy
	b8TEf5log8EXyKFSreCMEIybX+E1kRkuxUoSmtAH78kOKD2YTkZYJXcS6 w=;
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A0BIAABhmcdb/4sNJK1jGQEBAQEBAQE?=
	=?us-ascii?q?BAQEBAQcBAQEBAQGBZYIFZn8og3WIdos7gWglmQYLAQElhEcChHwhOBYBAwE?=
	=?us-ascii?q?BAgEBAm0cDIU5AQEBAQIBIwRSBQsLGCoCAlcGE4MhgXkID6ZDezOKGItMF4I?=
	=?us-ascii?q?AZ16CX4MQCwQYhEqCVwKIRBmGVI8ACYZYiiKBT4RxiWKMSIlMAgQLAhSBWiG?=
	=?us-ascii?q?BVU0jFYMnCYsPhV4fMAEJjAABAQ?=
X-IronPort-AV: E=Sophos;i="5.54,393,1534809600"; d="scan'208";a="467866459"
Received: from alln-core-6.cisco.com ([173.36.13.139])
	by rcdn-iport-1.cisco.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	17 Oct 2018 20:21:08 +0000
Received: from sjc-ads-6991 (sjc-ads-6991.cisco.com [10.30.218.111])
	by alln-core-6.cisco.com (8.15.2/8.15.2) with ESMTPS id w9HKL7ZD018881
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Wed, 17 Oct 2018 20:21:08 GMT
Date: Wed, 17 Oct 2018 13:21:07 -0700 (PDT)
From: Victor Kamensky <kamensky@cisco.com>
To: Martin Jansa <martin.jansa@gmail.com>
In-Reply-To: <CA+chaQekaVbr5MMkW7TFWXeFq5Ye-Cyfn5WBn-0ZiM=QVTW-GA@mail.gmail.com>
Message-ID: <alpine.LRH.2.00.1810171314560.37492@sjc-ads-6991.cisco.com>
References: <20181015182128.13115-1-kamensky@cisco.com>
	<CAJTo0LYWG7O+VryaFi9r4kc5JagPtuynWHi9gV6nV+cLPUw+SQ@mail.gmail.com>
	<9f182627633f75c8383901510cc11e4b87349084.camel@linuxfoundation.org>
	<alpine.LRH.2.00.1810162250430.53155@sjc-ads-6991.cisco.com>
	<118f12f46497b3b4fda287b64c5e432afde9b6d9.camel@linuxfoundation.org>
	<CA+chaQcjv6-2v8oC25=7fapKKg5XapC21+6K1oN28Kk9MJF2zw@mail.gmail.com>
	<40a5b6dd1386ea77070814f7ef7ad340cc2e9e62.camel@linuxfoundation.org>
	<CA+chaQekaVbr5MMkW7TFWXeFq5Ye-Cyfn5WBn-0ZiM=QVTW-GA@mail.gmail.com>
User-Agent: Alpine 2.00 (LRH 1167 2008-08-23)
MIME-Version: 1.0
X-Outbound-SMTP-Client: 10.30.218.111, sjc-ads-6991.cisco.com
X-Outbound-Node: alln-core-6.cisco.com
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
X-List-Received-Date: Wed, 17 Oct 2018 20:30:38 -0000
Content-Type: MULTIPART/MIXED;
	BOUNDARY="504000474-1082472408-1539807668=:37492"

--504000474-1082472408-1539807668=:37492
Content-Type: TEXT/PLAIN; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8BIT



On Wed, 17 Oct 2018, Martin Jansa wrote:

> systemd.bbclass won't include that .service file in FILES_<pkg> without setting SYSTEMD_SERVICE_<pkg>.
> I'll send fix for that in few minutes.

Martin, Richard, thank you for the help. I've reproduced
the issue reported by Martin in systemd enabled image, and
verified that his fix solves the issue.

The lesson I learnt:

o Look for WARNINGs

o Test systemd enabled image, along with default sysvinit

stap-exporter service is a new feature in SystemTap 4.0, I've never used
it before. I'll dig in and will try to make sure that it is functional
in resulting OE image.

Thanks,
Victor

> On Wed, Oct 17, 2018 at 5:07 PM <richard.purdie@linuxfoundation.org> wrote:
>       On Wed, 2018-10-17 at 16:50 +0200, Martin Jansa wrote:
>       > There seems to be one more issue in current master (for which I
>       > haven't seen a fix in master-next or ML):
>       >
>       > ERROR: systemtap-4.0-r0 do_package: QA Issue: systemtap:
>       > Files/directories were installed but not shipped in any package:
>       >   /lib
>       >   /lib/systemd
>       >   /lib/systemd/system
>       >   /lib/systemd/system/stap-exporter.service
>       > Please set FILES such that these items are packaged. Alternatively if
>       > they are unneeded, avoid installing them or delete them within
>       > do_install.
>       > systemtap: 4 installed and not shipped files. [installed-vs-shipped]
>
>       http://git.yoctoproject.org/cgit.cgi/poky/commit/?id=3b77e7b7852549dcfbc426d4ce258e6e857c0acd
>       was supposed to fix that :(
>
>       Cheers,
>
>       Richard
> 
> 
>

--504000474-1082472408-1539807668=:37492--
