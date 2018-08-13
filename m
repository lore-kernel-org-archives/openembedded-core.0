Return-Path: <alex.kanavin@gmail.com>
Received: from mail-oi0-f44.google.com (mail-oi0-f44.google.com
	[209.85.218.44])
	by mail.openembedded.org (Postfix) with ESMTP id 5301078CB0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Aug 2018 14:59:21 +0000 (UTC)
Received: by mail-oi0-f44.google.com with SMTP id j205-v6so27783210oib.4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Aug 2018 07:59:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=TBancfJY0kPayYigADYp1Dje7h3cRDk6OY1MQWT8SJg=;
	b=lIsVHA+Oeg246zsE5dcNK34nKmDitExO0vKUbbTzfTOgZKqS8ztioUtOX64Ajr1qdp
	K6KEIi0bXGWPp5CNFCR0D6SaVPpgkuR7kaFf6wawBfeeUoqGibnfla92guL02QSKhzQ8
	rVU3/JrHpqaWPnsNT0Mkh8ZeQC5aMTcDMUDRCm846F3H95pGvEL9wAC5JA+lG2F3dSG6
	S/hyevJHWLdmIOdQq+MzSHBKcQdaQ8gJvpIomqDH+SnbkBLqq+miv3VOX0fJKrjiqGMJ
	Cy6iSOSoZWjDgpoibzK485rfYlfhcn13ihnMso+jxOd3mSksg1bsk6J3Owx7/fVPdUYr
	DS0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=TBancfJY0kPayYigADYp1Dje7h3cRDk6OY1MQWT8SJg=;
	b=Ltzlzy8VrxfA/nbNZruuAu5djAM548XnqVfp+YRpUa4aeEGRQsH0QHFtUY9fm4H6h9
	2LoxcDbuPE4cEuJ40J6x3kS74875x8QSyCijY2tYlhCDFBcbP3JMPolr5ET1qM7XxP9E
	rWRmvY+KZRQG5w3GRdzD4rMb9lR7E4n9WDhOCQ9q7Z1YxFMvu+sNj0Aw5Lw97PPIvW6B
	bL6ZUZVk+gGBW/GCBjTxN5AKIznjyzHSlcod5n6hmKPp4NDcQACcN8iLoUwdNfEirE8g
	wlhyEdYV2eF76pH695sJ49FxDABdPdvtsXWZ2mNFetfZJXRrOYtHQp/5FtnaC+YBTl7w
	EYtQ==
X-Gm-Message-State: AOUpUlG2FSisDdZnzz9AAkYhkEuL3KY+HE8ESNeQ5e/N4BGkxd6Z/Uri
	Z2+xBTKvELDRa7M48RihE0y5klZzgUQ3ChRfYdY=
X-Google-Smtp-Source: AA+uWPy2aYy7PM72bO2Un5sa4RyrjfgtLl+vE/tWNTW4J9TLYVVH1v8iIK8t42iKbnfQTfNVlk43SaZJl2+pgShCSVE=
X-Received: by 2002:aca:4fcf:: with SMTP id
	d198-v6mr16582728oib.51.1534172362259; 
	Mon, 13 Aug 2018 07:59:22 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a4a:90c5:0:0:0:0:0 with HTTP; Mon, 13 Aug 2018 07:59:21
	-0700 (PDT)
In-Reply-To: <b936607d-dd70-47a1-826e-b245a57a7c79@gmail.com>
References: <1534150507-171031-1-git-send-email-changqing.li@windriver.com>
	<b936607d-dd70-47a1-826e-b245a57a7c79@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 13 Aug 2018 16:59:21 +0200
Message-ID: <CANNYZj_Fmqpz1bS8XMDsReaeg1s9wBQ2JWLCDt0_MMez-S_tKQ@mail.gmail.com>
To: akuster808 <akuster808@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] bind: upgrade 9.11.4 -> 9.13.2
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
X-List-Received-Date: Mon, 13 Aug 2018 14:59:21 -0000
Content-Type: text/plain; charset="UTF-8"

However, for the upcoming YP release, it's better to settle on
something that expires later than 2020. How is 9.12.x currently?

Alex

2018-08-13 16:37 GMT+02:00 akuster808 <akuster808@gmail.com>:
>
>
> On 08/13/2018 01:55 AM, changqing.li@windriver.com wrote:
>> From: Changqing Li <changqing.li@windriver.com>
>>
>> Signed-off-by: Changqing Li <changqing.li@windriver.com>
>
> Is there a reason why this version was selected? 9.13 is still under
> development and ISC in not recommending  this version for production.
> 9.11 EOL is 2020.
>
> We should keep one long term version around if you need bleeding edge.
>
> - armin
>> ---
>>  meta/recipes-connectivity/bind/{bind_9.11.4.bb => bind_9.13.2.bb} | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>  rename meta/recipes-connectivity/bind/{bind_9.11.4.bb => bind_9.13.2.bb} (97%)
>>
>> diff --git a/meta/recipes-connectivity/bind/bind_9.11.4.bb b/meta/recipes-connectivity/bind/bind_9.13.2.bb
>> similarity index 97%
>> rename from meta/recipes-connectivity/bind/bind_9.11.4.bb
>> rename to meta/recipes-connectivity/bind/bind_9.13.2.bb
>> index 7522fdb..08ebd24 100644
>> --- a/meta/recipes-connectivity/bind/bind_9.11.4.bb
>> +++ b/meta/recipes-connectivity/bind/bind_9.13.2.bb
>> @@ -19,8 +19,8 @@ SRC_URI = "https://ftp.isc.org/isc/bind9/${PV}/${BPN}-${PV}.tar.gz \
>>             file://0001-lib-dns-gen.c-fix-too-long-error.patch \
>>  "
>>
>> -SRC_URI[md5sum] = "9b4834d78f30cdb796ce437262272a36"
>> -SRC_URI[sha256sum] = "595070b031f869f8939656b5a5d11b121211967f15f6afeafa895df745279617"
>> +SRC_URI[md5sum] = "01d0524016ac15ea3f4b6c77d99db0b2"
>> +SRC_URI[sha256sum] = "6c044e9ea81add9dbbd2f5dfc224964cc6b6e364e43a8d6d8b574d9282651802"
>>
>>  UPSTREAM_CHECK_URI = "https://ftp.isc.org/isc/bind9/"
>>  UPSTREAM_CHECK_REGEX = "(?P<pver>9(\.\d+)+(-P\d+)*)/"
>
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

