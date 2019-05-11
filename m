Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com
	[209.85.215.194])
	by mail.openembedded.org (Postfix) with ESMTP id 7E0447DED0
	for <openembedded-core@lists.openembedded.org>;
	Sat, 11 May 2019 16:06:48 +0000 (UTC)
Received: by mail-pg1-f194.google.com with SMTP id a3so4516463pgb.3
	for <openembedded-core@lists.openembedded.org>;
	Sat, 11 May 2019 09:06:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=n8u+GJX6/exE4ZTRMTgPSKInZtyJHutSqEmZIzpKLNc=;
	b=MYsfvWXFqZrJOKlUijHK+rfJasNGKTOiGusYTTaRDeDP0b+OzEbyu75UAg6vm/UO0n
	7DSuxr9NzdOsxfRIadlepOTuKkEQ3AU9klaW3m7ZJKyACzvzEkEbtECjpyLVOiYtC0/Y
	uCqbYIlg3AY+uJx++tdITnS8NrrQ8OKu/mtnMGVUbZxnWbXtPFIZNVzy8nBrdSMXSnG8
	bXMwM8BsSLtGpUYpAtH2BOIdZT45SRPWcmBRfBzKwrvuMj15wD4+rUg/5Xj8HjnAdhGH
	RBf5cqzpMSe7NMPtiKWDXRm/1lsace+OSdYkSlugpLt13xLxoc9/UnniHzyn7nI/lzdZ
	TR2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding:content-language;
	bh=n8u+GJX6/exE4ZTRMTgPSKInZtyJHutSqEmZIzpKLNc=;
	b=IYQHYddIporiHUnXc2Ew2UQ+ue1iqYDNaBYto+ARpn6zQVzL5X9itsXYWVgGhmWe9j
	ETtDmIBaAr8bCzZw8iA1Mpvq4joBGWoB+jrI4O8va/RWxnzP78x99cNxWc48u+w2MWSO
	LtjwgB8dBN9hCP1dAg1hv9djAh0c0QqFczSOzLvscaQOV5u3QBCb3WBcAzclPPCV8y7Y
	E12KuXQ4E3fCr6QP37C8FVueSPZPlGKKi+Mc9yx4jHgwVie2eSwK+7sAffCcHdHbmuO+
	vuEQI1YOwvrKToyM/dNttmaKpBrPtZO3ilooAUbbGBq06wm04OBWhYu45gEzA+jChGkb
	fGLg==
X-Gm-Message-State: APjAAAXT5P2+qYlgDjOyU4swA+15RN4KuUs9ehoVTiS694O3ILZrrGcZ
	GRErm6NUGiN0Lr89ka+rwLDzD195
X-Google-Smtp-Source: APXvYqyYMXjcccI5cRAJHs5fx6+/XVx11fYMQW9c04eIRNpuKnswiooC+gNimq6hHPTvxzQ2OrIMsA==
X-Received: by 2002:a63:e956:: with SMTP id q22mr21593295pgj.277.1557590809043;
	Sat, 11 May 2019 09:06:49 -0700 (PDT)
Received: from ?IPv6:2601:202:4180:c33:2909:a937:370d:1a54?
	([2601:202:4180:c33:2909:a937:370d:1a54])
	by smtp.gmail.com with ESMTPSA id
	q5sm11466131pfb.51.2019.05.11.09.06.48
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 11 May 2019 09:06:48 -0700 (PDT)
To: Paul Barker <paul@betafive.co.uk>, openembedded-core@lists.openembedded.org
References: <cover.1557584714.git.akuster808@gmail.com>
	<54934103-7a6c-ebb0-ba90-8ef87251616f@betafive.co.uk>
From: akuster808 <akuster808@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <bed43f9f-78e3-46e2-934e-c2622ada1b0e@gmail.com>
Date: Sat, 11 May 2019 09:06:39 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <54934103-7a6c-ebb0-ba90-8ef87251616f@betafive.co.uk>
Subject: Re: [PATCH 00/41] Warrior pull request
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
X-List-Received-Date: Sat, 11 May 2019 16:06:48 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US



