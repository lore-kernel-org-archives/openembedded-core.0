Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 875A0606D1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Nov 2015 15:51:27 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga101.fm.intel.com with ESMTP; 18 Nov 2015 07:51:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,313,1444719600"; d="scan'208";a="602601857"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by FMSMGA003.fm.intel.com with ESMTP; 18 Nov 2015 07:51:10 -0800
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <cover.1447840091.git.alexander.kanavin@linux.intel.com>
	<1447861138.12500.83.camel@linuxfoundation.org>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <564C9DE1.5090900@linux.intel.com>
Date: Wed, 18 Nov 2015 17:48:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Icedove/38.3.0
MIME-Version: 1.0
In-Reply-To: <1447861138.12500.83.camel@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/8] Deprecate package_regex.inc and split it into recipes
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
X-List-Received-Date: Wed, 18 Nov 2015 15:51:33 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/18/2015 05:38 PM, Richard Purdie wrote:

>> This patch series deprecates package_regex.inc and splits its contents into
>> respective recipes. This is done for same reasons as deprecating
>> upstream_tracking.inc: having upstream version check tweaks bundled into a
>> separate file makes the information prone to getting out of date.
>
> Looking at the patches the one thing that bothers me is the name of this
> variable, "REGEX". In the recipe context its rather ambiguous what it
> means.
>
> I'm wondering if we should take the opportunity to call it something
> like SRC_URI_REGEX or something?
>
> We either do it now or not at all...

I agree. I'll do the rename (from REGEX_URI to UPSTREAM_CHECK_URI and 
from REGEX to UPSTREAM_CHECK_REGEX) and resubmit.

This may break upstream versions checks for a while though, because 
there may be code accessing these variables that is not in oe-core tree.

Alex


