Received: from eumx.net ([91.82.101.43] helo=owm.eumx.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ml@communistcode.co.uk>) id 1USQem-0007ko-R3
	for openembedded-core@lists.openembedded.org;
	Wed, 17 Apr 2013 13:36:10 +0200
Message-ID: <516E850D.9030703@communistcode.co.uk>
Date: Wed, 17 Apr 2013 12:18:37 +0100
From: Jack Mitchell <ml@communistcode.co.uk>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130403 Thunderbird/17.0.5
MIME-Version: 1.0
To: Martin Jansa <martin.jansa@gmail.com>
References: <1366195597-13363-1-git-send-email-ml@communistcode.co.uk>
	<1366195597-13363-2-git-send-email-ml@communistcode.co.uk>
	<20130417111042.GF26007@jama>
In-Reply-To: <20130417111042.GF26007@jama>
Cc: Jack Mitchell <jack.mitchell@dbbroadcast.co.uk>,
	openembedded-core@lists.openembedded.org
Subject: Re: [meta-oe][PATCHv2 2/2] net-snmp: Update to 5.7.2
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: ml@communistcode.co.uk
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 17 Apr 2013 11:36:14 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 17/04/13 12:10, Martin Jansa wrote:
> On Wed, Apr 17, 2013 at 11:46:37AM +0100, Jack Mitchell wrote:
>> From: Jack Mitchell <jack.mitchell@dbbroadcast.co.uk>
>>
>> - Removed some un-needed patches
>>
>> diff --git a/meta-oe/recipes-extended/net-snmp/net-snmp_5.7.1.bb b/meta-oe/recipes-extended/net-snmp/net-snmp_5.7.2.bb
>> similarity index 76%
>> rename from meta-oe/recipes-extended/net-snmp/net-snmp_5.7.1.bb
>> rename to meta-oe/recipes-extended/net-snmp/net-snmp_5.7.2.bb
>> index 19aa163..048ecb8 100644
>> --- a/meta-oe/recipes-extended/net-snmp/net-snmp_5.7.1.bb
>> +++ b/meta-oe/recipes-extended/net-snmp/net-snmp_5.7.2.bb
>> @@ -1,11 +1,8 @@
>>   require net-snmp.inc
>>   
>> -PR = "${INC_PR}.4"
> This can surprise people editing net-snmp.inc and bumping INC_PR there
> without any effect on net-snmp_5.7.2.bb.
>
> I understand why you wanted to remove it, but I would prefer to keep
> PR = "${INC_PR}.0" there as long as we have .inc with INC_PR.
>
> I wouldn't mind merging .inc in .bb as people probably don't have own
> versions of net-snmp in their layers (just guessing here).
>
> And it was send to wrong ML this time..

V3 incoming.

>
>>   LIC_FILES_CHKSUM = "file://README;beginline=3;endline=8;md5=7f7f00ba639ac8e8deb5a622ea24634e"
>>   
>>   SRC_URI = "${SOURCEFORGE_MIRROR}/net-snmp/net-snmp-${PV}.tar.gz \
>> -        file://sync-with-5.7-branch.patch \
>> -        file://libnl-3-support.patch \
>>           file://init \
>>           file://snmpd.conf \
>>           file://snmptrapd.conf \
>> @@ -30,5 +27,5 @@ do_configure_prepend() {
>>   PARALLEL_MAKE = ""
>>   CCACHE = ""
>>   
>> -SRC_URI[md5sum] = "c95d08fd5d93df0c11a2e1bdf0e01e0b"
>> -SRC_URI[sha256sum] = "7c71c9650c65b715356547e20ca2dbe6313944278af8cc19c32a5337f46b181f"
>> +SRC_URI[md5sum] = "5bddd02e2f82b62daa79f82717737a14"
>> +SRC_URI[sha256sum] = "09ed31b4cc1f3c0411ef9a16eff79ef3b30d89c32ca46d5a01a41826c4ceb816"
>> -- 
>> 1.8.2
>>
>>
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


-- 

   Jack Mitchell (jack@embed.me.uk)
   Embedded Systems Engineer
   http://www.embed.me.uk

--



