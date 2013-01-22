Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <radu.moisan@intel.com>) id 1TxfOK-0000xI-0Y
	for openembedded-core@lists.openembedded.org;
	Tue, 22 Jan 2013 16:04:13 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 22 Jan 2013 06:47:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,514,1355126400"; d="scan'208";a="275185600"
Received: from unknown (HELO [10.252.123.181]) ([10.252.123.181])
	by orsmga002.jf.intel.com with ESMTP; 22 Jan 2013 06:48:09 -0800
Message-ID: <50FEA6A8.8090201@intel.com>
Date: Tue, 22 Jan 2013 16:48:08 +0200
From: Radu Moisan <radu.moisan@intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130106 Thunderbird/17.0.2
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <50FE8DCF.8050704@communistcode.co.uk>
In-Reply-To: <50FE8DCF.8050704@communistcode.co.uk>
Subject: Re: Boot Breakage (systemd inclusion related?)
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
X-List-Received-Date: Tue, 22 Jan 2013 15:04:15 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 01/22/2013 03:02 PM, Jack Mitchell wrote:
> So I attempted to build with the latest head today and my system won't 
> boot, Here is the output:
>
> INIT: version 2.88 booting
> Starting Bootlog daemon: bootlogd: cannot allocate pseudo tty: No such 
> file or directory
> bootlogd.
> Collected errors:
>  * opkg_conf_load: Could not create lock file /var/lib/opkg/lock: 
> Read-only file system.
> INIT: Entering runlevel: 5S.d/S98run-postinsts': Re
> Stopping Bootlog daemon: bootlogd.
>
> dB Linux 1.0-20130122 (none) ttyO0
>
> (none) login:
>
> Does this mean much to anyone? I assume it is do with the new init 
> manager changes but I can't be certain...
>

If you didn't enable systemd then it shouldn't interfere, sysvinit 
should work as it previously worked.

Radu


