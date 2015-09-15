Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 87E626E630
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Sep 2015 08:44:27 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga101.jf.intel.com with ESMTP; 15 Sep 2015 01:44:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,534,1437462000"; d="scan'208";a="561961696"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by FMSMGA003.fm.intel.com with ESMTP; 15 Sep 2015 01:44:26 -0700
Message-ID: <55F7DADE.5030900@linux.intel.com>
Date: Tue, 15 Sep 2015 11:46:22 +0300
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.7.0
MIME-Version: 1.0
To: akuster808 <akuster808@gmail.com>, 
	openembedded-core@lists.openembedded.org
References: <cover.1439991562.git.alexander.kanavin@linux.intel.com>
	<55D4EC10.9060001@gmail.com>
In-Reply-To: <55D4EC10.9060001@gmail.com>
Subject: Re: [PATCH 00/22] Update webkitgtk to latest stable upstream; replace midori with epiphany
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
X-List-Received-Date: Tue, 15 Sep 2015 08:44:31 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 08/19/2015 11:50 PM, akuster808 wrote:
> If you happen to need to repost this series again, Ruby version has just
> been updated. It includes: CVE-2015-3900 Request hijacking vulnerability
> in RubyGems 2.4.6 and earlier.
>
> Do we have any idea how long this will be before hitting master-next?
>
> I am leaning towards sending an update to meta-ruby while this patches
> series makes it way through the process.

The ruby recipe has finally made it into oe-core master, so please 
review and send any necessary followup patches, if it's become out of 
sync with what was in meta-ruby. I've already sent a patch to remove 
ruby from meta-oe.

Alex


