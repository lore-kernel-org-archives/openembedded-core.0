Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SPDFO-0005lR-0G
	for openembedded-core@lists.openembedded.org;
	Tue, 01 May 2012 15:36:06 +0200
Received: by pbbrq2 with SMTP id rq2so4193885pbb.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 01 May 2012 06:26:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:x-enigmail-version:content-type
	:content-transfer-encoding;
	bh=/QxzbetoO2KVGE9R+sFqt0n5YONteQ1+Q5iA2gOKYoU=;
	b=LMVRFCvWiugON/cPPtVmBVm4royWsNsWxGjNYtGh1VfPBr2bHSnIO9wO8D1nWDfO//
	esQzEoh1sAY8clixS+658yo44MOP0NtZTttv1gYYgAc7MHk2Blz/XwWBW/o4Nv9AgS69
	6N4b7cxUpuZwnu4fApI29GhN4V9rcWD0/4m4JjfTmXX0YKohov3+gkH2GhqaEtmp3DrJ
	7GQH4BU27UQrV8f0emvyB2mT7/+FqEnaqZaWC6itjLSbIvrK6Mxp4CYWoFZ0Y71g2Mmu
	gMXq/xLsa5KNgWD0YcC5Q/HxS4D/bSzNRaV6dwcjzPYg3huv8F1J8tlYZw14ZiLiJjBd
	zmAw==
Received: by 10.68.225.198 with SMTP id rm6mr28212118pbc.89.1335878781958;
	Tue, 01 May 2012 06:26:21 -0700 (PDT)
Received: from [192.168.1.104] (99-57-140-209.lightspeed.sntcca.sbcglobal.net.
	[99.57.140.209])
	by mx.google.com with ESMTPS id ot5sm19297483pbb.26.2012.05.01.06.26.19
	(version=SSLv3 cipher=OTHER); Tue, 01 May 2012 06:26:20 -0700 (PDT)
Message-ID: <4F9FE478.6070107@gmail.com>
Date: Tue, 01 May 2012 06:26:16 -0700
From: Khem Raj <raj.khem@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:11.0) Gecko/20120411 Thunderbird/11.0.1
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <cover.1335824356.git.sgw@linux.intel.com>
	<c5a3097cc2507d3fe49f113684912d4804ed02bd.1335824356.git.sgw@linux.intel.com>
	<1335878270.7415.104.camel@ted>
In-Reply-To: <1335878270.7415.104.camel@ted>
X-Enigmail-Version: 1.4.1
Subject: Re: [CONSOLIDATED PULL 19/19] gcc-package-target: add libexec for plugins
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
X-List-Received-Date: Tue, 01 May 2012 13:36:06 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 05/01/2012 06:17 AM, Richard Purdie wrote:
> On Mon, 2012-04-30 at 15:21 -0700, Saul Wold wrote:
>> Fixes:
>> 
>> ERROR: For recipe gcc, the following files/directories were
>> installed but not shipped in any package: ERROR:
>> /usr/libexec/gcc/i586-poky-linux/4.7.1/plugin/gengtype

see part of this commit
http://git.openembedded.org/openembedded-core-contrib/commit/?h=kraj/misc&id=86542ceef469a20a77d2191f7c1f6e36911174d3

>> Signed-off-by: Saul Wold <sgw@linux.intel.com> --- 
>> meta/recipes-devtools/gcc/gcc-4.7.inc            |    2 +- 
>> meta/recipes-devtools/gcc/gcc-package-target.inc |   11
>> ++++------- 2 files changed, 5 insertions(+), 8 deletions(-)
> 
> Saul, this patch does other things in addition to what is
> described above. Why?
> 
> Cheers,
> 
> Richard
> 
> 
>> diff --git a/meta/recipes-devtools/gcc/gcc-4.7.inc
>> b/meta/recipes-devtools/gcc/gcc-4.7.inc index 784a3be..8adeb8d
>> 100644 --- a/meta/recipes-devtools/gcc/gcc-4.7.inc +++
>> b/meta/recipes-devtools/gcc/gcc-4.7.inc @@ -1,6 +1,6 @@ require
>> gcc-common.inc
>> 
>> -PR = "r0" +PR = "r1"
>> 
>> # Third digit in PV should be incremented after a minor release #
>> happens from this branch on gcc e.g. currently its 4.7.0 diff
>> --git a/meta/recipes-devtools/gcc/gcc-package-target.inc
>> b/meta/recipes-devtools/gcc/gcc-package-target.inc index
>> d58e001..392dfc4 100644 ---
>> a/meta/recipes-devtools/gcc/gcc-package-target.inc +++
>> b/meta/recipes-devtools/gcc/gcc-package-target.inc @@ -1,5 +1,5
>> @@ PACKAGES = "\ -  ${PN} ${PN}-plugins ${PN}-symlinks \ +  ${PN}
>> ${PN}-symlinks \ g++ g++-symlinks \ cpp cpp-symlinks \ g77
>> g77-symlinks \ @@ -36,20 +36,17 @@ FILES_${PN}-dev = "\ " 
>> FILES_${PN}-plugin-dev = "\ 
>> ${gcclibdir}/${TARGET_SYS}/${BINV}/plugin/include/ \ -
>> ${gcclibdir}/${TARGET_SYS}/${BINV}/plugin/gengtype \ 
>> ${gcclibdir}/${TARGET_SYS}/${BINV}/plugin/gtype.state \ +
>> ${libexecdir}/gcc/${TARGET_SYS}/${BINV}/plugin/gengtype \ " 
>> +ALLOW_EMPTY_${PN}-plugin-dev = "1" + FILES_${PN}-symlinks = "\ 
>> ${bindir}/cc \ ${bindir}/gcc \ ${bindir}/gccbug \ "
>> 
>> -FILES_${PN}-plugins = "\ -
>> ${gcclibdir}/${TARGET_SYS}/${BINV}/plugin \ -" 
>> -ALLOW_EMPTY_${PN}-plugins = "1" - FILES_g77 = "\ 
>> ${bindir}/${TARGET_PREFIX}g77 \ 
>> ${libexecdir}/gcc/${TARGET_SYS}/${BINV}/f771 \
> 
> 
> 
> _______________________________________________ Openembedded-core
> mailing list Openembedded-core@lists.openembedded.org 
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org/

iEYEARECAAYFAk+f5HcACgkQuwUzVZGdMxTCWgCZAb0BcPwGMsign36/AGoPBQpk
ABoAn3lqySL2xGTUFvwQoAbXUz3eNQzr
=NpaZ
-----END PGP SIGNATURE-----


