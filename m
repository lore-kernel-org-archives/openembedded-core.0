Return-Path: <sgw@linux.intel.com>
Received: from mga03.intel.com (unknown [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id 2BD2F65EB4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 May 2014 03:02:31 +0000 (UTC)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 18 May 2014 20:02:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.98,864,1392192000"; d="scan'208";a="433759855"
Received: from unknown (HELO [10.255.12.101]) ([10.255.12.101])
	by azsmga001.ch.intel.com with ESMTP; 18 May 2014 20:01:50 -0700
Message-ID: <5379741E.5010207@linux.intel.com>
Date: Sun, 18 May 2014 20:01:50 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.4.0
MIME-Version: 1.0
To: Khem Raj <raj.khem@gmail.com>, Zongchun YU <b40527@freescale.com>
References: <1400226305-5166-1-git-send-email-b40527@freescale.com>
	<CAMKF1spxe7wAPvbGHB94n3bvHjNO5K+jnnrXHMzpDaYMtfqntg@mail.gmail.com>
In-Reply-To: <CAMKF1spxe7wAPvbGHB94n3bvHjNO5K+jnnrXHMzpDaYMtfqntg@mail.gmail.com>
Cc: Zongchun Yu <Zongchun.Yu@freescale.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] doxygen: add recipe
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
X-List-Received-Date: Mon, 19 May 2014 03:02:38 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 05/16/2014 01:40 AM, Khem Raj wrote:
> On Fri, May 16, 2014 at 12:45 AM,  <b40527@freescale.com> wrote:
>> From: Zongchun Yu <Zongchun.Yu@freescale.com>
>>
>> Signed-off-by: Zongchun Yu <Zongchun.Yu@freescale.com>
>> ---
>>   .../doxygen/doxygen-native_1.8.6.bb                |   23 ++++++++++++++++++++
>
> Commit message should say that its adding recipe for doxygen-native
> and not oxygen

Also why are we adding it, what packages needs doxygen ?

Sau!

>
>>   1 files changed, 23 insertions(+), 0 deletions(-)
>>   create mode 100644 meta/recipes-devtools/doxygen/doxygen-native_1.8.6.bb
>>
>> diff --git a/meta/recipes-devtools/doxygen/doxygen-native_1.8.6.bb b/meta/recipes-devtools/doxygen/doxygen-native_1.8.6.bb
>> new file mode 100644
>> index 0000000..eac4c9b
>> --- /dev/null
>> +++ b/meta/recipes-devtools/doxygen/doxygen-native_1.8.6.bb
>> @@ -0,0 +1,23 @@
>> +DESCRIPTION = "Utilities for generating documentation from source code"
>> +HOMEPAGE = "http://www.stack.nl/~dimitri/doxygen/index.html"
>> +SECTION = "console/utils"
>> +LICENSE = "GPLv2"
>> +LIC_FILES_CHKSUM = "file://LICENSE;md5=b380c86cea229fa42b9e543fc491f5eb"
>> +DEPENDS = "flex-native bison-native"
>> +
>> +SRC_URI = "http://ftp.stack.nl/pub/users/dimitri/doxygen-${PV}.src.tar.gz"
>> +
>> +SRC_URI[md5sum] = "9385dc52f0627875f8fa758e754ec674"
>> +SRC_URI[sha256sum] = "6a718625f0c0c1eb3dee78ec1f83409b49e790f4c6c47fd44cd51cb92695535f"
>> +
>> +inherit native
>> +
>> +EXTRA_OECONF = "--prefix ${prefix}"
>> +
>> +do_configure () {
>> +    ./configure ${EXTRA_OECONF}
>> +}
>> +
>> +do_install() {
>> +    oe_runmake install DESTDIR=${D} MAN1DIR=share/man/man1
>> +}
>> --
>> 1.7.0.4
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core

