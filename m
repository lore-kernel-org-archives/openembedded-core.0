Return-Path: <andrei.adrianx.dinu@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id C1CE46B3C7
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Jul 2013 12:28:25 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 26 Jul 2013 05:28:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,751,1367996400"; d="scan'208";a="376541925"
Received: from adinu-vostro-460.rb.intel.com (HELO [10.237.105.146])
	([10.237.105.146])
	by fmsmga002.fm.intel.com with ESMTP; 26 Jul 2013 05:28:18 -0700
Message-ID: <51F26B86.5020309@intel.com>
Date: Fri, 26 Jul 2013 15:28:54 +0300
From: Andrei Dinu <andrei.adrianx.dinu@intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
Subject: is there a variable where the kernel version is stored?
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
X-List-Received-Date: Fri, 26 Jul 2013 12:28:26 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hello,

I'm having a problem trying to run Bastille. Seems like the kernel 
version has changed from 3.8.11 to 3.8.13 and
in order to run Bastille, i need to patch a file used by the tool to 
check the version of the system. It was previously
patched with linux-yocto-3.8.11 version, but now it has changed to 
linux-yocto-3.8.13 and the tool doesn't work
because it doesn't identify the right version of the kernel.

Is there a way to find out the kernel version at build time so i can 
replace it dynamically in that specific file?

Thanks in advance,

Andrei Dinu

