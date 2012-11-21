Received: from starfish.geekisp.com ([216.168.135.166])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <philip@balister.org>) id 1TbAEN-0007Zy-E6
	for openembedded-core@openembedded.org; Wed, 21 Nov 2012 14:20:52 +0100
Received: (qmail 26393 invoked by uid 1003); 21 Nov 2012 12:59:57 -0000
Received: from unknown (HELO ?192.168.1.105?)
	(philip@opensdr.com@96.240.166.19)
	by mail.geekisp.com with (DHE-RSA-AES256-SHA encrypted) SMTP;
	21 Nov 2012 12:59:57 -0000
Message-ID: <50ACD04B.4020009@balister.org>
Date: Wed, 21 Nov 2012 07:59:55 -0500
From: Philip Balister <philip@balister.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:16.0) Gecko/20121016 Thunderbird/16.0.1
MIME-Version: 1.0
To: Stefan Herbrechtsmeier <stefan@herbrechtsmeier.net>
References: <1353452291-3503-1-git-send-email-philip@balister.org>
	<50AC6EA2.60708@herbrechtsmeier.net>
In-Reply-To: <50AC6EA2.60708@herbrechtsmeier.net>
Cc: openembedded-core@openembedded.org
Subject: Re: [PATCH] distutils-common : Add -staticdev to PACKAGES.
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
X-List-Received-Date: Wed, 21 Nov 2012 13:20:58 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 11/21/2012 01:03 AM, Stefan Herbrechtsmeier wrote:
> Am 20.11.2012 23:58, schrieb Philip Balister:
>> Some python recipes may build static libraries that need packaging in
>> {PN}-static-dev.
>>
>> This change fixes a QA error in python-numpy.
>>
>> Signed-off-by: Philip Balister <philip@balister.org>
>> ---
>>   meta/classes/distutils-common-base.bbclass | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/meta/classes/distutils-common-base.bbclass
>> b/meta/classes/distutils-common-base.bbclass
>> index f66a5cd..36c1e83 100644
>> --- a/meta/classes/distutils-common-base.bbclass
>> +++ b/meta/classes/distutils-common-base.bbclass
>> @@ -5,7 +5,7 @@ EXTRA_OEMAKE = ""
>>   export STAGING_INCDIR
>>   export STAGING_LIBDIR
>> -PACKAGES = "${PN}-dev ${PN}-dbg ${PN}-doc ${PN}"
>> +PACKAGES = "${PN}-staticdev ${PN}-dev ${PN}-dbg ${PN}-doc ${PN}"
>>   FILES_${PN} = "${bindir}/* ${libdir}/* ${libdir}/${PYTHON_DIR}/*"
> Hi,
>
> I post a similarly patch parallel with the python-numpy fix:
> http://comments.gmane.org/gmane.comp.handhelds.openembedded.core/29575

Provided the:

+FILES_${PN}-staticdev += "\
+  ${PYTHON_SITEPACKAGES_DIR}/*.a \
+"

Actually catches a lot of the .a files, I prefer Stefan's version. Numpy 
still needs to to override the FILES though.

Philip

PS: WARNING, I am not a python expert, just trying to help fix QA issues 
as they come up.

>
> Regards,
>    Stefan
>


