Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f194.google.com (mail-pf0-f194.google.com
	[209.85.192.194])
	by mail.openembedded.org (Postfix) with ESMTP id C357071A23
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Oct 2016 13:27:00 +0000 (UTC)
Received: by mail-pf0-f194.google.com with SMTP id s8so12794324pfj.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Oct 2016 06:27:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=7bxbStcbbLRppH5QdzlZoHLfMbwO1W+QJMf/tBEJpQM=;
	b=io6YQ39fPGJoj3O1QVMNv2vatG61/BA3/GN/2Yc8wyrD1mj17ld+VFJefpZtO7NZ0V
	0RstSY12W/vFDGHxyylisjl8bj7QI+6CgEr5A4L9a7A/PSB9hop8r9q3iekXhxrRoziN
	UJoOu9zXMv9cK9tiCPovPRTP5sm/md+yJLzRszDY8+uC4szQzeUVpaYCy7uc30VHqSZ/
	TDP2sZEXiOAMPgSH39Fq6p+T9nYigMtvOg8tFoqAcDk5Dh1qnpJla/ZAPJvu+8W8KeoP
	n+/aF85sj/SF9FBqHJ9Of7PnokoSwEyszgEgXWUHmzDvHKtIXrqs/7nrd0CrJx87aJxY
	W8ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=7bxbStcbbLRppH5QdzlZoHLfMbwO1W+QJMf/tBEJpQM=;
	b=XUn+EQ3q9koFSPm5x9mOhmGfG3oJiFJCL0O/RvV7bi7qDeLYTzhutguUNCHeKeVlvF
	VcuLen77CHgVcH1sLx3K3EGjwMkDHpRnjodil5aJGa8vmsXchqBft1dY3yEC/71duQqv
	Vqhl6t2Z2YovRWEJUH3H87Mfy0O+mYKL+jA9oyt602RvTEvsEOjLQ9FAyI7iyo7Cxdld
	u2ukHS4obf1lpq9wST8k7MUnIyIC0oAV8HD/mbJoSJohUQr0DWPu01PFdHfrLmEsEuNy
	QxlPVPtPirZH8OBHJUloxM+1OFIw8zPcPkSHcTgj9hA4VMT+Ro0UhxiPXckzeUJ0iLqq
	gJzA==
X-Gm-Message-State: AA6/9RljMrzv2hEyQy4jHpsQ3Nv4+HyILs6xM/DBlX5WdXIWyhMuAELMmsD+mhhmhXKnxw==
X-Received: by 10.98.152.66 with SMTP id q63mr23152175pfd.42.1476710821744;
	Mon, 17 Oct 2016 06:27:01 -0700 (PDT)
Received: from ?IPv6:2601:646:8882:b8c:10af:7454:ca4e:95f6?
	([2601:646:8882:b8c:10af:7454:ca4e:95f6])
	by smtp.gmail.com with ESMTPSA id 3sm48299395pfo.31.2016.10.17.06.27.01
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 17 Oct 2016 06:27:01 -0700 (PDT)
Mime-Version: 1.0 (1.0)
From: Khem Raj <raj.khem@gmail.com>
X-Mailer: iPad Mail (14B71)
In-Reply-To: <58046ED3.1010106@windriver.com>
Date: Mon, 17 Oct 2016 06:27:00 -0700
Message-Id: <389FB3FF-09AC-4FB2-A3B1-7F7DF97E70B6@gmail.com>
References: <cover.1476004977.git.Qi.Chen@windriver.com>
	<e7f6b2d54c90833a8c6782a95283b8849438b3a9.1476004977.git.Qi.Chen@windriver.com>
	<CAMKF1spvigWQZ_NRzMgB--0h0cfqTOWGU2Tdo=c5Tn5hXsfumA@mail.gmail.com>
	<58046ED3.1010106@windriver.com>
To: ChenQi <Qi.Chen@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] systemd: avoid boot failures for mips64
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
X-List-Received-Date: Mon, 17 Oct 2016 13:27:00 -0000
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: quoted-printable



