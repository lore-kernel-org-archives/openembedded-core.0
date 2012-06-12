Received: from mail.dream-property.net ([82.149.226.172])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <obi@opendreambox.org>) id 1SeTR8-0002xX-C4
	for openembedded-core@lists.openembedded.org;
	Tue, 12 Jun 2012 17:55:18 +0200
Received: from localhost (localhost [127.0.0.1])
	by mail.dream-property.net (Postfix) with ESMTP id 40929315CFF2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Jun 2012 17:44:45 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at mail.dream-property.net
Received: from mail.dream-property.net ([127.0.0.1])
	by localhost (mail.dream-property.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id H5td1uWjxB+E
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Jun 2012 17:44:33 +0200 (CEST)
Received: from [172.22.22.61] (ip-95-222-195-88.unitymediagroup.de
	[95.222.195.88])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mail.dream-property.net (Postfix) with ESMTPSA id A2465315CFF1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Jun 2012 17:44:33 +0200 (CEST)
Message-ID: <4FD763E0.8000804@opendreambox.org>
Date: Tue, 12 Jun 2012 17:44:32 +0200
From: Andreas Oberritter <obi@opendreambox.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:12.0) Gecko/20120430 Thunderbird/12.0.1
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <1339514135-23891-1-git-send-email-sgw@linux.intel.com>
	<1339515389.8065.15.camel@ted>
In-Reply-To: <1339515389.8065.15.camel@ted>
Subject: Re: [PATCH v2] curl: enable ssl support
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
X-List-Received-Date: Tue, 12 Jun 2012 15:55:18 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 12.06.2012 17:36, Richard Purdie wrote:
> On Tue, 2012-06-12 at 08:15 -0700, Saul Wold wrote:
>> This patch enables ssl support for curl to allow git to clone from
>> https / ssl sites.
>>
>> [YOCTO #2532]
>>
>> Signed-off-by: Saul Wold <sgw@linux.intel.com>
>> ---
>>  meta/recipes-support/curl/curl_7.24.0.bb |   10 +++++-----
>>  1 files changed, 5 insertions(+), 5 deletions(-)
>>
>> diff --git a/meta/recipes-support/curl/curl_7.24.0.bb b/meta/recipes-support/curl/curl_7.24.0.bb
>> index 12e95c9..0a16750 100644
>> --- a/meta/recipes-support/curl/curl_7.24.0.bb
>> +++ b/meta/recipes-support/curl/curl_7.24.0.bb
>> @@ -5,10 +5,10 @@ SECTION = "console/network"
>>  LICENSE = "MIT"
>>  LIC_FILES_CHKSUM = "file://COPYING;beginline=7;md5=3a34942f4ae3fbf1a303160714e664ac"
>>  
>> -DEPENDS = "zlib gnutls"
>> -DEPENDS_virtclass-native = "zlib-native"
>> -DEPENDS_virtclass-nativesdk = "zlib-nativesdk"
>> -PR = "r0"
>> +DEPENDS = "zlib gnutls openssl"

Doesn't gnutls already provide the necessary bits to support SSL in curl?

>> +DEPENDS_virtclass-native = "zlib-native openssl"
> 
> openssl-native?

Or gnutls-native? Or just remove DEPENDS_virtclass-*?

Regards,
Andreas


