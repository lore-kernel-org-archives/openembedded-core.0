Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 475F46FF80
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Sep 2016 12:42:25 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga104.fm.intel.com with ESMTP; 26 Sep 2016 05:42:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.30,399,1470726000"; d="scan'208";a="766034094"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.49])
	([10.237.68.49])
	by FMSMGA003.fm.intel.com with ESMTP; 26 Sep 2016 05:42:26 -0700
To: openembedded-core@lists.openembedded.org
References: <1474620517-4809-1-git-send-email-anujx.mittal@intel.com>
	<20160923085640.GA17846@mbabyjoh-desk.ger.corp.intel.com>
	<5465751.PuAniykgrn@peggleto-mobl.ger.corp.intel.com>
	<1474644006.8561.15.camel@intel.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <a065a7e4-f6bb-4e99-8b2f-03562aff4c3f@linux.intel.com>
Date: Mon, 26 Sep 2016 15:40:33 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Icedove/45.2.0
MIME-Version: 1.0
In-Reply-To: <1474644006.8561.15.camel@intel.com>
Subject: Re: [master][PATCH] openssl: security fix CVE-2016-6304
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
X-List-Received-Date: Mon, 26 Sep 2016 12:42:27 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 09/23/2016 06:20 PM, Patrick Ohly wrote:

> The compile error is inside an #ifdef, so it could be that just that
> particular configuration hadn't been tested. But yes, one has to wonder.
>
> So what's preferred for OE-core master and the 2.2 release? Updating to
> 1.0.2i or backporting the critical patch?
>
> I don't have any strong opinion either way myself.

Meanwhile, 1.0.2j is out :) I'd say for master we should just go ahead 
and update to that.

Alex


