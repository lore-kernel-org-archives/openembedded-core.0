Return-Path: <andrej.valek@siemens.com>
Received: from david.siemens.de (david.siemens.de [192.35.17.14])
	by mail.openembedded.org (Postfix) with ESMTP id B362278532
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Aug 2017 06:26:49 +0000 (UTC)
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
	by david.siemens.de (8.15.2/8.15.2) with ESMTPS id v7I6QoBR029825
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK); 
	Fri, 18 Aug 2017 08:26:50 +0200
Received: from [192.168.253.100] ([163.242.56.100])
	by mail1.sbs.de (8.15.2/8.15.2) with ESMTPS id v7I6QnYj024087
	(version=TLSv1.2 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Fri, 18 Aug 2017 08:26:50 +0200
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
References: <1502981085-18209-1-git-send-email-andrej.valek@siemens.com>
	<1502987497.13978.239.camel@linuxfoundation.org>
From: Andrej Valek <andrej.valek@siemens.com>
Message-ID: <b911b7ff-0309-e459-0baf-b0fab4b68747@siemens.com>
Date: Fri, 18 Aug 2017 08:26:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <1502987497.13978.239.camel@linuxfoundation.org>
Subject: Re: [PATCH] ca-certificates: prevent executing update-ca-certificates from host system
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
X-List-Received-Date: Fri, 18 Aug 2017 06:26:51 -0000
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit


Yes, for actual branch is not required. But for branches like krogoth
and morty, where HOSTTOOLS is not implemented, is this necessary.

Andrej

On 08/17/2017 06:31 PM, Richard Purdie wrote:
> On Thu, 2017-08-17 at 16:44 +0200, Andrej Valek wrote:
>> Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
>> ---
>>  meta/recipes-support/ca-certificates/ca-certificates_20161130.bb | 2
>> +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/meta/recipes-support/ca-certificates/ca-
>> certificates_20161130.bb b/meta/recipes-support/ca-certificates/ca-
>> certificates_20161130.bb
>> index 9a80f43..771714d 100644
>> --- a/meta/recipes-support/ca-certificates/ca-
>> certificates_20161130.bb
>> +++ b/meta/recipes-support/ca-certificates/ca-
>> certificates_20161130.bb
>> @@ -72,7 +72,7 @@ CONFFILES_${PN} += "${sysconfdir}/ca-
>> certificates.conf"
>>  # Postinsts don't seem to be run for nativesdk packages when
>> populating SDKs.
>>  CONFFILES_${PN}_append_class-nativesdk = "
>> ${sysconfdir}/ssl/certs/ca-certificates.crt"
>>  do_install_append_class-nativesdk () {
>> -    SYSROOT="${D}${SDKPATHNATIVE}" update-ca-certificates
>> +    SYSROOT="${D}${SDKPATHNATIVE}" ${D}${sbindir}/update-ca-
>> certificates
>>  }
>>  
>>  do_install_append_class-native () {
> 
> Since the HOSTTOOLS changes, this should no longer be needed?
> 
> Cheers,
> 
> Richard
> 

