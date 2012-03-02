Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <edwin.zhai@intel.com>) id 1S3MCO-0008KO-HU
	for openembedded-core@lists.openembedded.org;
	Fri, 02 Mar 2012 07:42:40 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 01 Mar 2012 22:33:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="113685517"
Received: from edwin-gen.sh.intel.com (HELO edwin-gen) ([10.239.36.17])
	by azsmga001.ch.intel.com with SMTP; 01 Mar 2012 22:33:02 -0800
Received: by edwin-gen (sSMTP sendmail emulation);
	Fri, 02 Mar 2012 14:33:39 +0800
Date: Fri, 2 Mar 2012 14:33:39 +0800
From: "Zhai, Edwin" <edwin.zhai@intel.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Message-ID: <20120302063339.GB1450@edwin-gen>
MIME-Version: 1.0
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: multilib build failure with shadow-sysroot:do_populate_sysroot_setscene
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
X-List-Received-Date: Fri, 02 Mar 2012 06:42:40 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

RP,
I have image-sato multilib build failure with following error:

"ERROR: Task do_package_setscene depends upon nonexistant task 
/distro/edwin-working/poky/meta/recipes-extended/shadow/shadow-sysroot_4.1.4.3.bb:do_populate_sysroot_setscene
Summary: There was 1 ERROR message shown, returning a non-zero exit code."

After removing "shadow-sysroot:do_populate_sysroot_setscene" from 
USERADDSETSCENEDEPS in meta/classes/useradd.bbclass, I can pass the build.

Why does it become nonexistant task in multilib building? Any possible fix for 
it?

Thanks,
Edwin


-- 
best rgds,
edwin


