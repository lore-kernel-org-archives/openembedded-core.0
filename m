Return-Path: <alistair23@gmail.com>
Received: from mail-lf0-f65.google.com (mail-lf0-f65.google.com
	[209.85.215.65])
	by mail.openembedded.org (Postfix) with ESMTP id CEE2671C9B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Jan 2018 19:28:49 +0000 (UTC)
Received: by mail-lf0-f65.google.com with SMTP id f3so28114257lfe.4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Jan 2018 11:28:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=J5ULIlYIIz33zkXeBSGKEai0JlipcEIx+uyX70rBaOo=;
	b=mGC6lAOa72Op4v2Ukztvo8ghbZ4wYKgpucIZXpJAUtGOV5B1pkrvopeh/telw0eh5J
	4HkD1IRkisomFfKbVBi3tuRohchkpRaGB5If3JDW+Ud0sekStyrTnJ8qro3/jkATpZPI
	QXy8KZRuyiMsGFNU/HH3kNYaTHeTdjGxAvvKdq7HAAm9oy6RKzKlOnu7Udyg02ycGu0a
	Al/YVWz/mEP1vMdBWTl00YTyqVBYJbpxoHXWXNiBQsey4bgWClYEcO9N1UhOHFpAECLO
	9IQ5wP+Xb7/1XNXUCX404oOHKBEp3I+U4VQIIAYKc5oYO0eSQhm8fCYx1D5jcQXAX/Ay
	TCeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=J5ULIlYIIz33zkXeBSGKEai0JlipcEIx+uyX70rBaOo=;
	b=Pg1Vg8hLWpC+9iD6uMhNAlwJQGpjFyRNuVvK+XK1taIpr5xzZl31Sucu1ZUiOl/n1T
	51fcg/980Q/Zb2BpVS6xZhW5N8VtQmR/xvUKuxBkCMouKjHMAT9y8N+YItHZ//YVt0le
	bpcY6hYsRmkMMrQJbtDrAbhL3WoTkylOfjgYcifcrSSKMCvsTv2e88RUeYLcH/gcHiyE
	U0mIwmPuNCnZR0dASX+DQNaULsVT89veS2iNRayqma8jNVaEFZVcvNCEsrHdgW898bGk
	a95yo+4cd4pa/HaxYJG0cvBkOJdz+qAeEX86lUueDqHd5MHMvV6jza+UMVw1c235e7bv
	Hb/Q==
X-Gm-Message-State: AKwxytcAhNPZCJvRDalcGrWuazlpSQYOGquBItsxgdBWEjvKNqycW9Qk
	j33xxFJTCxE+ZhvlHDuqGPF9uNelIcbXsUreYlI=
X-Google-Smtp-Source: ACJfBosSaXpzy6cKc+mLQkEBUmTPIgoamwxi7RMON+Ra1kct/+2T1Mppz3jWxcOk0ldzOwd/exF90HM0uEQVypfBTy8=
X-Received: by 10.46.3.9 with SMTP id 9mr19358830ljd.27.1516303730290; Thu, 18
	Jan 2018 11:28:50 -0800 (PST)
MIME-Version: 1.0
Received: by 10.46.0.86 with HTTP; Thu, 18 Jan 2018 11:28:19 -0800 (PST)
In-Reply-To: <cb001244-b8fa-1425-54fa-98d65d4d43fb@linux.intel.com>
References: <20180118191245.9490-1-alistair.francis@xilinx.com>
	<cb001244-b8fa-1425-54fa-98d65d4d43fb@linux.intel.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 18 Jan 2018 11:28:19 -0800
Message-ID: <CAKmqyKNiny7U1Sdr+LtLSDOUsbENBbgWegP-hmVYTTwjKFJZ+w@mail.gmail.com>
To: Joshua Lock <joshua.g.lock@linux.intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] glib-2.0: Re-add the gettext depend
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
X-List-Received-Date: Thu, 18 Jan 2018 19:28:50 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Jan 18, 2018 at 11:23 AM, Joshua Lock
<joshua.g.lock@linux.intel.com> wrote:
>
>
> On 18/01/18 19:12, Alistair Francis wrote:
>>
>> Commit "glib-2.0: rationalise build dependencies"
>> (8b0ca0cb54c91611213556bdb99316d5e7ac5b3b) broke mingw glib builds with
>> the following error:
>>
>> This patch fixes the issue by re-adding the gettext dependency.
>>
>> Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>
>> ---
>>   meta/recipes-core/glib-2.0/glib.inc | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/meta/recipes-core/glib-2.0/glib.inc
>> b/meta/recipes-core/glib-2.0/glib.inc
>> index 354d95cfe3..e6997ae88f 100644
>> --- a/meta/recipes-core/glib-2.0/glib.inc
>> +++ b/meta/recipes-core/glib-2.0/glib.inc
>> @@ -24,6 +24,7 @@ DEPENDS = "glib-2.0-native \
>>              virtual/libiconv \
>>              libffi \
>>              zlib \
>> +           gettext \
>
>
> If this is only required for mingw we should add it in a mingw override,
> something like (untested):
>
> DEPENDS_mingw32 += "gettext"
>
> That way we:
> a) know that it's a mingw dependency (and to test that toolchain before
> removing)
> b) don't bloat the DEPENDS where gettext isn't a strict requirement.

That seems fine to me, the only issue I see is that previously this
wasn't just a mingw depend, so there could be other causes and mingw
is just what I test.

Alistair

>
>>              ${@bb.utils.contains('PTEST_ENABLED', '1', 'dbus', '', d)}"
>>     PACKAGES += "${PN}-codegen ${PN}-utils"
>>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

