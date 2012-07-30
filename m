Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <laurentiu.palcu@intel.com>) id 1Svlrk-0005tT-Hu
	for openembedded-core@lists.openembedded.org;
	Mon, 30 Jul 2012 11:02:16 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 30 Jul 2012 01:50:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="174757690"
Received: from lpalcu-linux (HELO [10.237.105.41]) ([10.237.105.41])
	by azsmga001.ch.intel.com with ESMTP; 30 Jul 2012 01:50:39 -0700
Message-ID: <50164ADE.9030603@intel.com>
Date: Mon, 30 Jul 2012 11:50:38 +0300
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:14.0) Gecko/20120714 Thunderbird/14.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <cover.1343387245.git.laurentiu.palcu@intel.com>
	<5012D864.1090208@linux.intel.com> <50152759.4080202@balister.org>
In-Reply-To: <50152759.4080202@balister.org>
Subject: Re: [PATCH 0/6] relocatable SDK
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
X-List-Received-Date: Mon, 30 Jul 2012 09:02:16 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Hi Philip,

>>> The user will then execute the .sh script and give it the target
>>> directory for SDK installation (default is /opt/poky). The installer
> 
> For oe-core the default should be something like /opt/oe-core, not 
> /opt/some-distro.
This a good observation.

SDKPATH = "/opt/${DISTRO}/${SDK_VERSION}"

I will change the installer/setup scripts so that the default SDK
installation directory takes into account the DISTRO variable.

Thanks,
Laurentiu

> 
> Philip


