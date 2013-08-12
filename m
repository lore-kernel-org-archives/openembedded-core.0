Return-Path: <eric.nelson@boundarydevices.com>
Received: from mail-pd0-f182.google.com (mail-pd0-f182.google.com
	[209.85.192.182])
	by mail.openembedded.org (Postfix) with ESMTP id E33CA61222
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Aug 2013 13:58:27 +0000 (UTC)
Received: by mail-pd0-f182.google.com with SMTP id r10so2830886pdi.27
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Aug 2013 06:58:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-gm-message-state:message-id:date:from:user-agent:mime-version:to
	:cc:subject:references:in-reply-to:content-type
	:content-transfer-encoding;
	bh=BuhXesczEe56lb9u+8LnX9XJt6jEHiZcQL+eTpZBJKE=;
	b=CnK/1zEdIt8bBd7xe5pRbkVr77e+0wl2URO6NtNr5lQpLWZZc73o37N75VpSulRvB0
	9QwjgY4fyYvZdPKMvV5dj3Ho+rZ0/HqERt8tl9/8NJZE9+IT4FnaFBtOQGsxED8avtW5
	MXRSjos5UC7xh7FO5XXvNjGJgNZ0pJTmIgkSUG7QcSg/876K6kyce1YSZDToz8ENJgLr
	6XDhHHAQVoz0dDmOel2FZWWFgpA6QBHuw4n+U58/cFfRnL4RyPeFtRzqgPsA/S2COnsl
	Pb3suTLlwKEcq1erMapkOhoF+3spFTxRqafP2GpXco3cPOKtO7Xlxn8ogQg0cNdeisDj
	RzLA==
X-Gm-Message-State: ALoCoQntYSBuQk8PXSL2S9HwXETKp2yGX7TRyWxmkWrdm2DJTZHBo/OitVwhY2R0S1BI+MYLpK0Y
X-Received: by 10.68.6.100 with SMTP id z4mr15509844pbz.187.1376315908577;
	Mon, 12 Aug 2013 06:58:28 -0700 (PDT)
Received: from [192.168.1.8] (ip98-167-230-131.ph.ph.cox.net. [98.167.230.131])
	by mx.google.com with ESMTPSA id
	xe9sm37477650pbc.21.2013.08.12.06.58.26 for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 12 Aug 2013 06:58:27 -0700 (PDT)
Message-ID: <5208EA00.5010505@boundarydevices.com>
Date: Mon, 12 Aug 2013 06:58:24 -0700
From: Eric Nelson <eric.nelson@boundarydevices.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130803 Thunderbird/17.0.8
MIME-Version: 1.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <1376257018-17066-1-git-send-email-eric.nelson@boundarydevices.com>
	<1376291285.27470.33.camel@ted>
In-Reply-To: <1376291285.27470.33.camel@ted>
Cc: denys@ti.com, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] nativesdk-qt4-tools: remove nativesdk-libx11 for qt-embedded
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
X-List-Received-Date: Mon, 12 Aug 2013 13:58:28 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Thanks Richard,

On 08/12/2013 12:08 AM, Richard Purdie wrote:
> On Sun, 2013-08-11 at 14:36 -0700, Eric Nelson wrote:
>> Signed-off-by: Eric Nelson <eric.nelson@boundarydevices.com>
>> ---
>>   meta/recipes-qt/qt4/nativesdk-qt4-tools.inc | 5 ++++-
>>   1 file changed, 4 insertions(+), 1 deletion(-)
>>
>> diff --git a/meta/recipes-qt/qt4/nativesdk-qt4-tools.inc b/meta/recipes-qt/qt4/nativesdk-qt4-tools.inc
>> index cfc6fd8..6ec3225 100644
>> --- a/meta/recipes-qt/qt4/nativesdk-qt4-tools.inc
>> +++ b/meta/recipes-qt/qt4/nativesdk-qt4-tools.inc
>> @@ -1,5 +1,8 @@
>>   DESCRIPTION = "SDK tools for Qt/[X11|Mac|Embedded] version 4.x"
>> -DEPENDS = "nativesdk-zlib nativesdk-dbus nativesdk-libx11 qt4-native"
>> +DEPENDS = "nativesdk-zlib nativesdk-dbus qt4-native"
>> +OVERRIDES="${QTNAME}"
>> +DEPENDS_append_qt = " nativesdk-libx11"
>
> I'm afraid we can't do this since you just broke any other kind of
> override which might get used anywhere by any recipe using this .inc
> file. I'd also be wary of adding something as simple as "qt" into
> overrides since it can match things more widely than you might want.
>

I'm a bit of an OE n00b, and I'm not quite sure how to express this
conditional.

meta-toolchain-qte shouldn't depend on nativesdk-libx11, and I'm
not sure how the dependency can be moved to the X11 recipe
recipes_qt/meta/meta-toolchain-qt.bb.




