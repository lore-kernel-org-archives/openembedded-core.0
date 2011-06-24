Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QaFM8-0006p1-Uw
	for openembedded-core@lists.openembedded.org;
	Sat, 25 Jun 2011 01:00:09 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 24 Jun 2011 15:56:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,422,1304319600"; d="scan'208";a="22615874"
Received: from unknown (HELO [10.255.13.191]) ([10.255.13.191])
	by fmsmga001.fm.intel.com with ESMTP; 24 Jun 2011 15:56:31 -0700
Message-ID: <4E05161E.2030702@linux.intel.com>
Date: Fri, 24 Jun 2011 15:56:30 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.17) Gecko/20110428 Fedora/3.1.10-1.fc13 Thunderbird/3.1.10
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1308030161.git.lei.mei@intel.com>	<c3921b032b4db674706a2e17e6100d97c30ba994.1308030161.git.lei.mei@intel.com>	<3520C10B-8657-4900-8C2E-6A4EE6AA7FC3@dominion.thruhere.net>
	<749B9D3DBF0F054390025D9EAFF47F224C6526EA@shsmsx501.ccr.corp.intel.com>
In-Reply-To: <749B9D3DBF0F054390025D9EAFF47F224C6526EA@shsmsx501.ccr.corp.intel.com>
Subject: Re: [PATCH 1/1] gupnp: upgrade from 0.16.0 to 0.16.1
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 24 Jun 2011 23:00:09 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 06/14/2011 01:04 AM, Mei, Lei wrote:
>
>
>> -----Original Message-----
>> From: openembedded-core-bounces@lists.openembedded.org
>> [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf Of
>> Koen Kooi
>> Sent: Tuesday, June 14, 2011 3:46 PM
>> To: Patches and discussions about the oe-core layer
>> Subject: Re: [OE-core] [PATCH 1/1] gupnp: upgrade from 0.16.0 to 0.16.1
>>
>>
>> Op 14 jun 2011, om 07:59 heeft Mei Lei het volgende geschreven:
>>
>>> Signed-off-by: Mei Lei<lei.mei@intel.com>
>>> ---
>>> .../gupnp/{gupnp_0.16.0.bb =>  gupnp_0.16.1.bb}     |    7 +++++--
>>> 1 files changed, 5 insertions(+), 2 deletions(-)
>>> rename meta/recipes-connectivity/gupnp/{gupnp_0.16.0.bb =>
>> gupnp_0.16.1.bb} (79%)
>>>
>>> diff --git a/meta/recipes-connectivity/gupnp/gupnp_0.16.0.bb
>> b/meta/recipes-connectivity/gupnp/gupnp_0.16.1.bb
>>> similarity index 79%
>>> rename from meta/recipes-connectivity/gupnp/gupnp_0.16.0.bb
>>> rename to meta/recipes-connectivity/gupnp/gupnp_0.16.1.bb
>>> index 07b6b90..5b23134 100644
>>> --- a/meta/recipes-connectivity/gupnp/gupnp_0.16.0.bb
>>> +++ b/meta/recipes-connectivity/gupnp/gupnp_0.16.1.bb
>>> @@ -7,8 +7,8 @@ DEPENDS = "e2fsprogs gssdp libsoup-2.4 libxml2
>> gnome-icon-theme"
>>>
>>> SRC_URI = "http://gupnp.org/sites/all/files/sources/${BPN}-${PV}.tar.gz"
>>>
>>> -SRC_URI[md5sum] = "61b240c1a9fdf8ca82c5c3adde0d6757"
>>> -SRC_URI[sha256sum] =
>> "1b77201866b7632fb68bc2a3bdea22ef8ead34ba850b3ee367797432cfc0f04a"
>>> +SRC_URI[md5sum] = "021bb237741532af4bca50157ff326e4"
>>> +SRC_URI[sha256sum] =
>> "f01a1f4fd36ce161a3df29fa83e1a0a2fb40d3c9f30f6b403e7791688ad24cfe"
>>>
>>> PR = "r0"
>>>
>>> @@ -19,6 +19,9 @@ inherit autotools pkgconfig
>>> FILES_${PN} = "${libdir}/*.so.*"
>>> FILES_${PN}-dev += "${bindir}/gupnp-binding-tool"
>>>
>>> +do_configure_prepend() {
>>> +	sed -i -e
>> 's:GOBJECT_INTROSPECTION_CHECK(\[0.6.4\]):AM_CONDITIONAL([HAVE_INTR
>> OSPECTION], [false]):g' ${S}/configure.ac
>>> +}
>>> SYSROOT_PREPROCESS_FUNCS += "gupnp_sysroot_preprocess"
>>
>> Does adding 'gobject-introspection' to DEPENDS or --disable-introspection to
>> EXTRA_OECONF fix the build issue?
>
> "--disable-introspection to EXTRA_OECONF" didn't fix the configure issue.
> Adding depends is my first option, but that will trigger a do_compile failure of 'gobject-introspection'.
> So decide to upgrade it to the latest version in this way.
>
Can you look into correctly fixing the gobject-introspection instead of 
leaving it broken?  That's another option to fix this problem.

Sau!


> Thanks
> Lei
>
>>
>> regards,
>>
>> Koen
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>


