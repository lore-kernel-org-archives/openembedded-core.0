Return-Path: <raj.khem@gmail.com>
Received: from mail-ua0-f196.google.com (mail-ua0-f196.google.com
	[209.85.217.196])
	by mail.openembedded.org (Postfix) with ESMTP id CDC7271B40
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Dec 2016 16:51:55 +0000 (UTC)
Received: by mail-ua0-f196.google.com with SMTP id b35so21760245uaa.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 01 Dec 2016 08:51:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Jfke9b8I8yfA7Us+C6QDBUSPVdokHsFpCcDfJXZ8Skw=;
	b=x/pDSX1cV2u8vR1Vd5FLrIFWjeoXzWbxDzwad250+LU21b/7IHsANbLUrMUhNsQX0m
	uOmJN9Jmiwbzet7YV6K2PieSQMGWzF8Rc8gK+SQ2l2MzJ2CnUZPXaTWVUbKFej42aXAw
	guEtuldfDOKmUoJMrk8hTVxvmgygORtdXPS3BS/EHlwK7D2SKNI4lc0tnbZaoDTm16Yp
	V6vvYFPGt4IuQ9L8FhYtRfSaX5+1POOW6ICWJHeYpKWkPcgSHp+IbJulDS8xpfKMHdK8
	ZoZqyd6jkSiW2Mt/QrTPfn1ZRuBtamd5L2VMNJBt3ekQnlGOtb1aZnSs8JsRTfwt0yDm
	n/9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Jfke9b8I8yfA7Us+C6QDBUSPVdokHsFpCcDfJXZ8Skw=;
	b=Vq/wOmP8M82+Q/ieRVPCrtucp/YF0HlEkxbhwTNI20bk5KgnpBGuhfJu0HS21qRIfa
	4A5nQWjAGkUPx/EzeS099gLeR7+f433DjgJzy2QunsQief0GkWZOVQgqnTPebUCJwI3V
	Fs5LqqpcwhS0FPrdJy75htu0h+Bns1VhKt9oEWtajNQQBpPPaFOfrQ39nqxGMhpIoSQ9
	IY5t0t+eDD0oI5ndRC6FZEREUk5lYgXhddQyMA1hg6hCrcVfz4cn+vat9b/FL+6LaAm8
	/vr7iZSzc2zqELXpzI/JK0UCqigoYwDeGA31UI6dR/Q/xVvC07dK1suFNlgC6zxxCZf1
	wxtw==
X-Gm-Message-State: AKaTC00G9NtuNDAKH2MBo84IyNQ8mkzSrrdZdrnfFXcHVhXbTLBUPAozOal2lZQY+50oGIZdjvG17ix0hPxaiA==
X-Received: by 10.176.1.17 with SMTP id 17mr24274246uak.143.1480611116798;
	Thu, 01 Dec 2016 08:51:56 -0800 (PST)
MIME-Version: 1.0
Received: by 10.159.48.87 with HTTP; Thu, 1 Dec 2016 08:51:26 -0800 (PST)
In-Reply-To: <2b3dfd87-29e5-f50a-a0a1-bedd604b2bd3@opendreambox.org>
References: <1480549817-16636-1-git-send-email-obi@opendreambox.org>
	<15B74A76-F494-49BC-9BB6-6D0479495860@gmail.com>
	<2b3dfd87-29e5-f50a-a0a1-bedd604b2bd3@opendreambox.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 1 Dec 2016 08:51:26 -0800
Message-ID: <CAMKF1spwRmH3KfQ3ZS1WvWiqDhhXqFK=Bw40zfgGUzP32ubdVw@mail.gmail.com>
To: Andreas Oberritter <obi@opendreambox.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] libc-package.bbclass: split binary localedata even more if asked to
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
X-List-Received-Date: Thu, 01 Dec 2016 16:51:57 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Dec 1, 2016 at 4:33 AM, Andreas Oberritter <obi@opendreambox.org> wrote:
> On 01.12.2016 05:02, Khem Raj wrote:
>>
>>> On Nov 30, 2016, at 3:50 PM, Andreas Oberritter <obi@opendreambox.org> wrote:
>>>
>>> If GLIBC_SPLIT_LC_PACKAGES is set to a non-zero value, convert
>>> glibc-binary-localedata-XX-YY to be a meta package depending on
>>> glibc-binary-localedata-XX-YY-lc-address and so on. This enables
>>> saving quite some space if someone doesn't need LC_COLLATE for
>>> example.
>>>
>>> Some regex code was removed from output_locale_binary_rdepends,
>>> because legitimize_package_name already converts to lowercase.
>>>
>>
>> This looks ok. May be add some documentation around
>> GLIBC_SPLIT_LC_PACKAGES in extended local.conf sample.
>
> OK, will send a v2.
>
>> I am worried about dependency changes, may be comparing old and new
>> would help.
>
> The generated meta packages make sure that dependencies stay intact. I
> didn't observe any deviation in my test builds, with or without setting
> GLIBC_SPLIT_LC_PACKAGES to 1.

Thats comforting. did you also try a online package upgrade ?

>
> Regards,
> Andreas
>

