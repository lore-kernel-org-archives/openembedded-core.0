Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <scott.a.garman@intel.com>) id 1QZ9e5-0000TI-7K
	for openembedded-core@lists.openembedded.org;
	Wed, 22 Jun 2011 00:42:09 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 21 Jun 2011 15:38:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,402,1304319600"; d="scan'208";a="21114520"
Received: from unknown (HELO [10.255.13.75]) ([10.255.13.75])
	by fmsmga001.fm.intel.com with ESMTP; 21 Jun 2011 15:38:34 -0700
Message-ID: <4E011D62.4070603@intel.com>
Date: Tue, 21 Jun 2011 15:38:26 -0700
From: Scott Garman <scott.a.garman@intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.17) Gecko/20110424 Lightning/1.0b2 Thunderbird/3.1.10
MIME-Version: 1.0
To: Koen Kooi <koen@dominion.thruhere.net>
References: <cover.1308615886.git.scott.a.garman@intel.com>
	<cac953e344bf63b8e8b49d4d748427afbfcbd3ab.1308615886.git.scott.a.garman@intel.com>
	<10377FD6-4D99-467E-9755-A931F6C446E8@dominion.thruhere.net>
In-Reply-To: <10377FD6-4D99-467E-9755-A931F6C446E8@dominion.thruhere.net>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] shadow-sysroot: new recipe for useradd.bbclass support
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
X-List-Received-Date: Tue, 21 Jun 2011 22:42:09 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 06/20/2011 11:30 PM, Koen Kooi wrote:
>
> Op 21 jun 2011, om 02:29 heeft Scott Garman het volgende geschreven:
>
>> Packaging login.defs with base-passwd causes problems due to the
>> file being included in target package installs. Instead, this
>> shadow-sysroot recipe can be used by useradd.bbclass to put
>> login.defs into the target sysroot without disturbing packages
>> intended for target devices.
>
> So how does it end up on the target device after this?

login.defs would still end up on the target device when you install the 
shadow (target) package. Otherwise the file is not needed (and hence, 
should not have been packaged with base-passwd to begin with - my bad).

Scott

-- 
Scott Garman
Embedded Linux Engineer - Yocto Project
Intel Open Source Technology Center


