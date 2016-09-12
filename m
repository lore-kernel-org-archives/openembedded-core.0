Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f195.google.com (mail-pf0-f195.google.com
	[209.85.192.195])
	by mail.openembedded.org (Postfix) with ESMTP id D4E9277158
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Sep 2016 16:13:26 +0000 (UTC)
Received: by mail-pf0-f195.google.com with SMTP id x24so8291930pfa.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Sep 2016 09:13:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=mGN/c29ldWEZZKeGkJBDeIWtMs3i/YZBvw1AHNwqMcc=;
	b=vD3WR1bST1RvdAjvLKutCaA3NAx1R9AHSOMPJUd5uMOE3pI/mReAIzUpFqbmmNVgV6
	QWCfZHC2Z1jgIfjQETh2FCV6wX4kN5Lxtun8LTYND7epIi8hkQCajB8C+FhzuZbkRHfg
	TbwxI9Wu2SGBUzCFFhl4L1oQd8PyCWf+ml/F6knZRyI5DmprvIuHWwPPdDdWmOJm5hgK
	JElVgN/ARlBm5Vfe0HpEmMnHCIUUMBcTYgTCpEMQx5qBXHJF0EgfQDU0yGa24uAEBpbg
	W9PNmg4AU1FDujjqWpbt9RQL4S5ZCwk5s+mabRb9N1eOKss3zEz6nWFfeP3SkSAzVu97
	cqBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:cc:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=mGN/c29ldWEZZKeGkJBDeIWtMs3i/YZBvw1AHNwqMcc=;
	b=RBlhMKf9mhCAzoHqVzpFYXDG9fGD+AJva4VBjnZnxiCKeBwUA3ZJNZOPcK0p7V2+hn
	PbUfEpvCE1a8xf3ksx9Mx0yDjeAsJainFQOHrOTJLvPUxAkXJyV8STSMWoOmBx4+OZKC
	mQ2xAOshhJiG3hnNap5+u5+pxi7GvXRmZeOmJ/bTbxxFXIBC1cIjOd1OdbFjTYaxNQKF
	IM20XIl7fSAdrR6UnBzqXeiG1IVd4jOcEZyzSwy2AbtcunvyCB//Pz+VqLUaBI3/9rzG
	IQ+1z1FMfMTqK+YoR3N+J084HGc3DT1dJHQUTRkqjQoSl6ZLJWVoMaqNu7Lf3wOWYwsK
	EUCg==
X-Gm-Message-State: AE9vXwNe/hNUtwScBZmpJc/gnopbrfy+VXkONfk089FB7oT4O5wSBpBgPcQafMCF4p/8yg==
X-Received: by 10.98.64.193 with SMTP id f62mr34895111pfd.141.1473696807224;
	Mon, 12 Sep 2016 09:13:27 -0700 (PDT)
Received: from ?IPv6:2601:202:4001:9ea0:f0a1:4ecf:1e7b:61b2?
	([2601:202:4001:9ea0:f0a1:4ecf:1e7b:61b2])
	by smtp.gmail.com with ESMTPSA id
	tq5sm25669832pac.42.2016.09.12.09.13.25
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 12 Sep 2016 09:13:25 -0700 (PDT)
To: Andre McCurdy <armccurdy@gmail.com>
References: <cover.1473349917.git.akuster808@gmail.com>
	<CAJ86T=Vn3wRZ3uwym4MN4o1OCh+J-KsYayxf464fOyNy+1k9Xg@mail.gmail.com>
From: akuster808 <akuster808@gmail.com>
Message-ID: <25e03fb3-4d7f-fd52-1fa5-5e10214c4438@gmail.com>
Date: Mon, 12 Sep 2016 09:13:24 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <CAJ86T=Vn3wRZ3uwym4MN4o1OCh+J-KsYayxf464fOyNy+1k9Xg@mail.gmail.com>
Cc: akuster <akuster@mvista.com>,
	OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 00/26] Krogoth-next: stagged changes
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
X-List-Received-Date: Mon, 12 Sep 2016 16:13:27 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit



