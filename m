Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f67.google.com (mail-pa0-f67.google.com
	[209.85.220.67])
	by mail.openembedded.org (Postfix) with ESMTP id 3571060290
	for <openembedded-core@lists.openembedded.org>;
	Sat, 30 Jan 2016 02:44:49 +0000 (UTC)
Received: by mail-pa0-f67.google.com with SMTP id gi1so4389952pac.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Jan 2016 18:44:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-type:content-transfer-encoding;
	bh=egOq6iL0DoObQaF5R1ruADd9rEYUcPW65OsaR2bKao0=;
	b=UAuuTtmUWpk55IBGZRgBFJm4PsZu9U7qdyA/VJ7wz/mthdhHAREFUtfFwfT0Y/6cy8
	0dqPXuA/pPSRWouuelqda8HtmkHeNSv0gZe0+znC8XHpYDSBF5sTkcLEhr+aHCAFySmS
	vgS338aEOp7qbqNTCWpQHw82ilz6uTpVoS/wSMaMqfms4Qp+WtMC09K4hah2pF2deUYZ
	q+JB0UgtBaU5Acm4Pbu/uUdiucdcD1Gvits4EbQkB5hXG8iUGnI0lnRo67UuqEo5iOyg
	DmVtti2yt3qO7BpBf6dhYLCDCdAa7x8+u2Z7e6CxSRlAEplVZqNrUKQs53MwESCF4n6H
	YmTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:cc:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-type
	:content-transfer-encoding;
	bh=egOq6iL0DoObQaF5R1ruADd9rEYUcPW65OsaR2bKao0=;
	b=dIiJZ/hnEOnCDp5SXRsmk0JOjZOw9Krlh5KaJIrFvL7BbRy4gtqsvmecf5hYWxiKpv
	ETsDuplBJUjwY3ucqINDN34pydGI6Ub1TI/jbMnNWW68s7f1iQTKUJ9V5XRrwZYFNYPg
	t7OSX2mQY4etivr6bfiiW2qwUHRwi6NxfH3kyg7KqWfHsxYt6FJUP7aJ0Jf1G6o4tFhu
	Y/qhH2d4UnecDrkv7w4jc5ZLAoo9yZwrzHTJUxRmuYNv+gdltyjcGv1Hv+qRDA59YjGY
	ezPQL6MojUBNefq+p3dTc3xyKH6n0EGB3e3/bxJs0UGfIviNAXuoe073j0e+Ysxnn5FH
	GRgg==
X-Gm-Message-State: AG10YORssiI2RDp2iUkiJ+cQ4Twk495orx3aRHw3fixHWi++zGXLSzjDM6aYjRK8REmkbg==
X-Received: by 10.67.6.67 with SMTP id cs3mr18699468pad.143.1454121890148;
	Fri, 29 Jan 2016 18:44:50 -0800 (PST)
Received: from Akusters-laptop.local ([2601:202:4000:1239:3cff:6d04:6151:fa96])
	by smtp.googlemail.com with ESMTPSA id
	68sm26396788pfa.78.2016.01.29.18.44.40
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 29 Jan 2016 18:44:48 -0800 (PST)
To: Martin Jansa <martin.jansa@gmail.com>
References: <cover.1452385571.git.akuster808@gmail.com>
	<20160121115752.GA2603@jama> <20160127113311.GA2574@jama>
From: akuster808 <akuster808@gmail.com>
Message-ID: <56AC2396.8030707@gmail.com>
Date: Fri, 29 Jan 2016 18:44:38 -0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:38.0)
	Gecko/20100101 Thunderbird/38.5.1
MIME-Version: 1.0
In-Reply-To: <20160127113311.GA2574@jama>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 00/20] Dizzy-next pull request 2016-1
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
X-List-Received-Date: Sat, 30 Jan 2016 02:44:50 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

