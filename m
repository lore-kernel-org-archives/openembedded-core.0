Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f48.google.com (mail-pa0-f48.google.com
	[209.85.220.48])
	by mail.openembedded.org (Postfix) with ESMTP id E1620601F7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Mar 2015 23:54:18 +0000 (UTC)
Received: by pacgg7 with SMTP id gg7so1400824pac.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Mar 2015 16:54:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=99XPdZJ8OwIKmuEPGdYqW23p2HTzNKRnAhGe3AF1d7Y=;
	b=fCPESJU9T9k1iEuLKYI4mv0+UwQnWom6pyFIf7OOeTIvvL2Dkp7hriuX/gWniSmPiR
	HGvVfkU7CMqwZ/m2w6yncb0TkYtA222cGTBAfEASYCJ/rOGSBIEArVlUGzBJZ2mjoSBR
	qmlI5g83AdWVvNjmz/o5GCKoKoQaLtcbGWvwCmeDiX8WIzutuF1QG3bORsXjnGq5pd3T
	kdnN3dFMt1PZKtItoB7xHgp8VRjYBn1jN81QZAOGa+vRX6JOOClxHJEjEq1n9JF63RG/
	CSIrKlJHEeImdwF/n7Ee88iDDzenSaqApnSZ+UuhxK0/Gc+q982jG/wBUEInGYLHg5Yk
	jFuQ==
X-Received: by 10.66.194.134 with SMTP id hw6mr8732266pac.69.1427759659392;
	Mon, 30 Mar 2015 16:54:19 -0700 (PDT)
Received: from ?IPv6:2601:c:a700:3ba7:bdc8:daf2:1c92:3db7?
	([2601:c:a700:3ba7:bdc8:daf2:1c92:3db7])
	by mx.google.com with ESMTPSA id q3sm8454871pds.49.2015.03.30.16.54.16
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 30 Mar 2015 16:54:18 -0700 (PDT)
Message-ID: <5519E220.7080107@gmail.com>
Date: Mon, 30 Mar 2015 16:54:08 -0700
From: akuster808 <akuster808@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.5.0
MIME-Version: 1.0
To: Martin Jansa <martin.jansa@gmail.com>
References: <cover.1427729801.git.akuster808@gmail.com>
	<20150330184920.GE14928@jama>
In-Reply-To: <20150330184920.GE14928@jama>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 00/17] meta-core Dizzy next
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
X-List-Received-Date: Mon, 30 Mar 2015 23:54:21 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 8bit



On 03/30/2015 11:49 AM, Martin Jansa wrote:
> On Mon, Mar 30, 2015 at 09:41:05AM -0700, Armin Kuster wrote:
>> please consider these changes for Dizzy next
>>
>> The following changes since commit ec75238f6cc2d2d8d40e0268f6d2acc070cbe9a4:
>>
>>    Revert "file: Update CVE patch to ensure file gets built correctly" (2015-03-28 10:56:50 +0000)
>>
>> are available in the git repository at:
>>
>>    git://git.yoctoproject.org/poky-contrib akuster/dizzy-next
>>    http://git.yoctoproject.org/cgit.cgi//log/?h=akuster/dizzy-next
>>
>> Aníbal Limón (1):
>>    files/toolchain-shar-template.sh: fix replace target_sdk_dir twice in
>>      environment setup file
>>
>> Bian Naimeng (1):
>>    gcc-4.9: fix bug of 0056-top-level-reorder_gcc-bug-61144.patch
>>
>> Bruce Ashfield (3):
>>    linux-yocto/3.10: update to v3.10.65
>>    linux-yocto/3.14: update to 3.14.29
>>    linux-yocto/3.17: update to v3.17.8
>>
>> Chen Qi (1):
>>    package_manager.py: fix rootfs failure with multilib enabled
>>
>> Enrico Scholz (1):
>>    serf: fix 'ccache' builds
>>
>> Martin Jansa (2):
>>    xorg-driver: add x11 to required DISTRO_FEATURES
>>    piglit: add x11 to required DISTRO_FEATURES
>
> I don't feel very strongly about these, but without remaining
> required DISTRO_FEATURES patches it doesn't buy much, maybe stage them
> for a bit longer and then backport all of them in some next batch?

that sounds good.

>
>> Patrick Ohly (2):
>>    binconfig-disabled: try harder to prevent usage of config scripts
>>    binconfig-disabled: install config scripts in sysroot
>
> IIRC this was breaking some recipes in other layers, I'm not sure if
> it's worth it.

ok. easy enough to drop

thanks,
Armin
>
>> Richard Purdie (1):
>>    gcc-target: Don't install target gcc libdir files
>>
>> Robert Yang (2):
>>    dpkg: add perl to RDEPENDS
>>    which 2.18: fix SRC_URI
>>
>> Ross Burton (2):
>>    bitbake: tests/data: add test for incorrect remove behaviour
>>    bitbake: data_smart: split expanded removal values when handling
>>      _remove
>>
>> Saul Wold (1):
>>    linux-yocto-tiny_3.17: Update to actually use 3.17 git repo
>>
>>   bitbake/lib/bb/data_smart.py                       |  3 +-
>>   bitbake/lib/bb/tests/data.py                       |  7 ++++
>>   meta/classes/binconfig-disabled.bbclass            | 13 +++++++
>>   meta/files/toolchain-shar-template.sh              |  1 +
>>   meta/lib/oe/package_manager.py                     |  5 ++-
>>   meta/recipes-devtools/dpkg/dpkg.inc                |  2 +-
>>   .../0056-top-level-reorder_gcc-bug-61144.patch     | 42 ++++++++++------------
>>   meta/recipes-devtools/gcc/gcc-target.inc           |  9 +++++
>>   meta/recipes-extended/which/which_2.18.bb          |  2 +-
>>   meta/recipes-graphics/piglit/piglit_git.bb         |  4 ++-
>>   .../xorg-driver/xorg-driver-common.inc             |  4 ++-
>>   meta/recipes-kernel/linux/linux-yocto-rt_3.10.bb   |  8 ++---
>>   meta/recipes-kernel/linux/linux-yocto-rt_3.14.bb   |  8 ++---
>>   meta/recipes-kernel/linux/linux-yocto-tiny_3.10.bb |  6 ++--
>>   meta/recipes-kernel/linux/linux-yocto-tiny_3.14.bb |  6 ++--
>>   meta/recipes-kernel/linux/linux-yocto-tiny_3.17.bb |  8 ++---
>>   meta/recipes-kernel/linux/linux-yocto_3.10.bb      | 18 +++++-----
>>   meta/recipes-kernel/linux/linux-yocto_3.14.bb      | 18 +++++-----
>>   meta/recipes-kernel/linux/linux-yocto_3.17.bb      | 18 +++++-----
>>   meta/recipes-support/serf/serf/env.patch           | 28 +++++++++++++++
>>   meta/recipes-support/serf/serf_1.3.7.bb            |  8 ++---
>>   21 files changed, 139 insertions(+), 79 deletions(-)
>>   create mode 100644 meta/recipes-support/serf/serf/env.patch
>>
>> --
>> 1.9.1
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

