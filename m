Return-Path: <sgw@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [143.182.124.37])
	by mail.openembedded.org (Postfix) with ESMTP id 93EC960592
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Jul 2013 18:08:27 +0000 (UTC)
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 10 Jul 2013 11:08:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,1037,1363158000"; d="scan'208";a="266539641"
Received: from unknown (HELO [10.255.13.73]) ([10.255.13.73])
	by AZSMGA002.ch.intel.com with ESMTP; 10 Jul 2013 11:08:17 -0700
Message-ID: <51DDA311.10908@linux.intel.com>
Date: Wed, 10 Jul 2013 11:08:17 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130514 Thunderbird/17.0.6
MIME-Version: 1.0
To: Martin Jansa <martin.jansa@gmail.com>
References: <cover.1373468672.git.emilia.maria.silvia.ciobanu@intel.com>
	<6c15f39c5d3d9c6d7d8788d1c76758078b446fbd.1373468672.git.emilia.maria.silvia.ciobanu@intel.com>
	<20130710151637.GD3288@jama>
In-Reply-To: <20130710151637.GD3288@jama>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/3] docbook-sgml-dtd-4.1-native.bb: Add real PV inside the recipe
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
X-List-Received-Date: Wed, 10 Jul 2013 18:08:27 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 07/10/2013 08:16 AM, Martin Jansa wrote:
> On Wed, Jul 10, 2013 at 06:07:08PM +0300, Emilia Ciobanu wrote:
>> Signed-off-by: Emilia Ciobanu <emilia.maria.silvia.ciobanu@intel.com>
>> ---
>>   .../docbook-sgml-dtd-4.1-native.bb                 |    1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/meta/recipes-devtools/docbook-sgml-dtd/docbook-sgml-dtd-4.1-native.bb b/meta/recipes-devtools/docbook-sgml-dtd/docbook-sgml-dtd-4.1-native.bb
>> index 88c9396..1f338fd 100644
>> --- a/meta/recipes-devtools/docbook-sgml-dtd/docbook-sgml-dtd-4.1-native.bb
>> +++ b/meta/recipes-devtools/docbook-sgml-dtd/docbook-sgml-dtd-4.1-native.bb
>> @@ -6,6 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE-OASIS;md5=c608985dd5f7f215e669e7639a0b1d2e"
>>   DTD_VERSION = "4.1"
>>
>>   PR = "${INC_PR}.0"
>> +PV = "41"
>
> Why not 4.1?
>
It seems that the older version (3.1 and 4.1) have their tarballs named 
with 31 and 41.

Ema, can you use the regex to handle this correctly?

Sau!



>>
>>   # Note: the upstream sources are not distributed with a license file.
>>   # LICENSE-OASIS is included as a "patch" to workaround this. When
>> --
>> 1.7.9.5
>>
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

