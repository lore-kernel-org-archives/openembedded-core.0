Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id C940A60797
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Sep 2016 13:01:46 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga103.fm.intel.com with ESMTP; 26 Sep 2016 06:01:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.30,399,1470726000"; d="scan'208";a="173257172"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.49])
	([10.237.68.49])
	by fmsmga004.fm.intel.com with ESMTP; 26 Sep 2016 06:01:47 -0700
To: openembedded-core@lists.openembedded.org
References: <9143dac0-3a7c-59a8-13f4-f97340317f70@dresearch-fe.de>
	<CAHiDW_Fy0fK2CEh8MAOeR0WmCPJ_=mweSzVk1FbL-RyRSoqGRw@mail.gmail.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <ced21432-c81a-faeb-3063-cb0e9b0d2027@linux.intel.com>
Date: Mon, 26 Sep 2016 15:59:53 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Icedove/45.2.0
MIME-Version: 1.0
In-Reply-To: <CAHiDW_Fy0fK2CEh8MAOeR0WmCPJ_=mweSzVk1FbL-RyRSoqGRw@mail.gmail.com>
Subject: Re: defining default locale (LANG/LC_ALL)
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
X-List-Received-Date: Mon, 26 Sep 2016 13:01:47 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 09/26/2016 02:55 PM, Jussi Kukkonen wrote:
>
>     May be this is a FAQ, but I could not find any helpful documentation.
>
>     What is the best way to define a system wide default locale setting
>     (LANG and LC_ALL) for OE based Angstrom style images?
>
>
> systemd provides system wide locale settings through /etc/locale.conf,
> all services will inherit these (note that LC_ALL is not supported). I
> expect these should just work in OE.
>
> I'm not aware of anything quite like that for non-systemd though.

Note that LC_ALL should not be used for setting the system-wide default: 
it takes precedence over any other variable. LANG is the way to go.

Alex

