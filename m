Return-Path: <mark.hatle@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id E4A5E60F4A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Dec 2013 18:04:51 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id rBCI4nHs025058
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Dec 2013 10:04:51 -0800 (PST)
Received: from Marks-MacBook-Pro.local (172.25.36.226) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.347.0; Thu, 12 Dec 2013 10:04:49 -0800
Message-ID: <52A9FAC0.4030606@windriver.com>
Date: Thu, 12 Dec 2013 12:04:48 -0600
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9;
	rv:24.0) Gecko/20100101 Thunderbird/24.2.0
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <1386870464-41010-1-git-send-email-fahad_arslan@mentor.com>
	<1386871038.504.19.camel@ted>
In-Reply-To: <1386871038.504.19.camel@ted>
Subject: Re: [PATCH] libffi: Copy headers to more common include path.
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
X-List-Received-Date: Thu, 12 Dec 2013 18:04:52 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 12/12/13, 11:57 AM, Richard Purdie wrote:
> On Thu, 2013-12-12 at 22:47 +0500, Fahad Arslan wrote:
>> Signed-off-by: Fahad Arslan <fahad_arslan@mentor.com>
>> ---
>>   meta/recipes-gnome/libffi/libffi_3.0.13.bb |    5 +++++
>>   1 file changed, 5 insertions(+)
>>
>> diff --git a/meta/recipes-gnome/libffi/libffi_3.0.13.bb b/meta/recipes-gnome/libffi/libffi_3.0.13.bb
>> index db0841e..07dd7d1 100644
>> --- a/meta/recipes-gnome/libffi/libffi_3.0.13.bb
>> +++ b/meta/recipes-gnome/libffi/libffi_3.0.13.bb
>> @@ -22,3 +22,8 @@ inherit autotools
>>   FILES_${PN}-dev += "${libdir}/libffi-${PV}"
>>
>>   BBCLASSEXTEND = "native nativesdk"
>> +
>> +do_install_append() {
>> +    install -d ${D}${includedir}
>> +    cp -r ${D}${libdir}/libffi-${PV}/include/* ${D}${includedir}/ || true
>> +}
>
> Why? Shouldn't whatever is using them look for them in the correct
> location?

Correct, I think this is wrong as well.  Most of the time when versions are 
included into the include path, the system may allow for multiple versions to be 
installed and used at the same time.

--Mark

> Cheers,
>
> Richard
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>


