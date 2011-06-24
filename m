Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1Qa15m-0005FW-P3
	for openembedded-core@lists.openembedded.org;
	Fri, 24 Jun 2011 09:46:20 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 24 Jun 2011 00:42:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,418,1304319600"; d="scan'208";a="17936465"
Received: from unknown (HELO [10.255.13.126]) ([10.255.13.126])
	by azsmga001.ch.intel.com with ESMTP; 24 Jun 2011 00:42:40 -0700
Message-ID: <4E043FEF.8080107@linux.intel.com>
Date: Fri, 24 Jun 2011 00:42:39 -0700
From: Darren Hart <dvhart@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.17) Gecko/20110424 Lightning/1.0b2 Thunderbird/3.1.10
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: gconf-dbus fetch failure
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
X-List-Received-Date: Fri, 24 Jun 2011 07:46:20 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

It seems there is a problem with the subversion repository for gconf-dbus. Are others seeing this as well, or this perhaps a local networking issue?

ERROR: Logfile of failure stored in: /build/poky/timeline/qemux86/tmp/work/x86_64-linux/gconf-dbus-native-2.16.0+svnr705-r0/temp/log.do_fetch.19184
Log data follows:
| NOTE: Fetch svn://developer.imendio.com/svn/gconf-dbus;module=trunk;proto=http
| NOTE: Fetch svn://developer.imendio.com/svn/gconf-dbus;module=trunk;proto=http
| svn: OPTIONS of 'http://developer.imendio.com/svn/gconf-dbus/trunk': could not connect to server (http://developer.imendio.com)
|  ERROR: Function 'Fetcher failure for URL: 'svn://developer.imendio.com/svn/gconf-dbus;module=trunk;proto=http'. Unable to fetch URL svn://developer.imendio.com/svn/gconf-dbus;module=trunk;proto=http from any source.' failed

-- 
Darren Hart
Intel Open Source Technology Center
Yocto Project - Linux Kernel