On 1/27/16 3:33 AM, Martin Jansa wrote:
> On Thu, Jan 21, 2016 at 12:57:52PM +0100, Martin Jansa wrote:
>> On Sat, Jan 09, 2016 at 04:30:26PM -0800, Armin Kuster wrote:
>>> Please consider these changes for dizzy-next community support.
>>>
>>> The following changes since commit 6d34267e0a13e10ab91b60590b27a2b5ba3b7da6:
>>>
>>>   documentation: Changed some 'intro' tags to resolve multiple mega-manual warnings. (2015-11-18 16:44:05 +0000)
>>>
>>> are available in the git repository at:
>>>
>>>   git://git.yoctoproject.org/poky-contrib akuster/dizzy-next
>>>   http://git.yoctoproject.org/cgit.cgi//log/?h=akuster/dizzy-next
>> This is for oe-core, right? So it shouldn't be in poky-contrib and the
>> http link doesn't work, it should be:
>> http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=akuster/dizzy-next

no. this should be for oe core.
>>
>>> Armin Kuster (2):
>>>   openssh: CVE-2015-6563 CVE-2015-6564 CVE-2015-6565
>>>   Fixes a heap buffer overflow in glibc wscanf.
>> What is this 2nd patch? It doesn't follow commit summary convention and
>> I don't see it in master (at least not with this subject)
>> http://git.yoctoproject.org/cgit.cgi/poky-contrib/commit/?h=akuster/dizzy-next&id=4807ff0ca0abf085e6b81257534a4a62fde88d16


>> Other changes look good to me.

that was a patch from the patch queue and affect glibc below 2.21 so
Master, Jethro nor fido are  affected.

http://patches.openembedded.org/patch/109797/
> ping?

Dizzy 1.7.4 is  not planned yet.

