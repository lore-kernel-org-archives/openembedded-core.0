X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Message-ID: <2b054824-457e-74e2-ac5b-ddb4d2124d33@linux.intel.com>
Date: Mon, 23 May 2022 10:21:44 +0800
MIME-Version: 1.0
Subject: Re: [oe-core] [PATCH 0/4] systemd: Update patches
References: <20220522173145.1015305-1-jiaqing.zhao@linux.intel.com>
 <CAMKF1sqhrZsABy8fkWRopzMSKipc7uV-guRazjShBnLwN9iwfw@mail.gmail.com>
From: "Jiaqing Zhao" <jiaqing.zhao@linux.intel.com>
In-Reply-To: <CAMKF1sqhrZsABy8fkWRopzMSKipc7uV-guRazjShBnLwN9iwfw@mail.gmail.com>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-id: <openembedded-core.lists.openembedded.org>
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>

Hi, Raj

The patchset I sent is based on 2b9bb4c07d where your patches has already been merged.

I also checked the git log

$ git log --oneline | grep systemd
7d5c480d2b systemd: Fix path returned in sd_path_lookup()
3fd081967d systemd: Drop 0002-don-t-use-glibc-specific-qsort_r.patch
c6d3f721a4 systemd: Remove __compare_fn_t type in musl-specific patch
66361f908e systemd: Drop 0001-test-parse-argument-Include-signal.h.patch
↑ My patches
↓ Your patches
2cdfc505ce systemd: Update patch status
e57707e820 systemd: Drop 0016-Hide-__start_BUS_ERROR_MAP-and-__stop_BUS_ERROR_MAP.patch
433d51c384 systemd: Document future actions needed for set of musl patches
216fe2b8e5 systemd: Drop redundant musl patches

In your commit 216fe2b8e5, you removed 0017-missing_type.h-add-__compar_d_fn_t-definition.patch
for __compar_d_fn_t, but there is another one (possibly duplicate) named
0003-missing_type.h-add-__compare_fn_t-and-comparison_fn_.patch

Though I send out patchset v2, it only improves the description.

Jiaqing

On 2022-05-23 08:17, Khem Raj wrote:
> I have sent patches to remove the obsolete patches few days ago some
> of which are listed here. Please rebase your patch on top of master
> and resend rebased patchset
> 
> On Sun, May 22, 2022 at 10:32 AM Jiaqing Zhao
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
>>   systemd: Fix path returned in sd_path_lookup()
>>
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
>>
>>
>>
>>
>> 
>>
