Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1TQKJY-000436-W4 for openembedded-core@lists.openembedded.org;
	Mon, 22 Oct 2012 17:53:17 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q9MFdqkY006708;
	Mon, 22 Oct 2012 16:39:52 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 06604-01; Mon, 22 Oct 2012 16:39:48 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q9MFdgFB006701
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO);
	Mon, 22 Oct 2012 16:39:43 +0100
Message-ID: <1350920382.22340.0.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: "Denis 'GNUtoo' Carikli" <GNUtoo@no-log.org>
Date: Mon, 22 Oct 2012 16:39:42 +0100
In-Reply-To: <1350748213-6436-1-git-send-email-GNUtoo@no-log.org>
References: <1350748213-6436-1-git-send-email-GNUtoo@no-log.org>
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] boost: Activate zlib and bzip2 because they now work.
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 22 Oct 2012 15:53:17 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sat, 2012-10-20 at 17:50 +0200, Denis 'GNUtoo' Carikli wrote:
> This patch is needed for making wesnoth(will be sumbited
>   in meta-games) work.
> 
> Signed-off-by: Denis 'GNUtoo' Carikli <GNUtoo@no-log.org>
> ---
>  meta/recipes-support/boost/boost.inc |    7 +------
>  1 files changed, 1 insertions(+), 6 deletions(-)

I tried this in master-next, the build broke:

| libs/iostreams/src/bzip2.cpp:20:56: fatal error: bzlib.h: No such file or directory
| compilation terminated.
| 
|     "i586-poky-linux-g++" "-m32" "-march=i586" "-Wl,-O1" "-Wl,--hash-style=gnu" "-Wl,--as-needed" "--sysroot=/srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-world/build/build/tmp/sysroots/qemux86"  -ftemplate-depth-128 -O3 -finline-functions -Wno-inline -Wall -pthread -fPIC  -DBOOST_ALL_NO_LIB=1 -DBOOST_IOSTREAMS_DYN_LINK=1 -DBOOST_IOSTREAMS_USE_DEPRECATED -DNDEBUG  -I"." -c -o "bin.v2/libs/iostreams/build/aca09349fdb84d131321425f6c3a38ed/bzip2.o" "libs/iostreams/src/bzip2.cpp"
| 
| ...failed gcc.compile.c++ bin.v2/libs/iostreams/build/aca09349fdb84d131321425f6c3a38ed/bzip2.o...
| ...skipped <pbin.v2/libs/iostreams/build/aca09349fdb84d131321425f6c3a38ed>libboost_iostreams.so.1.51.0 for lack of <pbin.v2/libs/iostreams/build/aca09349fdb84d131321425f6c3a38ed>bzip2.o...
| ...skipped <pstage/lib>libboost_iostreams.so.1.51.0 for lack of <pbin.v2/libs/iostreams/build/aca09349fdb84d131321425f6c3a38ed>libboost_iostreams.so.1.51.0...
| ...skipped <pstage/lib>libboost_iostreams.so for lack of <pstage/lib>libboost_iostreams.so.1.51.0...
| common.mkdir bin.v2/libs/program_options
| common.mkdir bin.v2/libs/program_options/build
| common.mkdir bin.v2/libs/program_options/build/aca09349fdb84d131321425f6c3a38ed
| gcc.compile.c++ bin.v2/libs/program_options/build/aca09349fdb84d131321425f6c3a38ed/cmdline.o
| gcc.compile.c++ bin.v2/libs/program_options/build/aca09349fdb84d131321425f6c3a38ed/config_file.o
| gcc.compile.c++ bin.v2/libs/program_options/build/aca09349fdb84d131321425f6c3a38ed/options_description.o
| gcc.compile.c++ bin.v2/libs/program_options/build/aca09349fdb84d131321425f6c3a38ed/parsers.o
| gcc.compile.c++ bin.v2/libs/program_options/build/aca09349fdb84d131321425f6c3a38ed/variables_map.o
| gcc.compile.c++ bin.v2/libs/program_options/build/aca09349fdb84d131321425f6c3a38ed/value_semantic.o
| gcc.compile.c++ bin.v2/libs/program_options/build/aca09349fdb84d131321425f6c3a38ed/positional_options.o
| gcc.compile.c++ bin.v2/libs/program_options/build/aca09349fdb84d131321425f6c3a38ed/utf8_codecvt_facet.o
| gcc.compile.c++ bin.v2/libs/program_options/build/aca09349fdb84d131321425f6c3a38ed/convert.o
| gcc.compile.c++ bin.v2/libs/program_options/build/aca09349fdb84d131321425f6c3a38ed/winmain.o
| gcc.compile.c++ bin.v2/libs/program_options/build/aca09349fdb84d131321425f6c3a38ed/split.o
| gcc.link.dll bin.v2/libs/program_options/build/aca09349fdb84d131321425f6c3a38ed/libboost_program_options.so.1.51.0
| common.copy stage/lib/libboost_program_options.so.1.51.0

http://autobuilder.yoctoproject.org:8010/builders/nightly-world/builds/348/steps/shell_41/logs/stdio

Missing changes to DEPENDS maybe?

Cheers,

Richard



