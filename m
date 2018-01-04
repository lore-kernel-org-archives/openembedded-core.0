Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 4E66178698
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Jan 2018 13:13:50 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	04 Jan 2018 05:13:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.45,507,1508828400"; 
   d="scan'208";a="8009936"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by orsmga008.jf.intel.com with ESMTP; 04 Jan 2018 05:13:50 -0800
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	openembedded-core@lists.openembedded.org
References: <20171221130434.24427-1-alexander.kanavin@linux.intel.com>
	<20171221130434.24427-2-alexander.kanavin@linux.intel.com>
	<1514977917.5525.130.camel@linuxfoundation.org>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <b7f8ced5-0713-fbd5-5246-69e4bfa7e79f@linux.intel.com>
Date: Thu, 4 Jan 2018 15:13:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <1514977917.5525.130.camel@linuxfoundation.org>
Subject: Re: [PATCH 2/9] gnomebase.bbclass: split into autotools and meson versions
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
X-List-Received-Date: Thu, 04 Jan 2018 13:13:50 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 01/03/2018 01:11 PM, Richard Purdie wrote:
> On Thu, 2017-12-21 at 15:04 +0200, Alexander Kanavin wrote:
>> gnomebase.bbclass unfortunately hardcodes the autotools inherit,
>> so we have to introduce gnomebase-nobuildsystem.bbclass where
>> the common bits between autotools and meson classes can be placed.
> 
> In the interests of trying to avoid a ton more class files, could you
> tweak this to do something like:
> 
> GNOMEBASEBUILDCLASS ??= "autotools"
> 
> inherit ${GNOMEBASEBUILDCLASS}

Thanks, I just resent the patchset and this is now addressed.

Alex

