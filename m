Return-Path: <Mats.Karrman@tritech.se>
Received: from tritech.se (tritech.se [46.59.120.190])
	by mail.openembedded.org (Postfix) with ESMTP id 004CD6EF9F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Mar 2014 09:41:52 +0000 (UTC)
Received: from post.tritech.se (post.tritech.se [10.75.60.100])
	by tritech.se (8.14.3/8.14.3) with ESMTP id s2P9fl4M019413
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Mar 2014 10:41:52 +0100
Received: from POST.tritech.se ([fe80::b4fc:968e:bbef:54cb]) by
	post.tritech.se ([fe80::b4fc:968e:bbef:54cb%10]) with mapi id
	14.02.0387.000; Tue, 25 Mar 2014 10:41:47 +0100
From: =?iso-8859-1?Q?Mats_K=E4rrman?= <Mats.Karrman@tritech.se>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Thread-Topic: SDK build refers to existing installed SDK
Thread-Index: Ac9ICdNJSCWIhmk1SLiAWfXaEUWoLg==
Date: Tue, 25 Mar 2014 09:41:47 +0000
Message-ID: <ED3E0BCACD909541BA94A34C4A164D4C5B3A5F1C@post.tritech.se>
Accept-Language: en-US, sv-SE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [194.132.137.82]
MIME-Version: 1.0
Subject: SDK build refers to existing installed SDK
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
X-List-Received-Date: Tue, 25 Mar 2014 09:41:55 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi,=0A=
=0A=
I just ran into an unexpected error while doing some multitasking.=0A=
Project is based on OE-core Dora "distroless".=0A=
=0A=
While my build machine was busy building a new SDK using "-c populate_sdk" =
I simultaneously deleted an older SDK that was installed under /usr/local a=
nd installed a different one. This resulted in the build stopping with the =
following error:=0A=
=0A=
| x86_64-oesdk-linux-gcc  --sysroot=3D/home/makr/projects/xxx/svn/main/trun=
k/oe/build/tmp/sysroots/x86_64-nativesdk-oesdk-linux -DHAVE_CONFIG_H -I../n=
curses -I/home/makr/projects/xxx/svn/main/trunk/oe/build/tmp/work/x86_64-na=
tivesdk-oesdk-linux/nativesdk-ncurses/5.9-r15.1/ncurses-5.9/ncurses -isyste=
m/home/makr/projects/xxx/svn/main/trunk/oe/build/tmp/sysroots/x86_64-native=
sdk-oesdk-linux/usr/local/oecore-x86_64/sysroots/x86_64-oesdk-linux/usr/inc=
lude -D_GNU_SOURCE -DNDEBUG -I. -I../include -I/home/makr/projects/xxx/svn/=
main/trunk/oe/build/tmp/work/x86_64-nativesdk-oesdk-linux/nativesdk-ncurses=
/5.9-r15.1/ncurses-5.9/ncurses/../include -I/usr/local/oecore-x86_64/sysroo=
ts/x86_64-oesdk-linux/usr/include -isystem/home/makr/projects/xxx/svn/main/=
trunk/oe/build/tmp/sysroots/x86_64-nativesdk-oesdk-linux/usr/local/oecore-x=
86_64/sysroots/x86_64-oesdk-linux/usr/include -O2 -pipe  --param max-inline=
-insns-single=3D1200 -fPIC -c /home/makr/projects/xxx/svn/main/trunk/oe/bui=
ld/tmp/work/x86_64-nativesdk-oesdk-linux/nativesdk-ncurses/5.9-r15.1/ncurse=
s-5.9/ncurses/base/lib_beep.c -o ../obj_s/lib_beep.o=0A=
| cc1: error: /usr/local/oecore-x86_64/sysroots/x86_64-oesdk-linux/usr/incl=
ude: Permission denied=0A=
=0A=
The offending directory is given with an include directive which seems stra=
nge, building a new SDK should not poke around in an old one...=0A=
=0A=
Config & log files available on request.=0A=
=0A=
BR // Mats=0A=
=0A=
=0A=

