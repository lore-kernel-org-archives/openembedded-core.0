Return-Path: <maxin.john@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 9FE4977CD7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Apr 2017 08:29:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=intel.com; i=@intel.com; q=dns/txt; s=intel;
	t=1491899356; x=1523435356;
	h=date:from:to:cc:subject:message-id:references:
	mime-version:in-reply-to;
	bh=ssvEMPQpm/adfMlpyBpUbnWPUh+1dv7zuKc39Z2s/68=;
	b=RofzBw/EfG/frHgbBAypjEkY6QINpKXWQZoubScNhw47cC2XcBAO9lvW
	EH+gvVlTgLTELsKubYcTvfj3sRX4tg==;
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	11 Apr 2017 01:29:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.37,184,1488873600"; d="scan'208";a="844467222"
Received: from mbabyjoh-desk.fi.intel.com (HELO
	mbabyjoh-desk.ger.corp.intel.com) ([10.237.72.71])
	by FMSMGA003.fm.intel.com with ESMTP; 11 Apr 2017 01:29:13 -0700
Date: Tue, 11 Apr 2017 11:29:15 +0300
From: "Maxin B. John" <maxin.john@intel.com>
To: "Chang, Rebecca Swee Fun" <rebecca.swee.fun.chang@intel.com>
Message-ID: <20170411082914.GB16630@mbabyjoh-desk.ger.corp.intel.com>
References: <1491894357-128763-1-git-send-email-rebecca.swee.fun.chang@intel.com>
	<CAHiDW_F8U+ho73BV8k7cXbJ0tqufEGR9LVqNDBveTZhLDZsq=w@mail.gmail.com>
	<50B33AC5ED75F74F991980326F1C438D194EE79F@PGSMSX103.gar.corp.intel.com>
MIME-Version: 1.0
In-Reply-To: <50B33AC5ED75F74F991980326F1C438D194EE79F@PGSMSX103.gar.corp.intel.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] ed: update to 1.14.2
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
X-List-Received-Date: Tue, 11 Apr 2017 08:29:14 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Rebecca,

On Tue, Apr 11, 2017 at 09:09:23AM +0100, Chang, Rebecca Swee Fun wrote:
>Thanks Jussi, Richard was suggesting to add a note in the recipe about
>upstream regularly removing releases. Should I push a V2? Is Maxim working on it?

If we were not in a Feature freeze, upgrading would have been the best choice.
I have tried to update SRC_URI of ed-1.14.1 to the following servers:

1. DEBIAN_MIRROR : version 1.14.1 is not available 
2. http://fossies.org: version 1.14.1 is not available.

>> From: Jussi Kukkonen [mailto:jussi.kukkonen@intel.com]
>> Sent: Tuesday, April 11, 2017 3:58 PM
>> To: Chang, Rebecca Swee Fun <rebecca.swee.fun.chang@intel.com>
>> Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
>> Subject: Re: [OE-core] [PATCH] ed: update to 1.14.2
>>
>>> On 11 April 2017 at 10:05, <rebecca.swee.fun.chang@intel.com> wrote:
>>>
>>>     From: "Chang, Rebecca Swee Fun" <rebecca.swee.fun.chang@intel.com>
>>>
>>>         The previous version of ed-1.14.1 no longer exist in upstream source
>>>             archive at https://ftp.gnu.org/gnu/ed/. Upstream version was being
>>>                 replaced by a brand new version.
>>>
>> Feature freeze is in effect: version upgrades should either wait until after release
>> or come with a very good reason.
>>
>>Maxin sent a patch earlier to use the yocto mirror as SRC_URI: not ideal but probably
>>the best we can do if upstream really wants to delete old releases...

Warm Regards,
Maxin