On 5/11/19 9:00 AM, Paul Barker wrote:
> On 11/05/2019 15:27, Armin Kuster wrote:
>> Past due pull request for warrior-next
>>
>> The following changes since commit
>> f571b188177788d8ed0a7f3efe3569f153b1b0d3:
>>
>>    build-appliance-image: Update to warrior head revision (2019-04-14
>> 21:27:58 +0100)
>>
>> are available in the git repository at:
>>
>>    git://git.openembedded.org/openembedded-core-contrib
>> stable/warrior-next
>>    http://cgit.openembedded.org//log/?h=stable/warrior-next
>>
>> Adrian Bunk (3):
>>    gnutls: upgrade 3.6.5 -> 3.6.7
>>    dhcp: Replace OE specific patch for compatibility with latest bind
>>      with upstream patch
>>    gnome-doc-utils: Remove stale patch
>>
>> Alexander Kanavin (2):
>>    python3: add another multilib fix
>>    buildhistory: call a dependency parser only on actual dependency
>> lists
>>
>> Anuj Mittal (4):
>>    gcc: fix CVE-2018-18484
>>    gdb: fix CVE-2017-9778
>>    binutils: fix CVE-2019-9074 CVE-2019-9075 CVE-2019-9076 CVE-2019-9077
>>    openssh: fix CVE-2018-20685, CVE-2019-6109, CVE-2019-6111
>>
>> Bruce Ashfield (8):
>>    linux-yocto/5.0: update to v5.0.5
>>    linux-yocto-rt: update to 5.0.5-rt3
>>    linux-yocto/5.0: update to v5.0.7
>>    linux-yocto/4.19: update to v4.19.34
>>    linux-yocto-rt/4.19: fix merge conflict in lru_drain
>>    linux-yocto/5.0: port RAID configuration tweaks from master
>>    linux-yocto/5.0: integrate TCP timeout / hang fix
>>    linux-yocto/5.0: update TCP patch to mainline version
>>
>> Chen Qi (4):
>>    busybox: fix ptest failure about 'dc'
>>    base-files: move hostname operations out of issue file settings
>>    dropbear: set CVE_PRODUCT
>>    libsdl: set CVE_PRODUCT
>>
>> Dengke Du (1):
>>    linux-yocto_5.0: set devicetree for armv5
>>
>> He Zhe (1):
>>    ltp: Fix setrlimit03 call succeeded unexpectedly
>>
>> Jaewon Lee (1):
>>    Adding back wrapper and using OEPYTHON3HOME variable for python3
>>
>> Jens Rehsack (1):
>>    kernel-module-split.bbclass: support CONFIG_MODULE_COMPRESS=y
>>
>> Joshua Watt (2):
>>    resulttool: Load results from URL
>>    resulttool: Add log subcommand
>>
>> Kai Kang (1):
>>    cryptodev: fix module loading error
>>
>> Mardegan, Alberto (1):
>>    oeqa/core/runner: dump stdout and stderr of each test case
>>
>> Mariano Lopez (1):
>>    ptest.bbclass: Use d.getVar instead of os.environ
>>
>> Martin Jansa (2):
>>    icecc.bbclass: stop causing everything to be effectivelly
>> MACHINE_ARCH
>>    glibc: always use bfd linker
>>
>> Naveen Saini (2):
>>    core-image-rt: make sure that we append to DEPENDS
>>    core-image-rt-sdk: make sure that we append to DEPENDS
>>
>> Oleksandr Kravchuk (1):
>>    curl: update to 7.64.1
>>
>> Richard Purdie (4):
>>    core-image-sato-sdk-ptest: Try and keep image below 4GB limit
>>    resultool/resultutils: Fix module import error
>>    utils/multiprocess_launch: Improve failing subprocess output
>>    python3: Drop ptest hack
>>
>> Steven Hung (洪于玉) (1):
>>    kernel.bbclass: convert base_do_unpack_append() to a task
>>
>> sangeeta jain (1):
>>    resulttool/manualexecution: Enable test case configuration option
>>
>>   meta/classes/icecc.bbclass                         |    1 +
>>   meta/classes/kernel-module-split.bbclass           |   20 +-
>>   meta/classes/kernel.bbclass                        |    3 +-
>>   meta/classes/ptest.bbclass                         |    4 +-
>>   meta/classes/testimage.bbclass                     |    3 +-
>>   meta/lib/oe/buildhistory_analysis.py               |    2 +-
>>   meta/lib/oe/utils.py                               |    7 +-
>>   meta/lib/oeqa/core/runner.py                       |   20 +-
>>   ...eplace-custom-isc_boolean_t-with-C-standa.patch | 2882
>> --------------------
>>   ...d-includes-of-new-BIND9-compatibility-hea.patch |   79 +
>>   meta/recipes-connectivity/dhcp/dhcp_4.4.1.bb       |    2 +-
>>   ...ve-progressmeter-force-an-update-at-the-b.patch |  121 +
>>   .../openssh/openssh/CVE-2018-20685.patch           |   40 +
>>   .../openssh/openssh/CVE-2019-6109.patch            |  275 ++
>>   .../openssh/openssh/CVE-2019-6111.patch            |  187 ++
>>   meta/recipes-connectivity/openssh/openssh_7.9p1.bb |    4 +
>>   meta/recipes-core/base-files/base-files_3.0.14.bb  |    7 +-
>>   ...ix-two-test-case-to-also-depend-on-DC_BIG.patch |   39 +
>>   meta/recipes-core/busybox/busybox_1.30.1.bb        |    1 +
>>   meta/recipes-core/dropbear/dropbear.inc            |    2 +
>>   meta/recipes-core/glibc/glibc_2.29.bb              |    2 +-
>>   meta/recipes-devtools/binutils/binutils-2.32.inc   |    4 +
>>   .../binutils/binutils/CVE-2019-9074.patch          |   68 +
>>   .../binutils/binutils/CVE-2019-9075.patch          |  119 +
>>   .../binutils/binutils/CVE-2019-9076.patch          |   49 +
>>   .../binutils/binutils/CVE-2019-9077.patch          |   37 +
>>   meta/recipes-devtools/gcc/gcc-8.3.inc              |    1 +
>>   ...sion-limit-to-libiberty-s-demangling-code.patch |  325 +++
>>   meta/recipes-devtools/gdb/gdb-8.2.1.inc            |    1 +
>>   meta/recipes-devtools/gdb/gdb/CVE-2017-9778.patch  |   99 +
>>   ...ig.py-fix-another-place-where-lib-is-hard.patch |   31 +
>>   ...EPYTHON3HOME-is-set-use-instead-of-PYTHON.patch |   47 +
>>   .../python/python3/ptesthack.patch                 |   60 -
>>   meta/recipes-devtools/python/python3_3.7.2.bb      |    9 +-
>>   ...trlimit03.c-read-proc-sys-fs-nr_open-for-.patch |   70 +
>>   meta/recipes-extended/ltp/ltp_20190115.bb          |    1 +
>>   ...t.m4-Update-AM_GLIB_GNU_GETTEXT-to-match-.patch |   40 -
>>   meta/recipes-graphics/libsdl/libsdl_1.2.15.bb      |    2 +
>>   meta/recipes-graphics/libsdl2/libsdl2_2.0.9.bb     |    2 +
>>   meta/recipes-kernel/cryptodev/cryptodev.inc        |    4 +-
>>   ...01-Fix-module-loading-with-Linux-v5.0-rc5.patch |   59 +
>>   meta/recipes-kernel/linux/linux-yocto-rt_4.19.bb   |    6 +-
>>   meta/recipes-kernel/linux/linux-yocto-rt_5.0.bb    |    6 +-
>>   meta/recipes-kernel/linux/linux-yocto-tiny_4.19.bb |    8 +-
>>   meta/recipes-kernel/linux/linux-yocto-tiny_5.0.bb  |    8 +-
>>   meta/recipes-kernel/linux/linux-yocto_4.19.bb      |   20 +-
>>   meta/recipes-kernel/linux/linux-yocto_5.0.bb       |   21 +-
>>   meta/recipes-rt/images/core-image-rt-sdk.bb        |    2 +-
>>   meta/recipes-rt/images/core-image-rt.bb            |    2 +-
>>   .../images/core-image-sato-sdk-ptest.bb            |    4 +-
>>   .../curl/{curl_7.64.0.bb => curl_7.64.1.bb}        |    4 +-
>>   .../gnutls/{gnutls_3.6.5.bb => gnutls_3.6.7.bb}    |    7 +-
>>   scripts/lib/resulttool/log.py                      |   56 +
>>   scripts/lib/resulttool/manualexecution.py          |   14 +-
>>   scripts/lib/resulttool/merge.py                    |    8 +-
>>   scripts/lib/resulttool/regression.py               |    6 +-
>>   scripts/lib/resulttool/report.py                   |    2 +-
>>   scripts/lib/resulttool/resultutils.py              |   23 +-
>>   scripts/lib/resulttool/store.py                    |    4 +-
>>   scripts/resulttool                                 |    2 +
>>   60 files changed, 1871 insertions(+), 3061 deletions(-)
>>   delete mode 100644
>> meta/recipes-connectivity/dhcp/dhcp/0001-dhcpd-fix-Replace-custom-isc_boolean_t-with-C-standa.patch
>>   create mode 100644
>> meta/recipes-connectivity/dhcp/dhcp/0001-master-Added-includes-of-new-BIND9-compatibility-hea.patch
>>   create mode 100644
>> meta/recipes-connectivity/openssh/openssh/0001-upstream-Have-progressmeter-force-an-update-at-the-b.patch
>>   create mode 100644
>> meta/recipes-connectivity/openssh/openssh/CVE-2018-20685.patch
>>   create mode 100644
>> meta/recipes-connectivity/openssh/openssh/CVE-2019-6109.patch
>>   create mode 100644
>> meta/recipes-connectivity/openssh/openssh/CVE-2019-6111.patch
>>   create mode 100644
>> meta/recipes-core/busybox/busybox/0001-dc.tests-fix-two-test-case-to-also-depend-on-DC_BIG.patch
>>   create mode 100644
>> meta/recipes-devtools/binutils/binutils/CVE-2019-9074.patch
>>   create mode 100644
>> meta/recipes-devtools/binutils/binutils/CVE-2019-9075.patch
>>   create mode 100644
>> meta/recipes-devtools/binutils/binutils/CVE-2019-9076.patch
>>   create mode 100644
>> meta/recipes-devtools/binutils/binutils/CVE-2019-9077.patch
>>   create mode 100644
>> meta/recipes-devtools/gcc/gcc-8.3/0041-Add-a-recursion-limit-to-libiberty-s-demangling-code.patch
>>   create mode 100644 meta/recipes-devtools/gdb/gdb/CVE-2017-9778.patch
>>   create mode 100644
>> meta/recipes-devtools/python/python3/0001-Lib-sysconfig.py-fix-another-place-where-lib-is-hard.patch
>>   create mode 100644
>> meta/recipes-devtools/python/python3/0001-main.c-if-OEPYTHON3HOME-is-set-use-instead-of-PYTHON.patch
>>   delete mode 100644
>> meta/recipes-devtools/python/python3/ptesthack.patch
>>   create mode 100644
>> meta/recipes-extended/ltp/ltp/0001-syscalls-setrlimit03.c-read-proc-sys-fs-nr_open-for-.patch
>>   delete mode 100644
>> meta/recipes-gnome/gnome/gnome-doc-utils/0001-glib-gettext.m4-Update-AM_GLIB_GNU_GETTEXT-to-match-.patch
>>   create mode 100644
>> meta/recipes-kernel/cryptodev/files/0001-Fix-module-loading-with-Linux-v5.0-rc5.patch
>>   rename meta/recipes-support/curl/{curl_7.64.0.bb => curl_7.64.1.bb}
>> (95%)
>>   rename meta/recipes-support/gnutls/{gnutls_3.6.5.bb =>
>> gnutls_3.6.7.bb} (88%)
>>   create mode 100644 scripts/lib/resulttool/log.py
>>
>
> Could we also include
> https://git.openembedded.org/openembedded-core/commit/?id=f178990495c773b4b36b1be6aafc2da158b76894
> please?
Not in this one as this is a late pull request for the review done last
week. This commit is in the next series being worked on.

Thanks,
- armin
>
> Thanks,
>


