Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1Qsun7-0003pk-Gi
	for openembedded-core@lists.openembedded.org;
	Mon, 15 Aug 2011 12:53:09 +0200
Received: by wyf19 with SMTP id 19so3753911wyf.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Aug 2011 03:48:33 -0700 (PDT)
Received: by 10.227.201.81 with SMTP id ez17mr3412636wbb.3.1313405313435;
	Mon, 15 Aug 2011 03:48:33 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id 8sm4455673wbx.34.2011.08.15.03.48.32
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 15 Aug 2011 03:48:32 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Mon, 15 Aug 2011 12:48:31 +0200
Message-Id: <47713121-267A-4FB8-800A-FB1BE23B5650@dominion.thruhere.net>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Mime-Version: 1.0 (Apple Message framework v1244.3)
X-Mailer: Apple Mail (2.1244.3)
Subject: TypeError: 'bool' object is unsubscriptable ?
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
X-List-Received-Date: Mon, 15 Aug 2011 10:53:09 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

Since this morning I'm getting errors like this:

NOTE: Resolving any missing task queue dependencies
NOTE: preferred version 1.0.0d of openssl-native not available (for item =
openssl-native)
NOTE: versions of openssl-native available: 0.9.8m 0.9.8r 1.0.0c
NOTE: Preparing runqueue
NOTE: Executing SetScene Tasks
NOTE: Executing RunQueue Tasks
NOTE: Running task 4 of 133 (ID: 19, =
/OE/tentacle/sources/openembedded-core/meta/recipes-devtools/quilt/quilt-n=
ative_0.48.bb, do_configure)
NOTE: Running task 16 of 133 (ID: 49, =
/OE/tentacle/sources/openembedded-core/meta/recipes-devtools/libtool/libto=
ol-native_2.4.bb, do_unpack)
NOTE: Running task 18 of 133 (ID: 77, =
virtual:native:/OE/tentacle/sources/openembedded-core/meta/recipes-devtool=
s/pkgconfig/pkgconfig_0.25.bb, do_unpack)
NOTE: Running task 20 of 133 (ID: 21, =
virtual:native:/OE/tentacle/sources/openembedded-core/meta/recipes-support=
/sqlite/sqlite3_3.7.7.1.bb, do_unpack)
NOTE: package quilt-native-0.48-r0: task do_configure: Started
ERROR: Build of do_configure failed
ERROR: Traceback (most recent call last):
  File "/OE/tentacle/sources/bitbake/lib/bb/build.py", line 366, in =
exec_task
    return _exec_task(fn, task, d, quieterr)
  File "/OE/tentacle/sources/bitbake/lib/bb/build.py", line 323, in =
_exec_task
    exec_func(task, localdata)
  File "/OE/tentacle/sources/bitbake/lib/bb/build.py", line 171, in =
exec_func
    exec_func_shell(func, d, runfile, cwd=3Dadir)
  File "/usr/lib/python2.6/contextlib.py", line 34, in __exit__
    self.gen.throw(type, value, traceback)
  File "/OE/tentacle/sources/bitbake/lib/bb/utils.py", line 400, in =
fileslocked
    yield
  File "/OE/tentacle/sources/bitbake/lib/bb/build.py", line 171, in =
exec_func
    exec_func_shell(func, d, runfile, cwd=3Dadir)
  File "/OE/tentacle/sources/bitbake/lib/bb/build.py", line 239, in =
exec_func_shell
    if bb.msg.loggerVerbose[1]:
TypeError: 'bool' object is unsubscriptable

This is with a clean build from scratch in the portion that builds =
pseudo-native.=


