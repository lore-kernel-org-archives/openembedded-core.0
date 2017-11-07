Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id 3C32371B99
	for <openembedded-core@lists.openembedded.org>;
	Tue,  7 Nov 2017 14:53:50 +0000 (UTC)
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by orsmga105.jf.intel.com with ESMTP; 07 Nov 2017 06:53:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.44,359,1505804400"; d="scan'208";a="173093778"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by fmsmga006.fm.intel.com with ESMTP; 07 Nov 2017 06:53:50 -0800
To: Mark Hatle <mark.hatle@windriver.com>,
	openembedded-core@lists.openembedded.org, Khem Raj <raj.khem@gmail.com>
References: <20171018121423.1310-1-alexander.kanavin@linux.intel.com>
	<264c9619-62e7-ef43-9412-f00e9a1028ba@linux.intel.com>
	<634edf6c-23d9-1dbf-6c51-caef2f30c06f@windriver.com>
	<d4391631-e05e-bae9-363e-6d9fb7f3e3b6@linux.intel.com>
	<f7c3b1e5-b5d1-37e3-0a19-24dfd2cab276@windriver.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <bfd7b5d5-328b-c0d9-0b61-75e60237b149@linux.intel.com>
Date: Tue, 7 Nov 2017 16:53:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <f7c3b1e5-b5d1-37e3-0a19-24dfd2cab276@windriver.com>
Subject: Re: [PATCH] rpm: update to 4.14.0
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
X-List-Received-Date: Tue, 07 Nov 2017 14:53:51 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 11/06/2017 06:54 PM, Mark Hatle wrote:
> You would need to interpret the dwarf symbols and find all of the referenced
> files.  I can certainly be done with the libelf (libdwarf?), but I don't know if
> it can be done with binutils or elfutils directly.  They may not have the
> necessary translation to be able to assembly the pieces.
> 
> (A lot of the filenames are listed related to a directory.. and the entries are
> stored in different places and have to be assembled to get a similar output to
> what debugedit gave us.)
> 
> Writing a small standalone tool to give us this information may be very useful
> to us though -- and would let us break the 'rpm' dependency for deb/ipkg
> builds.. (probably)

'readelf -wL <binary>' looks promising. I think we can simply process 
its output from package.class (yes, a bit brittle, but easier than 
writing a separate tool).

Alex