- armin
>
>>> Belal, Awais (1):
>>>   grub2: Fix CVE-2015-8370
>>>
>>> Chen Qi (1):
>>>   image.bbclass: don't let do_rootfs depend on BUILDNAME
>>>
>>> Martin Jansa (3):
>>>   fontcache: allow to pass extra parameters and environment to fc-cache
>>>   texinfo: don't create dependency on INHERIT variable
>>>   linux-dtb.inc: drop unused DTB_NAME variable from do_install
>>>
>>> Mike Crowe (1):
>>>   allarch: Force TARGET_*FLAGS variable values
>>>
>>> Richard Purdie (2):
>>>   layer.conf: Add several allarch dependency exclusions
>>>   layer.conf: Add missing dependency for allarch package
>>>     initramfs-framework
>>>
>>> Sergiy Kibrik (1):
>>>   rsync: backport libattr checking patch
>>>
>>> Sona Sarmadi (7):
>>>   libtasn1: CVE-2015-3622
>>>   grep2.19: CVE-2015-1345
>>>   libxml2: CVE-2015-7942
>>>   libxml2: CVE-2015-8035
>>>   openssl: CVE-2015-3194, CVE-2015-3195
>>>   libxml2: CVE-2015-8241
>>>   bind: CVE-2015-8000
>>>
>>> Tudor Florea (2):
>>>   glibc: use patch for CVE-2015-1781
>>>   unzip: CVE-2015-7696, CVE-2015-7697
>>>
>>>  meta/classes/allarch.bbclass                       |   4 +
>>>  meta/classes/fontcache.bbclass                     |  19 +-
>>>  meta/classes/image.bbclass                         |   2 +-
>>>  meta/conf/layer.conf                               |  11 ++
>>>  ...E-2015-8370-Grub2-user-pass-vulnerability.patch |  50 ++++++
>>>  meta/recipes-bsp/grub/grub-efi_2.00.bb             |   1 +
>>>  meta/recipes-bsp/grub/grub_2.00.bb                 |   1 +
>>>  .../bind/bind/CVE-2015-8000.patch                  | 194 +++++++++++++++++++++
>>>  meta/recipes-connectivity/bind/bind_9.9.5.bb       |   1 +
>>>  .../openssh/openssh/CVE-2015-6563.patch            |  36 ++++
>>>  .../openssh/openssh/CVE-2015-6564.patch            |  34 ++++
>>>  .../openssh/openssh/CVE-2015-6565.patch            |  35 ++++
>>>  meta/recipes-connectivity/openssh/openssh_6.6p1.bb |   5 +-
>>>  .../CVE-2015-3194-Add-PSS-parameter-check.patch    |  37 ++++
>>>  ...CVE-2015-3195-Fix-leak-with-ASN.1-combine.patch |  61 +++++++
>>>  .../recipes-connectivity/openssl/openssl_1.0.1p.bb |   2 +
>>>  ...5-1472-wscanf-allocates-too-little-memory.patch | 108 ++++++++++++
>>>  meta/recipes-core/glibc/glibc_2.20.bb              |   5 +-
>>>  meta/recipes-core/libxml/libxml2.inc               |   3 +
>>>  .../libxml/libxml2/CVE-2015-7942.patch             |  58 ++++++
>>>  .../libxml/libxml2/CVE-2015-8035.patch             |  35 ++++
>>>  .../libxml/libxml2/CVE-2015-8241.patch             |  41 +++++
>>>  .../rsync/files/check_libattr.patch                |  33 ++++
>>>  meta/recipes-devtools/rsync/rsync_3.1.0.bb         |   3 +-
>>>  .../grep/grep-2.19/grep2.19-CVE-2015-1345.patch    | 129 ++++++++++++++
>>>  meta/recipes-extended/grep/grep_2.19.bb            |   4 +-
>>>  meta/recipes-extended/texinfo/texinfo_5.2.bb       |   2 +-
>>>  .../unzip/unzip/CVE-2015-7696.patch                |  38 ++++
>>>  .../unzip/unzip/CVE-2015-7697.patch                |  31 ++++
>>>  meta/recipes-extended/unzip/unzip_6.0.bb           |   2 +
>>>  meta/recipes-kernel/linux/linux-dtb.inc            |   1 -
>>>  .../gnutls/libtasn1/libtasn1-CVE-2015-3622.patch   |  44 +++++
>>>  meta/recipes-support/gnutls/libtasn1_4.0.bb        |   1 +
>>>  scripts/postinst-intercepts/update_font_cache      |   4 +-
>>>  34 files changed, 1020 insertions(+), 15 deletions(-)
>>>  create mode 100644 meta/recipes-bsp/grub/files/0001-Fix-CVE-2015-8370-Grub2-user-pass-vulnerability.patch
>>>  create mode 100644 meta/recipes-connectivity/bind/bind/CVE-2015-8000.patch
>>>  create mode 100644 meta/recipes-connectivity/openssh/openssh/CVE-2015-6563.patch
>>>  create mode 100644 meta/recipes-connectivity/openssh/openssh/CVE-2015-6564.patch
>>>  create mode 100644 meta/recipes-connectivity/openssh/openssh/CVE-2015-6565.patch
>>>  create mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2015-3194-Add-PSS-parameter-check.patch
>>>  create mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2015-3195-Fix-leak-with-ASN.1-combine.patch
>>>  create mode 100644 meta/recipes-core/glibc/glibc/CVE-2015-1472-wscanf-allocates-too-little-memory.patch
>>>  create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2015-7942.patch
>>>  create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2015-8035.patch
>>>  create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2015-8241.patch
>>>  create mode 100644 meta/recipes-devtools/rsync/files/check_libattr.patch
>>>  create mode 100644 meta/recipes-extended/grep/grep-2.19/grep2.19-CVE-2015-1345.patch
>>>  create mode 100644 meta/recipes-extended/unzip/unzip/CVE-2015-7696.patch
>>>  create mode 100644 meta/recipes-extended/unzip/unzip/CVE-2015-7697.patch
>>>  create mode 100644 meta/recipes-support/gnutls/libtasn1/libtasn1-CVE-2015-3622.patch
>>>
>>> -- 
>>> 1.9.1
>>>
>>> -- 
>>> _______________________________________________
>>> Openembedded-core mailing list
>>> Openembedded-core@lists.openembedded.org
>>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>> -- 
>> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
>
>


