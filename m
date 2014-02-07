Return-Path: <dvhart@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id CDEE16E918
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Feb 2014 16:56:05 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 07 Feb 2014 08:51:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.95,801,1384329600"; d="scan'208";a="479730694"
Received: from unknown (HELO [10.254.114.103]) ([10.254.114.103])
	by orsmga002.jf.intel.com with ESMTP; 07 Feb 2014 08:55:38 -0800
User-Agent: Microsoft-MacOutlook/14.3.9.131030
Date: Fri, 07 Feb 2014 08:55:33 -0800
From: Darren Hart <dvhart@linux.intel.com>
To: Bruce Ashfield <bruce.ashfield@windriver.com>,
	Saul Wold <sgw@linux.intel.com>, <richard.purdie@linuxfoundation.org>,
	"nitin.a.kamble" <nitin.a.kamble@intel.com>
Message-ID: <CF1A4F8F.6A6F9%dvhart@linux.intel.com>
Thread-Topic: [OE-core] [PATCH 2/2] linux-yocto/3.10: integrate LTSI
References: <cover.1391534980.git.bruce.ashfield@windriver.com>
	<274bcde5bf629e3cbac8d32560ce916520a771af.1391534980.git.bruce.ashfield@windriver.com>
	<52F50D0F.7020101@linux.intel.com> <52F50D61.90308@windriver.com>
	<CF1A4DD2.6A6E2%dvhart@linux.intel.com>
	<CF1A4E01.6A6E3%dvhart@linux.intel.com>
	<52F50E7B.50707@windriver.com>
In-Reply-To: <52F50E7B.50707@windriver.com>
Mime-version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/2] linux-yocto/3.10: integrate LTSI
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
X-List-Received-Date: Fri, 07 Feb 2014 16:56:05 -0000
Content-type: text/plain;
	charset="US-ASCII"
Content-transfer-encoding: 7bit

On 2/7/14, 8:48, "Bruce Ashfield" <bruce.ashfield@windriver.com> wrote:
>>>>>>| ERROR: Function failed: do_compile (log file is located at
>>>>>>
>>>>>> 
>>>>>>/home/pokybuild/yocto-autobuilder-dev/yocto-slave/nightly-x86/build/b
>>>>>>ui
>>>>>> l
>>>>>> 
>>>>>>d/tmp/work/qemux86-poky-linux/linux-yocto/3.10.25+gitAUTOINC+4d658aa5
>>>>>>80
>>>>>> _
>>>>>> 78d2a615b1-r0/temp/log.do_compile.1426)

So since this is qemux86 that is failing, and Bruce has run the qemu
builds - so are we using the right SRCREVs?

Machine: 78d2a615b1
Meta: 4d658aa580

>>>>>
>>>>> This can be seen on the AB
>>>>>
>>>>> 
>>>>>http://autobuilder.yoctoproject.org/main/builders/nightly-x86/builds/2
>>>>>0/
>>>>> s
>>>>> teps/BuildImages/logs/stdio

--
Darren



