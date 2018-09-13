Return-Path: <alex.kanavin@gmail.com>
Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com
	[209.85.210.53])
	by mail.openembedded.org (Postfix) with ESMTP id 6A45B79920
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Sep 2018 16:47:35 +0000 (UTC)
Received: by mail-ot1-f53.google.com with SMTP id i10-v6so1879192oth.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Sep 2018 09:47:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=PoCm4lD6DOvPLTOp4bWsYlkaBtKD0GOFs4auM6k7yGs=;
	b=KEM+sw6+nE3eLyH8VXhgb6mrWzCH28i2oDYoQFYuB8Sj4kzhpdSekvAWL0PTWUsBZQ
	kJ0Ugj1StDRST2p/HukutRgFDo9WUNAjLyomTxvmDwrmc+pQSCrXCrkFTkGxw/QHA7Sb
	aEBOP4SNzO8jFjIAn3pCVJxDvLk+6Lx/NOHsZI0cHIAzg/+yUt+LuFyqRRvL8bISIm/r
	7oPvtYaUVqx/uUFBO/i4sBMX0ueJchZVLPFWdS1G29656lQXKTE6vmo2CFkv4KXNFPan
	p8Sz6R542dPcvtFW3I+5TQwiYcJwT3L6nnpmLXZM8WeDoVPaDVM2mvDdYK13vV09r8cx
	sdew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=PoCm4lD6DOvPLTOp4bWsYlkaBtKD0GOFs4auM6k7yGs=;
	b=qi9TW35mSjg6cwI/JgI6u+R3PS70/etRvpMjY2LDc6Y0UaaR2oLidM+BM4mdfH/tWZ
	PJS4OeHfGie69wl0CApfDRfyaKlPlx7gi+LNOJsIMgeKYbhKQIoqPnnF+s3Tr+Q5bnm4
	a0pKBrWdUBIPRjwarH0fcFenryi4iyr8bu8WvOk1uXOVScPX1Oxoqi0L0KGvGwFnYKx0
	sxWDUxHJDCj4R+2M7uNjcTylffccn0TIJ/EvLSCcz17Z+P/NfRcTzVFWh9wAki8u+8gF
	WLgsgY+YynaJPNPeHoC3jegIcrFwdO3LaJu6LX7TKeGDVPjkutpivKdaJQAD0j2ysl09
	MQxw==
X-Gm-Message-State: APzg51AwmVF8cAhX8P24vCih71a8615sMWE9/Z5GFKMxvAN3IsH7E55C
	lItjg2IcWsoOAcXmVurrR3qpUbeuFqdN5bErIAJpYQ==
X-Google-Smtp-Source: ANB0VdbTxh4Tbo66IYULIyJb/6pMilwrOuUHpMrqP909hGrJ8JtG+Hthyld/qZQ8JJwQahwDI55D1AjLmqHg9XXv32g=
X-Received: by 2002:a9d:2816:: with SMTP id
	m22-v6mr1687540otb.22.1536857256231; 
	Thu, 13 Sep 2018 09:47:36 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a4a:b48b:0:0:0:0:0 with HTTP; Thu, 13 Sep 2018 09:47:35
	-0700 (PDT)
In-Reply-To: <CAJTo0LYgS39aSN5djToJ+xqh=tyGxWnr7DZg-sS_b6RntXAn2w@mail.gmail.com>
References: <alw21y00P0lLAyC01lw2NN@charter.net>
	<CAJTo0LYgS39aSN5djToJ+xqh=tyGxWnr7DZg-sS_b6RntXAn2w@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 13 Sep 2018 18:47:35 +0200
Message-ID: <CANNYZj8sMDdpDR_B389sABajPa6VEFbR4gcRr7O0QNRNva0y5A@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, joseph-reynolds@charter.net
Subject: Re: [PATCH v2] dropbear: disable medium-strength ssh ciphers
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
X-List-Received-Date: Thu, 13 Sep 2018 16:47:35 -0000
Content-Type: text/plain; charset="UTF-8"

Actually, I'd rather have an 'upstream first' policy in this specific
case. If the change is good and desirable, please work with the
upstream to merge it there.

Alex

2018-09-13 18:00 GMT+02:00 Burton, Ross <ross.burton@intel.com>:
> This still can't be actually used, because dropbear won't be looking
> in the recipe folder and nothing puts that file into the source tree.
> Put a #error in it if you don't believe me. :)
>
> Ross
>
> On 12 September 2018 at 22:56,  <joseph-reynolds@charter.net> wrote:
>> This changes the Dropbear SSH server configuration so it will not
>> accept medium-strength encryption ciphers including: CBC mode, MD5,
>> 96-bit MAC, and triple DES.  This is consistent with the default
>> supported OpenSSH ciphers.
>>
>> Upstream-Status: Pending
>>
>> Signed-off-by: Joseph Reynolds <joseph-reynolds@charter.net>
>> ---
>>  meta/recipes-core/dropbear/dropbear/localoptions.h | 8 ++++++++
>>  1 file changed, 8 insertions(+)
>>  create mode 100644 meta/recipes-core/dropbear/dropbear/localoptions.h
>>
>> diff --git a/meta/recipes-core/dropbear/dropbear/localoptions.h
>> b/meta/recipes-core/dropbear/dropbear/localoptions.h
>> new file mode 100644
>> index 0000000..ec48c26
>> --- /dev/null
>> +++ b/meta/recipes-core/dropbear/dropbear/localoptions.h
>> @@ -0,0 +1,8 @@
>> +/* Customize dropbear per default_options.h in the dropbear project */
>> +
>> +/* Disable insecure ciphers */
>> +#define DROPBEAR_TWOFISH256 0
>> +#define DROPBEAR_TWOFISH128 0
>> +#define DROPBEAR_ENABLE_CBC_MODE 0
>> +#define DROPBEAR_SHA1_HMAC 0
>> +#define DROPBEAR_SHA1_96_HMAC 0
>> --
>> 1.8.3.1
>>
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

