Return-Path: <kamensky@cisco.com>
Received: from alln-iport-8.cisco.com (alln-iport-8.cisco.com [173.37.142.95])
	by mail.openembedded.org (Postfix) with ESMTP id F330E744AC
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Oct 2018 05:56:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=cisco.com; i=@cisco.com; l=2008; q=dns/txt; s=iport;
	t=1539755775; x=1540965375;
	h=date:from:to:cc:subject:in-reply-to:message-id:
	references:mime-version;
	bh=UpZKhL9Y5qv1yLmu1d7W2N6CiU7rJqK3A6lzrK+fOhs=;
	b=fWDugbGNYU3zPZoPtsJE3tfPT6OlKeSft0WgIqOlFBgvpaO7Xb0EUZ5k
	5PloI9c2b2R9njfy2GfQUHGWO5WjD5LREECzcswBhI2jZ0G86UH8ARHAv
	G8U5qmRSSzx/Y/1SBbxul+db1bMj+rHkod2V9WzNhXkM23EtX4JHlNNpU E=;
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A0BbAABDzsZb/4ENJK1jGgEBAQEBAgE?=
	=?us-ascii?q?BAQEHAgEBAQGBZYIEgWUojGuNNyWXIIFmCwEBhGwChG4hOBYBAwEBAgEBAm0?=
	=?us-ascii?q?ohTkBAQEBAgEnEQI/BQsLGC5XBhOFGgilOzOKHYtMF4IAgUWCX4RmhXICiF0?=
	=?us-ascii?q?4hhyOfgmQeZAglhMCBAsCFIFaIYFVTSMVO4JsgiYXjjkfMIwKAQE?=
X-IronPort-AV: E=Sophos;i="5.54,391,1534809600"; d="scan'208";a="186705598"
Received: from alln-core-9.cisco.com ([173.36.13.129])
	by alln-iport-8.cisco.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	17 Oct 2018 05:56:14 +0000
Received: from sjc-ads-6991 (sjc-ads-6991.cisco.com [10.30.218.111])
	by alln-core-9.cisco.com (8.15.2/8.15.2) with ESMTPS id w9H5uD6E002385
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Wed, 17 Oct 2018 05:56:14 GMT
Date: Tue, 16 Oct 2018 22:56:13 -0700 (PDT)
From: Victor Kamensky <kamensky@cisco.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
In-Reply-To: <9f182627633f75c8383901510cc11e4b87349084.camel@linuxfoundation.org>
Message-ID: <alpine.LRH.2.00.1810162250430.53155@sjc-ads-6991.cisco.com>
References: <20181015182128.13115-1-kamensky@cisco.com>
	<CAJTo0LYWG7O+VryaFi9r4kc5JagPtuynWHi9gV6nV+cLPUw+SQ@mail.gmail.com>
	<9f182627633f75c8383901510cc11e4b87349084.camel@linuxfoundation.org>
User-Agent: Alpine 2.00 (LRH 1167 2008-08-23)
MIME-Version: 1.0
X-Outbound-SMTP-Client: 10.30.218.111, sjc-ads-6991.cisco.com
X-Outbound-Node: alln-core-9.cisco.com
Cc: OE-core <openembedded-core@lists.openembedded.org>
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
X-List-Received-Date: Wed, 17 Oct 2018 05:56:14 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII; format=flowed



On Tue, 16 Oct 2018, Richard Purdie wrote:

> On Tue, 2018-10-16 at 10:27 +0100, Burton, Ross wrote:
>> On Mon, 15 Oct 2018 at 19:22, Victor Kamensky <kamensky@cisco.com>
>> wrote:
>>> Upgrade systemtap from 3.3 to 4.0: Removed backported patch.
>>
>> WARNING: systemtap-4.0-r0 do_package_qa: QA Issue: systemtap:
>> /systemtap/etc/stap-exporter/EXAMPLE is owned by uid 1000, which is
>> the same as the user running bitbake. This may be due to host
>> contamination
>> systemtap: /systemtap/etc/stap-exporter/EXAMPLE_NOERROR is owned by
>> uid 1000, which is the same as the user running bitbake. This may be
>> due to host contamination
>> systemtap: /systemtap/etc/stap-exporter/errno.stp is owned by uid
>> 1000, which is the same as the user running bitbake. This may be due
>> to host contamination
>> systemtap: /systemtap/etc/stap-exporter/syscalllatency.stp is owned
>> by
>> uid 1000, which is the same as the user running bitbake. This may be
>> due to host contamination
>> systemtap: /systemtap/etc/stap-exporter/timeout.stp is owned by uid
>> 1000, which is the same as the user running bitbake. This may be due
>> to host contamination
>> systemtap: /systemtap/etc/stap-exporter/topsys.stp is owned by uid
>> 1000, which is the same as the user running bitbake. This may be due
>> to host contamination [host-user-contaminated]
>
> There are also other issues from the addition of systemd unit files in
> 4.0. I've a patch in -next which tweaks both issues which I'll put in
> for testing.

Richard, thank you very prompt help.

In the long term it would be beneficial that those issues be
fixed in SystemTap itself, correct? If so, I can look at creating
proper patches and pushing them into SystemTap.

Also on my todo list is to attempt to push few existing
OE systemtap patches into SystemTap upstream source. I believe
they look like quite legit issues and I hope they could be
upstreamed.

Thanks,
Victor

> Cheers,
>
> Richard
>
>

