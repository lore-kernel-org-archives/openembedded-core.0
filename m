Received: from eumx.net ([91.82.101.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ml@communistcode.co.uk>) id 1TxdjQ-0005r5-Ns
	for openembedded-core@lists.openembedded.org;
	Tue, 22 Jan 2013 14:17:41 +0100
Message-ID: <50FE8DCF.8050704@communistcode.co.uk>
Date: Tue, 22 Jan 2013 13:02:07 +0000
From: Jack Mitchell <ml@communistcode.co.uk>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130109 Thunderbird/17.0.2
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Boot Breakage (systemd inclusion related?)
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: ml@communistcode.co.uk
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 22 Jan 2013 13:17:44 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

So I attempted to build with the latest head today and my system won't 
boot, Here is the output:

INIT: version 2.88 booting
Starting Bootlog daemon: bootlogd: cannot allocate pseudo tty: No such 
file or directory
bootlogd.
Collected errors:
  * opkg_conf_load: Could not create lock file /var/lib/opkg/lock: 
Read-only file system.
INIT: Entering runlevel: 5S.d/S98run-postinsts': Re
Stopping Bootlog daemon: bootlogd.

dB Linux 1.0-20130122 (none) ttyO0

(none) login:

Does this mean much to anyone? I assume it is do with the new init 
manager changes but I can't be certain...

-- 

   Jack Mitchell (jack@embed.me.uk)
   Embedded Systems Engineer
   http://www.embed.me.uk

--



