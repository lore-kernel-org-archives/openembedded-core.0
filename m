Return-Path: <armccurdy@gmail.com>
Received: from mail-wm0-f52.google.com (mail-wm0-f52.google.com [74.125.82.52])
	by mail.openembedded.org (Postfix) with ESMTP id 3FF8B76A51
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Jan 2016 17:18:13 +0000 (UTC)
Received: by mail-wm0-f52.google.com with SMTP id 123so115286978wmz.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Jan 2016 09:18:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	bh=nZDowtd6+O9F2X0ieo75DEFi/isKscFFBGgyNau8bN8=;
	b=jM3VoMBSA0mkLWAlpHpoUsMyM0tBGaW/1XnGcOtk6c3bkaWGWLzxEXVlmT2+esevUY
	JvkozvYCetwarvsVN1wKZVlNOLxihSkO//kTl1fHwU+5N1nxV4y7ytSh6Pp8ltnkthg9
	2osCMd3l9le3Ihh2AbYr9S04M+u7EFzHW7tRXMiVPgvjLCM2rR0FTLjQEQZqUaiTPi5W
	S+1hzlWDDJNZrKdmbtQlHUQzw/wfo8PUM92SyEv/ztRMbi08C8kXFzOlCR/2ylc1BdTG
	JzX0THz0lqIl8oM1q6ldtNzcpQ/SV31nlVig84MCoWB+LRpqc2mtIxXc57En4PSd1ci2
	U1eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	bh=nZDowtd6+O9F2X0ieo75DEFi/isKscFFBGgyNau8bN8=;
	b=T5FJEg4pBS+tXTpCf5y8FDEPNIqwefiIAu+VTQBBQf/VpMttbI3VxjO+8NDyPOa6C6
	ozj+GdfzLIFZckWo+00Hi072JNXcubrnH6oYVmIsybLqBAE7BXbYZB1hU/vJQIux/4Ua
	/uH427Vzis/tI1TNfTo5PPL/hdUBZwq4YqC1jLwesb+jsEe8UBy4oHd0cdscfmDOkIce
	g0ZWJiU1RW7vlUc/i2II6BNLk7nka+Dz/CKEB8PCNSSl0noi+pe+W2w1/iQGb4Q69sNc
	2o402U94IUbfVCd7znbznWm2Mo+gGz3OJ7mLhaqwLoi9Bo6GXpl7hbmij3vr6xa7RhOQ
	jXeg==
X-Gm-Message-State: AG10YORRAuTGghV9upRHCfmGQ+sEuI0KJEExdZEpxJaHy5FuOVt1+Hk4ESpRG9y+dyPlYk2IB6I+6qiIORlnWw==
MIME-Version: 1.0
X-Received: by 10.28.195.138 with SMTP id t132mr24587177wmf.61.1453828694024; 
	Tue, 26 Jan 2016 09:18:14 -0800 (PST)
Received: by 10.194.209.131 with HTTP; Tue, 26 Jan 2016 09:18:13 -0800 (PST)
In-Reply-To: <7CEFB79F-1AD8-4D5A-B2AD-6EE828F21256@gmail.com>
References: <1453785046-9017-1-git-send-email-armccurdy@gmail.com>
	<7CEFB79F-1AD8-4D5A-B2AD-6EE828F21256@gmail.com>
Date: Tue, 26 Jan 2016 09:18:13 -0800
Message-ID: <CAJ86T=UL4soJJUPHc4X7h2xkErU7DFJRzYaZuEc+QKekqEohiw@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [RFC][PATCH] gcc-runtime.inc: force libstdc++ to always use gcc4 compatible ABI
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
X-List-Received-Date: Tue, 26 Jan 2016 17:18:15 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 26, 2016 at 8:38 AM, Khem Raj <raj.khem@gmail.com> wrote:
>
>> On Jan 26, 2016, at 12:10 AM, Andre McCurdy <armccurdy@gmail.com> wrote:
>>
>> Experimental hack, not expected to be merged.
>>
>> Without this, the http://www.cplusplus.com/reference/string/string/appen=
d/
>> example fails to build with -std=3Dc++11 and it's not clear why (it's as=
 if we
>> build a version of libstdc++ which supports only the old ABI but with he=
aders
>> which try to use the new ABI when compiled with -std=3Dc++11 ?). As a wo=
rkaround,
>> force libstdc++ to provide, and default to using, the old ABI in all cas=
es.
>>
>> See also:
>>
>>  https://gcc.gnu.org/onlinedocs/libstdc++/manual/configure.html
>>  https://mail.gnome.org/archives/gtkmm-list/2015-June/msg00026.html
>>  https://wiki.debian.org/GCC5
>>
>> Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
>> ---
>> meta/recipes-devtools/gcc/gcc-runtime.inc | 13 +++++++++++++
>> 1 file changed, 13 insertions(+)
>>
>> diff --git a/meta/recipes-devtools/gcc/gcc-runtime.inc b/meta/recipes-de=
vtools/gcc/gcc-runtime.inc
>> index f20d298..3a476cd 100644
>> --- a/meta/recipes-devtools/gcc/gcc-runtime.inc
>> +++ b/meta/recipes-devtools/gcc/gcc-runtime.inc
>> @@ -10,6 +10,19 @@ EXTRA_OECONF_PATHS =3D "\
>>
>> EXTRA_OECONF_append_linuxstdbase =3D " --enable-clocale=3Dgnu"
>>
>> +# gcc-runtime.inc: force libstdc++ to always use gcc4 compatible ABI
>> +# Experimental hack. Without this, the http://www.cplusplus.com/referen=
ce/string/string/append/
>> +# example fails to build with -std=3Dc++11 and it's not clear why (it's=
 as if we
>> +# build a version of libstdc++ which supports only the old ABI but with=
 headers
>> +# which try to use the new ABI when compiled with -std=3Dc++11 ?). As a=
 workaround,
>> +# force libstdc++ to provide, and default to using, the old ABI in all =
cases.
>> +# See also:
>> +# https://gcc.gnu.org/onlinedocs/libstdc++/manual/configure.html
>> +# https://mail.gnome.org/archives/gtkmm-list/2015-June/msg00026.html
>> +# https://wiki.debian.org/GCC5
>> +#
>> +EXTRA_OECONF_append =3D " --disable-libstdcxx-dual-abi --with-default-l=
ibstdcxx-abi=3Dgcc4-compatible=E2=80=9D
>
> This change while makes it work compatible to older libstdc++ ABI, we sho=
uld make the defaults to be
> forward looking.

Yes, I agree. The problem is that currently our libstdc++ doesn't seem
to support the new ABI.

> I would rather keep --with-default-libstdcxx-abi=3Dc++11 since gcc6 will =
switch to newer
> c++ std as default. If we revert like you suggest, we will be up for more=
 work in gcc6 time.
>
> please define _GLIBCXX_USE_CXX11_ABI=3D0 for your app, where you see the =
problem.

My test case is the example app from:

  http://www.cplusplus.com/reference/string/string/append/

It fails when I try to compile to use the new ABI (ie by using
-stdc++11 or _GLIBCXX_USE_CXX11_ABI=3D1).

There is no legacy code involved.

>
>> RUNTIMETARGET =3D "libssp libstdc++-v3 libgomp libatomic \
>>     ${@bb.utils.contains_any('FORTRAN', [',fortran',',f77'], 'libquadmat=
h', '', d)} \
>> "
>> --
>> 1.9.1
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

