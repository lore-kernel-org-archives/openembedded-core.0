Return-Path: <jpewhacker@gmail.com>
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	by mail.openembedded.org (Postfix) with ESMTP id 745D27D711
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Aug 2019 12:50:44 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id c5so2885917wmb.5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Aug 2019 05:50:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=N1KSrSFfLuNPmX+/XgCaHHpEbhO36GrIhgntQY4CyqM=;
	b=Gs4KokCIYGyXhmQDZ//9wqcf6bNUEN7IxOip5IS+QYSRAoADXSO1/+yZf0DS0Bj3Nn
	p3fV5xShnmNq3d4fg3s1bvlBaFuJq1aP9vAc3EMCjjnpobK/y8/bz9fqX/bdUA902zUv
	L7ciQ/xariG0uqtnkY3gDGsaU6e7WcYj+MN9hGiFYFr9wHS2EGjOYNQLAaUt+BLSZTxW
	V1RazMF32usa28lRTq5SBqcdZL6eq02BbYbdGdX8iJtLAvNXiVhtG1jJL2Oei8Yctv3E
	Gf9rDnl16PclWPq19NYduPWVYwvslSFAbmJE2X4Gd9zP+wI2TBUzuSH5HsFYKi5vy5rx
	NtIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=N1KSrSFfLuNPmX+/XgCaHHpEbhO36GrIhgntQY4CyqM=;
	b=fqp75hY89083khIZ1VhqouyE4PpTHfmWap7EFeV9g6HU5twVuYMfghdV7TQ/CbEWyN
	oYPqngHZj/SCqkjBvcnAa1uSSmGq4bjg/9JYchb3WJME9+IL3Nn9DR7JCTlRq3WmkzZF
	9bMUDVIWPnyPEucpvumi27Hvm2/DRMa1jTu1+iBKrb4yfFVO5dmz2hwDERVDu4JpAULq
	EO7TubJV4zPu6PYuGFGHCHHRkUx52cEcYhiWvD56UouIIAO+k5o3DGcUN9e8WeNzPjYe
	WYj/bFWtudVQSHGkR28HmTRihUfRcSINA85UAAzO8oYgsd88iF5t0YADFAhrWMvj+iXZ
	7dzQ==
X-Gm-Message-State: APjAAAVK72tjP0WTqjI6tiK3D/QkaihNDf06pMp4wsprOB75jdS5JkIF
	sFTMoD7sbhJWZmzmJz4ipFYxrCH/tg/cMRqsk+0=
X-Google-Smtp-Source: APXvYqwY4eqXn8Ka54Cn5132dkbtboT4JQBBOwbjpCZ/n0ze1PdJBJi67EJc8UJHh73K6t5imR0IhmIqLZXGJkkQGgc=
X-Received: by 2002:a05:600c:2192:: with SMTP id
	e18mr27601944wme.83.1566910244271; 
	Tue, 27 Aug 2019 05:50:44 -0700 (PDT)
MIME-Version: 1.0
References: <20190627135440.15815-1-JPEWhacker@gmail.com>
	<CAMKF1srnRNisnxfnhypBQuwO9F5q72LSDzuBZqdStBoXaR1kDQ@mail.gmail.com>
	<e6cf5479e8da4d7e95463096a50b820e@xbox06.axis.com>
	<CAMKF1srRNUPoEj-7ogAxsWi3Pg1LZbjnze_aL2LpX7re2EtsiA@mail.gmail.com>
In-Reply-To: <CAMKF1srRNUPoEj-7ogAxsWi3Pg1LZbjnze_aL2LpX7re2EtsiA@mail.gmail.com>
From: Joshua Watt <jpewhacker@gmail.com>
Date: Tue, 27 Aug 2019 07:50:32 -0500
Message-ID: <CAJdd5GbGa1GgaG5h7Lj2dpZ41TtHA1vUELTq2-HhZ14V4T5meQ@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Peter Kjellerstedt <peter.kjellerstedt@axis.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] glibc: Fix locale DEPENDS
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
X-List-Received-Date: Tue, 27 Aug 2019 12:50:44 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 1, 2019 at 10:25 PM Khem Raj <raj.khem@gmail.com> wrote:
>
> Yes, I think so.

Oops, I forgot to mark the latest patch in-reply-to this one. It's
here: http://lists.openembedded.org/pipermail/openembedded-core/2019-August=
/286123.html

>
> On Mon, Jul 1, 2019 at 7:13 PM Peter Kjellerstedt <peter.kjellerstedt@axi=
s.com> wrote:
>>
>> Are you thinking of gettext-minimal-native? It is used by gettext.bbclas=
s if USE_NLS is =E2=80=9Cno=E2=80=9D.
>>
>>
>>
>> //Peter
>>
>>
>>
>> From: openembedded-core-bounces@lists.openembedded.org <openembedded-cor=
e-bounces@lists.openembedded.org> On Behalf Of Khem Raj
>> Sent: den 28 juni 2019 18:37
>> To: Joshua Watt <jpewhacker@gmail.com>
>> Cc: openembedded-core@lists.openembedded.org
>> Subject: Re: [OE-core] [PATCH] glibc: Fix locale DEPENDS
>>
>>
>>
>>
>>
>>
>>
>> On Thu, Jun 27, 2019 at 9:54 AM Joshua Watt <jpewhacker@gmail.com> wrote=
:
>>
>> gettext is required to generate the glibc locales in do_compile. If not
>> present, glibc will skip the generation which isn't reproducible.
>>
>> Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
>> ---
>>  meta/recipes-core/glibc/glibc_2.29.bb | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/meta/recipes-core/glibc/glibc_2.29.bb b/meta/recipes-core/g=
libc/glibc_2.29.bb
>> index 073d1533e37..c400ee10b0f 100644
>> --- a/meta/recipes-core/glibc/glibc_2.29.bb
>> +++ b/meta/recipes-core/glibc/glibc_2.29.bb
>> @@ -5,7 +5,7 @@ LIC_FILES_CHKSUM =3D "file://LICENSES;md5=3Dcfc0ed77a9f6=
2fa62eded042ebe31d72 \
>>        file://posix/rxspencer/COPYRIGHT;md5=3Ddc5485bb394a13b2332ec1c785=
f5d83a \
>>        file://COPYING.LIB;md5=3D4fbd65380cdd255951079008b364516c"
>>
>> -DEPENDS +=3D "gperf-native bison-native make-native"
>> +DEPENDS +=3D "gperf-native bison-native make-native gettext-native"
>>
>>
>>
>> I think we have had this dependency proposed in past and one think that =
worries me is that it will cause serialization a bit more and can affect bu=
lls times wasn=E2=80=99t there a minimal gettext at some point and I wonder=
 if that could satisfy needs here
>>
>>
>>
>>  PV =3D "2.29"
>>
>> --
>> 2.21.0

