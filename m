Return-Path: <david.c.nystrom@gmail.com>
Received: from mail-la0-f41.google.com (mail-la0-f41.google.com
	[209.85.215.41])
	by mail.openembedded.org (Postfix) with ESMTP id 446F16CA88
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Sep 2013 15:11:26 +0000 (UTC)
Received: by mail-la0-f41.google.com with SMTP id ec20so1097921lab.28
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Sep 2013 08:11:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=z9pm8GIfRIyQHrrh9PcgBbgDwzDCdfHbYf4gtVtmsZo=;
	b=cir9h0mPnTug8uPOLxaLv7zpsKEBlem3uPI4JC4s4TxOua9vO0eurA0Znchj2R6YQV
	eu4SJkC97p5lDEMRi4V2qjBqEdkxmDvspDKCwIEnM+CNdgKxe3V/o0/Up+lRaxhOE3Nh
	c3g9BVh6eak7DUmfTJL19FSgyd9fa0tDwJ+8lMond1OTnpqr9zu46+NoFmbtA+8F10yT
	ClN8XlbCbwfMBHCV4fbXa/NzG0V0fYBHsVxHbiRshrXcS1iEBmc+A6sAmFEv3f/N6IgV
	Y7lG1sNniKsLN/YP+tAqrDq+cTkaboPl6GDx2f+jkITYlK28epgZFZbAEvoConWY+1ED
	7L/w==
X-Received: by 10.152.28.7 with SMTP id x7mr1108332lag.26.1380208286887;
	Thu, 26 Sep 2013 08:11:26 -0700 (PDT)
Received: from [172.16.141.168] (sestofw01.enea.se. [192.36.1.252])
	by mx.google.com with ESMTPSA id mr1sm2670006lbc.16.1969.12.31.16.00.00
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 26 Sep 2013 08:11:24 -0700 (PDT)
Message-ID: <52444E95.5020006@gmail.com>
Date: Thu, 26 Sep 2013 17:11:17 +0200
From: =?UTF-8?B?RGF2aWQgTnlzdHLDtm0=?= <david.c.nystrom@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.0
MIME-Version: 1.0
To: Saul Wold <sgw@linux.intel.com>
References: <1380192442-12205-1-git-send-email-david.nystrom@enea.com>
	<52443B2A.4040806@linux.intel.com>
In-Reply-To: <52443B2A.4040806@linux.intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] makedevs: Add device_table-minimal.txt to the nativesdk sysroot
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
X-List-Received-Date: Thu, 26 Sep 2013 15:11:28 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On Thu 26 Sep 2013 03:48:26 PM CEST, Saul Wold wrote:
> On 09/26/2013 03:47 AM, David Nyström wrote:
>> Add an example device_table in the SDK under /usr/share/
>>
>> Signed-off-by: David Nyström <david.nystrom@enea.com>
>> ---
>>   meta/recipes-devtools/makedevs/makedevs_1.0.0.bb | 9 ++++++++-
>>   1 file changed, 8 insertions(+), 1 deletion(-)
>>
>> diff --git a/meta/recipes-devtools/makedevs/makedevs_1.0.0.bb
>> b/meta/recipes-devtools/makedevs/makedevs_1.0.0.bb
>> index e6860f0..4c7a5ae 100644
>> --- a/meta/recipes-devtools/makedevs/makedevs_1.0.0.bb
>> +++ b/meta/recipes-devtools/makedevs/makedevs_1.0.0.bb
>> @@ -4,7 +4,9 @@ LIC_FILES_CHKSUM =
>> "file://COPYING;md5=393a5ca445f6965873eca0259a17f833"
>>   SECTION = "base"
>>   SRC_URI = "file://makedevs.c \
>>              file://COPYING.patch"
>> -PR = "r7"
>> +PR = "r8"
>> +
> No PR bump needed any more.
>
> Thanks
>     Sau!
>
>> +FILES_${PN}_append_class-nativesdk = " ${datadir}"
>>
>>   do_configure() {
>>       install -m 0644 ${WORKDIR}/makedevs.c ${S}/
>> @@ -19,4 +21,9 @@ do_install() {
>>       install -m 0755 ${S}/makedevs ${D}${base_sbindir}/makedevs
>>   }
>>
>> +do_install_append_class-nativesdk() {
>> +        install -d ${D}${datadir}
>> +        install -m 644
>> ${COREBASE}/meta/files/device_table-minimal.txt ${D}${datadir}/
>> +}
>> +
>>   BBCLASSEXTEND = "native nativesdk"
>>

Any  reference to more info here?
Resend with PR removed ?



