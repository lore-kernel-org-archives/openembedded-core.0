Received: from mail-wi0-f169.google.com ([209.85.212.169])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <elvis.dowson@gmail.com>) id 1ScztE-0005gU-Uz
	for openembedded-core@lists.openembedded.org;
	Fri, 08 Jun 2012 16:10:13 +0200
Received: by wibhn14 with SMTP id hn14so1258044wib.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 Jun 2012 06:59:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:content-type:content-transfer-encoding:subject:date:message-id
	:to:mime-version:x-mailer;
	bh=Vz86ni8bw+Vq7ZmnM38UjeNycs6EpXDgCwvj06XVAuQ=;
	b=H6wm2xB7AKSpsvKyPkIEXPoMEYTjCCqatNDXk+r/ex/csflG6x3YIIjZUgSAVjd51a
	hDTWvsDa1x/Ld/3R8DCrFoeVHZTrlbxR+9GqWhb/fz/AVi+CpMHFFxyoanJHqV0yi4Vk
	HAKVRSrar0XlePJNlrOCuNZiBEcimC1GqcA0DN/NLmtLyXLNlobtXpUkUW0UFsqn32E4
	ddSJI6YK2Y2AiKl+4e5oM7lOVzjBgGSiiBo67X1cKjtZL0D2K4Q2D9FzAlSj84hN6QO9
	pCsBcQs+infeugFV/3qFOxeLIAXcoE2BgMJ34dJ4iiVVbz2JSMuZ8m3dNfDOmmgj9QjR
	KD0w==
Received: by 10.180.102.228 with SMTP id fr4mr626569wib.6.1339163983250;
	Fri, 08 Jun 2012 06:59:43 -0700 (PDT)
Received: from [192.168.1.36] (89.Red-83-42-2.dynamicIP.rima-tde.net.
	[83.42.2.89])
	by mx.google.com with ESMTPS id e20sm1389338wiv.7.2012.06.08.06.59.41
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 08 Jun 2012 06:59:42 -0700 (PDT)
From: Elvis Dowson <elvis.dowson@gmail.com>
Date: Fri, 8 Jun 2012 15:59:39 +0200
Message-Id: <32D32342-6B45-4644-9909-FEB737528DCF@gmail.com>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Mime-Version: 1.0 (Apple Message framework v1278)
X-Mailer: Apple Mail (2.1278)
Subject: ERROR: ExpansionError during parsing /tool/yocto/poky/meta/recipes-kernel/linux/linux-yocto_3.2.bb: Failure expanding variable SRCPV
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
X-List-Received-Date: Fri, 08 Jun 2012 14:10:13 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

Hi,

On Jun 8, 2012, at 12:58 PM, Richard Purdie wrote:

> On Thu, 2012-06-07 at 15:59 -0400, Bruce Ashfield wrote:
>> Richard/Saul,
>>=20
>> Here's a 9 patch series that is a collection of work that's been
>> brewing for about three weeks.
>>=20
>> Highlights include:
>>=20
>>  - removal of the 2.6.37 recipe, it's time is now gone
>>  - addition of the 3.4 kernel recipe
>>      - configuration fixups and audits within that 3.4 kernel
>>      - kernel *only* support for mips64 mti emulation
>>  - -stable updates for supported kernels 3.2.18, 3.0.32
>>  - machine fixes/configurations for the 3.2 and 3.0 kernels
>>  - kern tool updates, streamlining and fixes

I just updated my poky installation, and tried to build the =
meta-toolchain, and I got a bunch of errors. This is related to the =
recent updates to the linux-yocto_3.2.bb kernel.

elvis@eos:/tool/yocto/poky/build$ bitbake meta-toolchain
Pseudo is not present but is required, building this first before the =
main build
WARNING: Unable to get checksum for python-numpy SRC_URI entry config.h: =
file could not be found                                               | =
ETA:  00:00:43
WARNING: Unable to get checksum for python-numpy SRC_URI entry =
numpyconfig.h: file could not be found
ERROR: ExpansionError during parsing =
/tool/yocto/poky/meta/recipes-kernel/linux/linux-yocto_3.2.bb: Failure =
expanding variable SRCPV, expression was ${@bb.fetch2.get_srcrev(d)} =
which triggered exception FetchError: Fetcher failure for URL: =
'git://git.yoctoproject.org/linux-yocto-3.2;protocol=3Dgit;bareclone=3D1;b=
ranch=3Dstandard/default/base,meta;name=3Dmachine,meta'. The command git =
ls-remote git://git.yoctoproject.org/linux-yocto-3.2 =
ee78519365bdb25287703bbc31c06b193263c654l gave empty output unexpectedly
ERROR: No recipes available for:
  /tool/yocto/poky/meta-yocto/recipes-core/uclibc/uclibc_git.bbappend
  =
/tool/yocto/poky/meta-yocto/recipes-kernel/linux/linux-yocto_3.2.bbappend
  =
/tool/yocto/meta-xilinx/recipes-core/util-linux/util-linux_2.21.1.bbappend=

  /tool/yocto/poky/meta-yocto/recipes-core/psplash/psplash_git.bbappend
  /tool/yocto/poky/meta-yocto/recipes-core/netbase/netbase_4.47.bbappend
  =
/tool/yocto/meta-openembedded/meta-oe/recipes-multimedia/gstreamer/gst-ffm=
peg_0.10.13.bbappend
  =
/tool/yocto/meta-openembedded/meta-oe/recipes-core/dropbear/dropbear_2012.=
55.bbappend
  =
/tool/yocto/poky/meta-yocto/recipes-core/tasks/task-core-tools-profile.bba=
ppend
  =
/tool/yocto/meta-xilinx/recipes-core/initscripts/initscripts_1.0.bbappend
  =
/tool/yocto/meta-openembedded/meta-oe/recipes-core/busybox/busybox_1.19.4.=
bbappend
ERROR: Command execution failed: Exited with 1

Summary: There were 2 WARNING messages shown.
Summary: There were 3 ERROR messages shown, returning a non-zero exit =
code.


best regards,

Elvis Dowson=


