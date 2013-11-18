Return-Path: <Mats.Karrman@tritech.se>
Received: from tritech.se (tritech.se [46.59.120.190])
	by mail.openembedded.org (Postfix) with ESMTP id 363C76B200
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Nov 2013 15:41:58 +0000 (UTC)
Received: from post.tritech.se (post.tritech.se [10.75.60.100])
	by tritech.se (8.14.3/8.14.3) with ESMTP id rAIFftH8026794
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Nov 2013 16:42:00 +0100
Received: from POST.tritech.se ([fe80::b4fc:968e:bbef:54cb]) by
	post.tritech.se ([fe80::b4fc:968e:bbef:54cb%10]) with mapi id
	14.02.0347.000; Mon, 18 Nov 2013 16:41:55 +0100
From: =?iso-8859-1?Q?Mats_K=E4rrman?= <Mats.Karrman@tritech.se>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Thread-Topic: Source deployment conflict when building multiple machines
Thread-Index: Ac7kcpnHoBCNVvoATd+vshvk00Z2hA==
Date: Mon, 18 Nov 2013 15:41:54 +0000
Message-ID: <ED3E0BCACD909541BA94A34C4A164D4C4FD506FC@post.tritech.se>
Accept-Language: en-US, sv-SE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [194.132.137.82]
MIME-Version: 1.0
Subject: Source deployment conflict when building multiple machines
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
X-List-Received-Date: Mon, 18 Nov 2013 15:41:59 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi,=0A=
=0A=
Porting an old project from OE-Classic to OE-Core (Dora / distroless) I hav=
e run into another issue.=0A=
=0A=
When building for machine aaa everything is fine but when I then try to bui=
ld the same image for machine bbb (in same context, no intermediate cleanin=
g) there is a conflict while deploying sources. The reason seems to be that=
 the machine is not considered, just the CPU arch (sub directories of deplo=
y/sources are allarch-oe-linux, powerpc-oe-linux, x86_64-linux).=0A=
=0A=
When building for bbb a number of messages like this appear (all for machin=
e specific packages):=0A=
=0A=
"""=0A=
WARNING: The recipe shadow-securetty is trying to install files into a shar=
ed area when those files already exist. Those files and their manifest loca=
tion are:=0A=
   /home/makr/projects/upgrade_to_oe-core/oe/build/tmp-eglibc/deploy/source=
s/powerpc-oe-linux/MIT/shadow-securetty-4.1.4.3-r2/shadow-securetty-4.1.4.3=
-r2.showdata.dump=0A=
   Matched in manifest-aaa-shadow-securetty.dumpdata_create_diff_gz=0A=
   /home/makr/projects/upgrade_to_oe-core/oe/build/tmp-eglibc/deploy/source=
s/powerpc-oe-linux/MIT/shadow-securetty-4.1.4.3-r2/shadow-securetty-4.1.4.3=
-r2.diff.gz=0A=
   Matched in manifest-aaa-shadow-securetty.dumpdata_create_diff_gz=0A=
Please verify which package should provide the above files.=0A=
"""=0A=
=0A=
Is this as expected? Should I do something differently?=0A=
=0A=
Best Regards,=0A=
Mats=0A=

