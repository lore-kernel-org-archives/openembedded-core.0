Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1S7QM8-0001DG-QH for openembedded-core@lists.openembedded.org;
	Tue, 13 Mar 2012 12:57:33 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q2DBmov9025947
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Mar 2012 11:48:50 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 22522-09 for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Mar 2012 11:48:46 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q2DBmi1c025940
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Mar 2012 11:48:45 GMT
Message-ID: <1331639323.15192.38.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Tue, 13 Mar 2012 11:48:43 +0000
In-Reply-To: <cover.1331589797.git.sgw@linux.intel.com>
References: <cover.1331589797.git.sgw@linux.intel.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [CONSOLIDATED PULL 00/23] Catching up after conference Time
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
X-List-Received-Date: Tue, 13 Mar 2012 11:57:33 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2012-03-13 at 00:58 -0700, Saul Wold wrote:
> The following changes since commit f47ada62a3da879006e7cb27479dc9b72c56e923:
> 
>   cmake.bbclass: add ${base_libdir} to CMAKE_LIBRARY_PATH (2012-03-12 17:46:16 +0000)
> 
> are available in the git repository at:
>   git://git.openembedded.org/openembedded-core-contrib sgw/stage
>   http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/stage
> 
> Andreas Oberritter (10):
>   qt4: fix deps in libQtWebkit.la and QtWebKit.pc
>   udev-164: fixup "don't hardcode path to pidof"
>   package.bbclass: sort dynamically generated packages
>   util-linux: explicitly disable udev
>   linux-firmware: fix permissions of installed files
>   python, python-native: always set platform to linux2
>   python: regenerate plat-linux2/*.py
>   python: depend on bzip2
>   python-native: distutils: don't use libdir, remove dead code path
>   python, python-native: bump PR
> 
> Bruce Ashfield (1):
>   linux-yocto: respect FILESPATH directories
> 
> Dexuan Cui (1):
>   image_types: ensure .rootfs.ext3 is created before vmdk is created.
> 
> Jeff Lance (1):
>   trace-cmd: modifying License information
> 
> Matthew McClintock (2):
>   packagedata.py: Fix get_subpkgedata_fn for multilib
>   arch-powerpc.inc: use default value of TUNE_PKGARCH

I took everything except the two from Matthew. One clearly has incorrect
code, the packagedata one I'm worried is going to have some subtle side
effects. I'd like a little more time to think that one through.

Cheers,

Richard



