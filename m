Return-Path: <Mats.Karrman@tritech.se>
Received: from tritech.se (tritech.se [46.59.120.190])
	by mail.openembedded.org (Postfix) with ESMTP id 77534610D8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Mar 2014 07:40:31 +0000 (UTC)
Received: from post.tritech.se (post.tritech.se [10.75.60.100])
	by tritech.se (8.14.3/8.14.3) with ESMTP id s2Q7eQId016067;
	Wed, 26 Mar 2014 08:40:31 +0100
Received: from POST.tritech.se ([fe80::b4fc:968e:bbef:54cb]) by
	post.tritech.se ([fe80::b4fc:968e:bbef:54cb%10]) with mapi id
	14.02.0387.000; Wed, 26 Mar 2014 08:40:26 +0100
From: =?iso-8859-1?Q?Mats_K=E4rrman?= <Mats.Karrman@tritech.se>
To: Khem Raj <raj.khem@gmail.com>
Thread-Topic: [OE-core] SDK build refers to existing installed SDK
Thread-Index: Ac9ICdNJSCWIhmk1SLiAWfXaEUWoLgAkJd2AAArlBrg=
Date: Wed, 26 Mar 2014 07:40:26 +0000
Message-ID: <ED3E0BCACD909541BA94A34C4A164D4C5B3A652E@post.tritech.se>
References: <ED3E0BCACD909541BA94A34C4A164D4C5B3A5F1C@post.tritech.se>,
	<39D03392-2417-45CF-BD80-D160E8C466EE@gmail.com>
In-Reply-To: <39D03392-2417-45CF-BD80-D160E8C466EE@gmail.com>
Accept-Language: en-US, sv-SE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [194.132.137.82]
MIME-Version: 1.0
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: SDK build refers to existing installed SDK
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
X-List-Received-Date: Wed, 26 Mar 2014 07:40:35 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

On Wednesday, March 26, 2014 4:23 AM, Khem Raj wrote:=0A=
> > Hi,=0A=
> >=0A=
> > I just ran into an unexpected error while doing some multitasking.=0A=
> > Project is based on OE-core Dora "distroless".=0A=
> >=0A=
> > While my build machine was busy building a new SDK using "-c populate_s=
dk" I simultaneously deleted an older SDK that was installed under /usr/loc=
al and installed a different one. This resulted in the build stopping with =
the following error:=0A=
> >=0A=
> > | x86_64-oesdk-linux-gcc  --sysroot=3D/home/makr/projects/xxx/svn/main/=
trunk/oe/build/tmp/sysroots/x86_64-nativesdk-oesdk-linux -DHAVE_CONFIG_H -I=
../ncurses -I/home/makr/projects/xxx/svn/main/trunk/oe/build/tmp/work/x86_6=
4-nativesdk-oesdk-linux/nativesdk-ncurses/5.9-r15.1/ncurses-5.9/ncurses -is=
ystem/home/makr/projects/xxx/svn/main/trunk/oe/build/tmp/sysroots/x86_64-na=
tivesdk-oesdk-linux/usr/local/oecore-x86_64/sysroots/x86_64-oesdk-linux/usr=
/include -D_GNU_SOURCE -DNDEBUG -I. -I../include -I/home/makr/projects/xxx/=
svn/main/trunk/oe/build/tmp/work/x86_64-nativesdk-oesdk-linux/nativesdk-ncu=
rses/5.9-r15.1/ncurses-5.9/ncurses/../include -I/usr/local/oecore-x86_64/sy=
sroots/x86_64-oesdk-linux/usr/include -isystem/home/makr/projects/xxx/svn/m=
ain/trunk/oe/build/tmp/sysroots/x86_64-nativesdk-oesdk-linux/usr/local/oeco=
re-x86_64/sysroots/x86_64-oesdk-linux/usr/include -O2 -pipe  --param max-in=
line-insns-single=3D1200 -fPIC -c /home/makr/projects/xxx/svn/main/trunk/oe=
/build/tmp/work/x86_64-=0A=
> > nativesdk-oesdk-linux/nativesdk-ncurses/5.9-r15.1/ncurses-5.9/ncurses/b=
ase/lib_beep.c -o ../obj_s/lib_beep.o=0A=
> > | cc1: error: /usr/local/oecore-x86_64/sysroots/x86_64-oesdk-linux/usr/=
include: Permission denied=0A=
> >=0A=
> > The offending directory is given with an include directive which seems =
strange, building a new SDK should not poke around in an old one...=0A=
> >=0A=
> > Config & log files available on request.=0A=
> =0A=
> Was the installed SDK in your path that fed into the OE build env which w=
as generating new SDK ?=0A=
=0A=
No, it was not.=0A=
I have saved the output of "bitbake nativesdk-ncurses -e" if you're interes=
ted.=0A=
=0A=
BR // Mats=0A=

