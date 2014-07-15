Return-Path: <akuster@mvista.com>
Received: from mail-pa0-f49.google.com (mail-pa0-f49.google.com
	[209.85.220.49])
	by mail.openembedded.org (Postfix) with ESMTP id B2B787062A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Jul 2014 15:35:44 +0000 (UTC)
Received: by mail-pa0-f49.google.com with SMTP id hz1so3534554pad.22
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Jul 2014 08:35:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:date:from:user-agent:mime-version:to
	:subject:references:in-reply-to:content-type
	:content-transfer-encoding;
	bh=IwlBmWtW7Nr63rr2pAZ01p/KTcW83AbNoBJ88XMEjEM=;
	b=EtACjdLay9mn7njzW5xv5SBG8AuhWu0lOfBoKfqj9Bv6cVh5qjsUxv0hgJxJoNPDOL
	FdGuXusZO6fc+NXkik0dmuX2gybM+2fidPpx0TqUov1geV68up+lTS0GIWXHZrQMcuri
	/Cv90UEATJk27x90WvjiwlPfd9NZp5baoFDtb336iQjTC4yqzj2vdS2BoF96DkRoUaid
	TSCuCufEI5+3pD/KBVcyDUPo0Vimiuf4utfj5M8B4krJeouqPqXzStPJC2bfiFzjDkpO
	EH5ISPrIGc30MDnFIDNrfC2rJ6RFKTAXQFaKoHftn2Mc45V1EZhXiMMj+GFKGHsX3qtf
	UXUw==
X-Gm-Message-State: ALoCoQlbNtDH/epw/aHLwRFMc1OIFP6dQSDdQCYaZCj9LTc59xF00p3XHe4W84gjHpRxxle9rnWk
X-Received: by 10.68.247.137 with SMTP id ye9mr11578716pbc.69.1405438545567;
	Tue, 15 Jul 2014 08:35:45 -0700 (PDT)
Received: from [172.16.1.20] (c-98-239-95-55.hsd1.ca.comcast.net.
	[98.239.95.55])
	by mx.google.com with ESMTPSA id k4sm6694789pdh.28.2014.07.15.08.35.44
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 15 Jul 2014 08:35:44 -0700 (PDT)
Message-ID: <53C54A4E.20008@mvista.com>
Date: Tue, 15 Jul 2014 08:35:42 -0700
From: akuster <akuster@mvista.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.6.0
MIME-Version: 1.0
To: Saul Wold <sgw@linux.intel.com>, openembedded-core@lists.openembedded.org
References: <1405437238-28782-1-git-send-email-akuster@mvista.com>
	<53C5470B.2090704@linux.intel.com>
In-Reply-To: <53C5470B.2090704@linux.intel.com>
Subject: Re: [meta-oe][PATCH] [v2] nettle: update to version 3.0
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
X-List-Received-Date: Tue, 15 Jul 2014 15:35:46 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit


On 07/15/2014 08:21 AM, Saul Wold wrote:
> On 07/15/2014 08:13 AM, Armin Kuster wrote:
>> Updating to version 3.x
>> Version 3.x includes GPL v3 code. They call it dual
>>    licensing
>> Keeping 2.7.1 as it is GPL v2
>> Put common code in inc file
>>
>> Signed-off-by: Armin Kuster <akuster@mvista.com>
>> ---
>>   meta/recipes-support/nettle/nettle.inc      | 27 
>> +++++++++++++++++++++++++++
>>   meta/recipes-support/nettle/nettle_2.7.1.bb | 20 +++-----------------
>>   meta/recipes-support/nettle/nettle_3.0.bb   | 16 ++++++++++++++++
>>   3 files changed, 46 insertions(+), 17 deletions(-)
>>   create mode 100644 meta/recipes-support/nettle/nettle.inc
>>   create mode 100644 meta/recipes-support/nettle/nettle_3.0.bb
>>
>> diff --git a/meta/recipes-support/nettle/nettle.inc 
>> b/meta/recipes-support/nettle/nettle.inc
>> new file mode 100644
>> index 0000000..bca35c0
>> --- /dev/null
>> +++ b/meta/recipes-support/nettle/nettle.inc
>> @@ -0,0 +1,27 @@
>> +SUMMARY = "A low level cryptographic library"
>> +HOMEPAGE = "http://www.lysator.liu.se/~nisse/nettle/"
>> +SECTION = "libs"
>> +LICENSE = "LGPLv2.1 & GPLv2"
>> +
>> +# Version 2.7.1 is GPL v2
>> +# set PREFERRED_VERSION_nettle =  "2.7.1" in local.conf
>> +# if you want GPLv2 code
>> +#
>
> The preferred mechanism for getting GPLv2 is to set 
> INCOMPATIBLE_LICENSE="GPLv3", not by setting PREFERRED_VERSION, so I 
> am not sure this comment is best here.

