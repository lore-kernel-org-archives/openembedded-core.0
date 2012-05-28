Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1SZ08a-0007ev-6O
	for openembedded-core@lists.openembedded.org;
	Mon, 28 May 2012 15:37:32 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 28 May 2012 06:27:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="171988950"
Received: from unknown (HELO helios.localnet) ([10.252.120.22])
	by fmsmga002.fm.intel.com with ESMTP; 28 May 2012 06:26:14 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Giuseppe Condorelli <giuseppe.condorelli@gmail.com>
Date: Mon, 28 May 2012 14:26:13 +0100
Message-ID: <5252895.1gMWNIkXN5@helios>
Organization: Intel Corporation
User-Agent: KMail/4.8.2 (Linux/3.2.0-24-generic-pae; KDE/4.8.2; i686; ; )
In-Reply-To: <CAOHjBZsyWoca=JkLy==aqwYGwLeYYrNgR6PwwWMyNVjP0LSv5g@mail.gmail.com>
References: <CAOHjBZsyWoca=JkLy==aqwYGwLeYYrNgR6PwwWMyNVjP0LSv5g@mail.gmail.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: How to query installed rpm packages
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
X-List-Received-Date: Mon, 28 May 2012 13:37:32 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Monday 28 May 2012 15:14:32 Giuseppe Condorelli wrote:
> I need to query, via rpm command, the packages installed building an own
> image recipe.
> I know the populate_rootfs step for images uses rpm to install the packages
> (if we set PACKAGE_CLASSES).
> To do this it sets a dbpath and a root path for installing the packages.
> I need to know how to query them (rpm -qa ....) given that dbpath is set to
> /var/lib/rpm but I think it actually doesn't override
> the real /var/lib/rpm database (also I'm not building as superuser).

Have a look at list_installed_packages() in classes/rootfs_rpm.bbclass; that 
does exactly this. You can call this from your own shell function which you 
can add to ROOTFS_POSTPROCESS_COMMAND.

Note that if all you want is a listing of the installed packages in a file that 
gets written every time an image is built, you can get that using buildhistory 
without any extra work:

https://wiki.yoctoproject.org/wiki/Buildhistory

Cheers,
Paul

--

Paul Eggleton
Intel Open Source Technology Centre


