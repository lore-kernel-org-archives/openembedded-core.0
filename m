Return-Path: <jiaqing.zhao@linux.intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC836C433F5
	for <webhook@archiver.kernel.org>; Mon, 23 May 2022 02:37:41 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by mx.groups.io with SMTP id smtpd.web08.23271.1653273455066426353
 for <openembedded-core@lists.openembedded.org>;
 Sun, 22 May 2022 19:37:35 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=R/+NTApJ;
 spf=none, err=permanent DNS error (domain: linux.intel.com, ip: 192.55.52.88,
 mailfrom: jiaqing.zhao@linux.intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1653273455; x=1684809455;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=PbuDVYogaAYXhRKEKROrUD6OftIJU+hnKKNyeMY6jVA=;
  b=R/+NTApJo6L57nq5vOLliZFy+HPQCRWKtKK93JCOjQZtrxdGY5wyn968
   O3KcWZs+1ZQz/foLOPuQaTVu+eAEBgw4NUFSzvVd8Ah9drowpCLYplCFz
   wb2/ZObfyzgV4z+3Lo1zV6MSqlC8wb9M5kTOsUv3qcNUyA/LChTgNCiML
   +2aD7COMfup/LwEjY0Yl6dlRvewjRSIyMSz5ify019OwjbWBJpO0b/f3/
   vCFErWGKz+a5/cWx6+c7JoTfkntF8DTQQ1Hm5E193rjeGb3NfC6bUyCcb
   mXcpYz2KAHDTtgTIi9RgBBKmUJjQVZKDA6dKf5nJewaI6wkRywSNcJLbb
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10355"; a="298394927"
X-IronPort-AV: E=Sophos;i="5.91,245,1647327600";
   d="scan'208";a="298394927"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2022 19:37:32 -0700
X-IronPort-AV: E=Sophos;i="5.91,245,1647327600";
   d="scan'208";a="600401571"
Received: from jiaqingz-mobl.ccr.corp.intel.com (HELO [10.249.171.16])
 ([10.249.171.16])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2022 19:37:31 -0700
Message-ID: <edd7adbb-d1d2-931e-08ba-dced9b810252@linux.intel.com>
Date: Mon, 23 May 2022 10:37:27 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [oe-core] [PATCH v2 0/4] systemd: Update patches
Content-Language: en-US
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
References: <20220523022014.1203675-1-jiaqing.zhao@linux.intel.com>
 <CAMKF1sobD1EPHK3gQ+OcmC6c9F91U-KZkW5xdNgrDs8B7nQeYw@mail.gmail.com>
From: Jiaqing Zhao <jiaqing.zhao@linux.intel.com>
In-Reply-To: 
 <CAMKF1sobD1EPHK3gQ+OcmC6c9F91U-KZkW5xdNgrDs8B7nQeYw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 23 May 2022 02:37:41 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165995

On 2022-05-23 10:33, Khem Raj wrote:
> On Sun, May 22, 2022 at 7:20 PM Jiaqing Zhao
> <jiaqing.zhao@linux.intel.com> wrote:
>>
>> This patchset updates the existing systemd patches, these patches are
>> upstreamed, no longer needed or fix needed. Update these patches before
>> bumping to v251.
>>
>> Jiaqing Zhao (4):
>>   systemd: Drop 0001-test-parse-argument-Include-signal.h.patch
>>   systemd: Remove __compare_fn_t type in musl-specific patch
>>   systemd: Drop 0002-don-t-use-glibc-specific-qsort_r.patch
>>   systemd: Correct path returned in sd_path_lookup()
>>
>> v2: Update description fot the sd_path_lookup patch.
>>
> 
> Thanks, have you tested these patches with musl ?

Of course yes, I built core-image-full-cmdline with both glibc and musl,
both passes build and boots successfully. If there are more tests need to
perform, please tell me how to.

>>  ...sysctl.d-binfmt.d-modules-load.d-to-.patch |  73 ++++++++
>>  ...se-ROOTPREFIX-without-suffixed-slash.patch |  42 -----
>>  ...test-parse-argument-Include-signal.h.patch |  27 ---
>>  ...002-don-t-use-glibc-specific-qsort_r.patch | 163 ------------------
>>  ...-missing_type.h-add-comparison_fn_t.patch} |  44 ++---
>>  ...missing.h-check-for-missing-strndupa.patch |  14 +-
>>  meta/recipes-core/systemd/systemd_250.5.bb    |   6 +-
>>  7 files changed, 96 insertions(+), 273 deletions(-)
>>  create mode 100644 meta/recipes-core/systemd/systemd/0001-Move-sysusers.d-sysctl.d-binfmt.d-modules-load.d-to-.patch
>>  delete mode 100644 meta/recipes-core/systemd/systemd/0001-systemd.pc.in-use-ROOTPREFIX-without-suffixed-slash.patch
>>  delete mode 100644 meta/recipes-core/systemd/systemd/0001-test-parse-argument-Include-signal.h.patch
>>  delete mode 100644 meta/recipes-core/systemd/systemd/0002-don-t-use-glibc-specific-qsort_r.patch
>>  rename meta/recipes-core/systemd/systemd/{0003-missing_type.h-add-__compare_fn_t-and-comparison_fn_.patch => 0003-missing_type.h-add-comparison_fn_t.patch} (61%)
>>
>> --
>> 2.34.1
>>
>>
>> -=-=-=-=-=-=-=-=-=-=-=-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#165988): https://lists.openembedded.org/g/openembedded-core/message/165988
>> Mute This Topic: https://lists.openembedded.org/mt/91280598/1997914
>> Group Owner: openembedded-core+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [raj.khem@gmail.com]
>> -=-=-=-=-=-=-=-=-=-=-=-
>>

