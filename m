Return-Path: <Randy.MacLeod@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 50A0078112
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Aug 2017 02:56:57 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v7V2uw96004117
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 30 Aug 2017 19:56:58 -0700 (PDT)
Received: from [172.25.44.7] (172.25.44.7) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.361.1;
	Wed, 30 Aug 2017 19:56:56 -0700
To: Hongxu Jia <hongxu.jia@windriver.com>, "Burton, Ross"
	<ross.burton@intel.com>
References: <1503990043-5633-1-git-send-email-hongxu.jia@windriver.com>
	<CAJTo0LYjm79455K_W2rcxAOFCDG8XcSbeAQAu-wyBwG1gNdjNQ@mail.gmail.com>
	<58923314-00e9-55d0-09f9-473d7525abab@windriver.com>
From: Randy MacLeod <randy.macleod@windriver.com>
Message-ID: <ad883009-4ef0-8c72-2ad8-87e50aedb3c3@windriver.com>
Date: Wed, 30 Aug 2017 22:56:55 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <58923314-00e9-55d0-09f9-473d7525abab@windriver.com>
X-Originating-IP: [172.25.44.7]
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gnupg: 2.1.23 -> 2.2.0
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
X-List-Received-Date: Thu, 31 Aug 2017 02:56:58 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit

On 2017-08-30 08:58 PM, Hongxu Jia wrote:
> On 2017年08月30日 18:54, Burton, Ross wrote:
>> 2.4 has reached feature freeze, is there anything security related in 
>> this release that we should backport?
>>
> 

Based on:
https://lists.gnupg.org/pipermail/gnupg-announce/2017q3/000413.html
(and not any personal gnupg expertise)

---------------------------------------------------
Noteworthy changes in version 2.2.0
===================================

   This is the new long term stable branch.  This branch will only see
   bug fixes and no new features.

   * gpg: Reverted change done in 2.1.23 so that --no-auto-key-retrieve
     is again the default.
...
---------------------------------------------------

so it seems that it might be worthwhile to allow this upgrade into the
oe-core-2.4 release or to at least check if it causes any regressions
before rejecting it.

../Randy

> Here is the commits since 2.1.23, no urgent fix, we could upgrade it 
> after 2.4.
> 
> 9d80fb8 Release 2.2.0
> 24462fe po: Auto update
> 45d5f58 scd: Convey the correct length for Le
> 13821e1 gpg: Fix memory leak while running --check-trustdb.
> b065a69 gpg: Fix memory leak in sig-check.
> 757302c indent: Change comment style on two functions
> 02a5df6 build: Remove obsolete option from autogen.rc
> 565e486 gpgconf: Swap "auto-key-retrieve" and "no-auto-key-retrieve".
> b917cb6 tests: Do not run trust-pgp-4.scm
> 008ae0b build: Change SWDB tag "gnupg21" to "gnupg22".
> fd0e5b6 po: Update Norwegian translation
> 6158811 agent: Fix string translation for Windows
> e6fa6b0 po: Update Japanese translation
> c23a699 tests: Add tests for the PGP trust model.
> cbe54b2 tests: Move some functions into a common module.
> 0161225 gpgconf: Make WoT settings configurable by gpgconf.
> 6e596b2 gpgscm: Fix -Wimplicit-fallthrough warnings.
> e6f8411 gpg: default to --no-auto-key-retrieve.
> 2d6832a po: Update Russian translation
> 23107ba tests: Improve documentation.
> 977fc5f g10: Write status error on error of --quick-revoke-uid.
> d6b40a9 Post release updates
> e8ffa9a Release 2.1.23
> 
> //Hongxu
> 
>> Ross
>>
>> On 29 August 2017 at 08:00, Hongxu Jia <hongxu.jia@windriver.com 
>> <mailto:hongxu.jia@windriver.com>> wrote:
>>
>>     https://lists.gnupg.org/pipermail/gnupg-announce/2017q3/000413.html <https://lists.gnupg.org/pipermail/gnupg-announce/2017q3/000413.html>
>>
>>     Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com
>>     <mailto:hongxu.jia@windriver.com>>
>>     ---
>>      meta/recipes-support/gnupg/{gnupg_2.1.23.bb
>>     <http://gnupg_2.1.23.bb> => gnupg_2.2.0.bb
>>     <http://gnupg_2.2.0.bb>} | 4 ++--
>>      1 file changed, 2 insertions(+), 2 deletions(-)
>>      rename meta/recipes-support/gnupg/{gnupg_2.1.23.bb
>>     <http://gnupg_2.1.23.bb> => gnupg_2.2.0.bb
>>     <http://gnupg_2.2.0.bb>} (91%)
>>
>>     diff --git a/meta/recipes-support/gnupg/gnupg_2.1.23.bb
>>     <http://gnupg_2.1.23.bb>
>>     b/meta/recipes-support/gnupg/gnupg_2.2.0.bb <http://gnupg_2.2.0.bb>
>>     similarity index 91%
>>     rename from meta/recipes-support/gnupg/gnupg_2.1.23.bb
>>     <http://gnupg_2.1.23.bb>
>>     rename to meta/recipes-support/gnupg/gnupg_2.2.0.bb
>>     <http://gnupg_2.2.0.bb>
>>     index 8cbe5e1..0176ddd 100644
>>     --- a/meta/recipes-support/gnupg/gnupg_2.1.23.bb
>>     <http://gnupg_2.1.23.bb>
>>     +++ b/meta/recipes-support/gnupg/gnupg_2.2.0.bb
>>     <http://gnupg_2.2.0.bb>
>>     @@ -16,8 +16,8 @@ SRC_URI =
>>     "${GNUPG_MIRROR}/${BPN}/${BPN}-${PV}.tar.bz2 \
>>     file://0004-autogen.sh-fix-find-version-for-beta-checking.patch \
>>                "
>>
>>     -SRC_URI[md5sum] = "86c2304ead54b74a422e76c3f1bc7a91"
>>     -SRC_URI[sha256sum] =
>>     "a94476391595e9351f219188767a9d6ea128e83be5ed3226a7890f49aa2d0d77"
>>     +SRC_URI[md5sum] = "789f16949fae2d003d387f49e9da4b74"
>>     +SRC_URI[sha256sum] =
>>     "d4514a0be0f7a1ff263193330019eb4b53c82f0f5e230af3c14df371271a45e6"
>>
>>      EXTRA_OECONF = "--disable-ldap \
>>                     --disable-ccid-driver \
>>     --
>>     2.8.1
>>
>>
> 
> 
> 


-- 
# Randy MacLeod.  WR Linux
# Wind River an Intel Company

