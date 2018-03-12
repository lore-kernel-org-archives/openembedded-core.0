Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 049FA7888F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Mar 2018 09:16:24 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w2C9GPkn013804
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 12 Mar 2018 02:16:25 -0700 (PDT)
Received: from [128.224.162.197] (128.224.162.197) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.361.1;
	Mon, 12 Mar 2018 02:15:46 -0700
To: "Maxin B. John" <maxin.john@intel.com>
References: <cover.1520841539.git.Qi.Chen@windriver.com>
	<e0d90ab0b0aea86e2955dfa749fdad1add65e6ac.1520841539.git.Qi.Chen@windriver.com>
	<20180312085213.GA25631@mbabyjoh-desk.ger.corp.intel.com>
From: ChenQi <Qi.Chen@windriver.com>
Message-ID: <8447a24a-1ae3-715e-07ba-30a35148390e@windriver.com>
Date: Mon, 12 Mar 2018 17:16:48 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <20180312085213.GA25631@mbabyjoh-desk.ger.corp.intel.com>
X-Originating-IP: [128.224.162.197]
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/3] systemd: upgrade to 237
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
X-List-Received-Date: Mon, 12 Mar 2018 09:16:25 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

On 03/12/2018 04:52 PM, Maxin B. John wrote:
> Hi,
>
> On Mon, Mar 12, 2018 at 04:38:51PM +0800, Chen Qi wrote:
>> Upgrade systemd to 237.
>>
>> Note that this version has dropped autotools support.
> Very minor nit-picking :
>
> Even with this patch, "systemd_237.bb" and "systemd.inc" contains duplicated
>
> SRC_URI = "git://github.com/systemd/systemd.git;protocol=git"
>
> Probably a good idea to keep it only in "systemd.inc" file.
>

Hi Maxin,

Thanks for pointing it out.
I've fixed this problem and updated the remote branch.

Best Regards,
Chen Qi

>> The following patches are rebased:
>> 0004-Use-getenv-when-secure-versions-are-not-available.patch
>> 0005-binfmt-Don-t-install-dependency-links-at-install-tim.patch
>> 0007-use-lnr-wrapper-instead-of-looking-for-relative-opti.patch
>> 0015-Revert-udev-remove-userspace-firmware-loading-suppor.patch
>> 0018-check-for-uchar.h-in-configure.patch
>> 0019-socket-util-don-t-fail-if-libc-doesn-t-support-IDN.patch
>> 0001-add-fallback-parse_printf_format-implementation.patch
>> 0002-src-basic-missing.h-check-for-missing-strndupa.patch
>> 0007-check-for-missing-canonicalize_file_name.patch
>> 0008-Do-not-enable-nss-tests.patch
>> 0010-test-sizeof.c-Disable-tests-for-missing-typedefs-in-.patch
>> 0011-nss-mymachines-Build-conditionally-when-HAVE_MYHOSTN.patch
>>
>> The following backported patches are dropped:
>> 0001-core-evaluate-presets-after-generators-have-run-6526.patch
>> 0001-main-skip-many-initialization-steps-when-running-in-.patch
>> 0001-meson-update-header-file-to-detect-memfd_create.patch
>> 0003-fileio-include-sys-mman.h.patch
>>
>> The following patch is dropped as autotools support is dropped:
>> 0002-configure.ac-Check-if-memfd_create-is-already-define.patch
>>
>> The following patches are newly added to fix problems:
>> 0027-remove-nobody-user-group-checking.patch
>> 0028-add-missing-FTW_-macros-for-musl.patch
>> 0030-fix-missing-of-__register_atfork-for-non-glibc-build.patch
>> 0031-fix-missing-ULONG_LONG_MAX-definition-in-case-of-mus.patch
> Best Regards,
> Maxin
>


