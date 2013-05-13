Received: from eumx.net ([91.82.101.43] helo=owm.eumx.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ml@communistcode.co.uk>) id 1UbpCi-0007xN-9l
	for openembedded-core@lists.openembedded.org;
	Mon, 13 May 2013 11:38:06 +0200
Message-ID: <5190B034.1000800@communistcode.co.uk>
Date: Mon, 13 May 2013 10:19:48 +0100
From: Jack Mitchell <ml@communistcode.co.uk>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130428 Thunderbird/17.0.5
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: python-pyrex-native unpackaged files
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
X-List-Received-Date: Mon, 13 May 2013 09:38:21 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

My build from master this morning threw up the following:

WARNING: The recipe python-pyrex-native is trying to install files into 
a shared area when those files already exist. Those files and their 
manifest location are:
/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/lib/python2.7/site-packages/Pyrex/__init__.pyc
/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/lib/python2.7/site-packages/Pyrex/Debugging.pyc
/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/lib/python2.7/site-packages/Pyrex/Utils.pyc
/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/lib/python2.7/site-packages/Pyrex/Compiler/__init__.pyc
/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/lib/python2.7/site-packages/Pyrex/Compiler/Builtin.pyc
/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/lib/python2.7/site-packages/Pyrex/Compiler/Code.pyc
/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/lib/python2.7/site-packages/Pyrex/Compiler/DebugFlags.pyc
/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/lib/python2.7/site-packages/Pyrex/Compiler/Errors.pyc
/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/lib/python2.7/site-packages/Pyrex/Compiler/ExprNodes.pyc
/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/lib/python2.7/site-packages/Pyrex/Compiler/Filenames.pyc
/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/lib/python2.7/site-packages/Pyrex/Compiler/Lexicon.pyc
/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/lib/python2.7/site-packages/Pyrex/Compiler/Main.pyc
/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/lib/python2.7/site-packages/Pyrex/Compiler/ModuleNode.pyc
/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/lib/python2.7/site-packages/Pyrex/Compiler/Naming.pyc
/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/lib/python2.7/site-packages/Pyrex/Compiler/Nodes.pyc
/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/lib/python2.7/site-packages/Pyrex/Compiler/Options.pyc
/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/lib/python2.7/site-packages/Pyrex/Compiler/Parsing.pyc
/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/lib/python2.7/site-packages/Pyrex/Compiler/PyrexTypes.pyc
/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/lib/python2.7/site-packages/Pyrex/Compiler/Scanning.pyc
/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/lib/python2.7/site-packages/Pyrex/Compiler/Symtab.pyc
/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/lib/python2.7/site-packages/Pyrex/Compiler/TypeSlots.pyc
/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/lib/python2.7/site-packages/Pyrex/Compiler/Version.pyc
/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/lib/python2.7/site-packages/Pyrex/Distutils/__init__.pyc
/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/lib/python2.7/site-packages/Pyrex/Distutils/build_ext.pyc
/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/lib/python2.7/site-packages/Pyrex/Distutils/extension.pyc
/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/lib/python2.7/site-packages/Pyrex/Plex/__init__.pyc
/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/lib/python2.7/site-packages/Pyrex/Plex/Actions.pyc
/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/lib/python2.7/site-packages/Pyrex/Plex/DFA.pyc
/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/lib/python2.7/site-packages/Pyrex/Plex/Errors.pyc
/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/lib/python2.7/site-packages/Pyrex/Plex/Lexicons.pyc
/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/lib/python2.7/site-packages/Pyrex/Plex/Machines.pyc
/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/lib/python2.7/site-packages/Pyrex/Plex/Regexps.pyc
/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/lib/python2.7/site-packages/Pyrex/Plex/Scanners.pyc
/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/lib/python2.7/site-packages/Pyrex/Plex/Transitions.pyc
Please verify which package should provide the above files.

The package hasn't changed in about a year, so I can only assume that 
something to do with python packaging has recently caught this?

Cheers,
Jack.

-- 

   Jack Mitchell (jack@embed.me.uk)
   Embedded Systems Engineer
   http://www.embed.me.uk

--



