Return-Path: <andrei@gherzan.ro>
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	by mail.openembedded.org (Postfix) with ESMTP id 0A5CB7D9E5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 May 2019 12:23:51 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id f204so3864553wme.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 May 2019 05:23:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gherzan.ro; s=google;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-transfer-encoding:content-language;
	bh=w5Yc1LrfKdZ/fFIk++zXaBR/f0VYdJ9ulcd7ceaBkyU=;
	b=WJEjka3MBcG7UlrHGnTwzHJ2ekrB3/18H3ESG29jMQE3SlVVKDv0wWPcc/upsXYISX
	bICkPYtoEqdFDkoqQYgHh+OsmHV9YEXBo2r+MmvHYsJPLylC6p3OkfrB3DO8AI07j757
	c9wDRJ308mdMz1VR6kPCuXyzwGXL+z98ohX1lGOvG/k4Z/0y9rRpmv6KTA8zyuyTWHpP
	D01TJZ2bFKcC1o9eF+uHaZooepsq8rj7x8F4m9T9i68LvXk1eO42CAdL16P0jrPBM076
	+dbCuzsu9vxydZ+2IrSy51Y3BmLz+2oq1HQwR1y8nH29xEagL6I+XWDRCpVHMwSxK6U5
	Zdnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=w5Yc1LrfKdZ/fFIk++zXaBR/f0VYdJ9ulcd7ceaBkyU=;
	b=MgQVN4VqpwPKv07Uz0vCMfFTMNSw2Lj8fEPGmzjC8Nn2a2OdvPe4DgYUrqD5kKkArN
	SfWHeWI8Mb/RSqrORsLqvHgjsWLScSf1F3defsVuSMSMBurNAAU9iuZX0YEKdEOUxmz1
	VppkEZII84Kc6yg/0yJ3T3B9U5UY3Y2XXsW2L22PeR5pqKhPJetYsrOEGwWjwop90KBQ
	QIYWzQ9daqgE3jZKHqjHGi0sTU+NBG3yJ10RUNr/ZUJvofw5yOgoE5DSPgVMC4FMLo/7
	4mWiQcZnvBCP8dQp4pxUfpmGKxAcSjt3D1+fnam/lqKmiwNs8Sm7SKr46OpUDBgUS/OD
	Kjvw==
X-Gm-Message-State: APjAAAUX1Cx8o6IonPeSx+nKEE4yIhyyO4/IYAIVzsSza1fbTRYgvB42
	fHT31zD3nYsbzIo7055RfjTCPlkfmwk=
X-Google-Smtp-Source: APXvYqyZb7emW66LhyNcg+ab1u+MC9dxH08MiEd2tEq0NnaxBgOGfOfiHf7D22nfjMquc/H+tJBvIQ==
X-Received: by 2002:a1c:be12:: with SMTP id o18mr2226643wmf.124.1559219032270; 
	Thu, 30 May 2019 05:23:52 -0700 (PDT)
Received: from [10.100.100.101] (host90-152-4-101.ipv4.regusnet.com.
	[90.152.4.101]) by smtp.gmail.com with ESMTPSA id
	u19sm6979805wmu.41.2019.05.30.05.23.51
	(version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
	Thu, 30 May 2019 05:23:51 -0700 (PDT)
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	openembedded-core@lists.openembedded.org
References: <20190529144130.21278-1-andrei@gherzan.ro>
	<43b12f6cf16d43e788827f48a935ff6bdc3c777d.camel@linuxfoundation.org>
From: Andrei Gherzan <andrei@gherzan.ro>
Message-ID: <516136c9-a5a1-d32a-5eb0-2a1a4858bfe8@gherzan.ro>
Date: Thu, 30 May 2019 13:23:50 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <43b12f6cf16d43e788827f48a935ff6bdc3c777d.camel@linuxfoundation.org>
Subject: Re: [PATCH V2] ca-certificates: Fix openssl runtime dependency
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
X-List-Received-Date: Thu, 30 May 2019 12:23:52 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US

On 29/05/2019 19.45, Richard Purdie wrote:
> On Wed, 2019-05-29 at 15:41 +0100, Andrei Gherzan wrote:
>> Signed-off-by: Andrei Gherzan <andrei@gherzan.ro>
>> ---
>>  .../ca-certificates/ca-certificates_20190110.bb               | 4
>> +++-
>>  1 file changed, 3 insertions(+), 1 deletion(-)
>>
>> diff --git a/meta/recipes-support/ca-certificates/ca-
>> certificates_20190110.bb b/meta/recipes-support/ca-certificates/ca-
>> certificates_20190110.bb
>> index 4c0425302f..7c06573db2 100644
>> --- a/meta/recipes-support/ca-certificates/ca-
>> certificates_20190110.bb
>> +++ b/meta/recipes-support/ca-certificates/ca-
>> certificates_20190110.bb
>> @@ -82,6 +82,8 @@ do_install_append_class-native () {
>>      SYSROOT="${D}${base_prefix}" ${D}${sbindir}/update-ca-
>> certificates
>>  }
>>  
>> -RDEPENDS_${PN} += "openssl"
>> +RDEPENDS_${PN}_class-target = "openssl-bin"
>> +RDEPENDS_${PN}_class-native = "openssl"
>> +RDEPENDS_${PN}_class-nativesdk = "openssl"
> Wouldn't the nativesdk version be openssl-bin too?
>
> or really these would end up being openssl-native and 
> nativesdk-openssl-bin?
I completely abominated this one. Pushed v3.

-- 
Andrei Gherzan
gpg: rsa4096/D4D94F67AD0E9640 | t: @agherzan


