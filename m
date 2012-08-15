Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1T1kqU-0000bK-2c
	for openembedded-core@lists.openembedded.org;
	Wed, 15 Aug 2012 23:09:42 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 15 Aug 2012 13:57:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.77,774,1336374000"; d="scan'208";a="208963818"
Received: from unknown (HELO [10.255.12.253]) ([10.255.12.253])
	by fmsmga002.fm.intel.com with ESMTP; 15 Aug 2012 13:57:42 -0700
Message-ID: <502C0D40.5000809@linux.intel.com>
Date: Wed, 15 Aug 2012 13:57:36 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:14.0) Gecko/20120717 Thunderbird/14.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <76ac3ef04e78b07441df7d2c93c4a002deac74d5.1344946189.git.sgw@linux.intel.com>
	<5623cc2a909aa332092db9ca0c79ef36c2987554.1344946189.git.sgw@linux.intel.com>
	<1344970890.25109.2.camel@ted>
In-Reply-To: <1344970890.25109.2.camel@ted>
Subject: Re: [CONSOLIDATED REQUEST 05/64] console-tools: cleanup update-alternatives deprecated code
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
X-List-Received-Date: Wed, 15 Aug 2012 21:09:42 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 08/14/2012 12:01 PM, Richard Purdie wrote:
> On Tue, 2012-08-14 at 15:12 +0300, Saul Wold wrote:
>> Signed-off-by: Saul Wold <sgw@linux.intel.com>
>> ---
>>   .../console-tools/console-tools_0.3.2.bb           |    8 ++++++--
>>   1 files changed, 6 insertions(+), 2 deletions(-)
>>
>> diff --git a/meta/recipes-core/console-tools/console-tools_0.3.2.bb b/meta/recipes-core/console-tools/console-tools_0.3.2.bb
>> index 6027d4a..1446368 100644
>> --- a/meta/recipes-core/console-tools/console-tools_0.3.2.bb
>> +++ b/meta/recipes-core/console-tools/console-tools_0.3.2.bb
>> @@ -3,7 +3,7 @@ LICENSE = "GPLv2"
>>   LIC_FILES_CHKSUM = "file://COPYING.kbd;md5=9b2d91511d3d80d4d20ac6e6b0137fe9"
>>   SUMMARY = "Allows you to set-up and manipulate the Linux console."
>>   DESCRIPTION = "Provides tools that enable the set-up and manipulation of the linux console and console-font files."
>> -PR = "r5"
>> +PR = "r6"
>>
>>   SRC_URI = "${SOURCEFORGE_MIRROR}/lct/console-tools-${PV}.tar.gz \
>>              file://codepage.patch \
>> @@ -35,6 +35,10 @@ inherit autotools gettext update-alternatives
>>   ALTERNATIVE_PRIORITY = "100"
>>
>>   bindir_progs = "chvt deallocvt fgconsole openvt"
>> -ALTERNATIVE_LINKS = "${bindir}/${@' ${bindir}/'.join((d.getVar('bindir_progs', True)).split())}"
>> +ALTERNATIVE_${PN} = "${bindir_progs}"
>> +#python __anonymous() {
>> +#	for prog in d.getVar('bindir_progs', True).split():
>> +#		d.setVarFlag('ALTERNATIVE_LINK_NAME', prog, '%s/%s' % (d.getVar('base_bindir', True), prog))
>> +#}
>
Oops, that should not be there as I solved with the line above. Thanks 
for taking care of that.

Sau!

> Any particular reason we're adding in this anonymous python function
> which is commented out?
>
> Cheers,
>
> Richard
>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>


