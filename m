Received: from mail-ob0-f176.google.com ([209.85.214.176])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1U7ql1-0001Ll-H3
	for openembedded-core@lists.openembedded.org;
	Tue, 19 Feb 2013 18:13:31 +0100
Received: by mail-ob0-f176.google.com with SMTP id v19so6675593obq.7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Feb 2013 08:57:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=sBjR9U+kykmfp9edTUg/RfIJnXJaYkY8YQpVtHPrKr0=;
	b=tZHjIX5gWrXb9yx6+yAGKhDzBjOerAhA4QMNZR6MS61NKG2K6uhX7owg1sU/ajUkEB
	IYUYHHmdYcw3Q5IFUd2xVd6+2VOCKwQdaL85jP39wZgLF4t63OK2Nshzem812aM9GUFt
	a5stN9ZLB81GdDknujglJ00yRzBqUpUcmxY92Aeg8KkcWSAd1V2Mq1/cI2WYn9TFVm2h
	MHJLghkYyeIOik6I1D6zobyQtoLnEHE7lJGk1defX1P4EYEc22/aWQoz+ivYKIKewk39
	UaBj9zJyn/KzwsHSqoQ4dyjbDcJ7smaHXeD5Sok0h8gpP1NOrk74RFCCjbVt+ZXmDAcE
	DVHg==
MIME-Version: 1.0
X-Received: by 10.182.110.33 with SMTP id hx1mr4645546obb.32.1361293041467;
	Tue, 19 Feb 2013 08:57:21 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.182.2.197 with HTTP; Tue, 19 Feb 2013 08:57:21 -0800 (PST)
In-Reply-To: <5123AE35.5020007@linux.intel.com>
References: <1361123592-32572-1-git-send-email-otavio@ossystems.com.br>
	<1361123592-32572-4-git-send-email-otavio@ossystems.com.br>
	<5123AE35.5020007@linux.intel.com>
Date: Tue, 19 Feb 2013 13:57:21 -0300
X-Google-Sender-Auth: 5lX7KJUNAihPhuCE43v7Jww0po0
Message-ID: <CAP9ODKpL1KUmq1L6r9aHarBcG-UcThvEqF0OWwxkfxYiNhbcNw@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Saul Wold <sgw@linux.intel.com>
Cc: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2 4/5] qt4-tools: Drop libx11 dependency when building without 'x11' distro feature
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
X-List-Received-Date: Tue, 19 Feb 2013 17:13:32 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Tue, Feb 19, 2013 at 1:54 PM, Saul Wold <sgw@linux.intel.com> wrote:
> On 02/17/2013 09:53 AM, Otavio Salvador wrote:
>>
>> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
>> ---
>>   meta/recipes-qt/qt4/nativesdk-qt4-tools.inc | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/meta/recipes-qt/qt4/nativesdk-qt4-tools.inc
>> b/meta/recipes-qt/qt4/nativesdk-qt4-tools.inc
>> index cfc6fd8..d7ce8dc 100644
>> --- a/meta/recipes-qt/qt4/nativesdk-qt4-tools.inc
>> +++ b/meta/recipes-qt/qt4/nativesdk-qt4-tools.inc
>> @@ -1,10 +1,10 @@
>>   DESCRIPTION = "SDK tools for Qt/[X11|Mac|Embedded] version 4.x"
>> -DEPENDS = "nativesdk-zlib nativesdk-dbus nativesdk-libx11 qt4-native"
>> +DEPENDS = "nativesdk-zlib nativesdk-dbus
>> ${@base_contains('DISTRO_FEATURES', 'x11', 'virtual/nativesdk-libx11', '',
>> d)} qt4-native"
>>   SECTION = "libs"
>>   HOMEPAGE = "http://qt.nokia.com"
>>   LICENSE = "LGPLv2.1 | GPLv3"
>>
>> -INC_PR = "r13"
>> +INC_PR = "r14"
>>
>>   FILESEXTRAPATHS =. "${FILE_DIRNAME}/qt4-${PV}:"
>>
>>
>
> Does this also need a change to the EXTRA_OECONF to ensure that the x11
> functionality is disabled by default in the configuration.

I didn't find this option; it'd be great so we'd ensure it wouldn't
link against host x11.

-- 
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br


