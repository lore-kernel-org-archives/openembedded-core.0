Return-Path: <armccurdy@gmail.com>
Received: from mail-vk0-f67.google.com (mail-vk0-f67.google.com
	[209.85.213.67])
	by mail.openembedded.org (Postfix) with ESMTP id AFC9574CB4
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Jul 2018 03:07:06 +0000 (UTC)
Received: by mail-vk0-f67.google.com with SMTP id o202-v6so9649080vko.2
	for <openembedded-core@lists.openembedded.org>;
	Sun, 08 Jul 2018 20:07:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=ckm5S285oqvUc6B5K0qPeRPKTYDPzZsaiEmWvMfX+3M=;
	b=KXft0rHxZ8oGytKFXpR0HSWxE3WvYGMm9v5A6xhfDc7lJVrqHqIivhRHcIZWcyCH3X
	2jNsjFupsXI77aMjXr/5kzF7dCWSBpMVPW2hA86eus2249REkDz5vRZV9+ffVhwUGBKz
	oWfRWd202NdftnwvYfW/1cEdxMe8J1dxfjoLFUooQZmyR91C6mSy6fxS7Mc62lC7K25X
	Ua6xt+RQB0y+5sE5JcHOQXyvdTee7OW7Eq1UAoDZFVembKXOlNadLqeVqt2eFcSGs0my
	V2HaqVjCbCK4cE+R2aToWMU6qM7iDrmSJdksHjKgzDA5COW0rtSRu6kaoC6qQ1wgAugD
	p7RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=ckm5S285oqvUc6B5K0qPeRPKTYDPzZsaiEmWvMfX+3M=;
	b=UbC6ylRWJFfj15CYmTb9xNXiP9dB9NFaePQrk700zpjRpd+4LrFyyf8zD16cxeaPKU
	wN26L1mEkHDNmXt0FvaMD1/gctFUxck2oMzT/m8DNxFk/KYSJwmA5eaYxcvMt+nP1qBh
	U0RoMF7og81Ao1fby4OZT6CUwidAYiiE2Y3FM85qPKoSNVaGvIrOz4Dx1hEbocNPndcC
	UF4Dm+OEGhk3T7tauTxzCXdr/F84fMXqAKg0IPSAKSHZfc1X04v8a/6nDvUEz+cxW43B
	zjm7seyO2VXx9WXddvBCAezEU1XQuyS2ZuPKEUR106mDR+DNKPVUBrdf6+VCpOO56U7Z
	P7Xg==
X-Gm-Message-State: APt69E3QEfvQhZ3Dy0rlLONkG0Bbpui9WJAmp7u3P1YiTMBP2XWeCorK
	EcgASDxvhbCzkSMAunLBuUauAasHuJAuiwMuYU4=
X-Google-Smtp-Source: AAOMgpcq+X9iA1rjdtj3GSe0Z5yq1QTxHYI+F6rfmEe0txHcd57T/subJ5t3PI0TFJ/4BKLByyS4oORmMNrzQF0Cix0=
X-Received: by 2002:a1f:88:: with SMTP id
	130-v6mr10777085vka.154.1531105627432; 
	Sun, 08 Jul 2018 20:07:07 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ab0:2a5:0:0:0:0:0 with HTTP;
	Sun, 8 Jul 2018 20:07:07 -0700 (PDT)
In-Reply-To: <CANNYZj_aKU=fV7AqF17CVRzgRSC9thHO9aZcw8S5CuHVCB0PYA@mail.gmail.com>
References: <1530903954-20926-1-git-send-email-armccurdy@gmail.com>
	<CANNYZj_aKU=fV7AqF17CVRzgRSC9thHO9aZcw8S5CuHVCB0PYA@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Sun, 8 Jul 2018 20:07:07 -0700
Message-ID: <CAJ86T=VnYJ8VBKnep_mXXdwOZtij561NNM1_uSyiV+S1Ob76Rg@mail.gmail.com>
To: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] openssl_1.1: avoid using += with an over-ride
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
X-List-Received-Date: Mon, 09 Jul 2018 03:07:06 -0000
Content-Type: text/plain; charset="UTF-8"

On Sat, Jul 7, 2018 at 1:52 AM, Alexander Kanavin
<alex.kanavin@gmail.com> wrote:
> We really need a QA warning for this issue. Nobody's going to remember
> what the correct way is. Can you look into it please?

It should be a parsing error, not a QA warning. If a feature of the
language is mistakenly used so often (100% of the time, as far as I
can tell) then we should just have the parser reject it.

> 2018-07-06 21:05 GMT+02:00 Andre McCurdy <armccurdy@gmail.com>:
>> Using += with an over-ride can be a source of confusion so try to
>> avoid the construct in core recipes.
>>
>> The current usage is incorrect and prevents the aarch64 and musl
>> specific config options from being active together.
>>
>> Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
>> ---
>>  meta/recipes-connectivity/openssl/openssl_1.1.0h.bb | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/meta/recipes-connectivity/openssl/openssl_1.1.0h.bb b/meta/recipes-connectivity/openssl/openssl_1.1.0h.bb
>> index 94b75eb..ac2ad81 100644
>> --- a/meta/recipes-connectivity/openssl/openssl_1.1.0h.bb
>> +++ b/meta/recipes-connectivity/openssl/openssl_1.1.0h.bb
>> @@ -122,12 +122,12 @@ do_configure () {
>>  #| engines/afalg/e_afalg.c:110:20: error: '__NR_eventfd' undeclared (first use in this function)
>>  #|      return syscall(__NR_eventfd, n);
>>  #|                     ^~~~~~~~~~~~
>> -EXTRA_OECONF_aarch64 += "no-afalgeng"
>> +EXTRA_OECONF_append_aarch64 = " no-afalgeng"
>>
>>  #| ./libcrypto.so: undefined reference to `getcontext'
>>  #| ./libcrypto.so: undefined reference to `setcontext'
>>  #| ./libcrypto.so: undefined reference to `makecontext'
>> -EXTRA_OECONF_libc-musl += "-DOPENSSL_NO_ASYNC"
>> +EXTRA_OECONF_append_libc-musl = " -DOPENSSL_NO_ASYNC"
>>
>>  do_install () {
>>          oe_runmake DESTDIR="${D}" MANDIR="${mandir}" MANSUFFIX=ssl install
>> --
>> 1.9.1
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core

