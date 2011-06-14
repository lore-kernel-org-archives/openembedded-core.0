Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QWVt6-0004jr-6B
	for openembedded-core@lists.openembedded.org;
	Tue, 14 Jun 2011 17:50:44 +0200
Received: by wwb17 with SMTP id 17so5059101wwb.24
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Jun 2011 08:47:18 -0700 (PDT)
Received: by 10.227.165.202 with SMTP id j10mr3727051wby.18.1308066438504;
	Tue, 14 Jun 2011 08:47:18 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id fm14sm5130719wbb.24.2011.06.14.08.47.17
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 14 Jun 2011 08:47:17 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Tue, 14 Jun 2011 17:47:16 +0200
Message-Id: <966DEA61-296E-432F-A84B-D6403877C113@dominion.thruhere.net>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Mime-Version: 1.0 (Apple Message framework v1084)
X-Mailer: Apple Mail (2.1084)
Subject: eglibc patching fails
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
X-List-Received-Date: Tue, 14 Jun 2011 15:50:44 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

Hi,

After todays update with a clean build from scratch:

ERROR: Logfile of failure stored in: =
/OE/tentacle/build/tmp-angstrom_2010_x-eglibc/work/armv7a-angstrom-linux-g=
nueabi/eglibc-2.12-r14/temp/log.do_patch.14168
Log data follows:
| NOTE: Applying patch 'eglibc-svn-arm-lowlevellock-include-tls.patch' =
(sources/openembedded-core/meta/recipes-core/eglibc/eglibc-2.12/eglibc-svn=
-arm-lowlevellock-include-tls.patch)
| NOTE: Applying patch 'IO-acquire-lock-fix.patch' =
(sources/openembedded-core/meta/recipes-core/eglibc/eglibc-2.12/IO-acquire=
-lock-fix.patch)
| NOTE: Applying patch 'shorten-build-commands.patch' =
(sources/openembedded-core/meta/recipes-core/eglibc/eglibc-2.12/shorten-bu=
ild-commands.patch)
| NOTE: Applying patch 'mips-rld-map-check.patch' =
(sources/openembedded-core/meta/recipes-core/eglibc/eglibc-2.12/mips-rld-m=
ap-check.patch)
| NOTE: Applying patch 'fix-for-make-3.82.diff' =
(sources/openembedded-core/meta/recipes-core/eglibc/eglibc-2.12/fix-for-ma=
ke-3.82.diff)
| ERROR: ld.so: object 'libpseudo.so' from LD_PRELOAD cannot be =
preloaded: ignored.
| xterm Xt error: Can't open display:
| xterm:  DISPLAY is not set
| ERROR: Cannot proceed with manual patch resolution - 'xterm -T =
"$TERMWINDOWTITLE" -e $SHELLCMDS' not found. Check TERMCMDRUN variable.
| ERROR: Function 'patch_do_patch' failed
NOTE: package eglibc-2.12-r14: task do_patch: Failed
ERROR: Task 146 =
(/OE/tentacle/sources/openembedded-core/meta/recipes-core/eglibc/eglibc_2.=
12.bb, do_patch) failed with exit code '1'

regards,

Koen=


