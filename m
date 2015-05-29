Return-Path: <mike.looijmans@topic.nl>
X-Greylist: delayed 459 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 29 May 2015 18:31:42 UTC
Received: from smtp04.mail.online.nl (smtp04.mail.online.nl [194.134.25.74])
	by mail.openembedded.org (Postfix) with ESMTP id DB661606E8
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 May 2015 18:31:42 +0000 (UTC)
Received: from smtp04.mail.online.nl (localhost [127.0.0.1])
	by smtp04.mail.online.nl (Postfix) with ESMTP id E2CD1280021
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 May 2015 20:24:02 +0200 (CEST)
Received: from [192.168.1.6] (s55969068.adsl.online.nl [85.150.144.104])
	by smtp04.mail.online.nl (Postfix) with ESMTP
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 May 2015 20:24:02 +0200 (CEST)
Message-ID: <5568AEC2.7090606@topic.nl>
Date: Fri, 29 May 2015 20:24:02 +0200
From: Mike Looijmans <mike.looijmans@topic.nl>
Organization: Topic
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.7.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
X-Online-Scanned: by Cloudmark authority (on m7-zaas-prd-smtp04.m7zaas.local)
Subject: boost fails to build on MIPS
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 29 May 2015 18:31:43 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On current OE master, boost fails to build, because something attempts 
to add "-m32" to the gcc commandline for no apparent reason.

Can anyone confirm this, or am I the only MIPS user in the world?

For example:

| gcc.compile.c++ 
bin.v2/libs/atomic/build/gcc-4.3.1/release/threading-multi/lockpool.o
| mipsel-oe-linux-g++: error: unrecognized command line option '-m32'
|
|     "mipsel-oe-linux-g++" "-mel" "-mabi=32" "-mhard-float" 
"-march=mips32" "-Wl,-O1" "-Wl,--as-needed" 
"--sysroot=/home/milo/work/openpli-next/build/tmp/sysroots/vuduo2" 
-ftemplate-depth-128  -Os -pipe -g -feliminate-unused-debug-types 
-fvisibility-inlines-hidden -O3 -finline-functions -Wno-inline -Wall 
-pthread -fPIC -m32  -DBOOST_ALL_NO_LIB=1 -DBOOST_ATOMIC_DYN_LINK=1 
-DBOOST_ATOMIC_SOURCE -DNDEBUG  -I"." -c -o 
"bin.v2/libs/atomic/build/gcc-4.3.1/release/threading-multi/lockpool.o" 
"libs/atomic/src/lockpool.cpp"

-- 
Mike Looijmans

