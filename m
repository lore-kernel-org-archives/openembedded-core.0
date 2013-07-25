Return-Path: <sgw@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 11B446AF67
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Jul 2013 16:23:49 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 25 Jul 2013 09:23:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,744,1367996400"; d="scan'208";a="375980275"
Received: from unknown (HELO [10.255.14.43]) ([10.255.14.43])
	by fmsmga002.fm.intel.com with ESMTP; 25 Jul 2013 09:23:49 -0700
Message-ID: <51F15115.3040008@linux.intel.com>
Date: Thu, 25 Jul 2013 09:23:49 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130514 Thunderbird/17.0.6
MIME-Version: 1.0
To: 'Patches and discussions about the oe-core layer'
	<openembedded-core@lists.openembedded.org>, 
	"Iorga, Cristian" <cristian.iorga@intel.com>, 
	"Burton, Ross" <ross.burton@intel.com>
Subject: Thoughts about bluez4 and bluez5
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
X-List-Received-Date: Thu, 25 Jul 2013 16:23:49 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit



Cristi, Ross:

There is currently a PREFERRED_PROVIDER issue with bluez4 and bluez5 and 
I am beginning to think we need to distinguish the 
libasound-module-bluez with libasound-module-bluez5.

I am also seeing some areas where we might need a virtual/bluez to allow 
recipes to enable features in places like connman and ofono

Thoughts?



-- 
     Sau!

Saul Wold
Yocto Component Wrangler @ Intel
Yocto Project / Poky Build System


