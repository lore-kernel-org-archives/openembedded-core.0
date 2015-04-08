Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 12F6F605F1
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Apr 2015 01:55:59 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.9/8.14.9) with ESMTP id t381txl1015648
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 7 Apr 2015 18:55:59 -0700 (PDT)
Received: from [128.224.162.174] (128.224.162.174) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.224.2;
	Tue, 7 Apr 2015 18:55:58 -0700
Message-ID: <55248AAD.7010503@windriver.com>
Date: Wed, 8 Apr 2015 09:55:57 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:31.0) Gecko/20100101 Thunderbird/31.6.0
MIME-Version: 1.0
To: Khem Raj <raj.khem@gmail.com>
References: <cover.1428410929.git.liezhi.yang@windriver.com>
	<1849e3c3ca006bb7e3cb406aa5d040eeec226d80.1428410929.git.liezhi.yang@windriver.com>
	<27D7EBDF-FA94-4B14-B185-69C3BD080239@gmail.com>
In-Reply-To: <27D7EBDF-FA94-4B14-B185-69C3BD080239@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [RFC PATCH 2/2] bzip2: remove bzip2-dev from PACKAGES
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
X-List-Received-Date: Wed, 08 Apr 2015 01:56:01 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit



On 04/08/2015 09:34 AM, Khem Raj wrote:
>
>> On Apr 7, 2015, at 5:58 AM, Robert Yang <liezhi.yang@windriver.com> wrote:
>>
>> There should be only one dev package which is libbz2-dev, so remove
>> bzip2-dev.
>>
>> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
>> ---
>> meta/recipes-extended/bzip2/bzip2_1.0.6.bb |    3 ++-
>> 1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/meta/recipes-extended/bzip2/bzip2_1.0.6.bb b/meta/recipes-extended/bzip2/bzip2_1.0.6.bb
>> index ed12277..d1d1c8d 100644
>> --- a/meta/recipes-extended/bzip2/bzip2_1.0.6.bb
>> +++ b/meta/recipes-extended/bzip2/bzip2_1.0.6.bb
>> @@ -17,6 +17,7 @@ SRC_URI[md5sum] = "00b516f4704d4a7cb50a1d97e6e8e15b"
>> SRC_URI[sha256sum] = "a2848f34fcd5d6cf47def00461fcb528a0484d8edef8208d6d2e2909dc61d9cd"
>>
>> PACKAGES =+ "libbz2 libbz2-dev libbz2-staticdev"
>> +PACKAGES_remove = "bzip2-dev bzip2-staticdev”
>
> why remove ${PN}-dev ? others should be removed IMO


I think that it had added libbz2-dev was because debian/ubuntu uses
libbz2-dev, the similar to xz.

// Robert

>
>>
>> CFLAGS_append = " -fPIC -fpic -Winline -fno-strength-reduce -D_FILE_OFFSET_BITS=64"
>>
>> @@ -35,7 +36,7 @@ do_install_ptest () {
>>
>> FILES_libbz2 = "${libdir}/lib*${SOLIBS}"
>>
>> -FILES_libbz2-dev = "${includedir} ${libdir}/lib*${SOLIBSDEV}"
>> +FILES_libbz2-dev = "${includedir} ${libdir}/lib*${SOLIBSDEV} ${libdir}/lib*.la"
>> SECTION_libbz2-dev = "devel"
>> RDEPENDS_libbz2-dev = "libbz2 (= ${EXTENDPKGV})"
>>
>> --
>> 1.7.9.5
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
>
>

