Return-Path: <net147@gmail.com>
Received: from mail-ve0-f169.google.com (mail-ve0-f169.google.com
	[209.85.128.169])
	by mail.openembedded.org (Postfix) with ESMTP id 2CD706A413
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Jun 2013 08:29:12 +0000 (UTC)
Received: by mail-ve0-f169.google.com with SMTP id m1so4862253ves.28
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Jun 2013 01:29:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=yn5FMD0B1jDwM5xrOL5Sa7Uk+wNVbeHVJeWYtdzrdb4=;
	b=JGca+t1vKoNckR1lq3OUfdO+h0bX0ElUK7XOn7FAvZwCnX8+9E3h1QMv3bat5GQWen
	jhos0DXW/gNaope2GQ6sTyGYZQu7kL0Yf5hhc4tPxM4Ym/P0NbTTBKBl7WbjayhEId0g
	CZaQTjVtRUFurNcvAjYFxBCbJ3+8fvpAgz1six1ywcQ3aLhwPhvclNVVF7e4YzGZd5BO
	vcDqCsAfa++OsQM5wDqtpaI0eayosBkXL1Bv1RKVI9ATplKbwHxZD9Dt0eXcPKeNGBEM
	vI56snl5EzwJdSrPuGJ5SmMi/lIbhxrdJNgTxARk5dY2Zen0bRm09VEWDXYKhFeqsbf+
	yJ8g==
MIME-Version: 1.0
X-Received: by 10.220.105.197 with SMTP id u5mr2119289vco.8.1371716953072;
	Thu, 20 Jun 2013 01:29:13 -0700 (PDT)
Received: by 10.58.68.170 with HTTP; Thu, 20 Jun 2013 01:29:12 -0700 (PDT)
In-Reply-To: <1371710061.8611.26.camel@pb-ThinkPad-R50e>
References: <1371693296-6834-1-git-send-email-net147@gmail.com>
	<1371710061.8611.26.camel@pb-ThinkPad-R50e>
Date: Thu, 20 Jun 2013 18:29:12 +1000
Message-ID: <CANwerB1UzzrNA20Uos8EiL_kqKAYDfKCW61ASMCfLf4NrVF0GQ@mail.gmail.com>
From: Jonathan Liu <net147@gmail.com>
To: Phil Blundell <pb@pbcl.net>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] libx11: enable Xcms by default
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
X-List-Received-Date: Thu, 20 Jun 2013 08:29:12 -0000
Content-Type: text/plain; charset=UTF-8

On 20 June 2013 16:34, Phil Blundell <pb@pbcl.net> wrote:
> On Thu, 2013-06-20 at 11:54 +1000, Jonathan Liu wrote:
>> The following do not work if Xcms is not enabled in libx11:
>> - starting xterm and doing ls --color / fails to color code the
>>   directories:
>>   xterm: Cannot allocate color "rgb:5c/5c/ff"
>> - xsetroot -solid rgb:5c/5c/ff fails with the following error:
>>   xsetroot:  unknown color "rgb:5c/5c/ff"
>> - xsetroot -solid rgbi:1.0/1.0/1.0 fails with the following error:
>>   xsetroot:  unknown color "rgbi:1.0/1.0/1.0"
>>
>> More specifically, applications that pass Xcms color names to
>> XParseColor do not work properly.
>
> The comment that you are deleting suggests that this behaviour is by
> design:
>
>> -# Let people with incredibly archaic requirements enable Xcms, but disable it by
>> -# default.
>
> Since there's already a PACKAGECONFIG option for this, can't you just
> enable that in your distro configuration rather than changing the
> default?  I don't think it's ever been the expectation that the default
> settings will represent "maximum functionality".
>
> p.
>
>

I already do enable it in my distro configuration. The motivation for
having this enabled by default is that discovering that applications
don't work as expected and then trying to track down what is causing
it can take up quite a bit of time. This time would have been better
spent on actual application development.

If it is not needed, the PACKAGECONFIG can be overridden or
libx11-diet used instead.

Regards,
Jonathan

