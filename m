Return-Path: <armccurdy@gmail.com>
Received: from mail-ua0-f177.google.com (mail-ua0-f177.google.com
	[209.85.217.177])
	by mail.openembedded.org (Postfix) with ESMTP id 46BA674B11
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 May 2018 20:00:57 +0000 (UTC)
Received: by mail-ua0-f177.google.com with SMTP id f3so19197137uan.9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 07 May 2018 13:00:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=rOutvQsY67dPsORPQ8Wz1sf6eDi1goztBYJr7/Frn6k=;
	b=Tvn/tA4LvyhkiMaNTIEOHYRJdd8o6X1VwjYhAnIkd2IrIf5lXsWHVFoHh+XCESiWWy
	v44pcUHQRpG6uFNrJ3ZaVmYApfEBuSswjb9oWrPB5UHRuK+KkpS7g9HOQqvuKDZPynLA
	w3/Kvl71BG3XrCoE3xrPstLEZ54y1uhqbJKZMbxZK/BnHyrv6dhUeQCmmyQOD++ErYq3
	e5Tj6AWkSZiU2IZAB83gRfykCmp6cZES7MJHMjBpsJ8HLA896diDm8jmGtEJpPzKNheF
	EVCIWV2MdDK2Sd+BiKx6TxFqNq8v6Z+Ih5nmDnM7nS8JEos6ZlUTVc3yTqxyqEdtL/6X
	3Skw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=rOutvQsY67dPsORPQ8Wz1sf6eDi1goztBYJr7/Frn6k=;
	b=C3tvbMkjH0htMbi4DOkNRNoP0dM0zZsWdDRD/j/6l2J8sMVhAAuyP9tHppLwdHc8DQ
	z5S9eduu6gX7U/2MXYwZEbbZuHF+RmCbIaIksk3BHUKQb74gn57LSQArKi2pXoxLMYxS
	fkiFL/RwzWfJr/hTqLJ0UZetUxj4RL8NOfveXWWQBA7rCiu3irU+hYHHAzEhMybnoJ8H
	xp3Or+h8DhQhN9ilPbbxz48T7Q41gbYEsJI45HNdBCbXUmhf83ojymnVJNoHMYRdF1Uq
	64d2RHrMENqClq/qmedCBiRn3/6hOB/GsOHkR7njL7iufN7Cmyiz5R2xc/cU6FItnwoM
	NFZw==
X-Gm-Message-State: ALQs6tC8/Y3rDZ7joLIqBqJF4QsV8JR/xYrA4S9hdCPFRicFcfILfKdn
	QVFxMgaBCEpGRnw6YA75R2GirQ8EL/PAfQ0Uiz4=
X-Google-Smtp-Source: AB8JxZqlLLGF+1RwGG3sSyW79XOdOVVpXkv/z4pFGUI+or2WuqYM4ocCf9Wlqg+BJPx3Fd7Q6mb7FrI3jelCuy2mEMU=
X-Received: by 10.159.40.35 with SMTP id c32mr34650216uac.193.1525723257956;
	Mon, 07 May 2018 13:00:57 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.176.48.148 with HTTP; Mon, 7 May 2018 13:00:57 -0700 (PDT)
In-Reply-To: <d962987c-6698-365c-6771-bdcf8a156051@windriver.com>
References: <CACAZDOmB7+7WfZfzt_qxinq48ANmsbm_q0nrmneAuN7gM2pJvQ@mail.gmail.com>
	<dc9619db-2ee9-131a-fe29-614308f0495e@linux.intel.com>
	<CACAZDOk8m5pXrny5etfe-cYNHkRj33w1LX1SfnBKDcW0iq6nuQ@mail.gmail.com>
	<d962987c-6698-365c-6771-bdcf8a156051@windriver.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Mon, 7 May 2018 13:00:57 -0700
Message-ID: <CAJ86T=V1X+FRW7fNS3r0UUosH8pUH_QEuzun29=sDuqNzUUBBw@mail.gmail.com>
To: Mark Hatle <mark.hatle@windriver.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: cURL recipe: SSL backend
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
X-List-Received-Date: Mon, 07 May 2018 20:00:57 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, May 7, 2018 at 7:17 AM, Mark Hatle <mark.hatle@windriver.com> wrote:
> On 5/7/18 8:16 AM, Viacheslav Salnikov wrote:
>> Alright, good point.
>>
>> But what if I need to use openssl instead of gnutls on Target? Can it be changed
>> without side effects?

The behaviour of curl when built with gnutls -vs- openssl in OE is not
the same. There are things (maybe related to certificates?) which work
fine with openssl but don't work with gnutls. Unfortunately I don't
have many more details than that - all the OE distros I use have
switched to using openssl, so going back to figure out what's wrong
with gnutls has never been a high priority. If you switch you should
test carefully, but from my experience openssl works better.

> This is why the package config settins are present in the curl recipe.  You can
> adjust the setting to use whatever TLS engine you want in your distribution or
> project configuration.
>
> PACKAGECONFIG_pn-curl = "ipv6 proxy ssl threaded-resolver zlib"

This will work, but a more robust approach may be to use _append and
_remove to change PACKAGECONFIG options (rather than over-riding with
an absolute set of options, which may become out of sync with the
defaults in the main recipe). e.g.

  PACKAGECONFIG_remove_pn-curl = "gnutls"
  PACKAGECONFIG_append_pn-curl = " ssl"

> or any other combination of available options..
>
> --Mark
>
>> Regards,
>>
>> 2018-05-07 15:59 GMT+03:00 Alexander Kanavin <alexander.kanavin@linux.intel.com
>> <mailto:alexander.kanavin@linux.intel.com>>:
>>
>>     On 05/07/2018 03:51 PM, Viacheslav Salnikov wrote:
>>
>>         cULR is built with GNUTLS for Target but OpenSSL is used for native and SDK.
>>
>>         So my question is: why GNUTLS is used only for target? Is it necessary
>>         for some good reason? Documentation for cURL has no explicit answer for
>>         that.
>>
>>         Could somebody help me to find the answer?
>>
>>
>>     I think enabling gnutls on the native side would add a ton of dependencies
>>     to build, and so openssl (which is more self-contained) is selected there.
>>
>>     Alex
>>
>>
>>
>>
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