ok. will correct.


>
>> +# Version 3.x is GPL v2 and v3
>> +
>> +
>> +DEPENDS += "gmp"
>> +
>> +SRC_URI = "http://www.lysator.liu.se/~nisse/archive/${BP}.tar.gz"
>> +
>> +EXTRA_OECONF = "--disable-openssl"
>> +
>> +do_configure_prepend() {
>> +       if [ ! -e ${S}/acinclude.m4 -a -e ${S}/aclocal.m4 ]; then
>> +               cp ${S}/aclocal.m4 ${S}/acinclude.m4
>> +       fi
>> +}
>> +
>> +inherit autotools
>> +
>> +BBCLASSEXTEND = "native"
>> diff --git a/meta/recipes-support/nettle/nettle_2.7.1.bb 
>> b/meta/recipes-support/nettle/nettle_2.7.1.bb
>> index 8aa5351..9ef9f64 100644
>> --- a/meta/recipes-support/nettle/nettle_2.7.1.bb
>> +++ b/meta/recipes-support/nettle/nettle_2.7.1.bb
>> @@ -1,26 +1,12 @@
>> -SUMMARY = "A low level cryptographic library"
>> -HOMEPAGE = "http://www.lysator.liu.se/~nisse/nettle/"
>> -SECTION = "libs"
>> +
>> +include nettle.inc
>> +
>>   LICENSE = "LGPLv2.1 & GPLv2"
>>   LIC_FILES_CHKSUM = 
>> "file://COPYING.LIB;md5=2d5025d4aa3495befef8f17206a5b0a1 \
>> file://serpent-decrypt.c;beginline=53;endline=67;md5=bcfd4745d53ca57f82907089898e390d 
>> \
>> file://serpent-set-key.c;beginline=56;endline=70;md5=bcfd4745d53ca57f82907089898e390d"
>>
>> -DEPENDS += "gmp"
>> -
>> -SRC_URI = "http://www.lysator.liu.se/~nisse/archive/${BP}.tar.gz"
>>
>>   SRC_URI[md5sum] = "003d5147911317931dd453520eb234a5"
>>   SRC_URI[sha256sum] = 
>> "bc71ebd43435537d767799e414fce88e521b7278d48c860651216e1fc6555b40"
>>
>> -EXTRA_OECONF = "--disable-openssl"
>> -
>> -do_configure_prepend() {
>> -       if [ ! -e ${S}/acinclude.m4 -a -e ${S}/aclocal.m4 ]; then
>> -               cp ${S}/aclocal.m4 ${S}/acinclude.m4
>> -       fi
>> -}
>> -
>> -inherit autotools
>> -
>> -BBCLASSEXTEND = "native"
>> diff --git a/meta/recipes-support/nettle/nettle_3.0.bb 
>> b/meta/recipes-support/nettle/nettle_3.0.bb
>> new file mode 100644
>> index 0000000..bac2e71
>> --- /dev/null
>> +++ b/meta/recipes-support/nettle/nettle_3.0.bb
>> @@ -0,0 +1,16 @@
>> +#
>> +# Nettle  3 and above contains GPL v3 code
>> +# use 2.7.1 if you do not want GPL v3 code
>> +#
>> +
>> +include nettle.inc
>> +
>> +LICENSE = "LGPLv2.1 & GPLv2 & GPLv3"
>> +
> This should be | (single) then based on your follow up email to RP.

will fix this too.

-Armin

>
> Sau!
>
>> +LIC_FILES_CHKSUM = 
>> "file://COPYINGv3;md5=11cc2d3ee574f9d6b7ee797bdce4d423\
>> + 
>> file://serpent-decrypt.c;beginline=53;endline=67;md5=a4ccbeb343203d3586661f45c1cab577 
>> \
>> + 
>> file://serpent-set-key.c;beginline=56;endline=70;md5=150b0ea44cdfb712a83331bff566e9a8"
>> +
>> +SRC_URI[md5sum] = "f64b1bf1e774b7ae6e507318e340250e"
>> +SRC_URI[sha256sum] = 
>> "9651c0bd2326eb737d0ed9eb403444712407c01a25b0fe813432ef31bebcd913"
>> +
>>


