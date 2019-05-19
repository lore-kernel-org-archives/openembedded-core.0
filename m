Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	by mail.openembedded.org (Postfix) with ESMTP id D65D372EB7
	for <openembedded-core@lists.openembedded.org>;
	Sun, 19 May 2019 09:58:09 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id y3so10479366wmm.2
	for <openembedded-core@lists.openembedded.org>;
	Sun, 19 May 2019 02:58:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=9P+xWdSBsBCQWHnfi37qLLe5EbB2VNYos804FhuurEs=;
	b=tWqyUJ78ID69IfJOE24L3/IdPXLh0xaEauAJfk+Q5/vWLYXcoAmI0p7VfimPK0LeFY
	ulNphAe95gK2WGJ3oaitBV4zmr/cu05brdDeScaquWS5xKmnKgYXI1qVJVN+zo4PxVnT
	oCi1k/U2VvY9BFw98Y2ttTfe+EyLXuXeKv0VRAACU2pv6vcMg8BEPymi9jGomENNSrU+
	EEomBPtMcev1TM86hwBg6R5D8LOiSdTMn8mnB/TgEJim83WW2HcjtU1JNaUH55pNXwT4
	QmVkroN1zIAyP2Pu12AeUg8QPczYLHKW6Qc108x26t/u2Senfc4RNoyIed88b5Ob/iZF
	rspw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=9P+xWdSBsBCQWHnfi37qLLe5EbB2VNYos804FhuurEs=;
	b=Bg/c4kVbB7Mx1RlFBSgwysfQdEEl/mH0SpeSjid+leHZuyGvIiv5vaHCX08oV+cpT4
	q40AGimao+5EQOXWqKsIc4pg3lrpyswXev0dvWDxqYnthsbcmaiBx+Rbgsg0cviLJJaG
	AmGoR7TauRv30heau3FqQ2VlvuPPo6V9PO3JFNJ2hvFSjCYIo1LxZVUwrMopacdHTcXv
	4uk7vbrnbwlLEZSkHSC996mbILGDBErHgNWElu5meNs4bo2QZIzO1hw/LBzV+syXJiVi
	LEOJjHPBoVJkUS3UGOKqKVUvH0Qb7/Z9QXElD5X7VCnAQKaqmzHxPmWzx1iJgQD9Xw/H
	LNVQ==
X-Gm-Message-State: APjAAAU/vwrMXoL1hQhMMU6TR9M6Xff8ENQojwdw6Eyp8rzY6efZ4lYY
	8RupUYVl6tdDfmFgZK6EFL13e0oA
X-Google-Smtp-Source: APXvYqzU5QaGoigmWV8msi3Pq4WPFnQaJU5HgYbJR0YU/BYsnsXm1sTRqhZP+JhVZj+lTFtn7wX+uw==
X-Received: by 2002:a1c:dcc2:: with SMTP id t185mr7552906wmg.143.1558259890071;
	Sun, 19 May 2019 02:58:10 -0700 (PDT)
Received: from ?IPv6:2a02:8109:b5c0:1267:38a9:dc4c:af62:603?
	([2a02:8109:b5c0:1267:38a9:dc4c:af62:603])
	by smtp.gmail.com with ESMTPSA id 9sm6134897wmi.24.2019.05.19.02.58.08
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 19 May 2019 02:58:08 -0700 (PDT)
Mime-Version: 1.0 (1.0)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Mailer: iPhone Mail (16E227)
In-Reply-To: <07b946fc-bd26-fd7a-e4c4-1cbb782db4f1@gmail.com>
Date: Sun, 19 May 2019 11:58:08 +0200
Message-Id: <90586B6E-70A7-4F92-98F1-2D822116DE48@gmail.com>
References: <20190517181151.44001-1-alex.kanavin@gmail.com>
	<20190517181151.44001-31-alex.kanavin@gmail.com>
	<07b946fc-bd26-fd7a-e4c4-1cbb782db4f1@gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 31/37] bash-completion: upgrade 2.8 -> 2.9
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
X-List-Received-Date: Sun, 19 May 2019 09:58:10 -0000
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: quoted-printable

Because the files are no longer included in bash-completion. They are provid=
ed only by util-linux now, previously they were provided by both.

Alex

> On 19 May 2019, at 6.48, Khem Raj <raj.khem@gmail.com> wrote:
>=20
>=20
>=20
>> On 5/17/19 11:11 AM, Alexander Kanavin wrote:
>> Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
>> ---
>>  .../{bash-completion_2.8.bb =3D> bash-completion_2.9.bb}     | 7 ++-----=

>>  1 file changed, 2 insertions(+), 5 deletions(-)
>>  rename meta/recipes-support/bash-completion/{bash-completion_2.8.bb =3D>=
 bash-completion_2.9.bb} (82%)
>> diff --git a/meta/recipes-support/bash-completion/bash-completion_2.8.bb b=
/meta/recipes-support/bash-completion/bash-completion_2.9.bb
>> similarity index 82%
>> rename from meta/recipes-support/bash-completion/bash-completion_2.8.bb
>> rename to meta/recipes-support/bash-completion/bash-completion_2.9.bb
>> index 85064343e30..ce66ba5a2a8 100644
>> --- a/meta/recipes-support/bash-completion/bash-completion_2.8.bb
>> +++ b/meta/recipes-support/bash-completion/bash-completion_2.9.bb
>> @@ -9,8 +9,8 @@ SECTION =3D "console/utils"
>>    SRC_URI =3D "https://github.com/scop/bash-completion/releases/download=
/${PV}/${BPN}-${PV}.tar.xz"
>>  -SRC_URI[md5sum] =3D "201b6ae62f7d5fb5b1b25e34427db919"
>> -SRC_URI[sha256sum] =3D "c01f5570f5698a0dda8dc9cfb2a83744daa1ec54758373a6=
e349bd903375f54d"
>> +SRC_URI[md5sum] =3D "60139333b25c4d54ad40323b701be130"
>> +SRC_URI[sha256sum] =3D "d48fe378e731062f479c5f8802ffa9d3c40a275a19e6e0f6=
f6cc4b90fa12b2f5"
>>  UPSTREAM_CHECK_REGEX =3D "bash-completion-(?P<pver>(?!2008).+)\.tar"
>>  UPSTREAM_CHECK_URI =3D "https://github.com/scop/bash-completion/releases=
"
>>  @@ -25,9 +25,6 @@ do_install_append() {
>>        # Delete files already provided by util-linux
>>      local i
>> -    for i in mount umount; do
>> -        rm ${D}${datadir}/${BPN}/completions/$i
>> -    done
>=20
> why is this deleted ?
>=20
>>  }
>>    RDEPENDS_${PN} =3D "bash"

