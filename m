Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QwIJD-0004v6-AT
	for openembedded-core@lists.openembedded.org;
	Wed, 24 Aug 2011 20:36:15 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 24 Aug 2011 11:31:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.68,276,1312182000"; d="scan'208";a="42016372"
Received: from unknown (HELO [10.255.14.203]) ([10.255.14.203])
	by azsmga001.ch.intel.com with ESMTP; 24 Aug 2011 11:30:59 -0700
Message-ID: <4E554363.5070505@linux.intel.com>
Date: Wed, 24 Aug 2011 11:30:59 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:5.0) Gecko/20110707 Thunderbird/5.0
MIME-Version: 1.0
To: Chris Larson <clarson@kergoth.com>
Cc: 'Patches and discussions about the oe-core layer'
	<openembedded-core@lists.openembedded.org>
Subject: Recent Changes to DevShell
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
X-List-Received-Date: Wed, 24 Aug 2011 18:36:15 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit


Chris,

In your recent changes to devshell, you seem to have broken the default 
behavior of setting  TERMCMD / TERMCMDRUN.

When I set them up for scree as follows:

TERMCMD = "${SCREEN_TERMCMD}"
TERMCMDRUN = "${SCREEN_TERMCMDRUN}"

I get a DEBUG message claing to be starting konsole, not screen, also 
there seems to be a problem with the environment being passed as the 
arg3 is related to env:

ERROR: Logfile of failure stored in: 
/vol/1/sgw/autobuilder/yab/yocto-slave/oe-core/build/build/tmp/work/armv5te-poky-linux-gnueabi/lttng-ust-0.15-r2/temp/log.do_devshell.31726
Log data follows:
| DEBUG: Attempting to spawn terminal "konsole"
| ERROR: Error executing a python function in 
/vol/1/sgw/autobuilder/yab/yocto-slave/oe-core/build/meta/recipes-kernel/lttng/lttng-ust_0.15.bb:
| TypeError: execve() arg 3 contains a non-string value
|
| ERROR: The stack trace of python calls that resulted in this 
exception/failure was:
| ERROR:   File "do_devshell", line 6, in <module>

Did you check that this worked correctly with screen?

Thanks
     Sau!

Saul Wold
Yocto Component Wrangler @ Intel
Yocto Project / Poky Build System



