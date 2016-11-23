Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f195.google.com (mail-pf0-f195.google.com
	[209.85.192.195])
	by mail.openembedded.org (Postfix) with ESMTP id 8A4B0607F8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Nov 2016 03:38:07 +0000 (UTC)
Received: by mail-pf0-f195.google.com with SMTP id y68so68708pfb.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Nov 2016 19:38:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=O80e7+4YHc7kBg/E0SMQ5eshYq02Gh4LKx1UbVa05yI=;
	b=i2mYDNX3pCNORNFolM+pv8t3siK5dbHUFepZEBl7rBi8C4SJiOS2XrIZmbKUl5IJ4M
	bATXjIBecWvDKnuMcdaDokmJCCrgw8a+iSOR4Ysi4GjLGGBn3/+fzx3xFq2lJKGmzCED
	Sm/lWqn3yenloJSnSvq23MwH6iKrsJfOsrutWmiVh/3powmwuw++coN20HK1TLNuUjE1
	qB+dIxwcAa8lDr2nn0JGoRUVK0mJNMsktiAlr4XMTCqPR9nSIzt4W/IF5zIAbFDEzXz9
	f+0iN+uxMyHj9Q0kL5Gt/mJtzUpVC0HO75AN1bkjW/EjwPD8xRrantWLUglVXEOs0Udi
	W17Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=O80e7+4YHc7kBg/E0SMQ5eshYq02Gh4LKx1UbVa05yI=;
	b=RTWm7nJpIpa5iUjdZH7zs5PT4KSajeBqZcRdbQdbL6Ztk6WUrVcso6A3xtzkhO/Pf3
	kplYwgm5M0YqO+WMbKRziJ1cnUMIIDOGVAsLWGu5FS1S7JfUMjOgaaa7fnTf8MU9YN/c
	CyMvsAEMSmsrN9X9osohxm3I4fT7PdXc6sXkgbN2EX3+3pZqz4CpAoW2j4XQRUCxeD1T
	Ic5+iZ08Z0OBnZBKVr5WJDNvfscaoDHMkVrnEA4V33oIpIrkpMG9buTrN0kPpOgHXT3m
	OLheHf3N2b0DVoBZH0jvTB3V9QWsu7nDUZa25l2KKwIu4vPLE50b9xjNUcKvdO9wOTyX
	Ozfw==
X-Gm-Message-State: AKaTC00UctyW915NwJKKMNeQeGshay4IBHt+bvR40zCAaHq92QlwM3QcOILcBNuvtYOlmQ==
X-Received: by 10.99.60.11 with SMTP id j11mr1860810pga.26.1479872289243;
	Tue, 22 Nov 2016 19:38:09 -0800 (PST)
Received: from ?IPv6:2601:646:8882:b8c:d191:f445:6e57:1696?
	([2601:646:8882:b8c:d191:f445:6e57:1696])
	by smtp.gmail.com with ESMTPSA id
	w5sm48284899pfl.31.2016.11.22.19.38.07
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 22 Nov 2016 19:38:08 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 10.1 \(3251\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <0bb2fa3a-66ee-4fd7-100c-e990dd507a1d@windriver.com>
Date: Tue, 22 Nov 2016 19:38:07 -0800
Message-Id: <76B00DDD-67D7-467A-84F7-67C0FB25EA62@gmail.com>
References: <20161123020049.22482-1-Yuanjie.Huang@windriver.com>
	<7CEAD313-1930-44C6-92A5-29E922A3485A@gmail.com>
	<0bb2fa3a-66ee-4fd7-100c-e990dd507a1d@windriver.com>
To: Yuanjie Huang <yuanjie.huang@windriver.com>
X-Mailer: Apple Mail (2.3251)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] gdb-cross: depends on flex-native and bison-native
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
X-List-Received-Date: Wed, 23 Nov 2016 03:38:09 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

are they regenerating code during configure ?

> On Nov 22, 2016, at 7:22 PM, Yuanjie Huang =
<yuanjie.huang@windriver.com> wrote:
>=20
> Hi Raj,
>=20
> We observed gdb/ada-lex.l is processed by flex while gdb/c-exp.y, =
gdb/f-exp.y, gdb/go-exp.y and many others are handled by bison. =
Basically, all language-specific codes in gdb are generated.
>=20
> Best,
> Yuanjie
>=20
> On 11/23/2016 11:05 AM, Khem Raj wrote:
>>> On Nov 22, 2016, at 6:00 PM, Yuanjie Huang =
<Yuanjie.Huang@windriver.com> wrote:
>>>=20
>>> From: Yuanjie Huang <yuanjie.huang@windriver.com>
>>>=20
>>> Some source code of gdb is generated with flex or bison. Make both
>>> dependencies, to avoid compilation failure on host without them.
>>=20
>> can you find out which parts those are ? what is it trying to do to =
need flex/yacc
>>> Signed-off-by: Yuanjie Huang <yuanjie.huang@windriver.com>
>>> ---
>>> meta/recipes-devtools/gdb/gdb-cross.inc | 2 +-
>>> 1 file changed, 1 insertion(+), 1 deletion(-)
>>>=20
>>> diff --git a/meta/recipes-devtools/gdb/gdb-cross.inc =
b/meta/recipes-devtools/gdb/gdb-cross.inc
>>> index 5fa7c33..a34223e 100644
>>> --- a/meta/recipes-devtools/gdb/gdb-cross.inc
>>> +++ b/meta/recipes-devtools/gdb/gdb-cross.inc
>>> @@ -1,6 +1,6 @@
>>> require gdb-common.inc
>>>=20
>>> -DEPENDS =3D "expat-native ncurses-native"
>>> +DEPENDS =3D "expat-native ncurses-native flex-native bison-native"
>>>=20
>>> inherit python3native
>>>=20
>>> --=20
>>> 2.7.4
>>>=20
>>> --=20
>>> _______________________________________________
>>> Openembedded-core mailing list
>>> Openembedded-core@lists.openembedded.org
>>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>=20