> On Oct 16, 2016, at 11:25 PM, ChenQi <Qi.Chen@windriver.com> wrote:
>=20
>> On 10/17/2016 07:03 AM, Khem Raj wrote:
>>> On Sun, Oct 9, 2016 at 2:23 AM, Chen Qi <Qi.Chen@windriver.com> wrote:
>>> If we start a systemd based qemumips64 target with 'pam' enabled in
>>> DISTRO_FEATURES, we could not login in successfully. After you provide
>>> username and password to the login prompt, the login prompt just comes u=
p
>>> again. Besides, there are other boot failures.
>>>=20
>>> Append '-O0' flag for mips64 target as a workaround to this problem.
>>>=20
>>> [YOCTO #10250]
>>>=20
>>> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
>>> ---
>>>  meta/recipes-core/systemd/systemd.inc | 1 +
>>>  1 file changed, 1 insertion(+)
>>>=20
>>> diff --git a/meta/recipes-core/systemd/systemd.inc b/meta/recipes-core/s=
ystemd/systemd.inc
>>> index f800f42..db588e7 100644
>>> --- a/meta/recipes-core/systemd/systemd.inc
>>> +++ b/meta/recipes-core/systemd/systemd.inc
>>> @@ -23,3 +23,4 @@ PV =3D "230+git${SRCPV}"
>>>  S =3D "${WORKDIR}/git"
>>>=20
>>>  LDFLAGS_append_libc-uclibc =3D " -lrt -lssp_nonshared -lssp "
>>> +CFLAGS_append_mips64 =3D " -O0"
>> can you instead explore a bit more e.g. disabling lto etc.
>> CFLAGS_append_mips64 =3D " -fno-lto"
>>=20
>> and also consider little endian
>>=20
>=20
> Hi Khem,
>=20
> I thought of adding '-O0' to CFLAGS because when I was debugging this prob=
lem, I found that several 'printf' statements would make errors disappear. I=
'm not familiar with these options. I just gave a test for '-fno-lto', and i=
t caused the following error.

O0 will mean bad performance. We should try to narrow it down to a subset of=
 opt passes. Can you try O1 or Os
>=20
> ERROR: systemd-1_230+gitAUTOINC+3a74d4fc90-r0 do_package: debugedit failed=
 with exit code 1 (cmd was '/buildarea2/chenqi/poky/build-systemd/tmp/sysroo=
ts/x86_64-linux/usr/lib/rpm/bin/debugedit' -i -l '/buildarea2/chenqi/poky/bu=
ild-systemd/tmp/work/mips64-poky-linux/systemd/1_230+gitAUTOINC+3a74d4fc90-r=
0/debugsources.list' '/buildarea2/chenqi/poky/build-systemd/tmp/work/mips64-=
poky-linux/systemd/1_230+gitAUTOINC+3a74d4fc90-r0/package/usr/lib/systemd/pt=
est/tests/test-libsystemd-sym.o'):
> /buildarea2/chenqi/poky/build-systemd/tmp/sysroots/x86_64-linux/usr/lib/rp=
m/bin/debugedit: /buildarea2/chenqi/poky/build-systemd/tmp/work/mips64-poky-=
linux/systemd/1_230+gitAUTOINC+3a74d4fc90-r0/package/usr/lib/systemd/ptest/t=
ests/test-libsystemd-sym.o: Unhandled relocation 2 in .debug_info section
> ERROR: systemd-1_230+gitAUTOINC+3a74d4fc90-r0 do_package: Function failed:=
 split_and_strip_files
> ERROR: Logfile of failure stored in: /buildarea2/chenqi/poky/build-systemd=
/tmp/work/mips64-poky-linux/systemd/1_230+gitAUTOINC+3a74d4fc90-r0/temp/log.=
do_package.8462
> ERROR: Task (/buildarea2/chenqi/poky/meta/recipes-core/systemd/systemd_230=
.bb:do_package) failed with exit code '1'
>=20
> Best Regards,
> Chen Qi
>=20
>>> --
>>> 1.9.1
>>>=20
>>> --
>>> _______________________________________________
>>> Openembedded-core mailing list
>>> Openembedded-core@lists.openembedded.org
>>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>=20

