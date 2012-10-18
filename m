Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1TOwTE-0005IJ-Tn
	for openembedded-core@lists.openembedded.org;
	Thu, 18 Oct 2012 22:13:33 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 18 Oct 2012 13:00:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,608,1344236400"; d="scan'208";a="237138772"
Received: from unknown (HELO envy.home) ([10.255.14.53])
	by fmsmga002.fm.intel.com with ESMTP; 18 Oct 2012 13:00:11 -0700
Message-ID: <50805F8F.5050604@linux.intel.com>
Date: Thu, 18 Oct 2012 15:59:11 -0400
From: Darren Hart <dvhart@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:16.0) Gecko/20121009 Thunderbird/16.0
MIME-Version: 1.0
To: Khem Raj <raj.khem@gmail.com>
References: <1350554279-8975-1-git-send-email-yashpal.dutta@freescale.com>
	<7A2134DD-519C-4FFB-ACEE-8E36E7A5A088@gmail.com>
In-Reply-To: <7A2134DD-519C-4FFB-ACEE-8E36E7A5A088@gmail.com>
X-Enigmail-Version: 1.4.5
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] cryptodev kernel module recipe
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
X-List-Received-Date: Thu, 18 Oct 2012 20:13:33 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit



On 10/18/2012 02:14 AM, Khem Raj wrote:
> 
> On Oct 18, 2012, at 2:57 AM, Yashpal Dutta <yashpal.dutta@freescale.com> wrote:
> 
>> +-install:
>> ++modules_install:
>> + 	make -C $(KERNEL_DIR) SUBDIRS=`pwd` modules_install
>> +-	@echo "Installing cryptodev.h in /usr/include/crypto ..."
>> +-	@install -D crypto/cryptodev.h /usr/include/crypto/cryptodev.h
>> ++	@echo "Installing cryptodev.h in $(PREFIX)/usr/include/crypto ..."
>> ++	@install -D crypto/cryptodev.h $(PREFIX)/usr/include/crypto/cryptodev.h
>> + 
> 
> why is it installing linux headers under /usr/include shouldn't they be under usr/include/linux ?

And shouldn't /usr/include be one of those ${*dir} variables?

-- 
Darren Hart
Intel Open Source Technology Center
Yocto Project - Technical Lead - Linux Kernel


