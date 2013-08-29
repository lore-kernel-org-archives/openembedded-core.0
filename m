Return-Path: <rewitt@declaratino.com>
Received: from p3plwbeout15-05.prod.phx3.secureserver.net
	(p3plsmtp15-05-2.prod.phx3.secureserver.net [173.201.193.42])
	by mail.openembedded.org (Postfix) with ESMTP id A9A6D6BEEB
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Aug 2013 18:53:43 +0000 (UTC)
Received: from localhost ([173.201.193.116])
	by p3plwbeout15-05.prod.phx3.secureserver.net with bizsmtp
	id Jitg1m0012X8myt01itg6S; Thu, 29 Aug 2013 11:53:40 -0700
X-SID: Jitg1m0012X8myt01
Received: (qmail 23502 invoked by uid 99); 29 Aug 2013 18:53:40 -0000
X-Originating-IP: 192.146.101.8
User-Agent: Workspace Webmail 5.6.41
Message-Id: <20130829115339.a5c5c4a29245e5c988b774ab8f895ac5.53f04ab59e.wbe@email15.secureserver.net>
From: <rewitt@declaratino.com>
To: "Elvis Dowson" <elvis.dowson@gmail.com>
Date: Thu, 29 Aug 2013 11:53:39 -0700
Mime-Version: 1.0
Cc: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Subject: Re: QEMU with ARM Cortex A9 with hard float configuration - Kernel panic
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
X-List-Received-Date: Thu, 29 Aug 2013 18:53:43 -0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

=0A=0A> -------- Original Message --------=0A> Subject: Re: [OE-core] [oe-c=
ore] QEMU with ARM Cortex A9 with hard float=0A> configuration - Kernel pan=
ic=0A> From: Elvis Dowson <elvis.dowson@gmail.com>=0A> Date: Thu, August 29=
, 2013 12:28 pm=0A> To: Bruce Ashfield <bruce.ashfield@windriver.com>=0A> C=
c: OpenEmbedded Core Mailing List=0A> <openembedded-core@lists.openembedded=
.org>=0A> =0A> =0A> On Aug 29, 2013, at 8:23 PM, Bruce Ashfield <bruce.ashf=
ield@windriver.com> wrote:=0A> =0A> > On 13-08-29 10:02 AM, Elvis Dowson wr=
ote:=0A> >> Hi Bruce,=0A> >> =0A> >> On Aug 29, 2013, at 4:35 PM, Bruce Ash=
field <bruce.ashfield@windriver.com> wrote:=0A> >> =0A> >>> With that, it's=
 always been a manual setup for me in the past. The typical=0A> >>> workflo=
w is to test them via the usermode NFS boot. Have you given=0A> >>> that a =
go ?=0A> >> =0A> >> Does yocto have some wrapper script/command to setup nf=
s boot automatically=0A> >> without too much manual configuration? The runq=
emu and runqemu-internal=0A> >> scripts seems to indicate that, but haven't=
 tried this before.=0A> >> =0A> >> Let me know if it exists! If not, if you=
 could point me to a link that describes how=0A> >> to set NFS boot, and us=
e it to load a beagleboard image it would be great!=0A> > =0A> > This is su=
pported right out of the box, and it should be documented in=0A> > the proj=
ect docs.=0A> > =0A> > Search for users-space NFS in http://www.yoctoprojec=
t.org/docs/current/adt-manual/adt-manual.html=0A> =0A> I saw this, its only=
 for the rootfs. what I've read on the net alluded to the fact that you nee=
d to have=0A> xload, uboot and the kernel image on a specific partition ins=
ide an sdcard image. Those were=0A> the boot procedures used for the beagle=
board using qemu.=0A> =0A> This is for -M beagle, with qemu-system-arm. =0A=
> =0A> Anyway, I just need a way to boot vexpress-a9 using QEMU. I'll send =
a private email, with the=0A> patch to you, so that you can start off from =
where I left, in terms of modifications to poky-master=0A> and be able to d=
ebug the issue directly at your end.=0A=0AI actually set up a build to get =
a vexpress-a15 booting in qemu with=0Aneon support. However, I didn't use t=
he yocto kernel and just pointed at=0Amy own defconfig and kernel version 3=
.10.7. If it would be helpful for=0Ayou, I could put my changes up on githu=
b.=0A=0AThe weirdest thing was if I just used the defconfig that is in the=
=0Akernel for vexpress it wouldn't boot, I had to tweak it a bit.=0A=0A> Be=
st regards,=0A> =0A> Elvis Dowson=0A> _____________________________________=
__________=0A> Openembedded-core mailing list=0A> Openembedded-core@lists.o=
penembedded.org=0A> http://lists.openembedded.org/mailman/listinfo/openembe=
dded-core

