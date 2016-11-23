Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f67.google.com (mail-pg0-f67.google.com [74.125.83.67])
	by mail.openembedded.org (Postfix) with ESMTP id B5ACD6FF7B
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Nov 2016 06:52:22 +0000 (UTC)
Received: by mail-pg0-f67.google.com with SMTP id 3so424129pgd.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Nov 2016 22:52:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=qEFkIWRgKLo+57Dubf297nPFGSThsS96iegwHoKCB50=;
	b=F4Fev5+yRvXrDZHjockgOQY24yLFf3gb2G5/gXehTInZfH2kXUMdh8+FkuLD54jk8W
	cBgOfvTLPEKEWXg/tOgrrmYbz+A5t4G2rdkYfjHdKoqR0HOC6a6nWLTZhixDRxNGdTcs
	YxW0Jduifx02wYQxXho0QvbTqislpI59HAEj9X4HZn3haOfvERTWgcV1k/I9HbBL1WZw
	+0UUG1iaxkUamJQOyOW+VujuCmOzFJiSpCiGIpYi20rlxjSYMLOH7VLV9q36Qg6/tQfr
	ulQ7JraRNzWe5XeaEBfC7MIH1HDX541tThEu0tI55+MvXkIIUn8Vtv72l22PwJvt/K/n
	azWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=qEFkIWRgKLo+57Dubf297nPFGSThsS96iegwHoKCB50=;
	b=HDOdaix4Oj5XsgJDnSY5Ml0ZC+567tOhE5wTJXDlURohpOk+G9UgZYInCU1tf+ABY/
	GrjGxpi5KYSvZ1mdTYjJmH9Kc/URz4EvgkA3r2oO6+OjUjesAouQC1D8bI/OPuqtWxMV
	pOVYYSRRLQqndyylieCrU5qDkt/1tDGA5aZGn4bOi0Ek3dTvx8SuZ13YCNtCR6rqUMUB
	d0LT4niWHs3QiHC1MJ+v4dYmBfrl4ukAOId3M9dnNYZWPZfcnJo6blIdjBjBgK3R/PvT
	2kPbPV4AUc8Mmqh4vWQqBoxCb1FA7Xksb/gJ/uEd674EC2JguQgckzGtzbaoW/6KAIYh
	c2ww==
X-Gm-Message-State: AKaTC01IPbbrHn085mrOlGh9FFT8IBEduBD9jyy/OrRIfue6bXph+wHAelBabZ8R7cRx6w==
X-Received: by 10.98.61.21 with SMTP id k21mr1508517pfa.118.1479883943775;
	Tue, 22 Nov 2016 22:52:23 -0800 (PST)
Received: from ?IPv6:2601:646:8882:b8c:5159:9909:3ede:f0af?
	([2601:646:8882:b8c:5159:9909:3ede:f0af])
	by smtp.gmail.com with ESMTPSA id
	65sm49019781pfl.21.2016.11.22.22.52.22
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 22 Nov 2016 22:52:23 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 10.1 \(3251\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <926fbd84-941c-2eeb-d189-27133a6b0688@windriver.com>
Date: Tue, 22 Nov 2016 22:52:21 -0800
Message-Id: <2A3A314E-B614-4930-AA36-3B33471550C2@gmail.com>
References: <20161123020049.22482-1-Yuanjie.Huang@windriver.com>
	<7CEAD313-1930-44C6-92A5-29E922A3485A@gmail.com>
	<0bb2fa3a-66ee-4fd7-100c-e990dd507a1d@windriver.com>
	<76B00DDD-67D7-467A-84F7-67C0FB25EA62@gmail.com>
	<926fbd84-941c-2eeb-d189-27133a6b0688@windriver.com>
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
X-List-Received-Date: Wed, 23 Nov 2016 06:52:23 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


> On Nov 22, 2016, at 10:49 PM, Yuanjie Huang =
<yuanjie.huang@windriver.com> wrote:
>=20
>=20
> On 11/23/2016 11:38 AM, Khem Raj wrote:
>> are they regenerating code during configure ?
> No, code is generated during compilation. Corresponding c files are =
not included in git repo, so these files are always compiled from =
flex/bison source files.

OK.=20

>>> On Nov 22, 2016, at 7:22 PM, Yuanjie Huang =
<yuanjie.huang@windriver.com> wrote:
>>>=20
>>> Hi Raj,
>>>=20
>>> We observed gdb/ada-lex.l is processed by flex while gdb/c-exp.y, =
gdb/f-exp.y, gdb/go-exp.y and many others are handled by bison. =
Basically, all language-specific codes in gdb are generated.
>>>=20
>>> Best,
>>> Yuanjie
>>>=20
>>> On 11/23/2016 11:05 AM, Khem Raj wrote:
>>>>> On Nov 22, 2016, at 6:00 PM, Yuanjie Huang =
<Yuanjie.Huang@windriver.com> wrote:
>>>>>=20
>>>>> From: Yuanjie Huang <yuanjie.huang@windriver.com>
>>>>>=20
>>>>> Some source code of gdb is generated with flex or bison. Make both
>>>>> dependencies, to avoid compilation failure on host without them.
>>>> can you find out which parts those are ? what is it trying to do to =
need flex/yacc
>>>>> Signed-off-by: Yuanjie Huang <yuanjie.huang@windriver.com>
>>>>> ---
>>>>> meta/recipes-devtools/gdb/gdb-cross.inc | 2 +-
>>>>> 1 file changed, 1 insertion(+), 1 deletion(-)
>>>>>=20
>>>>> diff --git a/meta/recipes-devtools/gdb/gdb-cross.inc =
b/meta/recipes-devtools/gdb/gdb-cross.inc
>>>>> index 5fa7c33..a34223e 100644
>>>>> --- a/meta/recipes-devtools/gdb/gdb-cross.inc
>>>>> +++ b/meta/recipes-devtools/gdb/gdb-cross.inc
>>>>> @@ -1,6 +1,6 @@
>>>>> require gdb-common.inc
>>>>>=20
>>>>> -DEPENDS =3D "expat-native ncurses-native"
>>>>> +DEPENDS =3D "expat-native ncurses-native flex-native =
bison-native"
>>>>>=20
>>>>> inherit python3native
>>>>>=20
>>>>> --=20
>>>>> 2.7.4
>>>>>=20
>>>>> --=20
>>>>> _______________________________________________
>>>>> Openembedded-core mailing list
>>>>> Openembedded-core@lists.openembedded.org
>>>>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>=20


