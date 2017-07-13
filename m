Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 8FE9C780C3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Jul 2017 02:55:14 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v6D2tF9v028664
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 12 Jul 2017 19:55:15 -0700 (PDT)
Received: from [128.224.162.246] (128.224.162.246) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.294.0;
	Wed, 12 Jul 2017 19:55:14 -0700
To: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
References: <cover.1499854502.git.liezhi.yang@windriver.com>
	<47a058d68bb13f343f6399d4ec1de74897d2eb50.1499854502.git.liezhi.yang@windriver.com>
	<1499873929.5349.44.camel@linux.intel.com>
From: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <7bd81488-b366-5358-cbe0-3bafc07129a0@windriver.com>
Date: Thu, 13 Jul 2017 10:55:09 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <1499873929.5349.44.camel@linux.intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 4/6] git: 2.11.1 -> 2.13.2
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
X-List-Received-Date: Thu, 13 Jul 2017 02:55:15 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit



On 07/12/2017 11:38 PM, Leonardo Sandoval wrote:
> for some reason git did not detect (as other patches in this series)
> the renaming (delete/create), make it easier to review.
>

By default, git format-patch handles similarity > 50% as rename,
the git_2.13.2.bb changes a lot, so no renames.

// Robert

>
>
> On Wed, 2017-07-12 at 03:15 -0700, Robert Yang wrote:
>> * Remove git-relink from PERLTOOLS:
>>   git-2.13.2/Documentation/RelNotes/2.12.0.txt:
>>   * An ancient script "git relink" has been removed.
>>
>> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
>> ---
>>  meta/recipes-devtools/git/git.inc       |  1 -
>>  meta/recipes-devtools/git/git_2.11.1.bb | 11 -----------
>>  meta/recipes-devtools/git/git_2.13.2.bb | 11 +++++++++++
>>  3 files changed, 11 insertions(+), 12 deletions(-)
>>  delete mode 100644 meta/recipes-devtools/git/git_2.11.1.bb
>>  create mode 100644 meta/recipes-devtools/git/git_2.13.2.bb
>>
>> diff --git a/meta/recipes-devtools/git/git.inc b/meta/recipes-devtools/git/git.inc
>> index 9b0d328..4390b8d 100644
>> --- a/meta/recipes-devtools/git/git.inc
>> +++ b/meta/recipes-devtools/git/git.inc
>> @@ -86,7 +86,6 @@ PERLTOOLS = " \
>>      ${libexecdir}/git-core/git-cvsserver \
>>      ${bindir}/git-cvsserver \
>>      ${libexecdir}/git-core/git-difftool \
>> -    ${libexecdir}/git-core/git-relink \
>>      ${libexecdir}/git-core/git-send-email \
>>      ${libexecdir}/git-core/git-svn \
>>      ${libexecdir}/git-core/git-instaweb \
>> diff --git a/meta/recipes-devtools/git/git_2.11.1.bb b/meta/recipes-devtools/git/git_2.11.1.bb
>> deleted file mode 100644
>> index f2f072c..0000000
>> --- a/meta/recipes-devtools/git/git_2.11.1.bb
>> +++ /dev/null
>> @@ -1,11 +0,0 @@
>> -require git.inc
>> -
>> -EXTRA_OECONF += "ac_cv_snprintf_returns_bogus=no \
>> -                 ac_cv_fread_reads_directories=${ac_cv_fread_reads_directories=yes} \
>> -                 "
>> -EXTRA_OEMAKE += "NO_GETTEXT=1"
>> -
>> -SRC_URI[tarball.md5sum] = "6a7a73db076bb0514b602720669d685c"
>> -SRC_URI[tarball.sha256sum] = "a1cdd7c820f92c44abb5003b36dc8cb7201ba38e8744802399f59c97285ca043"
>> -SRC_URI[manpages.md5sum] = "e4268a6b514ccdb624b6450ff55881a3"
>> -SRC_URI[manpages.sha256sum] = "ee567e7b0f95333816793714bb31c54e288cf8041f77a0092b85e62c9c2974f9"
>> diff --git a/meta/recipes-devtools/git/git_2.13.2.bb b/meta/recipes-devtools/git/git_2.13.2.bb
>> new file mode 100644
>> index 0000000..e7cae40
>> --- /dev/null
>> +++ b/meta/recipes-devtools/git/git_2.13.2.bb
>> @@ -0,0 +1,11 @@
>> +require git.inc
>> +
>> +EXTRA_OECONF += "ac_cv_snprintf_returns_bogus=no \
>> +                 ac_cv_fread_reads_directories=${ac_cv_fread_reads_directories=yes} \
>> +                 "
>> +EXTRA_OEMAKE += "NO_GETTEXT=1"
>> +
>> +SRC_URI[tarball.md5sum] = "894583cddfb0ec3b0156484966f9db9c"
>> +SRC_URI[tarball.sha256sum] = "e19d450648d6d100eb93abaa5d06ffbc778394fb502354b7026d73e9bcbc3160"
>> +SRC_URI[manpages.md5sum] = "97384d23f2ee88d5ce51ffc75096bd3e"
>> +SRC_URI[manpages.sha256sum] = "1c2bd0a2340b2ef118b7b167a8fec6cc05eb18cad9043e6e7a95fd8a70bb8c4c"
>> --
>> 2.10.2
>>
>
>
>

