Return-Path: <armccurdy@gmail.com>
Received: from mail-wr0-f196.google.com (mail-wr0-f196.google.com
	[209.85.128.196])
	by mail.openembedded.org (Postfix) with ESMTP id C02EE77B5B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Mar 2017 18:59:09 +0000 (UTC)
Received: by mail-wr0-f196.google.com with SMTP id u108so32566433wrb.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Mar 2017 11:59:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=jrBKFxxRIpva+m4gkL6aF6rBMaXqH7TiqOAloa0isDU=;
	b=MoRpTm6ffyjXeq4eMcr2/0QSSzxWZFcMGeoFiRPoJGMkSIktuVpMtDSjHHCt6gHePV
	edfz32ZleBwCPpu1jYIEhMlS4fDATRqc0tYcLHF+L6RNIToZvK0N4K6KePYkSt0ajMvH
	qUYPE3u7a8qDCXLSTPFX/4Ija5TtiVnBRDhiKVekHWmMAVqupWqH/0iDdMaHsJW0EA4F
	QXpql+uvF02T+2wVE61hGWWFmHMyQQNfU2VCKgUSmPP83HfO+MR6hK/Z1F27QCUOnkJi
	fLUaR0ths37IMxedlIFS1Z4AS1k/760SVYFFgQ6ePe5HbMJZM7XyRJzKRSWwo+twX2I5
	PU6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=jrBKFxxRIpva+m4gkL6aF6rBMaXqH7TiqOAloa0isDU=;
	b=eGubqK+SKMfk1qTTPTsh4tfzbAbtFiaMFkqeoRDEHn9nkzvq+nqg4w0OZ5vTFKRmil
	JRCJQlccTDucLzP7SOBeVhdZP8q6nghWEXC86gA8CjGJ+g/Z3eSnjA+N8wKPq/OGZupx
	+slmQDklUjYEb2qGyuMjNhnyZPThyj0AwlZNV0RiANvMwuX8JeXt69bMXBKfLzSw4Ewu
	GSvWto9n+ky6wBBvy8UqyS6aYNskpSc5FK2y+m74wuzfX41qy2TcJpU5FtLgatEt9s9a
	YVxkOxkj0lBKXqcFyzB68hlV2WmXLIju0klf2UM5pUjTXquuLeOEeK/8ij3QgOWMUZZF
	tZfQ==
X-Gm-Message-State: AFeK/H1d9PCGSm7sqhdJ/LWwhrDqzW8lv9DLr5L8ItoN0nfhHFIAgXA4GkDGn1UV8dVIZr7tZ2ShNUYuQPe+2A==
X-Received: by 10.223.152.215 with SMTP id w81mr4399045wrb.151.1490295550359; 
	Thu, 23 Mar 2017 11:59:10 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.152.55 with HTTP; Thu, 23 Mar 2017 11:59:09 -0700 (PDT)
In-Reply-To: <bca89655-d4fd-d6ea-74c7-9f6050473b89@topic.nl>
References: <1490222875-16219-1-git-send-email-armccurdy@gmail.com>
	<bca89655-d4fd-d6ea-74c7-9f6050473b89@topic.nl>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Thu, 23 Mar 2017 11:59:09 -0700
Message-ID: <CAJ86T=USCOn32KPsH1TURbJL671wPwGXLBeajkL06wyvs4Q0wA@mail.gmail.com>
To: Mike Looijmans <mike.looijmans@topic.nl>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] native.bbclass: clear MACHINE_FEATURES
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
X-List-Received-Date: Thu, 23 Mar 2017 18:59:10 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Mar 23, 2017 at 2:06 AM, Mike Looijmans <mike.looijmans@topic.nl> wrote:
> On 22-03-17 23:47, Andre McCurdy wrote:
>>
>> Try to avoid native recipes accidentally being dependent on
>> MACHINE_FEATURES. This simple change doesn't prevent MACHINE_FEATURES
>> set via MACHINE_FEATURES_BACKFILL sneaking through, but it's better
>> than nothing.
>
> Maybe this would work:
>
> MACHINE_FEATURES_BACKFILL_CONSIDERED = "${MACHINE_FEATURES_BACKFILL}"

I guess it doesn't work if MACHINE_FEATURES_BACKFILL_CONSIDERED is set
elsewhere using _append.

The real solution would probably be to skip backfilling
MACHINE_FEATURES entirely for class-native?

>>
>> Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
>> ---
>>  meta/classes/native.bbclass | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/meta/classes/native.bbclass b/meta/classes/native.bbclass
>> index 6becf82..1919fbc 100644
>> --- a/meta/classes/native.bbclass
>> +++ b/meta/classes/native.bbclass
>> @@ -112,6 +112,7 @@ PKG_CONFIG_SYSTEM_INCLUDE_PATH[unexport] = "1"
>>  LIBCOVERRIDE = ""
>>  CLASSOVERRIDE = "class-native"
>>  MACHINEOVERRIDES = ""
>> +MACHINE_FEATURES = ""
>>
>>  PATH_prepend = "${COREBASE}/scripts/native-intercept:"
>>
>>
>
>
>
> Kind regards,
>
> Mike Looijmans
> System Expert
>
> TOPIC Products
> Materiaalweg 4, NL-5681 RJ Best
> Postbus 440, NL-5680 AK Best
> Telefoon: +31 (0) 499 33 69 79
> E-mail: mike.looijmans@topicproducts.com
> Website: www.topicproducts.com
>
> Please consider the environment before printing this e-mail
>
>
>
>
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

