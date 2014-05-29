Return-Path: <sgw@linux.intel.com>
Received: from mga11.intel.com (unknown [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id CE3A76605F
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 May 2014 17:08:09 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 29 May 2014 10:08:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.98,935,1392192000"; d="scan'208";a="546851633"
Received: from unknown (HELO [10.255.12.174]) ([10.255.12.174])
	by fmsmga002.fm.intel.com with ESMTP; 29 May 2014 10:08:09 -0700
Message-ID: <53876979.1020100@linux.intel.com>
Date: Thu, 29 May 2014 10:08:09 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.5.0
MIME-Version: 1.0
To: 'Patches and discussions about the oe-core layer'
	<openembedded-core@lists.openembedded.org>, 
	Yocto Project Discussion <yocto@yoctoproject.org>
Subject: HEADS-UP: Master now has GCC 4.9 as default
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
X-List-Received-Date: Thu, 29 May 2014 17:08:11 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit


Folks,

We have been testing with GCC 4.9 in master_under_test for sometime now 
and it's been passing local testing and sanity testing on the 
autobuilder.  Since we have the final fix for a PPC ICE issue in place 
now, we are moving to GCC 4.9 as the default in master for the 1.7 release.

Please be aware if this if you find some package failing unexpectedly.

Thanks to Khem and other for this effort!

-- 
     Sau!

Saul Wold
Yocto Component Wrangler @ Intel
Yocto Project / Poky Build System


