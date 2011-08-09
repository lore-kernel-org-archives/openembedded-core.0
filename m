Received: from mail-iy0-f171.google.com ([209.85.210.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QqcCe-0005hX-BG
	for openembedded-core@lists.openembedded.org;
	Tue, 09 Aug 2011 04:38:00 +0200
Received: by iyf13 with SMTP id 13so12215091iyf.16
	for <openembedded-core@lists.openembedded.org>;
	Mon, 08 Aug 2011 19:33:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:x-enigmail-version:content-type;
	bh=VfvYLdA02iRm4I1cYU6qkrooYq3Lsl3NslOXe8adOpE=;
	b=dkZOKEB0L0vAfjJQwc1uhO2ZNDf9RmRQlPcVih+BkgE3C6ShWcvx6lrUVzMvOF2zq/
	vdLdib5R7VV9xb8zWxGs15gAQGLkEkUJYg9dgP+Jkscwoh0Z5ZwyLGX/M0+7WFebIA68
	3M7oT2ijsQzvnvOqmf/7KNo1iVcovYZZOvBSI=
Received: by 10.42.162.198 with SMTP id z6mr5510349icx.233.1312857211168;
	Mon, 08 Aug 2011 19:33:31 -0700 (PDT)
Received: from [192.168.1.70] (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id t14sm4657623ibj.30.2011.08.08.19.33.30
	(version=SSLv3 cipher=OTHER); Mon, 08 Aug 2011 19:33:30 -0700 (PDT)
Message-ID: <4E409C78.2060908@gmail.com>
Date: Mon, 08 Aug 2011 19:33:28 -0700
From: Khem Raj <raj.khem@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:6.0) Gecko/20110801 Thunderbird/6.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <840A81C1B782724A8EB52725BD519EFF1832C5@MBX20.4emm.local>
	<CAMKF1spMJyBDYowk-Bb9szzAM2RuxoRm=GLnURz_qfryePccmw@mail.gmail.com>
	<840A81C1B782724A8EB52725BD519EFF1832E3@MBX20.4emm.local>
In-Reply-To: <840A81C1B782724A8EB52725BD519EFF1832E3@MBX20.4emm.local>
X-Enigmail-Version: 1.2pre
Subject: Re: gcc version mismatch in sdk generation
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
X-List-Received-Date: Tue, 09 Aug 2011 02:38:00 -0000
X-Groupsio-MsgNum: 7809
Content-Type: multipart/mixed; boundary="------------050403010900030805090108"

--------------050403010900030805090108
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 08/08/2011 06:52 PM, James Limbouris wrote:
> On Tuesday, 9 August 2011 9:40 AM, Khem Raj wrote:
>> On Mon, Aug 8, 2011 at 6:33 PM, James Limbouris 
>> <james@digitalmatter.com.au> wrote:
>>> On Tue Aug 9 01:25:55 CEST 2011, Richard Purdie wrote:
>>>> On Mon, 2011-08-08 at 05:02 +0000, James Limbouris wrote:
>>>>> Hi,
>>>>> 
>>>>> In oe-core, with Angstrom 2010.x, generating an sdk with:
>>>>> 
>>>>> bitbake meta-toolchain-qte
>>>>> 
>>>>> is giving me a toolchain with gcc-4.6.1 binaries in the i686 
>>>>> sysroot, but gcc-4.5.4 runtime libraries in the arm (target)
>>>>> sysroot. The sdk can't link until a symlink is installed to
>>>>> trick it into using the 4.5.4 libraries.
>>>>> 
>>>>> I've checked the preferred versions, but they seem to be set 
>>>>> consistently in the disto's conf file, at least as far as I
>>>>> can see.
>>>>> 
>>>>> 'bitbake -s | grep gcc' gives: gcc
>>>>> :4.5-r39.1+svnr176640 gcc-cross
>>>>> :4.5-r39.2+svnr176640 gcc-cross-canadian-arm
>>>>> :4.5-r39.0+svnr176640 gcc-cross-initial
>>>>> :4.5-r39.0+svnr176640 gcc-cross-intermediate
>>>>> :4.5-r39.0+svnr176640 gcc-crosssdk
>>>>> :4.5-r39.0+svnr176640 gcc-crosssdk-initial
>>>>> :4.5-r39.0+svnr176640 gcc-crosssdk-intermediate
>>>>> :4.5-r39.0+svnr176640 gcc-runtime
>>>>> :4.5-r39.1+svnr176640 gcc-runtime-nativesdk
>>>>> :4.6.1+svnr175454-r5 :4.5-r39.1+svnr176640 gccmakedep 
>>>>> 1:1.0.2-r3 libgcc :4.5-r39.1+svnr176640 libgcc-nativesdk 
>>>>> :4.6.1+svnr175454-r3     :4.5-r39.1+svnr176640
>>>> 
>>>> The nativesdk and crosssdk versions need to match at the very
>>>> least.
>>>> 
>>>> Cheers,
>>>> 
>>>> Richard
>>> 
>>> Yes - that's what is so confusing. They seem to match in the
>>> Angstrom conf:
>> 
>> 
>> what does SDKGCCVERSION contain ?
>> 
> 
> Hi,
> 
> Here are edited highlights from bitbake -e | grep -i GCC:
> 

Can you try attached patch ? this is for meta-angstrom

Thx

- -Khem


-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEARECAAYFAk5AnHcACgkQuwUzVZGdMxSX3gCgiMm/l2eOjT992lsqKaxnfuno
QVUAniNpa6BtGGrOjwjxfGFSdYCoHMWm
=EeKC
-----END PGP SIGNATURE-----

--------------050403010900030805090108
Content-Type: text/x-diff;
 name="0001-angstrom-2010.x.conf-Pin-PREFERRED_VERSION_gcc-cross.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename*0="0001-angstrom-2010.x.conf-Pin-PREFERRED_VERSION_gcc-cross.pa";
 filename*1="tch"

From 8d6f9db776f30a2a88972fdb08856e0799839a25 Mon Sep 17 00:00:00 2001
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 8 Aug 2011 19:18:32 -0700
Subject: [PATCH] angstrom-2010.x.conf: Pin
 PREFERRED_VERSION_gcc-cross-canadian-${TRANSLATED_TARGET_ARCH}

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 conf/distro/angstrom-2010.x.conf |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/conf/distro/angstrom-2010.x.conf b/conf/distro/angstrom-2010.x.conf
index e47561a..6622a1f 100644
--- a/conf/distro/angstrom-2010.x.conf
+++ b/conf/distro/angstrom-2010.x.conf
@@ -106,6 +106,7 @@ PREFERRED_VERSION_binutils                       ?= "${ANGSTROM_BINUTILS_VERSION
 PREFERRED_VERSION_binutils-cross                 ?= "${ANGSTROM_BINUTILS_VERSION}"
 PREFERRED_VERSION_binutils-crosssdk              ?= "${ANGSTROM_BINUTILS_VERSION}"
 PREFERRED_VERSION_binutils-cross-canadian        ?= "${ANGSTROM_BINUTILS_VERSION}"
+PREFERRED_VERSION_gcc-cross-canadian-${TRANSLATED_TARGET_ARCH} ?= "${ANGSTROM_GCC_VERSION}"
 
 PREFERRED_VERSION_gcc                            ?= "${ANGSTROM_GCC_VERSION}"
 PREFERRED_VERSION_gcc-cross                      ?= "${ANGSTROM_GCC_VERSION}"
-- 
1.7.5.4


--------------050403010900030805090108--
