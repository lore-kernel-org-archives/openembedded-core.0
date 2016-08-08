Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 7170877142
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 Aug 2016 05:48:38 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u785mcEo029548
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 7 Aug 2016 22:48:38 -0700 (PDT)
Received: from [128.224.162.240] (128.224.162.240) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.248.2;
	Sun, 7 Aug 2016 22:48:37 -0700
To: Khem Raj <raj.khem@gmail.com>
References: <cover.1470127858.git.liezhi.yang@windriver.com>
	<7e8b65b32c46371860e3c2a3c7e76bf5279fb4ba.1470127858.git.liezhi.yang@windriver.com>
	<CAMKF1spQ5gP-78DTTK8+jvkJFx6WSF9YQKw8+Jv7xvrRqNYYQQ@mail.gmail.com>
From: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <57A81D33.2010101@windriver.com>
Date: Mon, 8 Aug 2016 13:48:35 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.8.0
MIME-Version: 1.0
In-Reply-To: <CAMKF1spQ5gP-78DTTK8+jvkJFx6WSF9YQKw8+Jv7xvrRqNYYQQ@mail.gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/3] strace: 4.12 -> 4.13
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
X-List-Received-Date: Mon, 08 Aug 2016 05:48:38 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit



On 08/07/2016 10:43 PM, Khem Raj wrote:
> this broke musl/mips64 see
>
> http://errors.yoctoproject.org/Errors/Details/74499/

Sorry, I will look into it later.

// Robert

>
> On Tue, Aug 2, 2016 at 1:51 AM, Robert Yang <liezhi.yang@windriver.com> wrote:
>> Updated Makefile-ptest.patch
>>
>> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
>> ---
>>   meta/recipes-devtools/strace/strace/Makefile-ptest.patch     | 12 ++++--------
>>   .../strace/{strace_4.12.bb => strace_4.13.bb}                |  4 ++--
>>   2 files changed, 6 insertions(+), 10 deletions(-)
>>   rename meta/recipes-devtools/strace/{strace_4.12.bb => strace_4.13.bb} (91%)
>>
>> diff --git a/meta/recipes-devtools/strace/strace/Makefile-ptest.patch b/meta/recipes-devtools/strace/strace/Makefile-ptest.patch
>> index 824031e..2b76e8a 100644
>> --- a/meta/recipes-devtools/strace/strace/Makefile-ptest.patch
>> +++ b/meta/recipes-devtools/strace/strace/Makefile-ptest.patch
>> @@ -10,23 +10,22 @@ Signed-off-by: Chong Lu <Chong.Lu@windriver.com>
>>    2 files changed, 19 insertions(+), 1 deletion(-)
>>
>>   diff --git a/configure.ac b/configure.ac
>> -index 0209bac..b969e25 100644
>>   --- a/configure.ac
>>   +++ b/configure.ac
>>   @@ -36,7 +36,7 @@ AC_INIT([strace],
>>    AC_CONFIG_SRCDIR([strace.c])
>>    AC_CONFIG_AUX_DIR([.])
>>    AC_CONFIG_HEADERS([config.h])
>> --AM_INIT_AUTOMAKE([foreign nostdinc dist-xz no-dist-gzip silent-rules parallel-tests])
>> -+AM_INIT_AUTOMAKE([foreign nostdinc dist-xz no-dist-gzip silent-rules serial-tests])
>> +-AM_INIT_AUTOMAKE([foreign nostdinc dist-xz silent-rules parallel-tests])
>> ++AM_INIT_AUTOMAKE([foreign nostdinc dist-xz silent-rules serial-tests])
>>    AM_MAINTAINER_MODE
>>    AC_CANONICAL_HOST
>>
>>   diff --git a/tests/Makefile.am b/tests/Makefile.am
>> -index 0f23b4b..429f7e9 100644
>> +index 9023029..e1917fa 100644
>>   --- a/tests/Makefile.am
>>   +++ b/tests/Makefile.am
>> -@@ -332,3 +332,21 @@ ksysent.h: $(srcdir)/ksysent.sed
>> +@@ -784,3 +784,21 @@ ksysent.h: $(srcdir)/ksysent.sed
>>
>>    BUILT_SOURCES = ksysent.h
>>    CLEANFILES = ksysent.h $(TESTS:=.tmp)
>> @@ -48,6 +47,3 @@ index 0f23b4b..429f7e9 100644
>>   +              sed -i -e 's/$${srcdir=.}/./g' $(DESTDIR)/$(TESTDIR)/$$file; \
>>   +      done
>>   +      for i in net net-fd scm_rights-fd sigaction; do sed -i -e 's/$$srcdir/./g' $(DESTDIR)/$(TESTDIR)/$$i.test; done
>> ---
>> -1.9.1
>> -
>> diff --git a/meta/recipes-devtools/strace/strace_4.12.bb b/meta/recipes-devtools/strace/strace_4.13.bb
>> similarity index 91%
>> rename from meta/recipes-devtools/strace/strace_4.12.bb
>> rename to meta/recipes-devtools/strace/strace_4.13.bb
>> index 70d7402..1a576b3 100644
>> --- a/meta/recipes-devtools/strace/strace_4.12.bb
>> +++ b/meta/recipes-devtools/strace/strace_4.13.bb
>> @@ -14,8 +14,8 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/strace/strace-${PV}.tar.xz \
>>              file://0001-Fix-build-when-using-non-glibc-libc-implementation-o.patch \
>>              "
>>
>> -SRC_URI[md5sum] = "efb8611fc332e71ec419c53f59faa93e"
>> -SRC_URI[sha256sum] = "51144b78cb9ba22211b95a5aafe0af3694c0d575b25975d80ca9dd4dfd7c1e59"
>> +SRC_URI[md5sum] = "4b78c7febdd24c79d5147824d1a080a3"
>> +SRC_URI[sha256sum] = "d48f732576c91ece36a5843d63f9be054c40ef59f1e4773986042636861625d7"
>>
>>   inherit autotools ptest bluetooth
>>
>> --
>> 2.9.0
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

