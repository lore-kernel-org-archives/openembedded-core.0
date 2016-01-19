Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f172.google.com (mail-ig0-f172.google.com
	[209.85.213.172])
	by mail.openembedded.org (Postfix) with ESMTP id 72E2573174
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Jan 2016 15:00:51 +0000 (UTC)
Received: by mail-ig0-f172.google.com with SMTP id z14so79092770igp.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Jan 2016 07:00:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	bh=8tAa9VXMpQOOHHF8SFizRZsNHYJRg1xib0hC58C05Vs=;
	b=HRvJhDk1WAWHYQb7zMjpDtaZ6qPAdNTNe+JZ4BAxBkbsV56+kaYlo0uYiLg52ksuCW
	8PLs7YsKonsIuuQKQznpZ1LLznUPbr586y9DJ3ODOaqj0XFdhZHHH9ffg6ORzNnpMhvj
	yEvo9dxEvtV+SkVFr4cGfvg6m6Em79mIQM9Ll7ez1tSdN9ZX+6J5AxMwIkuANGaCDiLJ
	AhwnksnsJ3IXJbaQQGsayOQa7OT/2TmwnmL5rE8KX5q9xF3/5YOO7C6sR4o6p8AtmrHc
	2dS0ZlaFKq0JYUHAAcnpRsvfzXEXOZC1ZlPkAzuP8etkdgvq+wn5CIrw0orRQX534Bsh
	DkwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type:content-transfer-encoding;
	bh=8tAa9VXMpQOOHHF8SFizRZsNHYJRg1xib0hC58C05Vs=;
	b=M4IvJ2mrBn8s/ECicdZwKqe+EtAm1iV+V8EjcQkirL764N+cmEt551+9Yc0EeIIE+g
	z5HFoyjP4EgKESOBEcTzhJ8w5M22aWVryY4lJKxAw6S9i40t6cxHzmlh3t3IWvGz49rG
	G0bg3XsNMFUZL9sGYJF7v3VRXan2wjT3LUZ54wjxP2l7nt8wPPTofq2MKXUQHpjjefoO
	lKBabhpI3OeO+FCkfCwjcNMVMsGHW9+OGu59HwtCHObjLvZ8RiQdPgWaqYdIiT53kY60
	luvMWwObMGXqBzFW68zbwGFdXavui6bZ8b/hR8NP0HKv0Bo2efEKRFKCZ+i3ckJdDJmP
	MkEg==
X-Gm-Message-State: AG10YOSGmvSzTutfm/Msr8EsLZPNG/OcSLYyISKRYhWw0caIS7y3UwjyS+nNcnETpnYh4haUoepSf++1MFNnbg==
X-Received: by 10.50.141.226 with SMTP id rr2mr14566162igb.75.1453215651874;
	Tue, 19 Jan 2016 07:00:51 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.16.74 with HTTP; Tue, 19 Jan 2016 07:00:22 -0800 (PST)
In-Reply-To: <1616789.GRtlt9rzHW@masala.hex>
References: <a11d14dd08dcef1c508ae13079284cfb96629c50.1453029952.git.raj.khem@gmail.com>
	<1564093.TSl0G7yhEJ@masala.hex>
	<F049320E-FDD3-4EBE-B25E-CA431E699223@gmail.com>
	<1616789.GRtlt9rzHW@masala.hex>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 19 Jan 2016 07:00:22 -0800
Message-ID: <CAMKF1spvcwWk3mnVeEWviZyBiqcyS0puhYtBfgjePSyjcj7wiQ@mail.gmail.com>
To: "roman@khimov.ru" <roman@khimov.ru>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 19/73] mtools: Fix build with uclibc
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
X-List-Received-Date: Tue, 19 Jan 2016 15:00:58 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 18, 2016 at 10:17 PM, Roman Khimov <roman@khimov.ru> wrote:
> =D0=92 =D0=BF=D0=B8=D1=81=D1=8C=D0=BC=D0=B5 =D0=BE=D1=82 18 =D1=8F=D0=BD=
=D0=B2=D0=B0=D1=80=D1=8F 2016 13:51:36 =D0=BF=D0=BE=D0=BB=D1=8C=D0=B7=D0=BE=
=D0=B2=D0=B0=D1=82=D0=B5=D0=BB=D1=8C Khem Raj =D0=BD=D0=B0=D0=BF=D0=B8=D1=
=81=D0=B0=D0=BB:
>> > And from what I remember, I had some issue building native package wit=
h
>> > 'DEPENDS +=3D'. Although that's an old branch and probably things are
>> > different now.
>>
>> I guess what you might have seen is that there is no provider for
>> libiconv-native which is already fixed by
>> https://github.com/kraj/openembedded-core/commit/a5e6f5939c0ee4280eabd7c=
fc01
>> 131052040bc81
>>
>> if it was something else. Please report with more details.
>
> True, it was something like that. If that's already fixed, then everythin=
g is
> perfect. Will this kind of patches go to jethro?

Not all of this series but this one in particular can go in. Send a
request for backport and let Robert know.

>
> --
>  http://roman.khimov.ru
> mailto: roman@khimov.ru
> gpg --keyserver hkp://subkeys.pgp.net --recv-keys 0xE5E055C3

