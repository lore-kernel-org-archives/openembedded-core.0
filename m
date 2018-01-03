Return-Path: <alistair23@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 3CDA871B2A
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Jan 2018 19:48:50 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id y82so21441159wmg.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 03 Jan 2018 11:48:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc;
	bh=PLN8pTg7gQN3wLnB5qCyUcBgf1BHKb7HhKSoQJZkmcw=;
	b=FNnpUy7VuPVxzTjfGeZOkQnfnUr5mhkEaqDxG2uLUpyfJ4PlzYGOJQKB+aNCzS4ZwV
	DxGHRCII8hNJ8QkBTJzTNL0zp/iTdwZXZsqw3mjNjqzp34QauXlNJqu27G0m7oGSA9dD
	6d5SzchODnrzphXTiqkh/Pu7v3T7LGaSK7+6U2gshMSOcMVrcdqjkjQdDI66KmB9H2hB
	TM7ukinZ/rVkwgPQEJesUZS9SncNvsFmIH6Bd/B2tIJmot1n2USpRmsbpIWEf1ZJ/MnV
	w99S7BqCJwsxRBw9MSBDVOSJ97Blhhn9zwF/t2OuhHFQzxWBN7Fh2hQTvFe4iMEQTT/R
	0r3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc;
	bh=PLN8pTg7gQN3wLnB5qCyUcBgf1BHKb7HhKSoQJZkmcw=;
	b=fEA1SNeW90iZZkIPCsFOb9kgElTjEjz4eZSXmSIFFdIvn6QFhpEfmA8EvkBw6ZSOwX
	6XC0JH6l8P6DR52Mgo9+bM/oHwC4uLIerujEzRkI0RwSuF7G11dqo+euD+7B/p3RigY3
	MZIklJdzFwJNpVIVgwVigQxE5apQIlbriQlQAaMZs59F6HFMxKjrOEJ1nmjdnvr/y0YK
	dD+AFt+DQxM8HAQmQeMgs/c6BPGz2Y2t2SGo0z+nQjuCok+32zR8iRWjJTAVjzN4UVle
	1Hnrvv2043dvIZoPtnKeTJwaK1eYXqCgy/+9KHFFPHuPWIM2I/hE4qjBx5tEgeqkgcHF
	yL3g==
X-Gm-Message-State: AKGB3mLlVJ94G4ybSEQskqaYlWJUK/Bv7quhbvhJeMJ2YU3TlGqeU7fk
	OAXc1kt114FtOondEOC3D9E+Ht/Y17MjVvNoMno=
X-Google-Smtp-Source: ACJfBosGVpLQtiCFRMZO/1dUYWY8usByP0G1GF7yqcUeyUtekdHQEnmdTrJTJKueh/zLqsJcr5XfakAsMHhq0ZZvCko=
X-Received: by 10.28.152.85 with SMTP id a82mr2116848wme.16.1515008931858;
	Wed, 03 Jan 2018 11:48:51 -0800 (PST)
MIME-Version: 1.0
Sender: alistair23@gmail.com
Received: by 10.28.164.69 with HTTP; Wed, 3 Jan 2018 11:48:21 -0800 (PST)
In-Reply-To: <1514976899.5525.120.camel@linuxfoundation.org>
References: <20180102224935.23756-1-alistair.francis@xilinx.com>
	<1514976899.5525.120.camel@linuxfoundation.org>
From: Alistair Francis <alistair.francis@xilinx.com>
Date: Wed, 3 Jan 2018 11:48:21 -0800
X-Google-Sender-Auth: BwCEVtJkc5MFUn3LFN5pVZFC8PA
Message-ID: <CAKmqyKODeNkBrHNHjAhYt+KbPTS+N13ohj4QbnasDLFjmLJzAA@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] glib-2.0: Remove python3 modules when building for mingw
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
X-List-Received-Date: Wed, 03 Jan 2018 19:48:51 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Jan 3, 2018 at 2:54 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Tue, 2018-01-02 at 14:49 -0800, Alistair Francis wrote:
>> Commit "glib-2.0: Add python3 modules required by gdbus-codegen"
>> (26af3b4b33a34d7e53059b07236f9d5aae5e004a) broke the MinGW build of
>> QEMU. To fix the build remove the python3 RDEPENDS for gdbus-codegen
>> when targeting mingw.
>>
>> Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>
>> ---
>>  meta/recipes-core/glib-2.0/glib.inc | 6 ++++++
>>  1 file changed, 6 insertions(+)
>>
>> diff --git a/meta/recipes-core/glib-2.0/glib.inc b/meta/recipes-
>> core/glib-2.0/glib.inc
>> index fbc655a012..f8e803a90a 100644
>> --- a/meta/recipes-core/glib-2.0/glib.inc
>> +++ b/meta/recipes-core/glib-2.0/glib.inc
>> @@ -121,6 +121,12 @@ RDEPENDS_${PN}-codegen += "\
>>              python3-xml \
>>             "
>>
>> +RDEPENDS_${PN}-codegen_remove_mingw32 = "\
>> +            python3 \
>> +            python3-distutils \
>> +            python3-xml \
>> +           "
>> +
>>  RDEPENDS_${PN}-ptest += "\
>>              dbus \
>>              gnome-desktop-testing \
>
> I have pretty strong feelings that we shouldn't be using remove like
> this, or duplicating data. Its susceptible to breakage when one value
> changes and the other does not. Can you rework this so it doesn't use
> remove, or duplicate data?
>
> In case its not clear, you can do something like:
>
> CODEGEN_PYTHON_RDEPENDS = "python3 python3-distutils python3-xml"
> CODEGEN_PYTHON_RDEPENDS_mingw32 = ""
>
> RDEPENDS_${PN}-codegen += "${CODEGEN_PYTHON_RDEPENDS}"
>
> which is much more maintainable.

Looks good to me, I'll send a v2.

Alistair

>
> Cheers,
>
> Richard
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

