Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1Qsvhj-0005eP-PJ for openembedded-core@lists.openembedded.org;
	Mon, 15 Aug 2011 13:51:39 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p7FBl4km016509
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Aug 2011 12:47:04 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 16215-02 for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Aug 2011 12:47:00 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p7FBkvLL016481
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Aug 2011 12:46:58 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <47713121-267A-4FB8-800A-FB1BE23B5650@dominion.thruhere.net>
References: <47713121-267A-4FB8-800A-FB1BE23B5650@dominion.thruhere.net>
Date: Mon, 15 Aug 2011 12:46:55 +0100
Message-ID: <1313408815.14274.565.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: TypeError: 'bool' object is unsubscriptable ?
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
X-List-Received-Date: Mon, 15 Aug 2011 11:51:40 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2011-08-15 at 12:48 +0200, Koen Kooi wrote:
> Since this morning I'm getting errors like this:
> 
> NOTE: Resolving any missing task queue dependencies
> NOTE: preferred version 1.0.0d of openssl-native not available (for item openssl-native)
> NOTE: versions of openssl-native available: 0.9.8m 0.9.8r 1.0.0c
> NOTE: Preparing runqueue
> NOTE: Executing SetScene Tasks
> NOTE: Executing RunQueue Tasks
> NOTE: Running task 4 of 133 (ID: 19, /OE/tentacle/sources/openembedded-core/meta/recipes-devtools/quilt/quilt-native_0.48.bb, do_configure)
> NOTE: Running task 16 of 133 (ID: 49, /OE/tentacle/sources/openembedded-core/meta/recipes-devtools/libtool/libtool-native_2.4.bb, do_unpack)
> NOTE: Running task 18 of 133 (ID: 77, virtual:native:/OE/tentacle/sources/openembedded-core/meta/recipes-devtools/pkgconfig/pkgconfig_0.25.bb, do_unpack)
> NOTE: Running task 20 of 133 (ID: 21, virtual:native:/OE/tentacle/sources/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.7.7.1.bb, do_unpack)
> NOTE: package quilt-native-0.48-r0: task do_configure: Started
> ERROR: Build of do_configure failed
> ERROR: Traceback (most recent call last):
>   File "/OE/tentacle/sources/bitbake/lib/bb/build.py", line 366, in exec_task
>     return _exec_task(fn, task, d, quieterr)
>   File "/OE/tentacle/sources/bitbake/lib/bb/build.py", line 323, in _exec_task
>     exec_func(task, localdata)
>   File "/OE/tentacle/sources/bitbake/lib/bb/build.py", line 171, in exec_func
>     exec_func_shell(func, d, runfile, cwd=adir)
>   File "/usr/lib/python2.6/contextlib.py", line 34, in __exit__
>     self.gen.throw(type, value, traceback)
>   File "/OE/tentacle/sources/bitbake/lib/bb/utils.py", line 400, in fileslocked
>     yield
>   File "/OE/tentacle/sources/bitbake/lib/bb/build.py", line 171, in exec_func
>     exec_func_shell(func, d, runfile, cwd=adir)
>   File "/OE/tentacle/sources/bitbake/lib/bb/build.py", line 239, in exec_func_shell
>     if bb.msg.loggerVerbose[1]:
> TypeError: 'bool' object is unsubscriptable
> 
> This is with a clean build from scratch in the portion that builds pseudo-native.

Should be fixed now, sorry. Picked the wrong version of patch :/.

Cheers,

Richard



