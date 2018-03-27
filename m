Return-Path: <Jef.Driesen@niko.eu>
X-Greylist: delayed 604 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 27 Mar 2018 11:20:36 UTC
Received: from relay08.secure-mail.be (relay08.secure-mail.be [195.13.7.11])
	by mail.openembedded.org (Postfix) with ESMTP id 58CBE78477
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Mar 2018 11:20:35 +0000 (UTC)
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A2BqCADeJbpa/7lOx1RdHQEBBQELAYJvU?=
	=?us-ascii?q?lOBMJhngwOUVAuFBAKEAyE3FQECAQEBAQEBAgFqKII4IoMMUQEqFEImAQQbhQc?=
	=?us-ascii?q?DAa4miEaCFwkBhTSBH3uCFIkIgy+CJAOHEg8ohUyKLQiBNI4vg1iHNI99gSUyI?=
	=?us-ascii?q?iaBLHODEJBPj2OBFwEB?=
X-IPAS-Result: =?us-ascii?q?A2BqCADeJbpa/7lOx1RdHQEBBQELAYJvUlOBMJhngwOUVAu?=
	=?us-ascii?q?FBAKEAyE3FQECAQEBAQEBAgFqKII4IoMMUQEqFEImAQQbhQcDAa4miEaCFwkBh?=
	=?us-ascii?q?TSBH3uCFIkIgy+CJAOHEg8ohUyKLQiBNI4vg1iHNI99gSUyIiaBLHODEJBPj2O?=
	=?us-ascii?q?BFwEB?=
Received: from edge.nikogroup.be ([84.199.78.185])
	by relay08.secure-mail.be with ESMTP; 27 Mar 2018 13:10:30 +0200
Received: from HUB.NIKO.LAN (172.22.10.201) by EDGE.nikogroup.be
	(192.168.22.31) with Microsoft SMTP Server (TLS) id 14.3.224.2;
	Tue, 27 Mar 2018 13:10:35 +0200
Received: from MBX.NIKO.LAN ([::1]) by HUB.NIKO.LAN ([::1]) with mapi id
	14.03.0224.002; Tue, 27 Mar 2018 13:10:29 +0200
From: <Jef.Driesen@niko.eu>
To: <openembedded-core@lists.openembedded.org>
Thread-Topic: Yocto rocko ssh fetcher error: scp not found
Thread-Index: AdPFurCw6SOXgxq/SVOq2ePWS6mNTA==
Date: Tue, 27 Mar 2018 11:10:29 +0000
Message-ID: <FAB9E48578194042BE5C63B8BE47610339A3AD19@MBX.NIKO.LAN>
Accept-Language: en-US, nl-BE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.22.10.222]
x-endpointsecurity-0xde81-ev: v:6.2.35.1008, d:out, a:y, w:t, t:0,
	sv:1522127698, ts:1522149029
x-exclaimer-md-config: ea9a6d46-d5fe-4ddc-9ba9-49fab8e88ad4
MIME-Version: 1.0
Subject: Yocto rocko ssh fetcher error: scp not found
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
X-List-Received-Date: Tue, 27 Mar 2018 11:20:36 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi,

I have a recipe which uses the ssh fetcher:

SRC_URI =3D "ssh://username@sshserver/~/demo-${PV}.zip"

I'm trying to upgrade from pyro to rocko, and now I'm getting errors

ERROR: demo-2.0.47.0-r0 do_fetch: Fetcher failure: Fetch command export DBU=
S_SESSION_BUS_ADDRESS=3D"unix:abstract=3D/tmp/dbus-XZhnQDkmvV"; export SSH_=
AUTH_SOCK=3D"/run/user/1000/keyring/ssh"; export PATH=3D"/home/jdi/develop/=
yocto/build/tmp/sysroots-uninative/x86_64-linux/usr/bin:/home/jdi/develop/y=
octo/scripts:/home/jdi/develop/yocto/build/tmp/work/armv7ahf-neon-poky-linu=
x-gnueabi/demo/2.0.47.0-r0/recipe-sysroot-native/usr/bin/arm-poky-linux-gnu=
eabi:/home/jdi/develop/yocto/build/tmp/work/armv7ahf-neon-poky-linux-gnueab=
i/demo/2.0.47.0-r0/recipe-sysroot/usr/bin/crossscripts:/home/jdi/develop/yo=
cto/build/tmp/work/armv7ahf-neon-poky-linux-gnueabi/demo/2.0.47.0-r0/recipe=
-sysroot-native/usr/sbin:/home/jdi/develop/yocto/build/tmp/work/armv7ahf-ne=
on-poky-linux-gnueabi/demo/2.0.47.0-r0/recipe-sysroot-native/usr/bin:/home/=
jdi/develop/yocto/build/tmp/work/armv7ahf-neon-poky-linux-gnueabi/demo/2.0.=
47.0-r0/recipe-sysroot-native/sbin:/home/jdi/develop/yocto/build/tmp/work/a=
rmv7ahf-neon-poky-linux-gnueabi/demo/2.0.47.0-r0/recipe-sysroot-native/bin:=
/home/jdi/develop/yocto/bitbake/bin:/home/jdi/develop/yocto/build/tmp/hostt=
ools"; export HOME=3D"/home/jdi"; scp -B -r  username@sshserver/~/demo-2.0.=
47.0.zip /home/jdi/develop/yocto/build/downloads/ failed with exit code 127=
, output:
/bin/sh: 1: scp: not found

Thus the PATH gets set to:

/home/jdi/develop/yocto/build/tmp/sysroots-uninative/x86_64-linux/usr/bin
/home/jdi/develop/yocto/scripts
/home/jdi/develop/yocto/build/tmp/work/armv7ahf-neon-poky-linux-gnueabi/dem=
o/2.0.47.0-r0/recipe-sysroot-native/usr/bin/arm-poky-linux-gnueabi
/home/jdi/develop/yocto/build/tmp/work/armv7ahf-neon-poky-linux-gnueabi/dem=
o/2.0.47.0-r0/recipe-sysroot/usr/bin/crossscripts
/home/jdi/develop/yocto/build/tmp/work/armv7ahf-neon-poky-linux-gnueabi/dem=
o/2.0.47.0-r0/recipe-sysroot-native/usr/sbin
/home/jdi/develop/yocto/build/tmp/work/armv7ahf-neon-poky-linux-gnueabi/dem=
o/2.0.47.0-r0/recipe-sysroot-native/usr/bin
/home/jdi/develop/yocto/build/tmp/work/armv7ahf-neon-poky-linux-gnueabi/dem=
o/2.0.47.0-r0/recipe-sysroot-native/sbin
/home/jdi/develop/yocto/build/tmp/work/armv7ahf-neon-poky-linux-gnueabi/dem=
o/2.0.47.0-r0/recipe-sysroot-native/bin
/home/jdi/develop/yocto/bitbake/bin
/home/jdi/develop/yocto/build/tmp/hosttools

But none of these contain an scp binary. So I think scp needs to be added t=
o HOSTTOOLS.

Jef
Disclaimer

This e-mail and its attachments is intended only for the person(s) or entit=
y to which it is addressed. If you receive this e-mail by mistake, please d=
elete this e-mail from your system and destroy all copies of it. It may con=
tain confidential and/or privileged information. You should not copy it or =
use it for any purpose nor disclose its contents to any person unless allow=
ed by a written document between the sender and the addressee.

