Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QNI1z-0005fr-UN
	for openembedded-core@lists.openembedded.org;
	Fri, 20 May 2011 07:13:48 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 19 May 2011 22:10:50 -0700
X-ExtLoop1: 1
Received: from unknown (HELO [10.255.12.39]) ([10.255.12.39])
	by orsmga002.jf.intel.com with ESMTP; 19 May 2011 22:10:49 -0700
Message-ID: <4DD5F7D9.6070103@linux.intel.com>
Date: Thu, 19 May 2011 22:10:49 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.17) Gecko/20110428 Fedora/3.1.10-1.fc13 Thunderbird/3.1.10
MIME-Version: 1.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	'Patches and discussions about the oe-core layer'
	<openembedded-core@lists.openembedded.org>
Subject: qemu-config & non-gplv3
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 20 May 2011 05:13:48 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit


Richard,

I was reminded again about the need to do non-GPLv3 sooner and more 
often.  I ran that today for core-image-basic on x86 and found 3 issues, 
first 2 were easy and will be in tonight's consolidated pull.

This issue again was with qemu-config dragging in GPLv3 licensed stuff 
and thus not having dependencies met. I understand the need for those 
packages in a development/debug environment, but we need a flexible way 
to enable and disable that task.

I know the easy way would be to club it over the head and remove 
qemu-config from qemu.inc's MACHINE_ESSENTIAL_EXTRA_RDEPENDS, but that's 
not the correct way!

We can make it be MACHINE_EXTRA_RDEPENDS or maybe more flexibly an 
IMAGE_FEATURE that can be disabled for minimal or non-GPLv3 builds.

Thoughts?

Thanks
-- 
     Sau!

Saul Wold
Yocto Component Wrangler @ Intel
Yocto Project / Poky Build System



