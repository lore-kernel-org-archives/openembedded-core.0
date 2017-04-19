Return-Path: <raj.khem@gmail.com>
Received: from mail-wr0-f193.google.com (mail-wr0-f193.google.com
	[209.85.128.193])
	by mail.openembedded.org (Postfix) with ESMTP id 99F4E71BE5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Apr 2017 16:34:39 +0000 (UTC)
Received: by mail-wr0-f193.google.com with SMTP id o21so3923294wrb.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Apr 2017 09:34:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=sjIh806QxbwISGspMgUZX3eEbzX+jEAqI8dg+Hd6X68=;
	b=vJ8EVgPA8S7oFzRrv0wK7X/rqktIMitjVgau2B+pAKd3mHziT8sSOmqMMi0DOfXBTJ
	ek6Fa/t2OEy8EavOz98U6mX+q4QOo/KoBA3w83czC0lzj3H5W4cMr0c0FS+OWoaf6PZP
	tfF/IhvPNHub7Y0N9BsCyjnfiQCMI3sJZ9dI/DinH58zwsMGZhGHnoqylaA/9E3iFX0o
	DoKhToTaOmN3JislCTk+7k27YFY8af3yYLl4AP6wo/sCWd81HkAn/frQ7Rq+nNgW+fNs
	4f2JgoWXSJSfvD/9AG4UWHjZg0pexvFTgmMs/EqoggnubUX1TjgbIIEw6Iv5w5AiSYaA
	29Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=sjIh806QxbwISGspMgUZX3eEbzX+jEAqI8dg+Hd6X68=;
	b=hG9+tHTZiJo3WDiIfyhjCNs9z2UK5rCnxN7RxtlVO4Zji+NrIJLr3sz4iYsxQ7NJ5Y
	h/LaRsELItg3LaYeE1C3yTufz2hAHLJ3vHzFeluAraOWJYVTF9JFhSf3TXPM45AunFLT
	c2E4B+9jOG92FONprEfk8HYHSJ2ZkowAA5urHT58qjxC0DYiYeP+1o/MvOoyRABD3F/u
	HKEyI9lxXBoMrOkGsFXWuxubblhGjlaaNUcn+Yk3ei7MNDRf8UAQiY8W1/RXngqpUI+W
	cfv9NM25glB/vnIloigJxH/aqLD/s5/pcdavif93jhqDMR7lctp6eeAqsN7QMLmIpZX9
	lHZw==
X-Gm-Message-State: AN3rC/4d04emLO60uNBjqUpYLNg9aO3ojkcMAAPiwqWTe6hmT8wjF/6O
	IuAXEYJhotzDrTj6CBcTBihrrP55SQ==
X-Received: by 10.223.138.152 with SMTP id y24mr3691467wry.26.1492619680264;
	Wed, 19 Apr 2017 09:34:40 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.180.141 with HTTP; Wed, 19 Apr 2017 09:34:09 -0700 (PDT)
In-Reply-To: <1492592243.15070.1.camel@andred.net>
References: <20170419015839.1294-1-raj.khem@gmail.com>
	<20170419015839.1294-3-raj.khem@gmail.com>
	<1492592243.15070.1.camel@andred.net>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 19 Apr 2017 09:34:09 -0700
Message-ID: <CAMKF1soi+coTExmRNkvFU_5s3o3eEJBUDqN07RbQJLoD-xHGsA@mail.gmail.com>
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <git@andred.net>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/5] libtirpc: Enable des APIs for musl
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
X-List-Received-Date: Wed, 19 Apr 2017 16:34:40 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 19, 2017 at 1:57 AM, Andr=C3=A9 Draszik <git@andred.net> wrote:
> On Tue, 2017-04-18 at 18:58 -0700, Khem Raj wrote:
>> Use memset() API instead of __bzero()
>> Drop the patch removing des_* functions for musl
>>
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> ---
>>  .../0001-replace-__bzero-with-memset-API.patch     |  28 +++++
>>  .../libtirpc/remove-des-functionality.patch        | 139 --------------=
--
>> -----
>>  meta/recipes-extended/libtirpc/libtirpc_1.0.1.bb   |   5 +-
>>  3 files changed, 31 insertions(+), 141 deletions(-)
>>  create mode 100644 meta/recipes-extended/libtirpc/libtirpc/0001-replace=
-
>> __bzero-with-memset-API.patch
>>  delete mode 100644 meta/recipes-extended/libtirpc/libtirpc/remove-des-
>> functionality.patch
>>
>> [...]
>>
>>
>>  SRC_URI_append_libc-uclibc =3D " file://remove-des-functionality.patch =
\
>
> This patch is being removed with this change, and so uclibc builds will
> fail.

yes I know. one should move it to bbappend in own layer if using uclibc.

 Is it time to remove all remaining references to uclibc?

Probably.

>
> Cheers,
> Andre'
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