On 09/08/2016 01:00 PM, Andre McCurdy wrote:
> On Thu, Sep 8, 2016 at 8:55 AM, Armin Kuster <akuster808@gmail.com> wrote:
>> The following changes are being considered for krogoth-next.
>> If I am missing something, please let me know.
> Perhaps this one:
>
>    http://git.openembedded.org/openembedded-core/commit/?id=c03b32bd71dbe04f2f239556fea0b53215e403d7

got it.
Armin
>
> ?
>
>> The following changes since commit aad7166704021d82ad3a5ec468552f8f10360d41:
>>
>>    curl: security fix for CVE-2016-5421 (2016-09-02 08:48:29 +0100)
>>
>> are available in the git repository at:
>>
>>    http://git.yoctoproject.org/git/poky-contrib akuster/krogoth-next
>>    http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=akuster/krogoth-next
>>
>> Alejandro Hernandez (1):
>>    initramfs-live-boot: Make sure we kill udev before switching root when
>>      live booting
>>
>> Armin Kuster (2):
>>    tiff: Security fix CVE-2015-8781
>>    tiff: Security fix CVE-2015-8784
>>
>> Henry Bruce (1):
>>    npm: npm.bbclass now adds nodejs to RDEPENDS
>>
>> Jackie Huang (1):
>>    e2fsprogs: Fix missing check for permission denied.
>>
>> Jacob Kroon (1):
>>    bitbake.conf/toolchain-scripts.bbclass: Remove debug prefix mappings
>>      in SDK
>>
>> Jeremy Puhlman (2):
>>    Fix random python backtrace in mutlilib handling code.
>>    bitbake.conf: set READELF for cross compilation
>>
>> Jonathan Liu (1):
>>    meta/classes: fix bb.build.FuncFailed typos
>>
>> Khem Raj (3):
>>    python{3}-numpy: Predefine of sizeof off_t on mips/mipsel/ppc
>>    systemd: Create missing sysusers offline
>>    gdb: Cache gnu gettext config vars for musl builds
>>
>> Markus Lehtonen (1):
>>    base.bbclass wipe ${S} before unpacking source
>>
>> Pascal Bach (1):
>>    gcc, qemuppc: Explicitly disable forcing SPE flags for 4.9
>>
>> Reinette Chatre (1):
>>    binutils: advance SRCREV to obtain versioned symbols
>>
>> Richard Purdie (2):
>>    busybox: Backport makefile fix from upstream
>>    busybox: Add parallel make fix
>>
>> Ross Burton (1):
>>    cml1: fix tasks after default [dirs] changed
>>
>> Sona Sarmadi (2):
>>    sudo: CVE-2015-8239
>>    curl: security fix for CVE-2016-7141
>>
>> Stefan Agner (1):
>>    busybox: Fix busybox-init on non-tty consoles
>>
>> Stephano Cetola (1):
>>    systemd: allow add users as a rootfs postprocess cmd
>>
>> Tanu Kaskinen (1):
>>    pulseaudio: fix crash when disconnecting bluetooth devices
>>
>> Yi Zhao (3):
>>    tiff: Security fix CVE-2016-3186
>>    tiff: Security fix CVE-2016-5321
>>    tiff: Security fix CVE-2016-5323
>>
>>   meta/classes/base.bbclass                          |  18 +-
>>   meta/classes/cml1.bbclass                          |   2 +
>>   meta/classes/grub-efi.bbclass                      |   2 +-
>>   meta/classes/gummiboot.bbclass                     |   4 +-
>>   meta/classes/multilib_global.bbclass               |   3 +-
>>   meta/classes/npm.bbclass                           |   1 +
>>   meta/classes/rootfs-postcommands.bbclass           |  43 +-
>>   meta/classes/syslinux.bbclass                      |   2 +-
>>   meta/classes/toolchain-scripts.bbclass             |   3 +
>>   meta/conf/bitbake.conf                             |   9 +-
>>   meta/recipes-core/busybox/busybox.inc              |   4 +-
>>   .../busybox/busybox/makefile-fix-backport.patch    |  40 ++
>>   .../busybox/busybox/parallel-make-fix.patch        |  65 ++
>>   meta/recipes-core/busybox/busybox_1.24.1.bb        |   2 +
>>   meta/recipes-core/initrdscripts/files/init-live.sh |   4 +-
>>   meta/recipes-core/systemd/systemd_229.bb           |   8 +-
>>   meta/recipes-devtools/binutils/binutils-2.26.inc   |   2 +-
>>   ...s-fix-missing-check-for-permission-denied.patch |  32 +
>>   meta/recipes-devtools/e2fsprogs/e2fsprogs_git.bb   |   3 +
>>   ...AltiVec-generation-on-powepc-linux-target.patch |  11 +
>>   meta/recipes-devtools/gdb/gdb_7.10.1.bb            |   5 +
>>   .../python/python-numpy/arm/numpyconfig.h          |   1 +
>>   .../python/python-numpy/mips/_numpyconfig.h        |   1 +
>>   .../python/python-numpy/powerpc/_numpyconfig.h     |   1 +
>>   .../sudo/sudo/CVE-2015-8239-1.patch                | 699 +++++++++++++++++++++
>>   .../sudo/sudo/CVE-2015-8239-2.patch                |  45 ++
>>   meta/recipes-extended/sudo/sudo_1.8.15.bb          |   2 +
>>   .../libtiff/files/CVE-2015-8781.patch              | 195 ++++++
>>   .../libtiff/files/CVE-2015-8784.patch              |  73 +++
>>   .../libtiff/files/CVE-2016-3186.patch              |  24 +
>>   .../libtiff/files/CVE-2016-5321.patch              |  49 ++
>>   .../libtiff/files/CVE-2016-5323.patch              | 107 ++++
>>   meta/recipes-multimedia/libtiff/tiff_4.0.6.bb      |   5 +
>>   ...th-don-t-create-the-HSP-HFP-profile-twice.patch | 343 ++++++++++
>>   .../pulseaudio/pulseaudio_8.0.bb                   |   1 +
>>   meta/recipes-support/curl/curl/CVE-2016-7141.patch |  50 ++
>>   meta/recipes-support/curl/curl_7.47.1.bb           |   1 +
>>   37 files changed, 1813 insertions(+), 47 deletions(-)
>>   create mode 100644 meta/recipes-core/busybox/busybox/makefile-fix-backport.patch
>>   create mode 100644 meta/recipes-core/busybox/busybox/parallel-make-fix.patch
>>   create mode 100644 meta/recipes-devtools/e2fsprogs/e2fsprogs/e2fsprogs-fix-missing-check-for-permission-denied.patch
>>   create mode 100644 meta/recipes-extended/sudo/sudo/CVE-2015-8239-1.patch
>>   create mode 100644 meta/recipes-extended/sudo/sudo/CVE-2015-8239-2.patch
>>   create mode 100644 meta/recipes-multimedia/libtiff/files/CVE-2015-8781.patch
>>   create mode 100644 meta/recipes-multimedia/libtiff/files/CVE-2015-8784.patch
>>   create mode 100644 meta/recipes-multimedia/libtiff/files/CVE-2016-3186.patch
>>   create mode 100644 meta/recipes-multimedia/libtiff/files/CVE-2016-5321.patch
>>   create mode 100644 meta/recipes-multimedia/libtiff/files/CVE-2016-5323.patch
>>   create mode 100644 meta/recipes-multimedia/pulseaudio/pulseaudio/0001-bluetooth-don-t-create-the-HSP-HFP-profile-twice.patch
>>   create mode 100644 meta/recipes-support/curl/curl/CVE-2016-7141.patch
>>
>> --
>> 2.7.4
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core


