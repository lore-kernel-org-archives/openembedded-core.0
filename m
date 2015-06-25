Return-Path: <anibal.limon@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 1078D60125
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Jun 2015 20:03:09 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 25 Jun 2015 13:03:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,679,1427785200"; d="scan'208";a="734745172"
Received: from alimon-thinkpad-w540.zpn.intel.com (HELO [10.219.4.55])
	([10.219.4.55])
	by fmsmga001.fm.intel.com with ESMTP; 25 Jun 2015 13:03:09 -0700
Message-ID: <558C5EED.70000@linux.intel.com>
Date: Thu, 25 Jun 2015 15:05:01 -0500
From: =?UTF-8?B?QW7DrWJhbCBMaW3Ds24=?= <anibal.limon@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.7.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
Subject: Automatic Upgrade Helper Announcement
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
X-List-Received-Date: Thu, 25 Jun 2015 20:03:13 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi all,

I'm glad to announce the enabling of Automatic Upgrade Helper (a.k.a. 
AUH), the AUH is a service
that provides recipe upgrades and will be run on weekly basis.

If you are a maintainer (listed in [1]) you will receive AUH emails with 
Recipe upgrades when AUH
detects that upgrade is needed.

The development of AUH continues with adding capabilities like 
buildhistory support and image
testing for upgraded recipes planned for Yocto 1.9 release [2], 
contributions are welcome the code
can be found at [3].

Any comment or concern please contact me.

Cheers,
     alimon

[1] 
http://git.yoctoproject.org/cgit/cgit.cgi/poky/tree/meta-yocto/conf/distro/include/maintainers.inc 

[2] 
https://bugzilla.yoctoproject.org/buglist.cgi?product=Maintenance%20Tools&component=Automated%20Update%20Handler 

[3] http://git.yoctoproject.org/cgit/cgit.cgi/auto-upgrade-helper/

