Return-Path: <alejandro.hernandez@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id CFB6173D6C
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Apr 2015 21:24:39 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga103.jf.intel.com with ESMTP; 13 Apr 2015 14:24:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.11,572,1422950400"; d="scan'208";a="708367208"
Received: from aehernan-devstation.zpn.intel.com (HELO [10.219.4.80])
	([10.219.4.80])
	by fmsmga002.fm.intel.com with ESMTP; 13 Apr 2015 14:24:39 -0700
Message-ID: <552C340E.4030804@linux.intel.com>
Date: Mon, 13 Apr 2015 16:24:30 -0500
From: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.5.0
MIME-Version: 1.0
To: Martin Jansa <martin.jansa@gmail.com>
References: <cover.1425076707.git.alejandro.hernandez@linux.intel.com>
	<93d70e328d697eb20a6bcd5b86ec96c89e1019cc.1425076707.git.alejandro.hernandez@linux.intel.com>
	<20150413184018.GL2330@jama>
In-Reply-To: <20150413184018.GL2330@jama>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] python3: Upgrade from 3.3.3 to 3.4.2
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
X-List-Received-Date: Mon, 13 Apr 2015 21:24:39 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit



On 13/04/15 13:40, Martin Jansa wrote:
> On Fri, Feb 27, 2015 at 06:30:52PM -0600, Alejandro Hernandez wrote:
>> Modifies:
>> python3-native_3.3.3.bb -> python3-native_3.4.2.bb: Updates checksums, version, patches
>> and SRC_URIs to use xz format, LICENSE did not change, dates were updated, adds fix for
>> ctypes/libffi needed for pip <- required since Python 3.4 (see PEP #453).
>> python3_3.3.3.bb -> python3_3.4.2.bb: Updates checksums, version, patches and SRC_URIs
>> to use xz format, adds fix for ctypes/libffi, fixes oe_multilib_header() call,
>> adds python3-core as RDEPENDS to python3-misc to avoid QA issue.
>> generate-manifest-3.4.py - > generate-manifest-3.4.py: fixes reprlib,
>> adds _sitebuiltins and _collections_abc <- formerly part of collections, separated since 3.4
>> python-3.3-manifest.inc -> python-3.4-manifest.inc
>>
>> Rebases:
>> 12-distutils-prefix-is-inside-staging-area.patch
>> python-3.3-multilib.patch
>> 04-default-is-optimized.patch
>> avoid-ncursesw-include-path.patch
>>
>> Deletes (fixed upstream):
>> fix-ast.h-dependency.patch
>> python3-fix-build-error-with-Readline-6.3.patch
>> 06-ctypes-libffi-fix-configure.patch
>> remove_sqlite_rpath.patch
> There is a lot of textrel QA warnings in 3.3.3 (you can see them e.g. in
> http://lists.openembedded.org/pipermail/openembedded-core/2015-March/102948.html
> ), is this upgrade fixing them?
>
>> [YOCTO #6857]
>>
>> Signed-off-by: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
>>
I don't remember there being any warnings when I first did the upgrade, 
but I just checked and now they are being shown, something must've 
changed , anyway they are still there for 3.4, we can still upgrade and 
I'll dig into this later


