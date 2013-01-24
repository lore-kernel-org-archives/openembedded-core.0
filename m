Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <radu.moisan@intel.com>) id 1TyJWa-0002cf-Jj
	for openembedded-core@lists.openembedded.org;
	Thu, 24 Jan 2013 10:55:12 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 24 Jan 2013 01:39:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,528,1355126400"; d="scan'208";a="281587618"
Received: from dell-desktop (HELO [10.237.105.59]) ([10.237.105.59])
	by fmsmga002.fm.intel.com with ESMTP; 24 Jan 2013 01:39:38 -0800
Message-ID: <510102F4.70108@intel.com>
Date: Thu, 24 Jan 2013 11:46:28 +0200
From: Radu Moisan <radu.moisan@intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130106 Thunderbird/17.0.2
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <50FFFF81.8010203@communistcode.co.uk>
In-Reply-To: <50FFFF81.8010203@communistcode.co.uk>
Subject: Re: systemd: /run directory not created
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
X-List-Received-Date: Thu, 24 Jan 2013 09:55:12 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 01/23/2013 05:19 PM, Jack Mitchell wrote:
> When I attempt to boot a systemd enabled image I get an error stating 
> that the run directory could not be mounted as it doesn't exist. I 
> checked the target rootfs and there isn't a /run directory. What is 
> responsible for creating this and why is it not doing it's job?
>
> [ 2.631549] systemd[1]: Failed to mount /run: No such file or directory
>
> Possibly of interest is that I am running a custom distro with 
> manually specified DISTRO_FEATURES.
>

Possibly because /run was a link created by the initscripts which are 
now disabled when systemd is the init manager. I'll look into this and 
update 00-create-volatile.conf so that systemd will handle the link 
creation in stead.

Radu


