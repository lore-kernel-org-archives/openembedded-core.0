Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 856C960616
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Jan 2017 13:00:44 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga104.fm.intel.com with ESMTP; 13 Jan 2017 05:00:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,221,1477983600"; d="scan'208";a="1112085462"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by fmsmga002.fm.intel.com with ESMTP; 13 Jan 2017 05:00:43 -0800
To: openembedded-core@lists.openembedded.org,
	"Lock, Joshua G" <joshua.g.lock@intel.com>
References: <20170105163423.8776-1-joshua.g.lock@intel.com>
	<35878aed-24bd-6129-54bb-f1dd68bf09a8@linux.intel.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <1b59a012-5943-d763-975f-764a6247121b@linux.intel.com>
Date: Fri, 13 Jan 2017 15:00:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Icedove/45.4.0
MIME-Version: 1.0
In-Reply-To: <35878aed-24bd-6129-54bb-f1dd68bf09a8@linux.intel.com>
Subject: Re: [PATCH] zlib: update SRC_URI to fix fetching
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
X-List-Received-Date: Fri, 13 Jan 2017 13:00:46 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 01/09/2017 02:56 PM, Alexander Kanavin wrote:
> On 01/05/2017 06:34 PM, Joshua Lock wrote:
>> Upstream have removed the file from zlib.net as a new version has
>> been released, switch to fetching from the official sourceforge
>> mirror.
>>
>> [YOCTO #10879]
>
> If a new version has been released, you should also update to that
> version. Also, does upstream version check (-c checkpkg) still work with
> the new SRC_URI?

Actually it doesn't, accordingly we have no way of knowing if zlib has a 
new version upstream. Please do check these things when you update SRC_URI.

Alex


