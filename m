Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id EA30C77B14
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 May 2017 10:54:08 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	04 May 2017 03:54:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.38,287,1491289200"; d="scan'208";a="1143528108"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by fmsmga001.fm.intel.com with ESMTP; 04 May 2017 03:54:08 -0700
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	openembedded-core@lists.openembedded.org
References: <20170503131153.1780-1-alexander.kanavin@linux.intel.com>
	<20170503131153.1780-4-alexander.kanavin@linux.intel.com>
	<1493894978.23535.113.camel@linuxfoundation.org>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <fe883eb0-51fc-54c3-d863-358d63dbc4eb@linux.intel.com>
Date: Thu, 4 May 2017 13:54:10 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <1493894978.23535.113.camel@linuxfoundation.org>
Subject: Re: [PATCH 4/5] recipes-lsb4/perl: remove the recipes
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
X-List-Received-Date: Thu, 04 May 2017 10:54:11 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 05/04/2017 01:49 PM, Richard Purdie wrote:
> On Wed, 2017-05-03 at 16:11 +0300, Alexander Kanavin wrote:
>> These were required by LSB 4.1 tests; there's no other reason to
>> continue
>> carrying them in oe-core.
>
> We did discuss LSB and agreed we'd document which pieces we'd support
> and not support. Can we add such a text file before we start deleting
> things please?
>
> [I'm totally in favour of killing off some of these things, but we need
> to do what we said we'd do]

I have added a 'docchange: yes' flag to the bug [1], so that Scott would 
document the changes, and assumed this would be sufficient?

[1] https://bugzilla.yoctoproject.org/show_bug.cgi?id=11316

Alex

