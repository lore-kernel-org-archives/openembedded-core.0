Return-Path: <dvhart@linux.intel.com>
Received: from mga01.intel.com (unknown [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id C0FA06FA9D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 May 2014 14:42:48 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 28 May 2014 07:42:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.98,928,1392192000"; d="scan'208";a="546193490"
Received: from cbwilker-mobl2.amr.corp.intel.com (HELO [10.254.9.144])
	([10.254.9.144])
	by fmsmga002.fm.intel.com with ESMTP; 28 May 2014 07:42:46 -0700
User-Agent: Microsoft-MacOutlook/14.4.1.140326
Date: Wed, 28 May 2014 07:44:00 -0700
From: Darren Hart <dvhart@linux.intel.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Message-ID: <CFAB4426.94179%dvhart@linux.intel.com>
Thread-Topic: [PATCH 0/1] i2c-tools: Add i2c-tools to the core
References: <cover.1401223100.git.dvhart@linux.intel.com>
	<1401266574.2607.17.camel@ted>
In-Reply-To: <1401266574.2607.17.camel@ted>
Mime-version: 1.0
Cc: Koen Kooi <koen@dominion.thruhere.net>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/1] i2c-tools: Add i2c-tools to the core
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
X-List-Received-Date: Wed, 28 May 2014 14:42:48 -0000
Content-type: text/plain;
	charset="US-ASCII"
Content-transfer-encoding: 7bit

On 5/28/14, 1:42, "Richard Purdie" <richard.purdie@linuxfoundation.org>
wrote:

>On Tue, 2014-05-27 at 13:38 -0700, Darren Hart wrote:
>> The following changes since commit
>>f3d62a9eb9c47356e6150fdd55f790c159e620c7:
>> 
>>   eglinfo: updated to compile with mesa10+ (2014-05-27 16:11:55 +0100)
>> 
>> are available in the git repository at:
>> 
>>   git://git.yoctoproject.org/poky-contrib dvhart/i2c-tools
>>   
>>http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=dvhart/i2c-tools
>> 
>> Darren Hart (1):
>>   i2c-tools: Add i2c-tools to the core
>> 
>>  meta/recipes-devtools/i2c-tools/files/Module.mk    |   72
>>++++++++++++++++++++
>>  .../i2c-tools/i2c-tools-3.1.0/Module.mk            |   72
>>++++++++++++++++++++
>>  meta/recipes-devtools/i2c-tools/i2c-tools_3.1.0.bb |   26 +++++++
>>  3 files changed, 170 insertions(+)
>>  create mode 100644 meta/recipes-devtools/i2c-tools/files/Module.mk
>>  create mode 100644
>>meta/recipes-devtools/i2c-tools/i2c-tools-3.1.0/Module.mk
>>  create mode 100644 meta/recipes-devtools/i2c-tools/i2c-tools_3.1.0.bb
>
>I merged this, I've said I wanted this patch for long enough to multiple
>people, thanks! :)
>
>I removed the duplicate Module.mk file...

Oops, thanks.

What follow-up is necessary/appropriate with meta-oe?

-- 
Darren Hart					Open Source Technology Center
darren.hart@intel.com				            Intel Corporation




