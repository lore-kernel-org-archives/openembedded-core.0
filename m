Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SiI2Q-0001eU-4F
	for openembedded-core@lists.openembedded.org;
	Sat, 23 Jun 2012 06:33:34 +0200
Received: by pbbrq2 with SMTP id rq2so4194792pbb.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Jun 2012 21:22:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:x-enigmail-version:content-type
	:content-transfer-encoding;
	bh=+lv57LAVnkOv52D00x31qK5tfTEVZdG13tpjOdFBqOI=;
	b=hJ+RXXJL06scRzHrDDFQl7DtqlWHwIpcl3wLPJtAxNP8vhh4Kua/mUcC0RMyiuLjhM
	01R6epXXNvmCZ5ucFyFaYLUpMN0MJTI2yAiuCS1em1KUnaE7XkODq22xY4cK7FZrksyN
	nUa3ODSjMIAep4nTR4WgomF+2CJnb8R1+iyh+hcwBEneWkV7SF3vFQR8Bofh03aqQiiT
	KCzm5jdFbWhOwIS7kPPzQbGyo0viDyJlh/XGcUTrX7f4WMvfOPdMuMflMBU5FxX/iimq
	FmbJ2tO1IFBlhED5L1aQ9fa6tWWrqDaN4Se1xahf2A5BtPlo9dVJ1N3xINw11FN6qlda
	ycUQ==
Received: by 10.68.238.68 with SMTP id vi4mr16402161pbc.123.1340425365127;
	Fri, 22 Jun 2012 21:22:45 -0700 (PDT)
Received: from [192.168.1.71] (99-57-140-209.lightspeed.sntcca.sbcglobal.net.
	[99.57.140.209])
	by mx.google.com with ESMTPS id nh8sm1149356pbc.60.2012.06.22.21.22.43
	(version=SSLv3 cipher=OTHER); Fri, 22 Jun 2012 21:22:44 -0700 (PDT)
Message-ID: <4FE54499.8040304@gmail.com>
Date: Fri, 22 Jun 2012 21:22:49 -0700
From: Khem Raj <raj.khem@gmail.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1;
	rv:13.0) Gecko/20120614 Thunderbird/13.0.1
MIME-Version: 1.0
To: Saul Wold <sgw@linux.intel.com>
References: <1340120601-23917-1-git-send-email-raj.khem@gmail.com>
	<4FE54346.5080401@linux.intel.com>
In-Reply-To: <4FE54346.5080401@linux.intel.com>
X-Enigmail-Version: 1.4.2
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gcc-4.7: Update to tip of gcc-4_7-branch since 4.7.1 has been out
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
X-List-Received-Date: Sat, 23 Jun 2012 04:33:34 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 6/22/2012 9:17 PM, Saul Wold wrote:
> On 06/19/2012 08:43 AM, Khem Raj wrote:
>> Signed-off-by: Khem Raj<raj.khem@gmail.com> --- 
>> meta/recipes-devtools/gcc/gcc-4.7.inc |   12 ++++++------ 1 files
>> changed, 6 insertions(+), 6 deletions(-)
>> 
>> diff --git a/meta/recipes-devtools/gcc/gcc-4.7.inc 
>> b/meta/recipes-devtools/gcc/gcc-4.7.inc index 34a73b1..25a1088
>> 100644 --- a/meta/recipes-devtools/gcc/gcc-4.7.inc +++
>> b/meta/recipes-devtools/gcc/gcc-4.7.inc @@ -3,12 +3,12 @@ require
>> gcc-common.inc PR = "r2"
>> 
>> # Third digit in PV should be incremented after a minor release 
>> -# happens from this branch on gcc e.g. currently its 4.7.0 -#
>> when 4.7.1 is releases and we bump SRCREV beyond the release -#
>> on branch then PV should be incremented to 4.7.1+svnr${SRCPV} +#
>> happens from this branch on gcc e.g. currently its 4.7.1 +# when
>> 4.7.2 is releases and we bump SRCREV beyond the release +# on
>> branch then PV should be incremented to 4.7.2+svnr${SRCPV} # to
>> reflect that change
>> 
>> -PV = "4.7.0+svnr${SRCPV}" +PV = "4.7.1+svnr${SRCPV}"
>> 
>> # BINV should be incremented after updating to a revision # after
>> a minor gcc release (e.g. 4.7.1 or 4.7.2) has been made @@ -16,9
>> +16,9 @@ PV = "4.7.0+svnr${SRCPV}" # 4.7.1 then the value below
>> will have 2 which will mean 4.7.2 # which will be next minor
>> release and so on.
>> 
>> -BINV = "4.7.1" +BINV = "4.7.2"
>> 
> I merged this and had tested it on the Autobuilder, but I just
> tried another build locally and got a grouping of failures that may
> have used sstate because they failed do_compile: 
> /srv/ssd/sgw_ab/poky/meta/recipes-extended/newt/libnewt_0.52.14.bb,
>
> 
do_compile
> /srv/ssd/sgw_ab/poky/meta/recipes-graphics/mesa/mesa-dri_7.11.bb, 
> do_compile 
> /srv/ssd/sgw_ab/poky/meta/recipes-kernel/trace-cmd/trace-cmd_1.2.bb,
>
> 
do_compile
> 
> /srv/ssd/sgw_ab/poky/meta/recipes-extended/logrotate/logrotate_3.8.1.bb,
>
> 
do_compile
> /srv/ssd/sgw_ab/poky/meta/recipes-kernel/kexec/kexec-tools_2.0.3.bb,
>
> 
do_compile
> 
> /srv/ssd/sgw_ab/poky/meta/recipes-kernel/trace-cmd/kernelshark_1.2.bb,
>
> 
do_compile
> 
> /srv/ssd/sgw_ab/poky/meta/recipes-bsp/u-boot/u-boot-mkimage_2011.06.bb,
>
> 
do_compile
> /srv/ssd/sgw_ab/poky/meta/recipes-devtools/apt/apt_0.7.14.bb,
> do_compile
> 
> 
> The failure was: | make: *** No rule to make target 
> `/srv/ssd/sgw_ab/builds/repack/tmp/sysroots/x86_64-linux/usr/lib/i586-poky-linux/gcc/i586-poky-linux/4.7.1/include/stddef.h',
>
> 
needed by `logrotate.o'.  Stop.
> 
> Note the 4.7.1!
> 
> A clean solved the issue, so I am not sure where it's picking up
> the 4.7.1 from during the do_configure.
> 
> More investigation is required!
> 

sstate for these packages should have been invalidated. I wonder if
this header path is being added to makefile rules when they are
generated first time but then it escapes the hash calculations when
doing sstate checksumming

> Sau!
> 
> 
> 
> 
>> -SRCREV = "186651" +SRCREV = "188658" BRANCH = "gcc-4_7-branch" 
>> FILESPATH = "${@base_set_filespath([ '${FILE_DIRNAME}/gcc-4.7' ],
>> d)}"
>> 


-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (MingW32)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org/

iEYEARECAAYFAk/lRJkACgkQuwUzVZGdMxTVpwCfRP+X+vR3KDpLA6LKra/70dhy
ad8AoImd9xian0gRV74yPx17jlt8TiWF
=E/5h
-----END PGP SIGNATURE-----


