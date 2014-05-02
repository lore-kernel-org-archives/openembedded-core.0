Return-Path: <valentin.popa@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 3C59760048
	for <openembedded-core@lists.openembedded.org>;
	Fri,  2 May 2014 11:19:08 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 02 May 2014 04:14:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,972,1389772800"; d="scan'208";a="504843158"
Received: from vpopa-desktop.rb.intel.com (HELO [10.237.105.76])
	([10.237.105.76])
	by orsmga001.jf.intel.com with ESMTP; 02 May 2014 04:19:02 -0700
Message-ID: <53637F1D.9090500@intel.com>
Date: Fri, 02 May 2014 14:18:53 +0300
From: Valentin Popa <valentin.popa@intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.4.0
MIME-Version: 1.0
To: Paul Eggleton <paul.eggleton@linux.intel.com>
References: <cover.1398871949.git.valentin.popa@intel.com>
	<cff8f1a8914290689c411c19e78f7118036eda9c.1398871949.git.valentin.popa@intel.com>
	<1823217.vjqjHS5tvm@peggleto-mobl5.ger.corp.intel.com>
In-Reply-To: <1823217.vjqjHS5tvm@peggleto-mobl5.ger.corp.intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/3] nettle: add nettle to poky
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
X-List-Received-Date: Fri, 02 May 2014 11:19:09 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 05/01/2014 02:34 PM, Paul Eggleton wrote:
> Hi Valentin,
>
> On Wednesday 30 April 2014 18:39:31 Valentin Popa wrote:
>> Newer versions of gnutls depends on nettle.
>>
>> Signed-off-by: Valentin Popa <valentin.popa@intel.com>
>> ---
>>   meta/recipes-support/nettle/nettle_2.7.1.bb | 22 ++++++++++++++++++++++
>>   1 file changed, 22 insertions(+)
>>   create mode 100644 meta/recipes-support/nettle/nettle_2.7.1.bb
>>
>> diff --git a/meta/recipes-support/nettle/nettle_2.7.1.bb
>> b/meta/recipes-support/nettle/nettle_2.7.1.bb new file mode 100644
>> index 0000000..eb7c9de
>> --- /dev/null
>> +++ b/meta/recipes-support/nettle/nettle_2.7.1.bb
>> @@ -0,0 +1,22 @@
>> +DESCRIPTION = "A low level cryptographic library"
> Since this value is short, could you please set it as SUMMARY instead?
>
>> +HOMEPAGE = "http://www.lysator.liu.se/~nisse/nettle/"
>> +SECTION = "libs"
>> +LICENSE = "GPLv2+"
> Is this license value correct? From the documentation:
>
> "Nettle is distributed under the GNU Lesser General Public License (LGPL), see
> the file COPYING.LIB for details"

I'll add both GPLv2 AND LGPLv2.1 (GPL contamination) .

>
> It looks like it might be even more complicated than that, since there is also
> a GPLv2 copying file in the 2.7.1 source.
>
>> +LIC_FILES_CHKSUM =
>> "file://COPYING.LIB;md5=2d5025d4aa3495befef8f17206a5b0a1"
> Given the above we'd probably want to checksum more than just this file.
>
> Cheers,
> Paul
>


