Received: from mail-qw0-f47.google.com ([209.85.216.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrei@gherzan.ro>) id 1RiqUS-0006KO-DV
	for openembedded-core@lists.openembedded.org;
	Thu, 05 Jan 2012 17:48:32 +0100
Received: by qadb17 with SMTP id b17so547459qad.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 05 Jan 2012 08:41:09 -0800 (PST)
Received: by 10.224.185.6 with SMTP id cm6mr3478562qab.89.1325781669139;
	Thu, 05 Jan 2012 08:41:09 -0800 (PST)
Received: from [128.224.170.134] ([89.121.200.106])
	by mx.google.com with ESMTPS id v5sm44327860qao.21.2012.01.05.08.41.07
	(version=SSLv3 cipher=OTHER); Thu, 05 Jan 2012 08:41:08 -0800 (PST)
Message-ID: <4F05D2A2.4010603@gherzan.ro>
Date: Thu, 05 Jan 2012 18:41:06 +0200
From: Andrei Gherzan <andrei@gherzan.ro>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:8.0) Gecko/20111124 Thunderbird/8.0
MIME-Version: 1.0
To: Saul Wold <sgw@linux.intel.com>
References: <1325154126-3368-1-git-send-email-andrei@gherzan.ro>
	<4F0396AA.3070901@linux.intel.com>
In-Reply-To: <4F0396AA.3070901@linux.intel.com>
Cc: Andrei Gherzan <andrei.gherzan@windriver.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] wpa-supplicant - pulls GPLv3 license rpm in a non-GPLv3 build (libgnutls-extra)
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
X-List-Received-Date: Thu, 05 Jan 2012 16:48:32 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 01/04/2012 02:00 AM, Saul Wold wrote:
> On 12/29/2011 02:22 AM, Andrei Gherzan wrote:
>> From: Andrei Gherzan<andrei.gherzan@windriver.com>
>>
>> Two different defconfigs are chosen, one for "with GPLv3 build" and 
>> one for "without".
>> In this way, libgnutls-extra is not pulled in a non-GPLv3 build.
>>
>> [YOCTO #1845]
>>
>> Signed-off-by: Andrei Gherzan<andrei@gherzan.ro>
>> ---
>>   .../wpa-supplicant/defconfig.inc                   |    4 +
>>   .../wpa-supplicant-0.7.3/defconfig-gnutls-nogplv3  |  409 
>> ++++++++++++++++++++
>>   .../wpa-supplicant/wpa-supplicant-0.7.inc          |    7 +-
>>   3 files changed, 418 insertions(+), 2 deletions(-)
>>   create mode 100644 
>> meta/recipes-connectivity/wpa-supplicant/defconfig.inc
>>   create mode 100644 
>> meta/recipes-connectivity/wpa-supplicant/wpa-supplicant-0.7.3/defconfig-gnutls-nogplv3
>>
>
> Merged into OE-Core as coded here, but would be willing to get a new 
> patch that removes the need for gnutls and the nogplv3 workaround.
>
> Thanks
>     Sau!
Done.

[PATCH] wpa-supplicant: Patch this recipe order to remove
       duplicate defconfig file (Andrei Gherzan)



