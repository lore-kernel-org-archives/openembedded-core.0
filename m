Return-Path: <raj.khem@gmail.com>
Received: from mail-ua0-f176.google.com (mail-ua0-f176.google.com
	[209.85.217.176])
	by mail.openembedded.org (Postfix) with ESMTP id B80C571A28
	for <openembedded-core@lists.openembedded.org>;
	Sun, 30 Oct 2016 17:40:03 +0000 (UTC)
Received: by mail-ua0-f176.google.com with SMTP id 51so71619918uai.1
	for <openembedded-core@lists.openembedded.org>;
	Sun, 30 Oct 2016 10:40:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=6uytqjZb/Uk/7CfX+xXCzlMhHepN4v1dUyAQ6046GHI=;
	b=IZmRr6+mSu2ER7ClKerwkf6sery4VN6uDl1Scxw860QU/cgdxbihg0CAsOWFEmrj5Q
	CYN9ZfUwYMT2gUQdrtSyQKdfspO+paGs0pkIsE3qnvJVgQLo3FFSK2feLRgRK+kk2z89
	0u4LbFicpQhj+Ekv7QQCAns5Nu3DLiz+YLZGw4nb42/6mOfu53RfnyR+3hqBCIqnmd1O
	qwpwEet7ou8bQTPEAp/y2YNCr6XYKoYtgM2USv3bx463DrgOrF1ZcXyVBXr6S8W2Kt1l
	r0IX1e3BPzdKVURlH1HH893WJOGDPE9aCq/5kyLJwccC+B+9qksN1Vsz1PwtUq9WZIJ+
	jjiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=6uytqjZb/Uk/7CfX+xXCzlMhHepN4v1dUyAQ6046GHI=;
	b=CgKE6sSR+s+DIobJrFttb0mSJwkiDB99XWT2SOT+nBfQaxNZNo+21YKTALMIzSlS9G
	xwCZ9J9tmaWCMQv5hzFfdqFXKR185MbXVT/Z7o35qn7qGsP5rE7gFxjaGKTNYT1YCt7y
	8ZAqcnuagPvqlL6eyqN4bUR8CjEZjzOqEiBw4KMWdxrdLOz4+omg/OlaxN0bQ0NJddQn
	W3CRCaWVP1n6FcoyF0AhxdOZ/hFNQeKpVc5ekveRuBYrjuS6lqz3JgFok8uWXRWgMNJ2
	OSzSPADp3xissiWDDTIhxb2eZCeaTNAVEUesFVhOFxbd5/1bobICeaEoDufQZckfpsZV
	wVRA==
X-Gm-Message-State: ABUngvd4QItYc8sDhf65Vt120vtBrpc9H7nptFYEar53GgIe5Yxu0QLkfL2YNMyIVQrxr1z1SPSSqUfOAH45YQ==
X-Received: by 10.176.0.180 with SMTP id 49mr2967398uaj.32.1477849204446; Sun,
	30 Oct 2016 10:40:04 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.176.5.136 with HTTP; Sun, 30 Oct 2016 10:39:34 -0700 (PDT)
In-Reply-To: <1477845629.23123.20.camel@linuxfoundation.org>
References: <20161029194615.19954-1-raj.khem@gmail.com>
	<1477845629.23123.20.camel@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 30 Oct 2016 10:39:34 -0700
Message-ID: <CAMKF1sriW41+1MTxTuBHQAbeR+b0LM65fkuUDRL-HapKSLze0A@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] boost: Fix SRC_URI checksums
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
X-List-Received-Date: Sun, 30 Oct 2016 17:40:03 -0000
Content-Type: text/plain; charset=UTF-8

On Sun, Oct 30, 2016 at 9:40 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Sat, 2016-10-29 at 12:46 -0700, Khem Raj wrote:
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>
> Why, what happened?

I haven't checked in detail but after the recent master commits my
builds started to fail with checksum errors.
since it was happening on two different machines I though it might
have been over sight.
>
> Cheers,
>
> Richard
>
>
>> ---
>>  meta/recipes-support/boost/boost-1.62.0.inc | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/meta/recipes-support/boost/boost-1.62.0.inc
>> b/meta/recipes-support/boost/boost-1.62.0.inc
>> index a097ea1..1144ac9 100644
>> --- a/meta/recipes-support/boost/boost-1.62.0.inc
>> +++ b/meta/recipes-support/boost/boost-1.62.0.inc
>> @@ -13,7 +13,7 @@ BOOST_P = "boost_${BOOST_VER}"
>>
>>  SRC_URI = "${SOURCEFORGE_MIRROR}/boost/${BOOST_P}.tar.bz2"
>>
>> -SRC_URI[md5sum] = "7ef085456c48c49a7fe8237f07e5f674"
>> -SRC_URI[sha256sum] =
>> "bce80293052e2d6230f1bec9b7524b33412e4fb26e9723460a0f362ac15b7acb"
>> +SRC_URI[md5sum] = "21b799e5d35ba2beef75b225deaf199a"
>> +SRC_URI[sha256sum] =
>> "a715dc2adff2d451719352b1e863d78cbb100a03f7ed76097c89b9016c59091e"
>>
>>  S = "${WORKDIR}/${BOOST_P}"
>> --
>> 2.10.1
>>

