Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by mx.groups.io with SMTP id smtpd.web12.1301.1598293720399785088
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Aug 2020 11:28:40 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: linux.intel.com, ip: 192.55.52.120, mailfrom: randy.e.witt@linux.intel.com)
IronPort-SDR: 2eFJvOYnYcAV0yRhI7J1FF/oW5awNkxMqF3LJkQ1Drx+6shwRMuH6RoERot07B8e88BT2iIgCp
 xfCYOrtl+DXw==
X-IronPort-AV: E=McAfee;i="6000,8403,9723"; a="153381009"
X-IronPort-AV: E=Sophos;i="5.76,349,1592895600"; 
   d="scan'208";a="153381009"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2020 11:28:39 -0700
IronPort-SDR: xaf1V5Yz82+xPtmyfAgwCoXG912qxniG0ayGmt+dE2VTAjqPCh+LLXMw2d4V22ski0QDH+K6G0
 vnBQ3wm0A7hw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,349,1592895600"; 
   d="scan'208";a="328591469"
Received: from rewitt-desk0.jf.intel.com (HELO [10.7.159.145]) ([10.7.159.145])
  by orsmga008.jf.intel.com with ESMTP; 24 Aug 2020 11:28:39 -0700
To: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
From: "Randy Witt" <randy.e.witt@linux.intel.com>
Subject: New changes to bootimg-efi.py break some wic installer image methods
Cc: khasim.mohammed@arm.com
Message-ID: <822ebe79-db79-49c9-c422-5f85ae7587ea@linux.intel.com>
Date: Mon, 24 Aug 2020 11:28:39 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hi,

The changes in 
https://git.yoctoproject.org/cgit/cgit.cgi/poky/commit/?id=801f07fc00d43d107cb6ae671dbbb57ee91cc6be 
prevent creating an installer image using wic described here: 
http://git.yoctoproject.org/cgit/cgit.cgi/meta-intel/tree/README#n201.

This is because the IMAGE_BOOT_FILES intended for bootimg-partition, now 
override the efi files added by efi-bootimg.

The simplest solution would be to use a different variable for the bootimg-efi 
plugin such as IMAGE_EFI_BOOT_FILES. IMAGE_BOOT_FILES and IMAGE_EFI_BOOT_FILES 
could always be set to the same values if desired.

I'm not sure this is the "best" solution, but it would allow for both methods to 
coexist with a relatively small change.
