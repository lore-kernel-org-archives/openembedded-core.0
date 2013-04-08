Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1UPGvY-0004ri-4i
	for openembedded-core@lists.openembedded.org;
	Mon, 08 Apr 2013 20:36:25 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r38IJ3Df024721
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 8 Apr 2013 11:19:03 -0700 (PDT)
Received: from Marks-MacBook-Pro.local (172.25.36.228) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.342.3; Mon, 8 Apr 2013 11:19:03 -0700
Message-ID: <51630A19.5090305@windriver.com>
Date: Mon, 8 Apr 2013 13:19:05 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8;
	rv:17.0) Gecko/20130328 Thunderbird/17.0.5
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <1365425799-25357-1-git-send-email-alexandru.damian@intel.com>
	<51630510.7080105@linux.intel.com>
In-Reply-To: <51630510.7080105@linux.intel.com>
Subject: Re: [PATCH] bluez4: add readline dependency
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 08 Apr 2013 18:36:26 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 4/8/13 12:57 PM, Saul Wold wrote:
> On 04/08/2013 05:56 AM, Alex DAMIAN wrote:
>> From: Alexandru DAMIAN <alexandru.damian@intel.com>
>>
>> bluez4 uses readline to be build, but the dependency is not listed
>> This is listed in the configuration log.
>> So we add it.
>>
> As far as I can tell it's needed only for gatttool, is this a tool that
> we need / want to provide for bluez?
>
> This seems to be a tools for viewing the Generic Attribute Profile (GATT).
>
> It can be disabled by setting "ac_cv_lib_readline_main=no"

We -really- want to avoid readline if possible, as it brings in GPLv3 
dependencies into the system.

If that tool is generically useful, I'd suggest a PACKAGECONFIG setting then.

--Mark

>
> Sau!
>
>
>> Signed-off-by: Alexandru DAMIAN <alexandru.damian@intel.com>
>> ---
>>    meta/recipes-connectivity/bluez/bluez4.inc |    2 +-
>>    1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/meta/recipes-connectivity/bluez/bluez4.inc b/meta/recipes-connectivity/bluez/bluez4.inc
>> index bff24d3..42d82b0 100644
>> --- a/meta/recipes-connectivity/bluez/bluez4.inc
>> +++ b/meta/recipes-connectivity/bluez/bluez4.inc
>> @@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=12f884d2ae1ff87c09e5b7ccc2c4ca7e \
>>                        file://COPYING.LIB;md5=fb504b67c50331fc78734fed90fb0e09 \
>>                        file://src/main.c;beginline=1;endline=24;md5=9bc54b93cd7e17bf03f52513f39f926e \
>>                        file://sbc/sbc.c;beginline=1;endline=25;md5=1a40781ed30d50d8639323a184aeb191"
>> -DEPENDS = "udev libusb dbus-glib glib-2.0 libcheck"
>> +DEPENDS = "udev libusb dbus-glib glib-2.0 libcheck readline"
>>    RDEPENDS_${PN}-dev = "bluez-hcidump"
>>
>>    PACKAGECONFIG ??= "\
>>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>



