Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 4A02D70101
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 May 2016 09:57:54 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 04 May 2016 02:57:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,576,1455004800"; d="scan'208";a="958577780"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by fmsmga001.fm.intel.com with ESMTP; 04 May 2016 02:57:53 -0700
To: openembedded-core@lists.openembedded.org
References: <1461867811-7837-1-git-send-email-akuster808@gmail.com>
	<1462355553.6485.5.camel@linux.intel.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <5729C7C7.4080002@linux.intel.com>
Date: Wed, 4 May 2016 12:58:31 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Icedove/38.6.0
MIME-Version: 1.0
In-Reply-To: <1462355553.6485.5.camel@linux.intel.com>
Subject: Re: [master][krogoth][PATCH 1/2] qemu: Security fix CVE-2016-2857
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
X-List-Received-Date: Wed, 04 May 2016 09:57:55 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 05/04/2016 12:52 PM, Joshua G Lock wrote:
> I've been seeing:
>
> "qemu: uncaught target signal 11 (Segmentation fault) - core dumped"
>
> when trying to build gobject-introspection for qemux86 recently and
> narrowed it down to this change, if I revert this patch the use of
> qemu-native by gobject-introspection no longer causes a segmentation
> fault.
>
> Are we missing some related patches for this CVE fix? I haven't dug
> into the details, but noticed that Fedora's CVE-2016-2857 diffstat[1]
> is much larger than ours[2].

Also this patch is included in qemu 2.5.1 release that happened several 
weeks ago, so maybe we should update master to that instead.

Also 2.6.0 will appear any day now.


Alex


