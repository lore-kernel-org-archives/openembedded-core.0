Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 97973787BE
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Nov 2017 13:45:44 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	23 Nov 2017 05:45:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.44,441,1505804400"; 
   d="scan'208";a="8670804"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by orsmga001.jf.intel.com with ESMTP; 23 Nov 2017 05:45:44 -0800
To: "Maxin B. John" <maxin.john@intel.com>
References: <20171122163233.10292-1-alexander.kanavin@linux.intel.com>
	<20171122163233.10292-6-alexander.kanavin@linux.intel.com>
	<20171123112830.GA27281@mbabyjoh-desk.ger.corp.intel.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <32dd1406-2b80-8cd5-2af6-cccf05470dd2@linux.intel.com>
Date: Thu, 23 Nov 2017 15:46:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <20171123112830.GA27281@mbabyjoh-desk.ger.corp.intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 6/6] neon: remove the recipe
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
X-List-Received-Date: Thu, 23 Nov 2017 13:45:44 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 11/23/2017 01:28 PM, Maxin B. John wrote:
> It will be good to remove references of neon from 'distro_alias.inc' and 'maintainers.inc' as well.

To be honest, those two files are inconsistent for many other recipes, 
and we need a general solution for them. I think removing 
distro_alias.inc was discussed, and maintainers.inc content can be 
splitted into individual recipes (using a custom tool perhaps).


Alex

