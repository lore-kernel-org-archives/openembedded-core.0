Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1UNQHz-0005vU-Jw
	for openembedded-core@lists.openembedded.org;
	Wed, 03 Apr 2013 18:12:08 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 03 Apr 2013 08:54:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,402,1363158000"; d="scan'208";a="316338569"
Received: from unknown (HELO envy.home) ([10.255.13.219])
	by fmsmga002.fm.intel.com with ESMTP; 03 Apr 2013 08:54:23 -0700
Message-ID: <515C50AF.5020408@linux.intel.com>
Date: Wed, 03 Apr 2013 08:54:23 -0700
From: Darren Hart <dvhart@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130110 Thunderbird/17.0.2
MIME-Version: 1.0
To: Ross Burton <ross.burton@intel.com>
References: <cover.1364942359.git.dvhart@linux.intel.com>
	<D8E6D6E1514B4B1297F02DD04278253F@intel.com>
In-Reply-To: <D8E6D6E1514B4B1297F02DD04278253F@intel.com>
X-Enigmail-Version: 1.5.1
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/3] Add input group and udev rule to fix rootless X
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 03 Apr 2013 16:12:08 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 04/03/2013 01:09 AM, Ross Burton wrote:
> On Tuesday, 2 April 2013 at 23:42, Darren Hart wrote:
>> udev: Add rule adding input devices to input group
> 
> Please put this in udev-extraconf so that systemd's udev can use it too.

OK, will do.

-- 
Darren Hart
Intel Open Source Technology Center
Yocto Project - Technical Lead - Linux Kernel


