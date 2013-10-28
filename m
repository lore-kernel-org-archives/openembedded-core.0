Return-Path: <openembedded-core@emagii.com>
Received: from smtp-out12.han.skanova.net (smtp-out12.han.skanova.net
	[195.67.226.212])
	by mail.openembedded.org (Postfix) with ESMTP id 763656CF0A
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Oct 2013 13:42:14 +0000 (UTC)
Received: from [10.175.196.165] (83.227.59.84) by smtp-out12.han.skanova.net
	(8.5.133) (authenticated as u82406562)
	id 521DAB1700F6AC7D for openembedded-core@lists.openembedded.org;
	Mon, 28 Oct 2013 14:42:14 +0100
Message-ID: <526E69B5.5050401@emagii.com>
Date: Mon, 28 Oct 2013 14:42:13 +0100
From: Ulf Samuelsson <openembedded-core@emagii.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:24.0) Gecko/20100101 Thunderbird/24.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
Subject: elfutils-native-0.148 does not build on Ubuntu-13.10
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
X-List-Received-Date: Mon, 28 Oct 2013 13:42:16 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

| gcc -D_GNU_SOURCE -DHAVE_CONFIG_H 
-DLOCALEDIR='"/home2/Angstrom/build/tmp-angstrom_v2012_12-eglibc/sysroots/i686-linux/usr/share/locale"' 
-DDEBUGPRED=0 
-DSRCDIR=\"/home2/Angstrom/build/tmp-angstrom_v2012_12-eglibc/work/i686-linux/elfutils-native-0.148-r11/elfutils-0.148/src\" 
-DOBJDIR=\"/home2/Angstrom/build/tmp-angstrom_v2012_12-eglibc/work/i686-linux/elfutils-native-0.148-r11/elfutils-0.148/src\" 
-I. -I.. -I. -I. -I../lib -I.. -I./../libelf -I./../libebl -I./../libdw 
-I./../libdwfl -I./../libasm 
-isystem/home2/Angstrom/build/tmp-angstrom_v2012_12-eglibc/sysroots/i686-linux/usr/include 
-std=gnu99 -Wall -Wshadow -Werror -Wunused -Wextra -fgnu89-inline 
-Wformat=2 
-isystem/home2/Angstrom/build/tmp-angstrom_v2012_12-eglibc/sysroots/i686-linux/usr/include 
-O2 -pipe -c ranlib.c
| addr2line.c: In function 'handle_address':
| addr2line.c:450:7: error: format '%a' expects argument of type 'float 
*', but argument 3 has type 'char **' [-Werror=format=]| gcc 
-D_GNU_SOURCE -DHAVE_CONFIG_H 
-DLOCALEDIR='"/home2/Angstrom/build/tmp-angstrom_v2012_12-eglibc/sysroots/i686-linux/usr/share/locale"' 
-DDEBUGPRED=0 
-DSRCDIR=\"/home2/Angstrom/build/tmp-angstrom_v2012_12-eglibc/work/i686-linux/elfutils-native-0.148-r11/elfutils-0.148/src\" 
-DOBJDIR=\"/home2/Angstrom/build/tmp-angstrom_v2012_12-eglibc/work/i686-linux/elfutils-native-0.148-r11/elfutils-0.148/src\" 
-I. -I.. -I. -I. -I../lib -I.. -I./../libelf -I./../libebl -I./../libdw 
-I./../libdwfl -I./../libasm 
-isystem/home2/Angstrom/build/tmp-angstrom_v2012_12-eglibc/sysroots/i686-linux/usr/include 
-std=gnu99 -Wall -Wshadow -Werror -Wunused -Wextra -fgnu89-inline 
-Wformat=2 
-isystem/home2/Angstrom/build/tmp-angstrom_v2012_12-eglibc/sysroots/i686-linux/usr/include 
-O2 -pipe -c ranlib.c
| addr2line.c: In function 'handle_address':
| addr2line.c:450:7: error: format '%a' expects argument of type 'float 
*', but argument 3 has type 'char **' [-Werror=format=]
|        if (sscanf (string, "(%a[^)])%" PRIiMAX "%n", &name, &addr, &i) 
== 2
|        ^
| addr2line.c:453:7: error: format '%a' expects argument of type 'float 
*', but argument 3 has type 'char **' [-Werror=format=]
|        switch (sscanf (string, "%a[^-+]%n%" PRIiMAX "%n", &name, &i, 
&addr, &j))
|        ^
| cc1: all warnings being treated as errors
| make[2]: *** [addr2line.o] Error 1
| make[2]: *** Waiting for unfinished jobs....
| rm i386_ld.o
| make[2]: Leaving directory 
`/home2/Angstrom/build/tmp-angstrom_v2012_12-eglibc/work/i686-linux/elfutils-native-0.148-r11/elfutils-0.148/src'
| make[1]: *** [all-recursive] Error 1
| make[1]: Leaving directory 
`/home2/Angstrom/build/tmp-angstrom_v2012_12-eglibc/work/i686-linux/elfutils-native-0.148-r11/elfutils-0.148'
| make: *** [all] Error 2
| ERROR: oe_runmake failed
| ERROR: Function failed: do_compile (see 
/home2/Angstrom/build/tmp-angstrom_v2012_12-eglibc/work/i686-linux/elfutils-native-0.148-r11/temp/log.do_compile.1845 
for further information)

|        if (sscanf (string, "(%a[^)])%" PRIiMAX "%n", &name, &addr, &i) 
== 2
|        ^
| addr2line.c:453:7: error: format '%a' expects argument of type 'float 
*', but argument 3 has type 'char **' [-Werror=format=]
|        switch (sscanf (string, "%a[^-+]%n%" PRIiMAX "%n", &name, &i, 
&addr, &j))
|        ^
| cc1: all warnings being treated as errors
| make[2]: *** [addr2line.o] Error 1
| make[2]: *** Waiting for unfinished jobs....
| rm i386_ld.o
| make[2]: Leaving directory 
`/home2/Angstrom/build/tmp-angstrom_v2012_12-eglibc/work/i686-linux/elfutils-native-0.148-r11/elfutils-0.148/src'
| make[1]: *** [all-recursive] Error 1
| make[1]: Leaving directory 
`/home2/Angstrom/build/tmp-angstrom_v2012_12-eglibc/work/i686-linux/elfutils-native-0.148-r11/elfutils-0.148'
| make: *** [all] Error 2
| ERROR: oe_runmake failed
| ERROR: Function failed: do_compile (see 
/home2/Angstrom/build/tmp-angstrom_v2012_12-eglibc/work/i686-linux/elfutils-native-0.148-r11/temp/log.do_compile.1845 
for further information)

but this is OK, on Ubuntu-12.10


BR
Ulf Samuelsson



